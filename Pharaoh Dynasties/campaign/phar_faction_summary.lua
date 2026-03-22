out("Loading phar_faction_summary.lua")

faction_summary = 
{
	panel_component_name = "clan",
	victory_panel_component_name = "campaign_victory", -- we also show the summary tab inside of the victory panel, so we'll need to initialise god slots there as well
	frontend_component_name = "overview_holder",
	-- responsible for populating the local deities part of the faction summary panel inside of "summary" tab
	summary_tab = 
	{
		init_god_slots = function()
			if not faction_summary.panel then
				return
			end

			local faction_summary_panel_summary_tab = faction_summary.panel:SequentialFind("summary")
			if faction_summary_panel_summary_tab then
				local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
				if not faction_key then
					return
				end

				local god_slots = {}
				if deities.has_faction_created_aten(faction_key) then
					god_slots = {deities.persistent[faction_key].aten_slot}
				else
					god_slots = deities.persistent[faction_key].god_slots
				end
				local summary_panel_god_slots = faction_summary.summary_tab.get_god_slots_data(god_slots, faction_key)
				faction_summary_panel_summary_tab:InterfaceFunction("init_faction_summary_panel_local_deities_components", summary_panel_god_slots)
				faction_summary.summary_tab.populate_god_slots(faction_summary.panel, god_slots, faction_key)
			end
		end,

		get_god_slots_data = function (god_slots, faction_key)
			if not faction_key then
				return
			end

			local god_slots_status_table = {}
			for index in ipairs(god_slots) do
				local current_god_slot = {
					slot_status = ""
				}
				local god_key = god_slots[index].god_key
				if god_key then
					current_god_slot.slot_status = "selected"
				elseif index <= deities.get_faction_god_slots_count(faction_key) then
					current_god_slot.slot_status = "available"
				else
					current_god_slot.slot_status = "locked"
				end
				table.insert(god_slots_status_table, current_god_slot)
			end
			return god_slots_status_table
		end,
	
		populate_god_slots = function (faction_summary_panel, god_slots, faction_key)
			if not faction_key then
				return
			end

			local is_from_faction_summary = true
			for index = 1, #god_slots do
				local worshipped_god_slot = faction_summary.panel:SequentialFind("worshipped_god_" .. tostring(index))
				local god_portrait_component = worshipped_god_slot:SequentialFind("god_portrait")
				local god = deities.get_god(god_slots[index].god_key)
				deities.init_god_slot_components(god_portrait_component, god_slots[index], god, index, is_from_faction_summary)
	
				if god_slots[index].god_key then
					local btn_god_portrait_component = god_portrait_component:SequentialFind("btn_god_portrait")
					tooltip_component = btn_god_portrait_component:SequentialFind(btn_god_portrait_component:Id() .. "_tooltip")
					if tooltip_component then
						tooltip_component:SequentialFind("list_content"):SetVisible(false)
					end
					local god_slot = {}
					if god_slots[index].god_key == "aten" then
						god_slot = deities.persistent[faction_key].aten_slot
					else
						god_slot = god_slots[index]
					end
					local favour_bar_component = worshipped_god_slot:SequentialFind("favour_bar")
					deities.init_god_slot_favour_bar_component(favour_bar_component, god_slot)
				end
			end
		end
	},

	overview_tab = 
	{
		config = 
		{
			component_ids = 
			{
				--holds faction leader's portrait and faction flag
				portrait_holder_component = "portrait_holder",
				-- holds name, title, flavour text for faction leader
				leader_info_component = "leader_info",
				-- holds the list of center orbs with faction-specific mechanics and info
				highlights_list_component_id = "highlights_list",
				-- holds the list of to-the-right orbs containing more general information about the game
				overview_list_component_id = "overview_list",
				-- center orb
				highlight_template_component_id = "highlight_template",
				-- to-the-right orb
				overview_template_component_id = "overview_template",
				orb_tooltip_layout_path = "UI/Campaign UI/faction_summary_tooltip",
				orb_tooltip_component_id = "faction_summary_tooltip"
			},

			faction_orbs = 
			{
				["phar_main_ramesses"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_ramesses_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_ramesses_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_ramesses_bullet_3",
								component_state = "negative"
							}
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_ramesses_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ram_province_management_influence_happiness_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_ramesses_2"
							},
							{
								building_key = "phar_main_ram_province_management_production_boost_happiness_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_ramesses_3"
							},
							{
								building_key = "phar_main_ram_military_administration_hero_training_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_ramesses_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_ramesses_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_ramesses_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_ramesses_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_ramesses_1",
						units = {
							{
								unit_key = "phar_main_fac_ram_medjai_swordsmen",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_ramesses_2"
							},
							{
								unit_key = "phar_main_fac_ram_sherden_raiders",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_ramesses_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_ramesses_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_ramesses_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_ramesses_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_ramesses",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_ramesses_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_ramesses_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_ramesses",
						units = {},
						buildings = {},
					},		
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_ramesses_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ers_shrine_ra",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_ramesses_2"
							},
							{
								building_key = "phar_main_ers_waystation_level_1_egyp",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_ramesses_3"
							},
						},
					},
					{
						name = "local_deities_ra_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_ramesses_bullet_1",
								component_state = ""
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_ramesses_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_ramesses_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_ramesses",
						units = {},
						buildings = {},
						deities = 
						{
							{
								key = "ra",
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_god_egypt_ra.png",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_ra_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_sinai_ramesses_1",
						units = {
							{
								unit_key = "phar_main_nat_sin_shasu_warriors",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_sinai_ramesses_2"
							},
							{
								unit_key = "phar_main_nat_sin_habiru_skirmishers",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_sinai_ramesses_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_egypt",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_ramesses",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_ramesses",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_ramesses",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_ramesses",
						units = {},
						buildings = {}
					},				
				},

				["phar_main_seti"] = 
				{
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_seti_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_seti_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_seti_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_seti_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_seti_military_administration_cost_mod_recruit_slot_type_b_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_seti_2"
							},
							{
								building_key = "phar_main_seti_province_management_main_building_production_boost_overall_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_seti_3"
							},
							{
								building_key = "phar_main_seti_province_management_main_building_legitimacy_influence_boost_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_seti_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_seti_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_seti_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_seti_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_seti_1",
						units = {
							{
								unit_key = "phar_main_fac_seti_veteran_levy_axemen",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_seti_2"
							},							
							{
								unit_key = "phar_main_pharaoh_elite_royal_khopesh_guards",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_seti_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_seti_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_seti_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_seti_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_seti",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_seti_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_seti_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_seti",
						units = {},
						buildings = {},
					},					
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_seti_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ers_shrine_set",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_seti_2"
							},
						},
					},
					{
						name = "local_deities_set_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_seti_bullet_1",
								component_state = ""
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_seti_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_seti_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_seti",
						units = {},
						buildings = {},
						deities = 
						{
							{
								key = "set",
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_god_egypt_set.png",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_set_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice",
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_lower_egypt_seti_1",
						units = {
							{
								unit_key = "phar_main_nat_low_lower_egyptian_militia",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_lower_egypt_seti_2"
							},							
							{
								unit_key = "phar_main_nat_low_light_egyptian_chariots",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_lower_egypt_seti_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_egypt",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_seti",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_seti",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_seti",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_seti",
						units = {},
						buildings = {}
					},
				},

				
				["phar_main_tausret"] = 
				{
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_tausret_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_tausret_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_tausret_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_tausret_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_tausret_resource_production_modifier_food_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_tausret_2"
							},
							{
								building_key = "phar_main_tausret_resource_production_modifier_gold_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_tausret_3"
							},
							{
								building_key = "phar_main_tausret_resource_production_modifier_bronze_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_tausret_4"
							},
							{
								building_key = "phar_main_tausret_resource_production_modifier_stone_wood_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_tausret_5"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_tausret_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_tausret_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_tausret_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_tausret_1",
						units = {
							{
								unit_key = "phar_main_fac_taus_javelin_chariots",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_tausret_2"
							},							
							{
								unit_key = "phar_main_fac_taus_egyptian_archers_axe",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_tausret_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_tausret_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_tausret_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_tausret_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_tausret",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_tausret_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_tausret_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_tausret",
						units = {},
						buildings = {},
					},					
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_tausret_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ers_shrine_isis",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_tausret_2"
							},
							{
								building_key = "phar_main_ers_trading_post_level_1_egyp",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_tausret_3"
							},
							{
								building_key = "phar_main_ers_unique_collosi_of_memnon",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_tausret_4"
							},
						},
					},
					{
						name = "local_deities_isis_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_tausret",
						units = {},
						buildings = {},
						deities = 
						{
							{
								key = "isis",
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_god_egypt_isis.png",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_isis_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice",
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_upper_egypt_tausret_1",
						units = {
							{
								unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_upper_egypt_tausret_2"
							},							
							{
								unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_upper_egypt_tausret_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_egypt",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_tausret",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_tausret",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_tausret",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_tausret",
						units = {},
						buildings = {}
					},
				},

				["phar_main_amenmesse"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_amenmesse_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_amenmesse_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_amenmesse_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_amenmesse_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_amenmesse_province_management_main_building_production_boost_growth_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_amenmesse_2"
							},
							{
								building_key = "phar_main_amenmesse_resource_production_gold_mine_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_amenmesse_3"
							},
							{
								building_key = "phar_main_amenmesse_resource_production_multiple_resource_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_amenmesse_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_amenmesse_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_amenmesse_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_amenmesse_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_amenmesse_1",
						units = {
							{
								unit_key = "phar_main_fac_amen_ta_seti_longbowmen",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_amenmesse_2"
							},							
							{
								unit_key = "phar_main_fac_amen_nubian_spearmen",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_amenmesse_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_amenmesse_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_amenmesse_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_amenmesse_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_amenmesse",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_amenmesse_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_amenmesse_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_amenmesse",
						units = {},
						buildings = {},
					},					
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_amenmesse_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ers_shrine_amun",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_amenmesse_2"
							},
						},
					},
					{
						name = "local_deities_amun_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_amenmesse",
						units = {},
						buildings = {},
						deities = 
						{
							{
								key = "amun",
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_god_egypt_amun.png",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_amun_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice",
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_nubia_kush_amenmesse_1",
						units = {
							{
								unit_key = "phar_main_nat_nub_nubian_recruits",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_nubia_kush_amenmesse_2"
							},							
							{
								unit_key = "phar_main_nat_nub_renowned_kushite_archers",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_nubia_kush_amenmesse_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_egypt",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_amenmesse",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_amenmesse",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_amenmesse",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_amenmesse",
						units = {},
						buildings = {}
					},
				},
				
				["phar_main_irsu"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_irsu_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_irsu_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_irsu_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_irsu_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_irsu_resource_production_food_cattle_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_irsu_2"
							},
							{
								building_key = "phar_main_irsu_province_management_production_boost_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_irsu_3"
							},
							{
								building_key = "phar_main_irsu_province_management_main_building_loot_boost_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_irsu_4"
							},
							{
								building_key = "phar_main_irsu_province_management_main_building_production_boost_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_irsu_5"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_irsu_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_irsu_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_irsu_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_irsu_1",
						units = {
							{
								unit_key = "phar_main_fac_irsu_sabunagib_warriors",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_irsu_2"
							},							
							{
								unit_key = "phar_main_fac_irsu_henku_warriors",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_irsu_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_irsu_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_irsu_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_irsu_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_irsu",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_irsu_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_irsu_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_irsu",
						units = {},
						buildings = {},
					},					
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_irsu_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ers_shrine_moloch",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_irsu_2"
							},
							{
								building_key = "phar_main_ers_trading_post_level_1_cana",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_irsu_3"
							},
						},
					},
					{
						name = "local_deities_moloch_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_irsu",
						units = {},
						buildings = {},
						deities = 
						{
							{
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_god_canaan_chemosh.png",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_moloch_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice",
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_sinai_retjennu_irsu_1",
						units = {
							{
								unit_key = "phar_main_nat_sin_shasu_warriors",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_sinai_ramesses_2"
							},
							{
								unit_key = "phar_main_nat_sin_habiru_skirmishers",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_sinai_ramesses_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_canaan",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_irsu",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_irsu",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "canaanite_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_irsu",
						units = {},
						buildings = {}
					},
				},

				["phar_main_bay"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_bay_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_bay_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_bay_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_bay_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_bay_province_management_production_boost_overall_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_bay_2"
							},
							{
								building_key = "phar_main_bay_province_management_happiness_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_bay_3"
							},
							{
								building_key = "phar_main_bay_resource_production_port_coast_derivative_type_a_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_bay_4"
							},
							{
								building_key = "phar_main_bay_province_management_main_building_diplomatic_relations_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_bay_5"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_bay_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_bay_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_bay_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_bay_1",
						units = {
							{
								unit_key = "phar_main_fac_bay_canaanite_vanguard",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_bay_2"
							},							
							{
								unit_key = "phar_main_fac_bay_canaanite_ambushers",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_bay_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_bay_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_bay_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_bay_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_bay",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_bay_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_bay_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_bay",
						units = {},
						buildings = {},
					},					
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_bay_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ers_shrine_thoth",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_bay_2"
							},
							{
								building_key = "phar_main_ers_fort_fenkhu_can_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_bay_3"
							},
						},
					},
					{
						name = "local_deities_thoth_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_bay",
						units = {},
						buildings = {},
						deities = 
						{
							{
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_god_egypt_thoth.png",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_thoth_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice",
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_fenkhu_bay_1",
						units = {
							{
								unit_key = "phar_main_nat_fen_canaanite_sellswords",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_fenkhu_bay_2"
							},
							{
								unit_key = "phar_main_nat_fen_armoured_syrian_archers",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_fenkhu_bay_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_canaan",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_bay",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_bay",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "canaanite_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_bay",
						units = {},
						buildings = {}
					},
				},

				["phar_main_suppiluliuma"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_suppi_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_suppi_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_suppi_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_suppi_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_suppi_military_administration_army_buff_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_suppi_2"
							},
							{
								building_key = "phar_main_suppi_province_management_growth_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_suppi_3"
							},
							{
								building_key = "phar_main_suppi_military_administration_garrison_type_b_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_suppi_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_suppi_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_suppi_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_suppi_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_suppi_1",
						units = {
							{
								unit_key = "phar_main_fac_sup_veteran_hittite_axemen",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_suppi_2"
							},							
							{
								unit_key = "phar_main_fac_sup_hittite_chariots",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_suppi_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_suppi_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_suppi_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_suppi_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_suppi",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_suppi_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_suppi_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_suppi",
						units = {},
						buildings = {},
					},					
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_suppi_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ers_shrine_arinna",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_suppi_2"
							},
							{
								building_key = "phar_main_ers_fort_highlands_hitt_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_suppi_3"
							},
							{
								building_key = "phar_main_ers_unique_hittite_rock_sanctuary",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_suppi_4"
							},
						},
					},
					{
						name = "local_deities_arinna_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_suppi",
						units = {},
						buildings = {},
						deities = 
						{
							{
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_god_hittite_arinna.png",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_arinna_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice",
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_highlands_suppi_1",
						units = {
							{
								unit_key = "phar_main_nat_hig_armoured_anatolian_spears",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_highlands_suppi_2"
							},
							{
								unit_key = "phar_main_nat_hig_kaskian_chargers",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_highlands_suppi_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_hittite",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_suppi",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_suppiluliuma",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_suppi",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_suppi",
						units = {},
						buildings = {}
					},
				},

				["phar_main_kurunta"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_kurunta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_kurunta_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_kurunta_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_kurunta_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_kuru_military_administration_army_debuff_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_kurunta_2"
							},
							{
								building_key = "phar_main_kuru_military_administration_unit_training_type_b_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_kurunta_3"
							},
							{
								building_key = "phar_main_kuru_military_administration_unit_training_type_a_1",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_kurunta_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_kurunta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_kurunta_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_units_kurunta_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_kurunta_1",
						units = {
							{
								unit_key = "phar_main_fac_kuru_phrygian_mercenaries",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_kurunta_2"
							},							
							{
								unit_key = "phar_main_fac_kuru_skirmisher_kaskian_chariots",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_units_kurunta_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_kurunta_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_kurunta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_kurunta_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_kurunta",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_kurunta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_main_fac_sum_court_kurunta_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_kurunta",
						units = {},
						buildings = {},
					},					
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_kurunta_1",
						units = {},
						buildings = {
							{
								building_key = "phar_main_ers_shrine_kurunta",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_kurunta_2"
							},
						},
					},
					{
						name = "local_deities_kurunta_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_kurunta",
						units = {},
						buildings = {},
						deities = 
						{
							{
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_god_hittite_kurunta.png",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_kurunta_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice",
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_lowlands_kurunta_1",
						units = {
							{
								unit_key = "phar_main_nat_isu_armoured_anatolian_spears",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_highlands_suppi_2" --this is an intended re-use
							},
							{
								unit_key = "phar_main_nat_isu_hittite_archers",
								description = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_lowlands_kurunta_2"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_hittite",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_kurunta",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_kurunta",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_kurunta",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_kurunta",
						units = {},
						buildings = {}
					},
				},				
				
				["phar_sea_peleset"] = {
					{
						name = "hybrid_gameplay_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_bullet_3",
								component_state = "positive"
							}
						},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_walwetes_1",
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_walwetes_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_walwetes_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_walwetes_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_walwetes_1",
						units = {
							{
								unit_key = "phar_sea_fac_pel_oxen_chariots",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_walwetes_2"
							},
							{
								unit_key = "phar_sea_fac_pel_renowned_philistian_defenders",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_walwetes_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_walwetes_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_commands_walwetes_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_commands_walwetes_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_commands_walwetes",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_court_walwetes_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_court_walwetes_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_court_walwetes",
						units = {},
						buildings = {},
					},		
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_ers_walwetes_1",
						units = {},
						buildings = {
							{
								building_key = "phar_sea_ers_nomad_peleset_foreign_region_1",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_ers_walwetes_2"
							},
							{
								building_key = "phar_sea_ers_nomad_peleset_razed_region_1",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_ers_walwetes_3"
							},
							{
								building_key = "phar_sea_ers_nomad_peleset_own_region_1",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_ers_walwetes_4"
							},
						},
					},
					{
						name = "local_deities_kuvava_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_deities_kuvava",
						units = {},
						buildings = {},
						deities = 
						{
							{
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_sea_people_god_kuvava.png",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_deities_kuvava_flavor"
							},
						}
					},									
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_native_units_fenkhu_walwetes_1",
						units = {
							{
								unit_key = "phar_main_nat_fen_renowned_canaanite_swordsmen",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_native_units_fenkhu_walwetes_2"
							},
							{
								unit_key = "phar_main_nat_fen_armoured_syrian_archers",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_native_units_fenkhu_walwetes_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_terrain_weather_canaan_walwetes",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_titles_walwetes",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_walwetes",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_legitimacy_walwetes",
						units = {},
						buildings = {}
					},
					{
						name = "forge_your_own_path_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_forge_your_own_path_walwetes",
						units = {},
						buildings = {}
					},				
			},

				["phar_sea_sherden"] = {
					{
						name = "hybrid_gameplay_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_bullet_3",
								component_state = "positive"
							}
						},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_iolaos_1",
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_iolaos_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_iolaos_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_iolaos_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_iolaos_1",
						units = {
							{
								unit_key = "phar_sea_fac_shr_battle_hardened_nuraghe_warriors",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_iolaos_2"
							},
							{
								unit_key = "phar_sea_fac_shr_seasoned_nuraghe_harpooneers",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_units_iolaos_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_iolaos_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_commands_iolaos_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_commands_iolaos_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_commands_iolaos",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_court_iolaos_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_sea_fac_sum_court_iolaos_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_court_iolaos",
						units = {},
						buildings = {},
					},		
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_ers_iolaos_1",
						units = {},
						buildings = {
							{
								building_key = "phar_sea_ers_nomad_sherden_fenkhu_foreign_region_2",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_ers_iolaos_2"
							},
							{
								building_key = "phar_sea_ers_nomad_sherden_fenkhu_own_region_2",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_ers_iolaos_3"
							},
							{
								building_key = "phar_sea_ers_nomad_sherden_fenkhu_razed_region_2",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_ers_iolaos_4"
							},
						},
					},
					{
						name = "local_deities_isul_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_deities_isul",
						units = {},
						buildings = {},
						deities = 
						{
							{
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_sea_people_god_isul.png",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_deities_isul_flavor"
							},
						}				
					},				
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_native_units_lowlands_iolaos_1",
						units = {
							{
								unit_key = "phar_main_nat_isu_heavy_anatolian_chariots",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_native_units_lowlands_iolaos_2"
							},
							{
								unit_key = "phar_main_nat_isu_armoured_anatolian_spears",
								description = "ui_text_replacements_localised_text_phar_sea_fac_sum_native_units_lowlands_iolaos_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_terrain_weather_lowlands_iolaos",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_titles_iolaos",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_iolaos",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_legitimacy_iolaos",
						units = {},
						buildings = {}
					},
					{
						name = "forge_your_own_path_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_forge_your_own_path_iolaos",
						units = {},
						buildings = {}
					},				
				},

				--COMBINED_MAP
				--MAJOR FACTIONS
				["troy_main_dan_mycenae"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_agamemnon_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_agamemnon_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_agamemnon_bullet_3",
								component_state = "negative"
							}
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_agamemnon_1",
						units = {},
						buildings = {
							{
								building_key = "phar_map_myc_resource_production_food_farm_minor_2",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_agamemnon_2"
							},
							{
								building_key = "phar_map_myc_province_management_roads_3",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_agamemnon_3"
							},
							{
								building_key = "phar_map_myc_province_management_eqeta_3",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_agamemnon_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_agamemnon_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_agamemnon_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_agamemnon_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_units_agamemnon_1",
						units = {
							{
								unit_key = "phar_map_fac_myc_argive_raiders",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_units_agamemnon_2"
							},
							{
								unit_key = "phar_map_fac_myc_skirmish_chariots",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_units_agamemnon_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_agamemnon_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_agamemnon_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_agamemnon_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_agamemnon",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_court_agamemnon_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_court_agamemnon_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_court_agamemnon",
						units = {},
						buildings = {},
					},		
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_agamemnon_1",
						units = {},
						buildings = {
							{
								building_key = "phar_map_ers_shrine_zeus",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_agamemnon_2"
							},
						},
					},
					{
						name = "local_deities_zeus_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_agamemnon_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_agamemnon_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_agamemnon_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_agamemnon",
						units = {},
						buildings = {},
						deities = 
						{
							{
								key = "zeus",
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_map_god_greek_zeus.png",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_zeus_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_achea_agamemnon_1",
						units = {
							{
								unit_key = "phar_map_nat_ach_laconian_hillmen",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_achea_agamemnon_2"
							},
							{
								unit_key = "phar_map_nat_ach_achaean_javelinmen",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_achea_agamemnon_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_terrain_weather_aegea",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_titles_agamemnon",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_agamemnon",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_legitimacy_agamemnon",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_ancient_legacy_agamemnon",
						units = {},
						buildings = {}
					},
				},
				["troy_main_trj_troy"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_priam_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_priam_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_priam_bullet_3",
								component_state = "negative"
							}
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_priam_1",
						units = {},
						buildings = {
							{
								building_key = "phar_map_military_infantry_type_a_wilusa_province_1",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_priam_2"
							},
							{
								building_key = "phar_map_wil_major_main_building_happiness_boost_1",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_priam_3"
							},
							{
								building_key = "phar_map_wil_landmark_victory_points_1",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_priam_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_priam_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_priam_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_priam_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_units_priam_1",
						units = {
							{
								unit_key = "phar_map_fac_troy_par_trojan_nobles",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_units_priam_2"
							},
							{
								unit_key = "phar_map_fac_troy_guards_of_troy",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_units_priam_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_priam_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_priam_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_priam_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_priam",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_court_priam_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_court_priam_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_court_priam",
						units = {},
						buildings = {},
					},		
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_priam_1",
						units = {},
						buildings = {
							{
								building_key = "phar_map_ers_shrine_apollo",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_priam_2"
							},
							{
								building_key = "phar_main_ers_trading_post_level_1_aeg",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_priam_3"
							},
						},
					},
					{
						name = "local_deities_apollo_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_priam_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_priam_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_priam_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_priam",
						units = {},
						buildings = {},
						deities = 
						{
							{
								key = "apollo",
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_map_god_greek_apollo.png",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_apollo_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_assuwa_priam_1",
						units = {
							{
								unit_key = "phar_map_nat_wil_coastal_club_fighters",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_assuwa_priam_2"
							},
							{
								unit_key = "phar_map_nat_wil_archer_chariots",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_assuwa_priam_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_terrain_weather_aegea",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_titles_priam",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_priam",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_legitimacy_priam",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_ancient_legacy_priam",
						units = {},
						buildings = {}
					},
				},
				["phar_map_ninurta"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_ninurta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_ninurta_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_ninurta_bullet_3",
								component_state = "negative"
							}
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_ninurta_1",
						units = {},
						buildings = {
							{
								building_key = "phar_map_ash_military_administration_cost_mod_3",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_ninurta_2"
							},
							{
								building_key = "phar_map_ash_military_administration_hero_training_3",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_ninurta_3"
							},
							{
								building_key = "phar_map_ash_military_garrison_type_a_3",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_ninurta_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_ninurta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_ninurta_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_ninurta_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_units_ninurta_1",
						units = {
							{
								unit_key = "phar_map_fac_ash_assyrian_sappers",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_units_ninurta_2"
							},
							{
								unit_key = "phar_map_fac_ash_assur_horsemen",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_units_ninurta_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_ninurta_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_ninurta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_ninurta_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_ninurta_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_ninurta",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_court_ninurta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_court_ninurta_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_court_ninurta",
						units = {},
						buildings = {},
					},		
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_ninurta_1",
						units = {},
						buildings = {
							{
								building_key = "phar_map_ers_shrine_ninurta",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_ninurta_2"
							},
							{
								building_key = "phar_map_ers_fort_mat_assur_meso_1",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_ninurta_3"
							},
						},
					},
					{
						name = "local_deities_ninurta_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_ninurta_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_ninurta_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_ninurta_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_ninurta",
						units = {},
						buildings = {},
						deities = 
						{
							{
								key = "ninurta",
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_map_god_mesopotamian_ninurta.png",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_ninurta_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_mat_assur_ninurta_1",
						units = {
							{
								unit_key = "phar_map_nat_assur_akkadian_hunters",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_mat_assur_ninurta_2"
							},
							{
								unit_key = "phar_map_nat_assur_akkadian_horsemen",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_mat_assur_ninurta_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_terrain_weather_mesopotamia",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_titles_ninurta",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_ninurta",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_legitimacy_ninurta",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_ancient_legacy_ninurta",
						units = {},
						buildings = {}
					},
				},
				["phar_map_babylon"] = {
					{
						name = "buildings_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_adad_shuma_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_adad_shuma_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_adad_shuma_bullet_3",
								component_state = "negative"
							}
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_adad_shuma_1",
						units = {},
						buildings = {
							{
								building_key = "phar_map_bab_province_management_gold_diplomacy_1",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_adad_shuma_2"
							},
							{
								building_key = "phar_map_bab_province_management_happiness_growth_type_a_3",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_adad_shuma_3"
							},
							{
								building_key = "phar_map_bab_province_management_influence_roads_type_a_3",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_buildings_adad_shuma_4"
							},
						},
					},
					{
						name = "faction_units_orb",
						bulletpoints_list = 
						{
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_adad_shuma_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_adad_shuma_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_units_adad_shuma_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_units_adad_shuma_1",
						units = {
							{
								unit_key = "phar_map_fac_bab_armoured_siluhlu_spears",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_units_adad_shuma_2"
							},
							{
								unit_key = "phar_map_fac_bab_babylonian_nobles",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_units_adad_shuma_3"
							},
						},
						buildings = {}
					},
					{
						name = "commands_adad_shuma_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_adad_shuma_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_adad_shuma_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_commands_adad_shuma",
						units = {},
						buildings = {},
					},	
					{
						name = "court_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_court_adad_shuma_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_court_adad_shuma_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_court_adad_shuma",
						units = {},
						buildings = {},
					},		
					{
						name = "outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_adad_shuma_1",
						units = {},
						buildings = {
							{
								building_key = "phar_map_ers_shrine_marduk",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_adad_shuma_2"
							},
							{
								building_key = "phar_map_ers_unique_etemenanki",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_adad_shuma_3"
							},
							{
								building_key = "phar_map_ers_unique_white_temple_of_anu",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_ers_adad_shuma_4"
							},
						},
					},
					{
						name = "local_deities_marduk_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_adad_shuma_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_adad_shuma_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_adad_shuma_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_adad_shuma",
						units = {},
						buildings = {},
						deities = 
						{
							{
								key = "marduk",
								deity_image_path = "UI/skins/default/local_deities/portraits/round/portrait_round_map_god_mesopotamian_marduk.png",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_marduk_flavor"
							},
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_mat_tamti_adad_shuma_1",
						units = {
							{
								unit_key = "phar_map_nat_tamti_akkadian_militia",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_mat_tamti_adad_shuma_2"
							},
							{
								unit_key = "phar_map_nat_tamti_akkadian_armoured_archers",
								description = "ui_text_replacements_localised_text_phar_map_fac_sum_native_units_mat_tamti_adad_shuma_3"
							},
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_terrain_weather_mesopotamia",
						units = {},
						buildings = {}
					},
					{
						name = "titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_titles_adad_shuma",
						units = {},
						buildings = {}
					},
					{
						name = "dynasty_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_unique", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_adad_shuma",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_legitimacy_adad_shuma",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "ui_text_replacements_localised_text_phar_main_fac_sum_header_advice", 
						tooltip_faction_specific_localised_text = "ui_text_replacements_localised_text_phar_map_fac_sum_ancient_legacy_adad_shuma",
						units = {},
						buildings = {}
					},
				},		
				--SECONDARY FACTIONS
				["phar_main_merneptah"] = 
				{		
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_merneptah_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_setnakhte"] = 
				{
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_setnakhte_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_napata"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_regions_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_regions_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_napata_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_bahariya"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_bahariya_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_dungul"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_dungul_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["troy_main_dan_achilles"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_achilles_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["troy_main_dan_ithaca"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_regions_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_regions_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_diplomacy_bullet_1",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ithaca_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["troy_main_dan_boeotians"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_boeotians_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["troy_main_trj_lycia"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_diplomacy_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_diplomacy_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lycia_advice_bullet_3",
								component_state = "positive"
							},							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["troy_rem_trj_thrace"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_regions_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_regions_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_thrace_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_ugarit"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ugarit_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_emar"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_emar_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_byblos"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_byblos_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_damascus"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_diplomacy_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_diplomacy_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_damascus_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_ashkelon"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_ashkelon_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["troy_amazons_trj_hippolyta"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_cimmerians_advice_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},	
				},
				["phar_main_malidiya"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_malidiya_advice_bullet_2",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_map_sangarian_phrygians"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_san_phrygians_advice_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_main_alashiya"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_alashiya_advice_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},	
				},
				["phar_main_carchemish"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_economy_bullet_2",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_economy_bullet_3",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_carchemish_advice_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},	
				},
				["phar_map_igihalkid"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_economy_bullet_2",
								component_state = "negative"
							},							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_elamites_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_map_lullubi"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_regions_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_regions_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_economy_bullet_2",
								component_state = "negative"
							},							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_lullubi_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_map_sutu"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_diplomacy_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_diplomacy_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_sutu_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_map_shubru"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_regions_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_regions_bullet_3",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_economy_bullet_1",
								component_state = "negative"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_economy_bullet_2",
								component_state = "negative"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_shubru_advice_bullet_2",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},
				["phar_map_assyria"] = {
					{
						name = "sec_fac_starting_regions_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_regions_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_regions_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_economy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_economy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_economy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_diplomacy_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_diplomacy_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_diplomacy_bullet_2",
								component_state = "positive"
							},
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_starting_advice_orb",
						bulletpoints_list = {
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_advice_bullet_1",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_advice_bullet_2",
								component_state = "positive"
							},
							{
								localised_text_key = "ui_text_replacements_localised_text_phar_map_sec_fac_sum_assyria_advice_bullet_3",
								component_state = "positive"
							},
							
						},
						tooltip_faction_specific_localised_header = "",
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "sec_fac_outposts_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {
						},
					},
					{
						name = "local_deities_orb",
						bulletpoints_list = {
						},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {},
						deities = 
						{
						}
					},					
					{
						name = "native_units_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {
						},
						buildings = {}
					},
					{
						name = "weather_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "sec_fac_titles_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "equipment_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "legitimacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
					{
						name = "ancient_legacy_orb",
						bulletpoints_list = {},
						tooltip_faction_specific_localised_header = "", 
						tooltip_faction_specific_localised_text = "",
						units = {},
						buildings = {}
					},
				},	
			},

			-- contains general config about each mechanic orb
			orb_info = 
			{
				buildings_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_buildings.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_title",
					help_page_key = "help_cat_buildings",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_buildings_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_capital_buildings",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_buildings"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.select_and_zoom_to_player_capital(execute_command, false)
					end
				},
				outposts_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_outposts.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_title",
					help_page_key = "help_the_land_camp_sites",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_capital_outposts",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_outposts"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.select_and_zoom_to_player_capital(execute_command, true)
					end
				},
				sec_fac_outposts_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_outposts.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_title",
					help_page_key = "help_the_land_camp_sites",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ers_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_capital_outposts",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_outposts"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.select_and_zoom_to_player_capital(execute_command, true)
					end
				},
				realm_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_realm.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_realm_title",
					help_page_key = "help_the_land_realms",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_realm_lower_egypt",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_capital_buildings",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_realms"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.select_and_zoom_to_player_capital(execute_command, false)
					end
				},
				realm_lower_egypt_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_realm.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_realm_title",
					help_page_key = "help_the_land_realms",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_realm_lower_egypt",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_capital_buildings",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_realms"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.select_and_zoom_to_player_capital(execute_command, false)
					end
				},
				realm_sinai_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_realm.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_realm_title",
					help_page_key = "help_the_land_realms",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_realm_sinai_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_capital_buildings",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_realms"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.select_and_zoom_to_player_capital(execute_command, false)
					end
				},
				faction_units_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_faction_units.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_units_title",
					help_page_key = "help_cat_units",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_units_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_leader_army",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_units"
					},
					handle_left_click = function(execute_command)
						local faction_obj = cm:get_local_faction(true)
						local faction_leader = faction_obj:faction_leader()
						if not cm:char_has_army(faction_leader) then
							return false
						end
						if execute_command then
							cm:scroll_camera_to_character(faction_leader:command_queue_index())
							CampaignUI.SelectObject(faction_leader:command_queue_index(), "character", true)
						end
						return true
					end
				},
				commands_ramesses_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_ramesses.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_seti_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_seti.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_tausret_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_tausret.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_amenmesse_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_amenmesse.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_merneptah_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_merneptah.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_setnakhte_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_setnakhte.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_irsu_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_irsu.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_bay_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_bay.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_suppi_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_suppiluliuma.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_kurunta_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_kurunta.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_iolaos_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/icon_commands_iolaos.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_walwetes_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/icon_commands_walwetes.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_agamemnon_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_mycenae.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_priam_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_troy.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_ninurta_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_assyria.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				commands_adad_shuma_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_babilim.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_title",
					help_page_key = "help_campaign_commands",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_commands_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_commands"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				native_units_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_native_units.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_title",
					help_page_key = "help_cat_units",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_native_units_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_leader_army",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_units"
					},
					handle_left_click = function(execute_command)
						local faction_obj = cm:get_local_faction(true)
						local faction_leader = faction_obj:faction_leader()
						if not cm:char_has_army(faction_leader) then
							return false
						end
						if execute_command then
							cm:scroll_camera_to_character(faction_leader:command_queue_index())
							CampaignUI.SelectObject(faction_leader:command_queue_index(), "character", true)
						end
						return true
					end
				},
				weather_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_weather.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_title",
					help_page_key = "help_armies_battle_battle_resolution_weather",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_terrain_weather_gen",
						redirect_text_localised_string = "",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_weather"
					},
					handle_left_click = function(execute_command)
						return false
					end
				},
				local_deities_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_title",
					help_page_key = "help_campaign_religion",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_set"
					},
					handle_left_click = function(execute_command)
						local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
						if not faction_key then
							return
						end

						if cm:turn_number() < feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.local_deities) then
							return false
						end

						if execute_command then
							common.toggle_fm_panel("local_deities")
						end
						return true
					end
				},
				local_deities_set_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_set_title",
					help_page_key = "help_campaign_religion_egyptian_deities_set",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_set"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_ra_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_ra_title",
					help_page_key = "help_campaign_religion_egyptian_deities_ra",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_ra"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_isis_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_isis_title",
					help_page_key = "help_campaign_religion_egyptian_deities_isis",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_isis"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_amun_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_amun_title",
					help_page_key = "help_campaign_religion_egyptian_deities_amun",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_amun"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_moloch_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_moloch_title",
					help_page_key = "help_campaign_religion_canaanite_deities_moloch",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_moloch"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_thoth_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_thoth_title",
					help_page_key = "help_campaign_religion_egyptian_deities_thoth",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_thoth"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_arinna_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_arinna_title",
					help_page_key = "help_campaign_religion_hittite_deities_arinna",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_arinna"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_kurunta_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_kurunta_title",
					help_page_key = "help_campaign_religion_hittite_deities_kurunta_deity",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_deities_kurunta"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_isul_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_deities_isul_title",
					help_page_key = "help_campaign_religion_sherden_deities_isul",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_help_deities_isul"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_kuvava_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_deities_kuvava_title",
					help_page_key = "help_campaign_religion_peleset_deities_kuvava",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_help_deities_kuvava"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_zeus_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_zeus_title",
					help_page_key = "help_campaign_religion_aegean_deities_zeus",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_redir_help_deities_zeus"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_apollo_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_apollo_title",
					help_page_key = "help_campaign_religion_aegean_deities_apollo",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_redir_help_deities_apollo"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_ninurta_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_ninurta_title",
					help_page_key = "help_campaign_religion_mesopotamian_deities_ninurta",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_redir_help_deities_ninurta"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				local_deities_marduk_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_local_deities.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_deities_marduk_title",
					help_page_key = "help_campaign_religion_mesopotamian_deities_marduk",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_deities_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_local_deities_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_redir_help_deities_marduk"
					},
					handle_left_click = function(execute_command)
						return faction_summary.overview_tab.config.orb_info.local_deities_orb.handle_left_click(execute_command)
					end
				},
				titles_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_titles.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_title",
					help_page_key = "help_factions_character_panel_titles_competences",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_leader_character_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_titles"
					},
					handle_left_click = function(execute_command)
						local faction_obj = cm:get_local_faction(true)
						local faction_leader = faction_obj:faction_leader()
						if not cm:char_has_army(faction_leader) then
							return false
						end
						if execute_command then
							CampaignUI.OpenDetailsForCharacter(faction_leader:command_queue_index(), "character", false, false, true)
						end
						return true
					end
				},
				sec_fac_titles_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_titles.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_title",
					help_page_key = "help_factions_character_panel_titles_competences",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_titles_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_leader_character_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_titles"
					},
					handle_left_click = function(execute_command)
						local faction_obj = cm:get_local_faction(true)
						local faction_leader = faction_obj:faction_leader()
						if not cm:char_has_army(faction_leader) then
							return false
						end
						if execute_command then
							CampaignUI.OpenDetailsForCharacter(faction_leader:command_queue_index(), "character", false, false, true)
						end
						return true
					end
				},
				equipment_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_equipment.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_equip_title",
					help_page_key = "help_factions_character_panel_ancillaries",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_equip_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_leader_character_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_ancillaries"
					},
					handle_left_click = function(execute_command)
						local faction_obj = cm:get_local_faction(true)
						local faction_leader = faction_obj:faction_leader()
						if not cm:char_has_army(faction_leader) then
							return false
						end
						if execute_command then
							CampaignUI.OpenDetailsForCharacter(faction_leader:command_queue_index(), "character", false, false, true)
						end
						return true
					end
				},
				dynasty_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_dynasty.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_title",
					help_page_key = "help_crown_dynasties",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_map_fac_sum_dynasty_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_redir_dynasty_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_redir_help_dynasty"
					},
					handle_left_click = function(execute_command)
						if execute_command then
							common.toggle_fm_panel("ruling_family")
						end
						return true
					end
				},
				court_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_court.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_court_title",
					help_page_key = "help_crown_court",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_court_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_court_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_court"
					},
					handle_left_click = function(execute_command)
						local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
						if not faction_key then
							return
						end

						if not legitimacy_choice:any_legitimacy_unlocked(faction_key) then
							return false
						end

						if cm:turn_number() < feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.court) then
							return false
						end
						
						if execute_command then
							common.toggle_fm_panel("court")
						end
						return true
					end
				},
				legitimacy_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_legitimacy.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_title",
					help_page_key = "help_crown_becoming_a_king",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_legitimacy_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_power_crown_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_legitimacy"
					},
					handle_left_click = function(execute_command)
						local faction_key = cm:get_local_faction_name(true)
						if cm:turn_number() < feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.pharaohs_crown) then
							return false
						end
						
						if execute_command then
							common.toggle_fm_panel("pharaohs_crown")
						end
						return true
					end
				},
				ancient_legacy_orb = 
				{
					is_central = false,
					show_faction_emblem = false,
					orb_icon_path = "UI/skins/default/faction_widget/phar_fw_icon_local_legacy_selection.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_title",
					help_page_key = "help_crown_ancient_legacies",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_ancient_legacy_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_ancient_legacy"
					},
					handle_left_click = function(execute_command)
						local faction_key = cm:get_local_faction_name(true)
						local turn_number = cm:turn_number()
						local faction_claimed_legacies = is_function(ancient_legacy_common.faction_claimed_legacies) and ancient_legacy_common:faction_claimed_legacies(faction_key)
						if turn_number < feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.pharaohs_crown)
							or turn_number < feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.ancient_legacy)
							or (not ancient_legacy_common:faction_can_claim_any_legacy(faction_key) and not faction_claimed_legacies)
						then
							return false
						end
						
						if execute_command then
							if is_table(faction_claimed_legacies) and not table.is_empty(faction_claimed_legacies) then
								local legacy_key, legacy_data = next(faction_claimed_legacies)
								local legacy_panel_name = ancient_legacy_ui_data[legacy_key].panel_name
								common.toggle_fm_panel(legacy_panel_name)
							elseif is_function(ancient_legacy_common.faction_can_claim_any_legacy) and ancient_legacy_common:faction_can_claim_any_legacy(faction_key) then
								common.toggle_fm_panel("legacy_selection")
							end
						end
						return true
					end
				},
				canaanite_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_widget/phar_fw_icon_local_legacy_selection.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_forge_own_path_title",
					help_page_key = "",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_main_fac_sum_forge_own_path_gen",
						-- redirect_text_localised_string = "",
						-- encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_help_forge_own_path"
					},
					handle_left_click = function(execute_command)
						
					end
				},
				forge_your_own_path_orb = 
				{
					is_central = false,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_widget/phar_fw_icon_local_legacy_selection.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_forge_your_own_path_title",
					help_page_key = "help_crown_forge_your_own_path",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_forge_your_own_path_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_redir_power_crown_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_help_forge_your_own_path"
					},
					handle_left_click = function(execute_command)
						local faction_key = cm:get_local_faction_name(true)
						if not forge_path.is_system_unlocked_by_faction("tribes_privileges", faction_key) then
							return false
						end
						if execute_command then
							common.toggle_fm_panel("sea_tribes_privileges")
						end
						return true
					end
			},
				hybrid_gameplay_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/icon_sea_hybrid.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_title",
					help_page_key = "help_campaign_war_spoils",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_sea_fac_sum_hybrid_gameplay_gen",
						redirect_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_war_spoils_panel",
						encyclopedia_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_help_war_spoils"
					},
					handle_left_click = function(execute_command)
						local faction_key = cm:get_local_faction_name(true)
						if not war_spoils.is_faction_applicable(faction_key) then
							return false
						end
						if execute_command then
							common.toggle_fm_panel("sea_war_spoils")
						end
						return true
					end
				},
				sec_fac_starting_regions_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_summary_icon_realm.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_starting_regions_title",
					help_page_key = "help_the_land_provinces_regions",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_map_fac_sum_starting_regions_gen",
						--redirect_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_war_spoils_panel",
						encyclopedia_text_localised_string = "uied_component_texts_localised_string_dy_action1_default_Text_edb89959"
					},
					handle_left_click = function(execute_command)
					end
				},
				sec_fac_starting_economy_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_map_icon_economy.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_starting_economy_title",
					help_page_key = "help_campaign_multiple_resource_economy",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_map_fac_sum_starting_economy_gen",
						--redirect_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_war_spoils_panel",
						encyclopedia_text_localised_string = "uied_component_texts_localised_string_dy_action1_default_Text_edb89959"
					},
					handle_left_click = function(execute_command)
					end
				},
				sec_fac_starting_diplomacy_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_map_icon_diplomacy.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_starting_diplomacy_title",
					help_page_key = "help_campaign_diplomacy",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_map_fac_sum_starting_diplomacy_gen",
						--redirect_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_war_spoils_panel",
						encyclopedia_text_localised_string = "uied_component_texts_localised_string_dy_action1_default_Text_edb89959"
					},
					handle_left_click = function(execute_command)
					end
				},
				sec_fac_starting_advice_orb = 
				{
					is_central = true,
					show_faction_emblem = true,
					orb_icon_path = "UI/skins/default/faction_summary/icons/phar_map_icon_advice.png",
					title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_starting_advice_title",
					help_page_key = "help_cat_campaign",
					tooltip_info = 
					{
						summary_text = "ui_text_replacements_localised_text_phar_map_fac_sum_starting_advice_gen",
						--redirect_text_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_redir_war_spoils_panel",
						encyclopedia_text_localised_string = "uied_component_texts_localised_string_dy_action1_default_Text_edb89959"
					},
					handle_left_click = function(execute_command)
					end
				},
			},

			-- contains filepaths and strings for faction-specific texts for the tooltip and leader info
			faction_info = 
				{
				["phar_main_ramesses"] =
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_ramesses_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_ramesses_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_ramesses_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_ramesses_2",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_ramesses/mon_64.png",
				},
				["phar_main_seti"] =
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_seti_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_seti_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_seti_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_seti_2",
					faction_emblem_small = "UI/Flags/phar_main_seti/mon_64.png",
				},
				["phar_main_amenmesse"] =
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_amenmesse_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_amenmesse_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_amenmesse_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_amenmesse_2",
					faction_emblem_small = "UI/Flags/phar_main_amenmesse/mon_64.png",
				},
				["phar_main_tausret"] =
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_tausret_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_tausret_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_tausret_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_tausret_2",
					faction_emblem_small = "UI/Flags/phar_main_tausret/mon_64.png",
				},
				["phar_main_merneptah"] =
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_setnakhte_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_merneptah_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_merneptah_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_merneptah_2",
					faction_emblem_small = "UI/Flags/phar_main_merneptah/mon_64.png",
				},
				["phar_main_setnakhte"] =
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_setnakhte_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_setnakhte_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_setnakhte_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_setnakhte_2",
					faction_emblem_small = "UI/Flags/phar_main_setnakhte/mon_64.png",
				},
				["phar_main_irsu"] = 
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_irsu_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_irsu_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_irsu_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_irsu_2",
					faction_emblem_small = "UI/Flags/phar_main_irsu/mon_64.png",
				},
				["phar_main_bay"] = 
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_bay_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_bay_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_bay_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_bay_2",
					faction_emblem_small = "UI/Flags/phar_main_bay/mon_64.png",
				},
				["phar_main_suppiluliuma"] = 
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_suppiluliuma_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_suppiluliuma_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_suppi_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_suppi_2",
					faction_emblem_small = "UI/Flags/phar_main_hattusa/mon_64.png",
				},
				["phar_main_kurunta"] = 
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_kurunta_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_kurunta_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_kurunta_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_main_fac_sum_subtitle_kurunta_2",
					faction_emblem_small = "UI/Flags/phar_main_tarhuntassa/mon_64.png",
				},
				["phar_sea_peleset"] =
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_sea_peleset_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_sea_peleset_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_subtitle_walwetes_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_subtitle_walwetes_2",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_sea_peleset/mon_64.png",
				},
				["phar_sea_sherden"] =
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_sea_sherden_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_sea_sherden_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_subtitle_iolaos_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_sea_fac_sum_subtitle_iolaos_2",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_sea_sherden/mon_64.png",
				},

				--COMBINED_MAP
				--MAJOR FACTIONS
				["troy_main_dan_mycenae"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_troy_main_dan_mycenae_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_mycenae_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_subtitle_agamemnon_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_subtitle_agamemnon_2",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/troy_main_ach_mycenae/mon_64.png",
				},
				["troy_main_trj_troy"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_troy_main_trj_troy_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_troy_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_subtitle_priam_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_subtitle_priam_2",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/troy_main_pel_troy/mon_64.png",
				},
				["phar_map_ninurta"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_map_ninurta_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_ninurta_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_subtitle_ninurta_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_subtitle_ninurta_2",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_meso_kurbarnuna/mon_64.png",
				},
				["phar_map_babylon"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_map_babylon_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_babilim_flag.png",
					leader_title_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_subtitle_adad_shuma_1",
					leader_flavour_localised_string = "ui_text_replacements_localised_text_phar_map_fac_sum_subtitle_adad_shuma_2",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_meso_babilim/mon_64.png",
				},		
				--SECONDARY FACTIONS
				["phar_main_merneptah"] = 
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_merneptah_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_merneptah_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_merneptah/mon_64.png",
				},
				["phar_main_setnakhte"] = 
				{
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_setnakhte_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_setnakhte_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_setnakhte/mon_64.png",
				},
				["phar_main_napata"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_napata_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_napata_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_napata/mon_64.png",
				},
				["phar_main_bahariya"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_bahariya_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_bahariya_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_bahariya/mon_64.png",
				},
				["phar_main_dungul"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_dungul_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_dungul_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_dungul/mon_64.png",
				},
				["troy_main_dan_achilles"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_troy_main_dan_achilles_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_troy_main_dan_achilles_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/troy_main_ach_achilles/mon_64.png",
				},
				["troy_main_dan_ithaca"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_troy_main_dan_ithaca_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_troy_main_dan_ithaca_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_aeg_ithaca/mon_64.png",
				},
				["troy_main_dan_boeotians"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_troy_main_dan_boeotians_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_troy_main_dan_boeotians_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_aeg_boeotians/mon_64.png",
				},
				["troy_main_trj_lycia"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_troy_main_trj_lycia_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_troy_main_trj_lycia_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_aeg_lycia/mon_64.png",
				},
				["troy_rem_trj_thrace"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_troy_rem_trj_thrace_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_troy_rem_trj_thrace_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/troy_rem_thr_thrace/mon_64.png",
				},
				["phar_main_ugarit"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_ugarit_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_ugarit_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_ugarit/mon_64.png",
				},
				["phar_main_emar"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_emar_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_emar_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_emar/mon_64.png",
				},
				["phar_main_byblos"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_byblos_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_byblos_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_byblos/mon_64.png",
				},
				["phar_main_damascus"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_damascus_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_damascus_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_tadmor/mon_64.png",
				},
				["phar_main_ashkelon"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_ashkelon_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_ashkelon_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_ashkelon/mon_64.png",
				},
				["troy_amazons_trj_hippolyta"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_troy_amazons_trj_hippolyta_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_troy_amazons_trj_hippolyta_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/troy_dlc1_thr_hippolytas_amazons/mon_64.png",
				},
				["phar_main_malidiya"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_malidiya_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_malidiya_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_malidiya/mon_64.png",
				},
				["phar_map_sangarian_phrygians"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_map_sangarian_phrygians_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_sangarian_phrygians_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_aeg_sangarian_phrygians/mon_512.png",
				},
				["phar_main_alashiya"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_alashiya_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_alashiya_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_alashiya/mon_512.png",
				},
				["phar_main_carchemish"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_main_carchemish_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_main_carchemish_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_main_carchemish/mon_512.png",
				},
				["phar_map_igihalkid"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_map_igihalkid_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_igihalkid_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_elam_igihalkid/mon_512.png",
				},
				["phar_map_lullubi"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_map_lullubi_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_lullubi_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_nom_lullubi/mon_512.png",
				},
				["phar_map_sutu"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_map_sutu_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_sutu_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_can_sutu/mon_512.png",
				},
				["phar_map_shubru"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_map_shubru_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_shubru_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_hit_shubru/mon_512.png",
				},
				["phar_map_assyria"] = {
					leader_portrait_filepath = "UI/skins/default/faction_summary/image_phar_map_assyria_portrait.png",
					faction_flag_filepath = "UI/skins/default/faction_summary/image_phar_map_assyria_flag.png",
					leader_title_localised_string = "",
					leader_flavour_localised_string = "",
					-- used in the "overview" orb when it's about a faction-specific mechanic and also in the tooltip
					faction_emblem_small = "UI/Flags/phar_map_meso_assyria/mon_512.png",
				},		
			}
			

		},

		init_ui_components = function()
			if not faction_summary.panel then
				return
			end

			faction_summary.overview_tab.init_leader_info()
			faction_summary.overview_tab.init_flag_and_portrait()
			faction_summary.overview_tab.init_orb_components()
		end,

		init_ui_templates = function(panel)
			if not panel then
				return
			end

			if not faction_summary.overview_tab.highlights_list_component then
				faction_summary.overview_tab.highlights_list_component = panel:SequentialFind(faction_summary.overview_tab.config.component_ids.highlights_list_component_id)
			end

			if not faction_summary.overview_tab.highlight_template_component then
				faction_summary.overview_tab.highlight_template_component = faction_summary.overview_tab.highlights_list_component:SequentialFind(faction_summary.overview_tab.config.component_ids.highlight_template_component_id)
				faction_summary.overview_tab.highlight_template_component:DivorceFromParent()
			end

			if not faction_summary.overview_tab.overview_list_component then
				faction_summary.overview_tab.overview_list_component = panel:SequentialFind(faction_summary.overview_tab.config.component_ids.overview_list_component_id)
			end

			if not faction_summary.overview_tab.overview_template_component then
				faction_summary.overview_tab.overview_template_component = faction_summary.overview_tab.overview_list_component:SequentialFind(faction_summary.overview_tab.config.component_ids.overview_template_component_id)
				faction_summary.overview_tab.overview_template_component:DivorceFromParent()
			end
		end,

		init_leader_info = function()
			local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
			if not faction_key then
				return
			end
			
			local leader_info = faction_summary.panel:SequentialFind("overview", faction_summary.overview_tab.config.component_ids.leader_info_component)
			if not leader_info then
				return
			end
			
			local faction_obj = core:is_campaign() and cm:get_local_faction(true)

			-- set through CCO in the frontend
			if not faction_summary.is_from_frontend then
				local name_component = leader_info:SequentialFind("dy_name")
				if name_component then
					name_component:SetStateText(faction_obj:localised_display_name())
				end
			end

			local title_component = leader_info:SequentialFind("dy_title")
			local flavour_component = leader_info:SequentialFind("dy_flavour")
			if not faction_obj or faction_obj:faction_leader():is_original_faction_leader() then
				-- We keep the behaviour of the base game when the original faction leader is still alive
				local title_string = common.get_localised_string(faction_summary.overview_tab.config.faction_info[faction_key].leader_title_localised_string)
				if title_component then
					title_component:SetStateText(title_string)
				end

				local flavour_text_string = common.get_localised_string(faction_summary.overview_tab.config.faction_info[faction_key].leader_flavour_localised_string)
				if flavour_component then
					flavour_component:SetStateText(flavour_text_string)
				end
			else
				if title_component then
					title_component:SetStateText(faction_obj:faction_leader_localised_subname())
				end

				if flavour_component then
					if faction_obj:is_localised_display_name_static() then
						flavour_component:SetStateText(faction_obj:faction_leader():onscreen_name())
					else
						-- No need to show the faction leader name because it is the same as the faction name
						flavour_component:SetVisible(false)
					end
				end
			end
		end,

		init_flag_and_portrait = function()
			local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
			if not faction_key then
				return
			end
			
			local portrait_holder = faction_summary.panel:SequentialFind("overview", faction_summary.overview_tab.config.component_ids.portrait_holder_component)
			if not portrait_holder then
				return
			end

			local faction_flag_component = portrait_holder:SequentialFind("faction_flag")
			if faction_flag_component then
				faction_flag_component:SetImagePath(faction_summary.overview_tab.config.faction_info[faction_key].faction_flag_filepath)
			end

			-- TODO: This will become 3d character model of the current faction leader. Waiting for UI
			local leader_portrait_component = portrait_holder:SequentialFind("leader_portrait")
			if leader_portrait_component then
				leader_portrait_component:SetImagePath(faction_summary.overview_tab.config.faction_info[faction_key].leader_portrait_filepath)
			end
		end,

		init_orb_components = function()
			local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
			if not faction_key then
				return
			end

			if not faction_summary.overview_tab.highlights_list_component then
				faction_summary.overview_tab.highlights_list_component = faction_summary.panel:SequentialFind(faction_summary.overview_tab.config.component_ids.highlights_list_component_id)
			end

			if not faction_summary.overview_tab.highlight_template_component then
				faction_summary.overview_tab.highlight_template_component = faction_summary.overview_tab.highlights_list_component:SequentialFind(faction_summary.overview_tab.config.component_ids.highlight_template_component_id)
				faction_summary.overview_tab.highlight_template_component:DivorceFromParent()
			end

			if not faction_summary.overview_tab.overview_list_component then
				faction_summary.overview_tab.overview_list_component = faction_summary.panel:SequentialFind(faction_summary.overview_tab.config.component_ids.overview_list_component_id)
			end

			if not faction_summary.overview_tab.overview_template_component then
				faction_summary.overview_tab.overview_template_component = faction_summary.overview_tab.overview_list_component:SequentialFind(faction_summary.overview_tab.config.component_ids.overview_template_component_id)
				faction_summary.overview_tab.overview_template_component:DivorceFromParent()
			end

			faction_summary.overview_tab.highlights_list_component:DestroyChildren()
			faction_summary.overview_tab.overview_list_component:DestroyChildren()

			for index, orb in ipairs(faction_summary.overview_tab.config.faction_orbs[faction_key]) do
				local orb_info_table = faction_summary.overview_tab.config.orb_info[orb.name]
				if orb_info_table then
					local entry_component
					if orb_info_table.is_central then
						entry_component = UIComponent(faction_summary.overview_tab.highlights_list_component:CreateFromComponent(faction_summary.overview_tab.highlight_template_component:Address(), orb.name))
						faction_summary.overview_tab.init_bulletpoints_list(entry_component)
					else
						entry_component = UIComponent(faction_summary.overview_tab.overview_list_component:CreateFromComponent(faction_summary.overview_tab.overview_template_component:Address(), orb.name))
						if faction_summary.overview_tab.config.orb_info[orb.name].show_faction_emblem then
							local faction_emblem_component = entry_component:SequentialFind("faction_emblem")
							faction_emblem_component:SetVisible(true)
							faction_emblem_component:SetImagePath(faction_summary.overview_tab.config.faction_info[faction_key].faction_emblem_small)
						end
					end

					if entry_component then
						local localised_orb_title = common.get_localised_string(orb_info_table.title_localised_string)
						entry_component:SequentialFind("dy_title"):SetStateText(localised_orb_title)
						entry_component:SequentialFind("dy_icon"):SetImagePath(orb_info_table.orb_icon_path)
						faction_summary.overview_tab.init_tooltip_for_component(entry_component)
						local icon_component = entry_component:SequentialFind("icon")
						if icon_component then
							icon_component:SetProperty("help_page_key", orb_info_table.help_page_key)
							icon_component:SetProperty("help_page_cursor", 0)
							icon_component:SetProperty("help_page_open_on_right_click", 1)
						end
					end
				end
			end
		end,

		init_bulletpoints_list = function(component)
			local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
			if not faction_key then
				return
			end

			local bulletpoints_list_component = component:SequentialFind("bulletpoints_list")
			if bulletpoints_list_component then
				local bulletpoint_template = bulletpoints_list_component:SequentialFind("bulletpoint_template")
				if bulletpoint_template then
					bulletpoint_template:DivorceFromParent()
					local bulletpoints_list_for_faction = {}
					for index, orb in ipairs(faction_summary.overview_tab.config.faction_orbs[faction_key]) do
						if orb.name == component:Id() then
							bulletpoints_list_for_faction = orb.bulletpoints_list
							break
						end
					end

					for index, bulletpoint_config_table in ipairs(bulletpoints_list_for_faction) do
						local bulletpoint_entry = bulletpoints_list_component:CreateFromComponent(bulletpoint_template:Address(), string.format("bulletpoint_%d", index))
						if bulletpoint_config_table.component_state and bulletpoint_config_table.component_state ~= "" then
							UIComponent(bulletpoint_entry):SetState(bulletpoint_config_table.component_state)
						end
						local localised_bulletpoint_text = common.get_localised_string(bulletpoint_config_table.localised_text_key)
						UIComponent(bulletpoint_entry):SetStateText(localised_bulletpoint_text)
					end
				end
			end
		end,

		init_tooltip_for_component = function(component)
			local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
			if not faction_key then
				return
			end
			
			component:SequentialFind("icon"):SetTooltipText("{{tt:" .. faction_summary.overview_tab.config.component_ids.orb_tooltip_layout_path .. "}}", "", true)

			local orb_info_table = faction_summary.overview_tab.config.orb_info[component:Id()]
			if table.is_empty(orb_info_table) then
				return 
			end

			local cco_table = {}
			cco_table.FactionKey = faction_key
			cco_table.Title = common.get_localised_string(orb_info_table.title_localised_string)
			-- if we want ot add an icon to the tooltip we just uncomment this line
			-- cco_table.IconPath = orb_info_table.orb_icon_path
			cco_table.SummaryText = common.get_localised_string(orb_info_table.tooltip_info.summary_text)
			for index, orb in ipairs(faction_summary.overview_tab.config.faction_orbs[faction_key]) do
				if orb.name == component:Id() then
					if orb.tooltip_faction_specific_localised_text ~= nil and orb.tooltip_faction_specific_localised_text ~= "" then
						cco_table.FactionEmblem = faction_summary.overview_tab.config.faction_info[faction_key].faction_emblem_small
						if orb.tooltip_faction_specific_localised_header ~= nil and orb.tooltip_faction_specific_localised_header ~= "" then
							cco_table.FactionHeader = common.get_localised_string(orb.tooltip_faction_specific_localised_header)
						end
						cco_table.FactionText = common.get_localised_string(orb.tooltip_faction_specific_localised_text)
					end
				end
			end
			
			if not faction_summary.is_from_frontend then
				if is_function(orb_info_table.handle_left_click) and orb_info_table.handle_left_click(false) then
					if is_string(orb_info_table.tooltip_info.redirect_text_localised_string) then
					cco_table.RedirectText = common.get_localised_string(orb_info_table.tooltip_info.redirect_text_localised_string)
				end
				end
				if is_string(orb_info_table.tooltip_info.encyclopedia_text_localised_string) then
				cco_table.EncyclopediaText = common.get_localised_string(orb_info_table.tooltip_info.encyclopedia_text_localised_string)
			end
			end

			local script_id = "tooltip_" .. component:Id()
			component:SequentialFind("icon"):SetProperty("script_id", script_id)
			common.set_context_value(script_id, cco_table)
		end,

		select_and_zoom_to_player_capital = function(execute_command, show_ers_panel)
			local faction_obj = cm:get_local_faction(true)
			if not faction_obj:has_home_region() then
				return false
			end

			local settlement = faction_obj:home_region():settlement()
			if settlement == nil or settlement:is_null_interface() then
				return false
			end
			
			if execute_command then
				cm:scroll_camera_to_settlement(faction_obj:home_region():name())
				CampaignUI.SelectSettlement(settlement:command_queue_index(), show_ers_panel)
			end
			return true
		end,

		cleaup_templates_and_variables = function()
			-- cleanup when the planel is closed
			if faction_summary.overview_tab.overview_list_component then
				faction_summary.overview_tab.overview_list_component = nil
			end

			if faction_summary.overview_tab.overview_template_component then
				faction_summary.overview_tab.overview_template_component = nil
			end

			if faction_summary.overview_tab.highlights_list_component then
				faction_summary.overview_tab.highlights_list_component = nil
			end

			if faction_summary.overview_tab.highlight_template_component then
				faction_summary.overview_tab.highlight_template_component = nil
			end

			if faction_summary.panel then
				faction_summary.panel = nil
			end

			if faction_summary.faction_key then
				faction_summary.faction_key = nil
			end

			if faction_summary.is_from_frontend then
				faction_summary.is_from_frontend = nil
			end
		end
	}
}

