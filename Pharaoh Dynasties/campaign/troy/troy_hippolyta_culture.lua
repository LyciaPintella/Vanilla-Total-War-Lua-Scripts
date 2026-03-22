out("Loading troy_hippolyta_culture.lua")

local DEBUG_ENABLED = false
hippolyta_debug_str = "troy_hippolyta_culture: "

local function print_debug(str, force_print) 
	if DEBUG_ENABLED or force_print then
		out(hippolyta_debug_str .. str)
	end
end

-- CONSTANTS

CULTURE_INITIAL_AMOUNT = 0 -- Leave this to 0 in the Database
HIPPOLYTA_CULTURE_MAX_VALUE = nil -- value from db. Used for the Culture bar

hippolyta_faction = "troy_amazons_trj_hippolyta"
hippolyta_culture = "troy_culture" -- db key of the culture resource
hippolyta_faction_mechanic_panel = "fm_amazon_kingdom_milestones"
hippolyta_view_legacy_video = "EventPics/amazons/hippolyta_events_all_scenes_dlc1.ca_vp8"


hippolyta_ui = {
	root = "fm_hippolyta_culture",
	src_path = "ui/campaign ui/fm_hippolyta_culture",
	target_path = {"hud_campaign", "faction_widget"}
}

-- hippolyta post-battle culture bonuses according enemy units count
hippolyta_post_battle_culture_bonuses = {	
	["troy_dlc1_hero_campaign_treasures_battle"] = {
		["1-200"]		=	2,
		["201-1000"]	=	5,
		["1001-2000"]	=	8,
		["2001-10000"]	=	10,
	},
}

-- hippolyta OccupationDecision culture bonuses according character skill
hippolyta_occupation_decision_culture_bonuses = {
	["troy_dlc1_hero_campaign_treasures_battle_spec_siege"] = 10,
}