----------------------------------------------------
--------------CAMPAIGN EVENT LISTENERS--------------
----------------------------------------------------

core:add_listener(
	"PharFactionSummaryPanel_PanelOpenedCampaign",
	"PanelOpenedCampaign",
	function(context) 
		return context.string == faction_summary.panel_component_name
	end, 
	function(context)
		faction_summary.panel = UIComponent(context.component)

		if not faction_summary.panel then
			script_error("ERROR: faction summary panel is not found!");
			return
		end
		
		faction_summary.summary_tab.init_god_slots()
		faction_summary.overview_tab.init_ui_components()

		core:add_listener (
			"PharFactionSummaryPanel_ButtonClicked",
			"ComponentLClickUp",
			function(context)
				local parent_of_clicked_component = UIComponent(context.component):Parent()
				return parent_of_clicked_component and faction_summary.overview_tab.config.orb_info[UIComponent(parent_of_clicked_component):Id()]
			end,
			function(context)
				if not faction_summary.panel then
					return
				end
				-- clicked on a orb in the "overview" tab
				local parent_of_clicked_component = UIComponent(context.component):Parent()
				local clicked_orb_info_table = faction_summary.overview_tab.config.orb_info[UIComponent(parent_of_clicked_component):Id()]
				if clicked_orb_info_table and is_function(clicked_orb_info_table.handle_left_click) then
					clicked_orb_info_table.handle_left_click(true)
				end
			end,
			true
		)

		-- this listener will trigger if we've hovered over a deity entry in the tooltip of the "local_deities" orb
		-- and create a tooltip for it, we have to do it here since the tooltip used has custom effect bundles 
		-- that need to be attached to the correct components of the tooltips once it's already been created
		core:add_listener(
			"PharFactionSummaryPanel_DeityEntry_OnMouseOn",
			"ComponentMouseOn",
			function(context)
				local parent_of_hovered_component = UIComponent(context.component):Parent()
				return parent_of_hovered_component and string.find(UIComponent(context.component):Id(), "deity_entry")
			end,
			function(context)
				if not faction_summary.panel then
					return
				end

				local split_string = string.split(UIComponent(context.component):Id(), "_")
				local entry_index = split_string[3]
				if (entry_index == "") then
					return
				end

				local faction_key = faction_summary.faction_key or cm:get_local_faction_name(true)
				if not faction_key then
					return
				end

				for index, orb in ipairs(faction_summary.overview_tab.config.faction_orbs[faction_key]) do
					if string.find(orb.name, "local_deities") and orb.deities and not table.is_empty(orb.deities) then
						local god_key = orb.deities[tonumber(entry_index)].key
						if god_key == nil or god_key == "" then
							return
						end

						local tier = deities.get_tier(faction_key, god_key)
						if tier <= 0 then
							return
						end

						deities.init_tier_tooltip(UIComponent(context.component), god_key, tier)
					end
				end
			end,
			true
		)
	end,
	true
)

core:add_listener(
	"PharVictoryScreen_PanelOpenedCampaign",
	"PanelOpenedCampaign",
	function(context) 
		return context.string == faction_summary.victory_panel_component_name
	end, 
	function(context)
		faction_summary.panel = UIComponent(context.component)

		if not faction_summary.panel then
			return
		end
		faction_summary.summary_tab.init_god_slots()
	end,
	true
)

-- panel closed
core:add_listener (
	"PharFactionSummaryPanel_PanelClosedCampaign",
	"PanelClosedCampaign",
	function(context) 
		return context.string == faction_summary.panel_component_name 
	end,
	function(context)
		core:remove_listener("PharFactionSummaryPanel_ButtonClicked")
		core:remove_listener("PharFactionSummaryPanel_DeityEntry_OnMouseOn")
		faction_summary.overview_tab.cleaup_templates_and_variables()
	end,
	true
)

-- this listener will trigger when we hover over an orb 
-- and will initialize the lists of unit cards, building info and/or deities if there are any of those for the tooltip of the orb we have hovered
-- used both in frontend and in campaign
core:add_listener(
	"PharFactionSummaryPanel_OnMouseOn",
	"ComponentMouseOn",
	function(context)
		local parent_of_hovered_component = UIComponent(context.component):Parent()
		return parent_of_hovered_component and faction_summary.overview_tab.config.orb_info[UIComponent(parent_of_hovered_component):Id()]
	end,
	function(context)
		if not faction_summary.panel then
			return
		end
		
		if faction_summary.is_from_frontend and not UIComponent(faction_summary.panel:Find("overview_background")):CurrentAnimationId() == "" then
			return
		end

		local ui_root = core:get_ui_root()
		if not ui_root then
			return
		end

		local faction_key = faction_summary.faction_key 
		if not faction_key then
			if core:is_campaign() then
				faction_key = cm:get_local_faction_name(true)
			else
				return
			end
		end
		local parent_of_hovered_component = UIComponent(context.component):Parent()

		local tooltip_component = ui_root:SequentialFind(faction_summary.overview_tab.config.component_ids.orb_tooltip_component_id)
		if tooltip_component then
			local units_and_buildings_list_component = tooltip_component:SequentialFind("units_and_buildings_list")
			for index, orb in ipairs(faction_summary.overview_tab.config.faction_orbs[faction_key]) do
				if orb.name == UIComponent(parent_of_hovered_component):Id() then
					if orb.units and not table.is_empty(orb.units) then
						units_and_buildings_list_component:InterfaceFunction("init_unit_cards_list", orb.units)
					end

					if orb.buildings and not table.is_empty(orb.buildings) then
						units_and_buildings_list_component:InterfaceFunction("init_building_entries_list", orb.buildings, faction_key)
					end

					if orb.deities and not table.is_empty(orb.deities) then
						local deities_list_component = tooltip_component:SequentialFind("deities_list")
						deities_list_component:SetVisible(true)
						
						local deity_template = deities_list_component:SequentialFind("template_deity_entry")
						if deity_template then
							deity_template:DivorceFromParent()
							for index, deity_info in ipairs(orb.deities) do
								local deity_entry = deities_list_component:CreateFromComponent(deity_template:Address(), string.format("deity_entry_%d", index))
								UIComponent(deity_entry):SetImagePath(deity_info.deity_image_path)

								local deity_description_component = UIComponent(deity_entry):SequentialFind("dy_deity_description")
								if deity_description_component then
									local localised_description_text = common.get_localised_string(deity_info.description)
									deity_description_component:SetStateText(localised_description_text)
								end
							end
						end
					end
				end
			end
		end
	end,
	true
)