-- Table with all the setup and configuration for the Efforts
hippolyta_efforts = {

	--[[ Table format:

		effort_key = {
			culture_cost -> Returns the required Culture to use the Effort,
			apply_effect -> Applies the effect of the Effort
			event_args -> Function that returns a comma separated string of arguments which should be passed to the HippolytaCulture_EffortButtonClickedEvent handler
			button = {
				name -> The name of the Effort button
				path -> Full path from the root element to the Effort button
				panel -> The panel in which the button is displayed
				should_show -> Conditions if the Effort button should be visible
				state -> Conditions if the Effort button should be active/inactive
			}
		}
	--]]

	-- Instant Level Up Unit Effort
	unit_level_up = {
		panel_icon_tooltip = "campaign_localised_strings_string_amazon_feat_unit_level_up_description_ui_panel",
		culture_cost = function() 
							local needed_experience = hippolyta_selected_unit:experience_until_next_level()
							local portion_size = 100
							local culture_per_portion = 1

							return -math.ceil((needed_experience / portion_size) * culture_per_portion)
						end,
		apply_effect = function()
				cm:add_experience_to_unit(hippolyta_selected_unit:command_queue_index(), 1)

				--
				--achievements.feats.func_execute(cm:get_faction(hippolyta_faction))
			end,
		event_args = function() return tostring(hippolyta_selected_unit:command_queue_index()) end,
		button = {
			name = "button_unit_level_up",
			path = {"units_panel", "main_units_panel", "button_group_unit"},
			panel = "units_panel",
			should_show = function() return cm:get_local_faction_name(true) == hippolyta_faction and hippolyta_selected_unit:unit_commander():is_null_interface() end,
			state = function()
						local buttonState = "active"
						local tooltip_details = {
													tooltipTitle = "amazon_feat_unit_level_up_title",
													tooltipDescription = "amazon_feat_unit_level_up_description",
													tooltipError = ""
												}

						if hippolyta_unlocked_efforts["unit_level_up"] == nil then
							buttonState = "inactive"							
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_milestone_locked_0"
						elseif hippolyta_selected_unit and hippolyta_selected_unit:experience_until_next_level() <= 0 then
							buttonState = "inactive"
							-- TODO proper string
							tooltip_details.tooltipDescription = '' -- Remove description only the error should be visible
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_max_level" -- Unit is max rank
						elseif hippolyta_selected_unit and not HippolytaCulture_CanAffordEffort("unit_level_up") then
							buttonState = "inactive"
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_not_enough_resource"
						end
						return buttonState, tooltip_details
					end
		}
	},

	-- Instant Level Up Hero Effort
	hero_level_up = {
		panel_icon_tooltip = "campaign_localised_strings_string_amazon_feat_hero_level_up_description_ui_panel",
		culture_cost = function()
			local needed_experience = hippolyta_selected_unit:unit_commander():experience_required_for_rank_up()
			local portion_size = 15
			local culture_per_portion = 1

			return -math.ceil((needed_experience / portion_size) * culture_per_portion)
		end,
		apply_effect = function()
			cm:add_agent_experience("character_cqi:" .. hippolyta_selected_unit:unit_commander():command_queue_index(), hippolyta_selected_unit:unit_commander():experience_required_for_rank_up())
			--
			--achievements.feats.func_execute(cm:get_faction(hippolyta_faction))
		end,
		event_args = function() return tostring(hippolyta_selected_unit:command_queue_index()) end,
		button = {
			name = "button_hero_level_up",
			path = {"units_panel", "main_units_panel", "button_group_unit"},
			panel = "units_panel",
			should_show = function() return cm:get_local_faction_name(true) == hippolyta_faction and not hippolyta_selected_unit:unit_commander():is_null_interface() end,
			state = function()
						local buttonState = "active"
						local tooltip_details = {
													tooltipTitle = "amazon_feat_hero_level_up_title",
													tooltipDescription = "amazon_feat_hero_level_up_description",
													tooltipError = ""
												}

						if hippolyta_unlocked_efforts["hero_level_up"] == nil then
							buttonState = "inactive"
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_milestone_locked_1" -- Need to unlock relevant milestone
						elseif hippolyta_selected_unit and hippolyta_selected_unit:unit_commander():experience_required_for_rank_up() <= 0 then
							buttonState = "inactive"
							-- TODO proper string
							tooltip_details.tooltipDescription = '' -- Remove description only the error should be visible
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_max_level" -- Character is max level
						elseif hippolyta_selected_unit and not HippolytaCulture_CanAffordEffort("hero_level_up") then
							buttonState = "inactive"
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_not_enough_resource" -- Not enough Amazon Treasure
						end
						return buttonState, tooltip_details
					end
		}
	},

	-- Instant Upgrade main building Effort
	instant_upgrade = {
		panel_icon_tooltip = "campaign_localised_strings_string_amazon_feat_instant_upgrade_description_ui_panel",
		culture_cost = function() return -150 end,
		apply_effect = function()
			local next_level_key = hippolyta_selected_region:slot_list():item_at(0):building():possible_building_construction_list()[1]
			cm:instantly_upgrade_building_in_region(hippolyta_selected_region:name(), 0, next_level_key)
			--
			--achievements.feats.func_execute(cm:get_faction(hippolyta_faction))
		end,
		event_args = function() return tostring(hippolyta_selected_region:command_queue_index()) end,
		-- now there is a second button for this in the building browser. It is managed on PanelOpenedCampaign. Its name and functionality are the same.
		button = {
			name = "button_amazons_instant_upgrade",
			path = {"construction_popup"},
			panel = "construction_popup",
			should_show = function() return cm:get_local_faction_name(true) == hippolyta_faction end,
			state = function()
						local next_level_key = nil
						if hippolyta_selected_region then
							next_level_key = hippolyta_selected_region:slot_list():item_at(0):building():possible_building_construction_list()[1]
						end
							
						local buttonState = "inactive"
						local tooltip_details = {
													tooltipTitle = "amazon_feat_instant_upgrade_title",
													tooltipDescription = "amazon_feat_instant_upgrade_description",
													tooltipError = ""
												}

						if hippolyta_unlocked_efforts["instant_upgrade"] == nil then
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_milestone_locked_4" -- Need to unlock relevant milestone
						elseif next_level_key and HippolytaCulture_CanAffordEffort("instant_upgrade") then
							buttonState = "active"
						elseif not next_level_key then
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_max_level" -- Already Max level
						else
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_not_enough_resource" -- Not enough Amazon Treasure
						end

						return buttonState, tooltip_details
					end
		}
	},

	-- Instantly Complete ongoing research Effort
	complete_research = {
		panel_icon_tooltip = "campaign_localised_strings_string_amazon_feat_complete_research_description_ui_panel",
		culture_cost = function()
			local cost_per_turn = -40
			local remaining_turns = cm:get_faction(hippolyta_faction):active_research_remaining_turns()

			if remaining_turns == -1 then
				return 0
			else
				return cost_per_turn * remaining_turns
			end
		end,
		apply_effect = function()
			cm:instantly_complete_ongoing_research_for_faction(hippolyta_faction, true)
			--
			--achievements.feats.func_execute(cm:get_faction(hippolyta_faction))
		end,
		event_args = function() return "" end,
		button = {
			name = "button_dlc01_complete_research",
			path = {"technology_panel"},
			panel = "technology_panel",
			should_show = function() return cm:get_local_faction_name(true) == hippolyta_faction end,
			state = function()
						local buttonState = "active"
						local tooltip_details = {
													tooltipTitle = "amazon_feat_complete_research_title",
													tooltipDescription = "amazon_feat_complete_research_description",
													tooltipError = ""
												}

						if hippolyta_unlocked_efforts["complete_research"] == nil then
							buttonState = "locked"
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_milestone_locked_3" -- Need to unlock relevant milestone
						elseif cm:get_faction(hippolyta_faction):active_research_remaining_turns() == -1 then
							buttonState = "inactive"
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_no_active_research" -- There is no active research
						elseif not HippolytaCulture_CanAffordEffort("complete_research") then
							buttonState = "inactive"
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_not_enough_resource" -- Not enough Amazon Treasure
						end
						return buttonState, tooltip_details
					end
		}
	},

	diplomatic_gift = {
		panel_icon_tooltip = "campaign_localised_strings_string_amazon_feat_diplomatic_gift_description_ui_panel",
		culture_cost = function() return -cm:model():get_campaign_variable_by_name("hypollita_diplomatic_gift_culture_cost") end,
		button = {			
			state = function(context)
						local buttonState = "active"
						local tooltip_details = {
													tooltipTitle = "amazon_feat_diplomatic_gift_title",
													tooltipDescription = "amazon_feat_diplomatic_gift_description",
													tooltipError = ""
												}

						local other_faction = context and cm:get_faction(context.string)
						if other_faction and not other_faction:is_null_interface() and other_faction:is_human() then
							buttonState = "inactive"
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_not_working_with_player"
						elseif hippolyta_unlocked_efforts["diplomatic_gift"] == nil then
							buttonState = "inactive"							
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_milestone_locked_2"
						elseif not HippolytaCulture_CanAffordEffort("diplomatic_gift") then
							buttonState = "inactive"
							tooltip_details.tooltipError = "amazon_feat_inactive_reason_not_enough_resource"
						end
						return buttonState, tooltip_details
					end
		}
	} -- This effort is implemented in the game engine (C++ side)
}