-- first tick listener to show faction summary panel in MP campaign since there are no intro cutscenes there
core:add_listener(
	"PharFactionSummaryPanel_FirstTickListener",
	"FirstTickAfterNewCampaignStarted",
	function()
		return true
	end,
	function(context)
		if not cm:is_multiplayer() then
			return
		end

		if faction_summary.panel_shown_on_campaign_start or CampaignUI.IsCinematicModeEnabled() then
			return
		end

		common.toggle_fm_panel("clan")
		faction_summary.panel_shown_on_campaign_start = true
	end,
	true
)

-- these two listeners will show faction summary panel in SP campaign
-- the intro cutscene finished before we disable cinematic mode, so we need to listen to both events
-- since we can't open any panels during cinematic mode
core:add_listener(
	"PharFactionSummaryPanel_IntroCutsceneFinishedListener",
	"ScriptEventIntroCutsceneFinished",
	function()
		return true
	end,
	function(context)
		faction_summary.panel_shown_on_campaign_start = false
		faction_summary.intro_cutscene_finished = true
	end,
	false
)

core:add_listener(
	"PharFactionSummaryPanel_CinematicModeDisabledListener",
	"ContextTriggerEvent",
	function(context)
		return context.string == "CampaignCinematicModeDisabled"
	end,
	function(context)
		if cm:turn_number() ~= 1 or cm:is_multiplayer() then
			return
		end

		-- do nothing if we're in FTUE mode
		if core:svr_load_bool("sbool_player_selected_first_turn_intro_on_frontend") or cm:get_saved_value("bool_is_tutorial_mode") then
			return
		end

		if faction_summary.panel_shown_on_campaign_start or not faction_summary.intro_cutscene_finished then
			return
		end
		
		common.toggle_fm_panel("clan")
		faction_summary.panel_shown_on_campaign_start = true
	end,
	true
)

----------------------------------------------------
--------------FRONTEND EVENT LISTENERS--------------
----------------------------------------------------

core:add_listener(
	"PharFactionSelection_FrontendFactionSelected",
	"ContextTriggerEvent",
	function(context)
		return string.find(context.string, "FrontendFactionSelected")
	end,
	function(context)
		local split_string = string.split(context.string, ":")
		local faction_key = split_string[2]
		if faction_key == "" then
			return
		end
		
		local ui_root = core:get_ui_root()
		if not ui_root then
			return
		end
		
		if not faction_summary.panel then
			faction_summary.panel = ui_root:SequentialFind(faction_summary.frontend_component_name)
		end
		
		faction_summary.faction_key = faction_key

		if not faction_summary.is_from_frontend then
			faction_summary.is_from_frontend = true
		end

		faction_summary.overview_tab.init_ui_components()
		
		local uic_grand_campaign = find_uicomponent("sp_grand_campaign")
			
		if not uic_grand_campaign then
			script_error("ERROR: start_new_campaign_listener() couldn't find uic_grand_campaign, how can this be?")
			return false
		end

		local first_time_panel_shown = core:svr_load_registry_bool("first_time_overview_panel_shown_frontend")
		local is_secondary_faction = common.is_secondary_faction(faction_key)
		if not first_time_panel_shown and not is_secondary_faction then
			core:svr_save_registry_bool("first_time_overview_panel_shown_frontend", true)
			uic_grand_campaign:InterfaceFunction("show_overview_panel", true)
		end
	end,
	true
)