-- Define the needed culture for reaching new Milestones and which Efforts they unlock
hippolyta_milestones = {
	[1] = {
		name = "amazon_milestone_title_0",
		unlocked_milestone_txt = "amazon_unlocked_milestone_txt_0",
		required_culture = 10,
		resource_cost = { 
							{
								key = "troy_food",
								val = 800,
							},						
						},
		unlocks = {"unit_level_up"}, -- effort keys from hippolyta_efforts table
		icon_name = "an_ancient_heritage_dlc1", -- Placeholder
		feat_icon_path = "ui/skins/default/dlc1_feat_1_icon.png",
		event = {
			title = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_1_title",
			primary_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_primary_detail",
			sec_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_1_secondary_detail",
			event_pic = 1041,
		}
	},

	[2] = {
		name = "amazon_milestone_title_1",
		unlocked_milestone_txt = "amazon_unlocked_milestone_txt_1",
		required_culture = 180,
		resource_cost = { 
							{
								key = "troy_food",
								val = 1500,
							},
							{
								key = "troy_wood",
								val = 1800,
							},
						},
		unlocks = {"hero_level_up"}, -- effort keys from hippolyta_efforts table
		icon_name = "a_place_of_wisdom_dlc1", -- Placeholder
		feat_icon_path = "ui/skins/default/dlc1_feat_2_icon.png",
		event = {
			title = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_2_title",
			primary_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_primary_detail",
			sec_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_2_secondary_detail",
			event_pic = 1042,
		}
	},

	[3] = {
		name = "amazon_milestone_title_2",
		unlocked_milestone_txt = "amazon_unlocked_milestone_txt_2",
		required_culture = 600,
		resource_cost = { 
							{
								key = "troy_food",
								val = 4000,
							},
							{
								key = "troy_stones",
								val = 800,
							},
						},
		unlocks = {"complete_research"}, -- effort keys from hippolyta_efforts table
		icon_name = "a_time_of_enlighment_dlc1", -- Placeholder
		feat_icon_path = "ui/skins/default/dlc1_feat_3_icon.png",
		event = {
			title = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_3_title",
			primary_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_primary_detail",
			sec_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_3_secondary_detail",
			event_pic = 1043,
		}
	},

	[4] = {
		name = "amazon_milestone_title_3",
		unlocked_milestone_txt = "amazon_unlocked_milestone_txt_3",
		required_culture = 1200,
		resource_cost = { 
							{
								key = "troy_food",
								val = 8000,
							},
							{
								key = "troy_bronze",
								val = 1000,
							},
						},
		unlocks = {"diplomatic_gift"}, -- effort keys from hippolyta_efforts table
		icon_name = "a_rulers_authority_dlc1", -- Placeholder
		feat_icon_path = "ui/skins/default/dlc1_feat_4_icon.png",
		event = {
			title = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_4_title",
			primary_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_primary_detail",
			sec_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_4_secondary_detail",
			event_pic = 1044,
		}
	},

	[5] = {
		name = "amazon_milestone_title_4",
		unlocked_milestone_txt = "amazon_unlocked_milestone_txt_4",
		required_culture = 2000,
		resource_cost = { 
							{
								key = "troy_food",
								val = 12000,
							},
							{
								key = "troy_gold",
								val = 350,
							},
						},
		unlocks = {"instant_upgrade"}, -- effort keys from hippolyta_efforts table
		icon_name = "an_enduring_legacy_dlc1", -- Placeholder
		feat_icon_path = "ui/skins/default/dlc1_feat_5_icon.png",
		event = {
			title = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_5_title",
			primary_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_primary_detail",
			sec_detail = "event_feed_strings_text_troy_dlc1_scripted_event_hippolyta_scripted_kingdom_5_secondary_detail",
			event_pic = 1045,
		}
	}
}

-- Effort purchase dialog localisation keys
purchase_dialog_keys = {
	unit_level_up = "amazon_dialog_unit_level_up",
	hero_level_up = "amazon_dialog_hero_level_up",
	diplomatic_gift = "amazon_dialog_diplomatic_gift",
	complete_research = "amazon_dialog_complete_research",
	instant_upgrade = "amazon_dialog_instant_upgrade"
}

-- Sacred buildings and regions will be handled from the database.

-- hippolyta OccupationDecision event message for sacred regions
hippolyta_sacred_regions_events = {
	["effect_bundle_dlc1_sacred_settlement_small_culture"] = {
		event = {
			title = "event_feed_strings_text_troy_event_feed_string_hippolyta_culture_small_title",
			primary_detail = "event_feed_strings_text_troy_event_feed_string_hippolyta_culture_primary_detail",
			sec_detail = "event_feed_strings_text_troy_event_feed_string_hippolyta_culture_small_secondary_detail",
			event_pic = 1091,
		}
	},
	["effect_bundle_dlc1_sacred_settlement_big_culture"] = {
		event = {
			title = "event_feed_strings_text_troy_event_feed_string_hippolyta_culture_big_title",
			primary_detail = "event_feed_strings_text_troy_event_feed_string_hippolyta_culture_primary_detail",
			sec_detail = "event_feed_strings_text_troy_event_feed_string_hippolyta_culture_big_secondary_detail",
			event_pic = 1090,
		}
	},
}

sacred_resource_icons = {
	hippolyta_sacred_big = { tooltip_key = "city_info_bar_amazon_sacred_settlement_big", icon_path = "UI/skins/default/sp_icon_culture_large.png" },
	hippolyta_sacred_small = { tooltip_key = "city_info_bar_amazon_sacred_settlement_small", icon_path = "UI/skins/default/sp_icon_culture_small.png" },
}

-- VARIABLES

hippolyta_selected_region = nil -- used for instant upgrade effort
hippolyta_selected_unit = nil -- used for hero / unit level up efforts

hippolyta_current_milestone = 0 -- current culture milestone
hippolyta_unlocked_efforts = {} -- array containing the keys of the unlocked efforts

hippolyta_is_allowed_diplomatic_gift = false -- a flag that diplomatic gift is allowed (do not save this)