core:add_listener(
	"PharFactionSelection_AdviceHistoryCleared",
	"AdviceCleared",
	true,
	function()
		core:svr_save_registry_bool("first_time_overview_panel_shown_frontend", false)
	end,
	true
)

core:add_listener(
	"PharFactionSelection_FrontendFactionSelectDestroyed",
	"ContextTriggerEvent",
	function(context)
		return context.string == "FrontendFactionSelectDestroyed"
	end,
	function(context)
		faction_summary.overview_tab.cleaup_templates_and_variables()
	end,
	true
)

core:add_listener(
	"PharFactionSelection_FrontendSelectedFactionClosed",
	"ContextTriggerEvent",
	function(context)
		return context.string == "FrontendSelectedFactionClosed"
	end,
	function(context)
		if faction_summary.faction_key then
			faction_summary.faction_key = nil
		end
	end,
	true
)

core:add_listener(
	"PharFactionSelection_SPGrandCampaign_OnCreate",
	"ContextTriggerEvent",
	function(context)
		return context.string == "SPGrandCampaign_OnCreate"
	end,
	function(context)
		local ui_root = core:get_ui_root()
		if not ui_root then
				return
		end
		faction_summary.overview_tab.init_ui_templates(ui_root:SequentialFind(faction_summary.frontend_component_name))
	end,
	true
)

core:add_listener(
	"PharFactionSelection_ComponentLClickUp",
	"ComponentLClickUp",
	function(context)
		return UIComponent(context.component):Id() == "button_toggle"
	end,
	function(context)
		if not faction_summary.panel then
			return
		end
		
		local button_glow_component = UIComponent(faction_summary.panel:Parent()):Find("selected_glow")
		if button_glow_component then
			UIComponent(button_glow_component):SetVisible(false)
		end
	end,
	true
)