-- injecting feat titles to milestones table
for _,v in ipairs(hippolyta_milestones) do
	v.unlocks_title_keys = {}
	if (v.unlocks) then
		for _, effort_key in pairs(v.unlocks) do
			if hippolyta_efforts[effort_key] then
				local buttonState, tooltipDetails = hippolyta_efforts[effort_key].button.state()
				table.insert(v.unlocks_title_keys, tooltipDetails.tooltipTitle)
			end
		end
	end
end



-- FUNCTIONS

function split_str(str, sep)
   local sep, fields = sep or ":", {}
   local pattern = string.format("([^%s]+)", sep)
   str:gsub(pattern, function(c) fields[#fields+1] = c end)
   return fields
end

--##########################################
-- UI
--##########################################

function HippolytaCulture_CreateCultureBarUI()
	print_debug("HippolytaCulture_CreateCultureBarUI()")
	if cm:get_local_faction_name(true) ~= hippolyta_faction then return end
	 
	local parent_panel = find_uicomponent(core:get_ui_root(), unpack(hippolyta_ui.target_path))
	local culture_bar = find_uicomponent(core:get_ui_root(), unpack(hippolyta_ui.target_path), hippolyta_ui.root)

	if not culture_bar then
		culture_bar = UIComponent(parent_panel:CreateComponent(hippolyta_ui.root, hippolyta_ui.src_path))
	end
end

function HippolytaCulture_UpdateCultureBarUI()
	print_debug("HippolytaCulture_UpdateCultureBarUI()")
	if cm:get_local_faction_name(true) ~= hippolyta_faction then return end

	local culture_bar = find_uicomponent(core:get_ui_root(), unpack(hippolyta_ui.target_path), hippolyta_ui.root)

	if culture_bar then
		culture_bar:SetVisible(true)

		local total_culture_gained = cm:get_faction(hippolyta_faction):pooled_resource(hippolyta_culture):playthrough_total_income_all()

		local max_height = find_uicomponent(culture_bar, "morale_parent", "background_morale_bar"):Height()
		local new_width = find_uicomponent(culture_bar, "morale_parent", "foreground_morale_bar"):Width()
		local new_height = 1 + max_height * (total_culture_gained / HIPPOLYTA_CULTURE_MAX_VALUE)

		find_uicomponent(culture_bar, "morale_parent", "foreground_morale_bar"):Resize(new_width, new_height)

		local tooltip = "Total culture gained: " .. tostring(total_culture_gained) .. "\n\n Current milestone: " .. hippolyta_current_milestone

		tooltip = tooltip .. "\n\nUnlocked efforts:\n"

		for k,v in pairs(hippolyta_unlocked_efforts) do
			tooltip = tooltip .. k .. "\n"
		end

		culture_bar:SetTooltipText(tooltip, "From troy_hyppolita_culture.lua - unlocalised text", true)
	end
end

function HippolytaCulture_HideCultureBarUI()
	print_debug("HippolytaCulture_HideCultureBarUI()")
	if cm:get_local_faction_name(true) ~= hippolyta_faction then return end

	local culture_bar = find_uicomponent(core:get_ui_root(), unpack(hippolyta_ui.target_path), hippolyta_ui.root)

	if culture_bar then
		culture_bar:SetVisible(false)
	end
end

function HippolytaCulture_ShowEffortButton(effort_key) 
	local effort_button = find_uicomponent(core:get_ui_root(), unpack(hippolyta_efforts[effort_key].button.path), hippolyta_efforts[effort_key].button.name)
	if not effort_button then
		print_debug(effort_key .. " BUTTON NOT FOUND", true)
		return
	end

	local shouldShowButton = hippolyta_efforts[effort_key].button.should_show()

	effort_button:SetVisible(shouldShowButton)

	if shouldShowButton then
		local buttonState, tooltipDetails = hippolyta_efforts[effort_key].button.state()		
		effort_button:SetState(buttonState)

		local cost = -hippolyta_efforts[effort_key].culture_cost()
		if tooltipDetails.tooltipDescription ~= '' then
			local descr = { text = tooltipDetails.tooltipDescription, params = {cost}}
			tooltipDetails.tooltipDescription = descr
		end

		HippolytaCulture_SetEffectTooltip(effort_button, tooltipDetails)	
	end
end

function HippolytaCulture_SetEffectTooltip(button, tooltipDetails)
	local tooltip_text = nil
		
	if tooltipDetails.tooltipError == nil or tooltipDetails.tooltipError == '' then
		if tooltipDetails.tooltipDescription == nil then
			tooltip_text = {''}
		else
			tooltip_text = {tooltipDetails.tooltipDescription}
		end
	else			

		if tooltipDetails.tooltipDescription == nil or tooltipDetails.tooltipDescription == '' then
			tooltip_text = {tooltipDetails.tooltipError}
		else
			tooltip_text = {tooltipDetails.tooltipDescription, tooltipDetails.tooltipError}
		end
	end
	
	button:SetTooltipWithTitle(tooltipDetails.tooltipTitle, tooltip_text, true)
end

function HippolytaCulture_HideEffortButton(effort_key) 
	local effort_button = find_uicomponent(core:get_ui_root(), unpack(hippolyta_efforts[effort_key].button.path), hippolyta_efforts[effort_key].button.name)
	if not effort_button then
		print_debug(effort_key .. " BUTTON NOT FOUND", true)
		return
	end

	effort_button:SetVisible(false)
end

function HippolytaCulture_EffortButtonClicked(effort_key)
	print_debug("HippolytaCulture_EffortButtonClicked()")
	CampaignUI.TriggerCampaignScriptEvent(cm:get_faction(hippolyta_faction):command_queue_index(), 
		"HippolytaCulture_EffortButtonClickedEvent," .. effort_key .. "," .. hippolyta_efforts[effort_key].event_args())
end

function HippolytaCulture_UnlockButtonClicked()
	print_debug("HippolytaCulture_UnlockButtonClicked()")
	CampaignUI.TriggerCampaignScriptEvent(cm:get_faction(hippolyta_faction):command_queue_index(), "HippolytaCulture_UnlockButtonClickedEvent")
end

--##########################################

-- Check if the player can afford the required effort
function HippolytaCulture_CanAffordEffort(effort_key)
	local current_culture = cm:get_faction(hippolyta_faction):pooled_resource(hippolyta_culture):value()

	return current_culture + hippolyta_efforts[effort_key].culture_cost() >= 0
end

-- Add culture (value can be negative)
function HippolytaCulture_AddCulture(value)
	cm:faction_add_pooled_resource(hippolyta_faction, hippolyta_culture, "troy_resource_factor_faction", value)
end

-- Spend resources to unlock milestone
function HippolytaCulture_PurchaseMilestone(milestone)
	for i, cost_pair in ipairs(milestone.resource_cost) do
		if cost_pair.val > 0 then
			cm:faction_add_pooled_resource(hippolyta_faction, cost_pair.key, "troy_resource_factor_faction", -cost_pair.val)
		end
	end
end

-- Returns the total gained Culture from the begining of the game 
function HippolytaCulture_PlaythroughTotalCulture()
	return cm:get_faction(hippolyta_faction):pooled_resource(hippolyta_culture):playthrough_total_income_all()
end

-- Check if new milestone reached and apply changes
function HippolytaCulture_UpdateCultureMilestone()
	local next_milestone = hippolyta_current_milestone + 1

	-- Check if next Milestone exists and if it is reached	
	-- Possibly the player can advance by 1 Milestone
	if hippolyta_milestones[next_milestone] and HippolytaCulture_PlaythroughTotalCulture() >= hippolyta_milestones[next_milestone].required_culture then
		hippolyta_current_milestone = next_milestone

		cm:show_message_event(
			hippolyta_faction,
			hippolyta_milestones[next_milestone].event.title,
			hippolyta_milestones[next_milestone].event.primary_detail,
			hippolyta_milestones[next_milestone].event.sec_detail,
			true,
			hippolyta_milestones[next_milestone].event.event_pic
		)

		print_debug("Milestone reached: " .. next_milestone .. " - " .. hippolyta_milestones[next_milestone].name, true)

		core:trigger_event("ReachTierOfAmazonKingdom", cm:get_faction(hippolyta_faction), next_milestone)

		for _, effort in ipairs(hippolyta_milestones[next_milestone].unlocks) do
			hippolyta_unlocked_efforts[effort] = true
			print_debug(effort .. " - Unlocked", true)
		end

		next_milestone = hippolyta_current_milestone + 1

	end
	
	-- Inform Victory conditions that we have completed the amazon kingdom
	core:trigger_event(
		"ScriptEventFactionVictoryConditionProgress", 
		hippolyta_current_milestone,
		"troy_amazons_trj_hippolyta_personal_objective_complete_amazon_kingdom",
		cm:model():world():faction_by_key(hippolyta_faction)
	)
end

function hippolyta_culture_check_to_enable_diplomatic_gift()
	if not hippolyta_is_allowed_diplomatic_gift then
		-- Allow Hippolyta's faction to grant diplomatic gifts
		cm:force_diplomacy("faction:" .. hippolyta_faction, "all" ,"diplomatic gift", true, true, false)
		-- Do not enter this then clause in order to skip force diplomacy on every turn start. However, enter the first time after game load or effort unlocked
		hippolyta_is_allowed_diplomatic_gift = true
	end
end

function HippolytaCulture_RefreshDiplomaticInfo(context)
	local diplomacy_panel = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown")
	
	if diplomacy_panel then
		local diplomatic_gift_button = diplomacy_panel:InterfaceFunction('find_diplomacy_button_by_type', "diplomatic_option_diplomatic_gift")
		diplomatic_gift_button = diplomatic_gift_button and UIComponent(diplomatic_gift_button) or nil
		if diplomatic_gift_button then
			local buttonState, tooltipDetails = hippolyta_efforts["diplomatic_gift"].button.state(context)
			diplomatic_gift_button:SetState(buttonState)
			
			HippolytaCulture_SetEffectTooltip(diplomatic_gift_button, tooltipDetails)
		end
	end

	hippolyta_culture_configure_agree_button(context, diplomacy_panel)
end

function hippolyta_culture_configure_agree_button(context, diplomacy_panel)
	local their_offers = diplomacy_panel:InterfaceFunction("get_all_diplomacy_offers", "their")
	for action, _ in pairs(their_offers) do
		return
	end

	local your_offers = diplomacy_panel:InterfaceFunction("get_all_diplomacy_offers", "your")
	local is_diplomatic_gift_proposed = false
	for action, _ in pairs(your_offers) do
		if action ~= "diplomatic_option_diplomatic_gift" then
			return
		end
		is_diplomatic_gift_proposed = true
	end

	if is_diplomatic_gift_proposed then
		local component_agree = diplomacy_panel:SequentialFind("button_agree")
		if component_agree then
			component_agree:SetState("inactive")
			component_agree:AppendTooltipText("diplomacy_panel_agree_button_tooltip_add_offer", true)
		end
	end
end

function HippolytaCulture_RefreshFMPanel()
	local milestone_panel = find_uicomponent(core:get_ui_root(), hippolyta_faction_mechanic_panel)
	if milestone_panel then
		milestone_panel:InterfaceFunction('set_hippolyta_milestones', hippolyta_milestones, hippolyta_current_milestone, hippolyta_view_legacy_video)
		
		-- Add tooltips for feat icon_name
		local milestone_parent = find_uicomponent(milestone_panel, "milestone_parent")
		if milestone_parent then
			for i=0, milestone_parent:ChildCount() - 1 do
				print_debug("milestone_" .. i, true)
				local feat_icon = find_uicomponent(milestone_panel, "milestone_" .. i, "feat_icon")
				if feat_icon then
					local effort_key = hippolyta_milestones[i + 1].unlocks[1]
					local tooltip_key = hippolyta_efforts[effort_key].panel_icon_tooltip

					feat_icon:SetTooltipText(common.get_localised_string(tooltip_key), tooltip_key, true)
				end
			end
		end	
	end
end

function HippolytaCulture_ApplyPostBattleCultureBonus(context)
	local battle = context:pending_battle()

	if type(hippolyta_post_battle_culture_bonuses) ~= "table" or not battle:has_attacker() or not battle:has_defender() then
		return
	end

	local is_attacker_side = battle:attacker_faction():name() == hippolyta_faction
	local hippolyta = is_attacker_side and battle:attacker() or battle:defender()
	local enemy_side_losses = is_attacker_side and battle:defense_side_losses() or battle:attack_side_losses()

	local culture_bonus = 0

	-- determine culture reward based on number of losses of the opposing side
	for skill, bonus_table in pairs(hippolyta_post_battle_culture_bonuses) do
		if hippolyta:has_skill(skill) then
			for range, bonus in pairs(bonus_table) do
				local from, to = string.match(range, "(%d+)-(%d+)")
				if from and to then
					from = tonumber(from) to = tonumber(to)
					if type(from) == "number" and enemy_side_losses >= from and type(to) == "number" and enemy_side_losses <= to then
						culture_bonus = culture_bonus + tonumber(bonus)
						break
					end
				end
			end
		end
	end

	if culture_bonus > 0 then
		-- using this method, the gained culture will be displayed in the post-battle screen.
		cm:faction_add_post_battle_looted_resource(hippolyta_faction, hippolyta_culture, "troy_resource_factor_faction", culture_bonus)
		--HippolytaCulture_AddCulture(culture_bonus)
	end
end

function HippolytaCulture_IsBattleWithHippolytaFaction()
	return cm:model():pending_battle():has_attacker() and cm:model():pending_battle():attacker():faction():name() == hippolyta_faction or
		cm:model():pending_battle():has_defender() and cm:model():pending_battle():defender():faction():name() == hippolyta_faction
end


--##########################################
-- triggers
--##########################################


function HippolytaCulture_UpdateCityInfoBars(province)
	if cm:get_local_faction_name(true) ~= hippolyta_faction then return end
	local regions_in_province = province:regions()
	for i = 0, regions_in_province:num_items() - 1 do
		local region = regions_in_province:item_at(i)
		for k = 0, region:effect_bundles():num_items() - 1 do
			local effect_bundle_key = region:effect_bundles():item_at(k):key()
			if effect_bundle_key == "effect_bundle_dlc1_sacred_settlement_small_culture" then
				cm:set_custom_settlement_info_icon(region:name(),
					"icon_sacred_settlement",
					sacred_resource_icons["hippolyta_sacred_small"].icon_path,
					sacred_resource_icons["hippolyta_sacred_small"].tooltip_key)
			elseif effect_bundle_key == "effect_bundle_dlc1_sacred_settlement_big_culture" then
				 cm:set_custom_settlement_info_icon(region:name(),
					"icon_sacred_settlement",
					sacred_resource_icons["hippolyta_sacred_big"].icon_path,
					sacred_resource_icons["hippolyta_sacred_big"].tooltip_key)
			end
		end
	end
end

core:add_listener (
	"HippolytaCulture_NewCampaignStarted",
	"NewCampaignStarted",
	true,
	function(context)
		print_debug("HippolytaCulture_NewCampaignStarted")

		HippolytaCulture_AddCulture(CULTURE_INITIAL_AMOUNT)
	end,
	false
);

core:add_listener (
	"HippolytaCulture_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context) 
		print_debug("HippolytaCulture_FirstTickAfterWorldCreated")

		if cm:get_faction(hippolyta_faction) then
			HIPPOLYTA_CULTURE_MAX_VALUE = cm:get_faction(hippolyta_faction):pooled_resource(hippolyta_culture):maximum_value()

			hippolyta_culture_check_to_enable_diplomatic_gift()

			local provinces = context:world():province_manager():province_list();
			for i = 0, provinces:num_items() - 1 do
				HippolytaCulture_UpdateCityInfoBars(provinces:item_at(i))
			end
		end
	end,
	false
);

function HippolytaCulture_AddListeners()
	out("HippolytaCulture_AddListeners()")

	-- start of turn listener
	core:add_listener(
		"HippolytaCulture_FactionTurnStart",
		"FactionTurnStart",
		function(context) return context:faction():name() == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_FactionTurnStart")

			HippolytaCulture_CreateCultureBarUI()
			--HippolytaCulture_UpdateCultureBarUI()
		end,
		true
	)

	-- end of turn listener
	core:add_listener(
		"HippolytaCulture_FactionTurnEnd", 
		"FactionTurnEnd",
		function(context) return context:faction():name() == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_FactionTurnEnd")
			HippolytaCulture_HideCultureBarUI()
		end,
		true
	)

	-- listener for instant_upgrade effort
	core:add_listener(
		"HippolytaCulture_ConstructionPopupDisplayed",
		"ConstructionPopupDisplayed",
		function(context) return cm:get_local_faction_name(true) == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_ConstructionPopupDisplayed")

			hippolyta_selected_region = cm:get_region(context.region_name) -- update hippolyta_selected_region in order to use it for instant_upgrade effort

			if context.slot_index == 0 then
				HippolytaCulture_ShowEffortButton("instant_upgrade")
			else
				HippolytaCulture_HideEffortButton("instant_upgrade")
			end
		end,
		true
	)
	core:add_listener(
		"HippolytaCulture_RegionSelected",
		"SettlementSelected",
		function(context) return cm:get_local_faction_name(true) == hippolyta_faction and context:garrison_residence():region():owning_faction():name() == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_RegionSelected")

			hippolyta_selected_region = context:garrison_residence():region() -- update hippolyta_selected_region in order to use it for instant_upgrade effort
		end,
		true
	)

	core:add_listener(
		"HippolytaCulture_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return cm:get_local_faction_name(true) == hippolyta_faction end,
		function(context)
			if context.string == hippolyta_efforts["complete_research"].button.panel then
				print_debug("HippolytaCulture_PanelOpenedCampaign")
				HippolytaCulture_ShowEffortButton("complete_research")
			else
				HippolytaCulture_RefreshFMPanel()
			end
		end,
		true
	)

	core:add_listener(
		"HippolytaCulture_BuildingBrowserInitialized",
		"BuildingBrowserInitialized",
		function(context) return cm:get_local_faction_name(true) == hippolyta_faction and context:garrison_residence():region():owning_faction():name() == hippolyta_faction end,
		function(context)
			hippolyta_selected_region = context:garrison_residence():region() -- update hippolyta_selected_region in order to use it for instant_upgrade effort

			local building_browser = core:get_ui_root():SequentialFind("building_browser")

			if building_browser then
				local main_building = building_browser:SequentialFind("category_parent"):Find(0)

				if main_building then
					main_building = UIComponent(main_building)
					local instant_upgrade_button = main_building:SequentialFind("button_amazons_instant_upgrade")
					if instant_upgrade_button then
						instant_upgrade_button:SetVisible(true)

						local buttonState, tooltipDetails = hippolyta_efforts["instant_upgrade"].button.state()
						instant_upgrade_button:SetState(buttonState)
						HippolytaCulture_SetEffectTooltip(instant_upgrade_button, tooltipDetails)
					end
				end
			end
		end,
		true
	)

	core:add_listener(
		"HippolytaCulture_ComponentLClickUp",
		"ComponentLClickUp",
		function(context) return cm:get_local_faction_name(true) == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_ComponentLClickUp: " .. context.string)

			for effort_key, _ in pairs(hippolyta_unlocked_efforts) do
				if context.string == hippolyta_efforts[effort_key].button.name then
					if effort_key == "unit_level_up"then
						if not hippolyta_selected_unit:unit_commander():is_null_interface() then
							effort_key = "hero_level_up"
						end
					end

					if HippolytaCulture_CanAffordEffort(effort_key) then
						local text = common.get_localised_string("campaign_localised_strings_string_" .. purchase_dialog_keys[effort_key])
						text = string.format(text, -hippolyta_efforts[effort_key].culture_cost())
						create_confirmation_box_with_text_from_script(
							"hippolyta_effort_confirmation", 
							text, 
							purchase_dialog_keys[effort_key],
							function()
								HippolytaCulture_EffortButtonClicked(effort_key)
							end
						)
					end

					break
				end
			end

			if context.string == "unlock_button" then
				HippolytaCulture_UnlockButtonClicked()
			end
		end,
		true
	)
	
	core:add_listener(
		"HippolytaCulture_DiplomacyNegotiationInitialised",
		"DiplomacyNegotiationInitialised",
		function(context) return cm:get_local_faction_name(true) == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_DiplomacyNegotiationInitialised")
			HippolytaCulture_RefreshDiplomaticInfo(context)
		end, 
		true
	)
	
	core:add_listener(
		"HippolytaCulture_ResearchStarted",
		"ResearchStarted",
		function(context) return context:faction():name() == hippolyta_faction and cm:get_local_faction_name(true) == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_ResearchStarted")
			HippolytaCulture_ShowEffortButton("complete_research")
		end, 
		true
	)

	core:add_listener(
		"HippolytaCulture_ResearchCancelled",
		"ResearchCancelled",
		function(context) return context:faction():name() == hippolyta_faction and cm:get_local_faction_name(true) == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_ResearchCancelled")
			HippolytaCulture_ShowEffortButton("complete_research")
		end, 
		true
	)

	core:add_listener(
		"HippolytaCulture_ResearchCompleted",
		"ResearchCompleted",
		function(context) return context:faction():name() == hippolyta_faction and cm:get_local_faction_name(true) == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_ResearchCompleted")
			HippolytaCulture_ShowEffortButton("complete_research")
		end, 
		true
	)

	core:add_listener(
		"HippolytaCulture_UnitContextMenuDisplayed", 
		"UnitContextMenuDisplayed",
		function(context) return cm:get_local_faction_name(true) == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_UnitContextMenuDisplayed")

			if context.num_selected_units == 1 then

				hippolyta_selected_unit = cm:model():unit_for_command_queue_index(context.selected_units_cqi[1])

				if hippolyta_selected_unit:unit_commander():is_null_interface() then
					-- calling HippolytaCulture_ShowEffortButton with "hero_level_up" would do the same, making the if unnecessary? ( the function actually invalidates the visibiltiy )
					HippolytaCulture_HideEffortButton("hero_level_up")  
					HippolytaCulture_ShowEffortButton("unit_level_up")
				else
					-- calling HippolytaCulture_ShowEffortButton with "unit_level_up" would do the same, making the if unnecessary? ( the function actually invalidates the visibiltiy )
					HippolytaCulture_HideEffortButton("unit_level_up")
					HippolytaCulture_ShowEffortButton("hero_level_up")
				end
			elseif context.num_selected_units == 0 then
				-- this handles the case where agent is selected
				HippolytaCulture_HideEffortButton("hero_level_up")
				HippolytaCulture_HideEffortButton("unit_level_up")
			end
		end,
		true
	)

	-- Aplly Efforts effects in model. This event will be called on every machine
	core:add_listener(
		"HippolytaCulture_EffortButtonClickedEvent",
		"UITriggerScriptEvent",
		function(context)
			local args = split_str(context:trigger(), ",")
			return args[1] == "HippolytaCulture_EffortButtonClickedEvent"
		end,
		function(context)
			print_debug("HippolytaCulture_EffortButtonClickedEvent")
			local args = split_str(context:trigger(), ",")
			local effort_key = args[2]

			if effort_key == "unit_level_up" or effort_key == "hero_level_up" then
				-- update the selected_unit variable, because it is set by the UI only on the local machine
				local selected_unit_cqi = tonumber(args[3])
				hippolyta_selected_unit = cm:model():unit_for_command_queue_index(selected_unit_cqi)
			end

			if effort_key == "instant_upgrade" then
				-- update the selected_region variable, because it is set by the UI only on the local machine
				local selected_region_cqi = tonumber(args[3])
				hippolyta_selected_region = cm:model():region_for_command_queue_index(selected_region_cqi)
			end

			if HippolytaCulture_CanAffordEffort(effort_key) then
				HippolytaCulture_AddCulture(hippolyta_efforts[effort_key].culture_cost())
				hippolyta_efforts[effort_key].apply_effect()
			end


			if effort_key == "instant_upgrade" and cm:get_campaign_ui_manager():is_panel_open("building_browser") then
				cm:callback(
					function()
						local main_building = core:get_ui_root():SequentialFind("building_browser"):SequentialFind("category_parent"):Find(0)
						if main_building then
							main_building = UIComponent(main_building)
							local instant_upgrade_button = main_building:SequentialFind("button_amazons_instant_upgrade")
							if instant_upgrade_button then
								local shouldShowButton = hippolyta_efforts["instant_upgrade"].button.should_show()
								instant_upgrade_button:SetVisible(shouldShowButton)
								local buttonState, tooltipDetails = hippolyta_efforts["instant_upgrade"].button.state()		
								instant_upgrade_button:SetState(buttonState)
								HippolytaCulture_SetEffectTooltip(instant_upgrade_button, tooltipDetails)
							end
						end
					end,
					0.2
				)
			else
				-- update button state
				HippolytaCulture_ShowEffortButton(effort_key)
			end
		end,
		true
	)

	core:add_listener(
		"HippolytaCulture_UnlockButtonClickedEvent",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger() == "HippolytaCulture_UnlockButtonClickedEvent"
		end,
		function(context)
			print_debug("HippolytaCulture_UnlockButtonClickedEvent")
			HippolytaCulture_UpdateCultureMilestone()
			hippolyta_culture_check_to_enable_diplomatic_gift()
			HippolytaCulture_RefreshFMPanel()
			HippolytaCulture_PurchaseMilestone(hippolyta_milestones[hippolyta_current_milestone])
		end,
		true
	)

	core:add_listener(
		"HippolytaCulture_BattleConflictFinished",
		"BattleConflictFinished",
		HippolytaCulture_IsBattleWithHippolytaFaction,
		function(context)
			HippolytaCulture_ApplyPostBattleCultureBonus(context)
		end,
		true
	)

	core:add_listener(
		"HippolytaCulture_CharacterPerformsSettlementOccupationDecision",
		"CharacterPerformsSettlementOccupationDecision",
		function(context) return context:character():faction():name() == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_CharacterPerformsSettlementOccupationDecision")
			if not is_table(hippolyta_occupation_decision_culture_bonuses) then
				return
			end

			local bonus = 0
			local character = context:character()

			for skill,skill_bonus in pairs(hippolyta_occupation_decision_culture_bonuses) do
				if character:has_skill(skill) then
					bonus = bonus + skill_bonus
				end
			end

			if bonus > 0 then
				HippolytaCulture_AddCulture(bonus)
			end
		end,
		true
	)
	core:add_listener(
		"HippolytaCulture_CharacterPerformsSettlementOccupationDecision_ForSacredRegions",
		"CharacterPerformsSettlementOccupationDecision",
		function(context) return context:character():faction():name() == hippolyta_faction end,
		function(context)
			print_debug("HippolytaCulture_CharacterPerformsSettlementOccupationDecision_ForSacredRegions")
			if not is_table(hippolyta_sacred_regions_events) then
				return
			end

			local region_bundles = context:garrison_residence():region():effect_bundles()

			for bundle_key, event_data in pairs(hippolyta_sacred_regions_events) do
				for z=0, region_bundles:num_items() - 1 do
					if region_bundles:item_at(z):key() == bundle_key then
						cm:show_message_event(
							hippolyta_faction,
							hippolyta_sacred_regions_events[bundle_key].event.title,
							hippolyta_sacred_regions_events[bundle_key].event.primary_detail,
							hippolyta_sacred_regions_events[bundle_key].event.sec_detail,
							true,
							hippolyta_sacred_regions_events[bundle_key].event.event_pic
						)
					break
					end
				end	
			end
		end,
		true
	)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_HIPPOLYTA_CURRENT_MILESTONE", hippolyta_current_milestone, context)
		cm:save_named_value("TROY_HIPPOLYTA_UNLOCKED_EFFORTS", hippolyta_unlocked_efforts, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		hippolyta_current_milestone = cm:load_named_value("TROY_HIPPOLYTA_CURRENT_MILESTONE", hippolyta_current_milestone, context)
		hippolyta_unlocked_efforts = cm:load_named_value("TROY_HIPPOLYTA_UNLOCKED_EFFORTS", hippolyta_unlocked_efforts, context) 
	end
)