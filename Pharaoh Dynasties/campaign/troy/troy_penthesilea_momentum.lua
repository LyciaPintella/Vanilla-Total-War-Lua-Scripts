out("Loading troy_penthesilea_momentum.lua")

-- CONSTANTS
local DEBUG_ENABLED = false
local penthesilea_debug_str = "troy_penthesilea_momentum: "

local function print_debug(str, force_print)
	if DEBUG_ENABLED or force_print then
		out(penthesilea_debug_str .. str)
	end
end

penthesilea_faction = "troy_amazons_trj_penthesilea"

penthesilea_momentum_tiers = {
	[1] = {
		min_value = 0,
		max_value = 199,
		bundle_key = "effect_bundle_amazons_momentum_level_1",
		th_component = "threshold_lowest",
		blood_oath_num_units = 0,
		remaining_momentum_after_blood_oath = 50,
	},
	[2] = {
		min_value = 200,
		max_value = 299,
		bundle_key = "effect_bundle_amazons_momentum_level_2",
		th_component = "threshold_lower",
		blood_oath_num_units = 3,
		remaining_momentum_after_blood_oath = 50,
	},
	[3] = {
		min_value = 300,
		max_value = 349,
		bundle_key = "effect_bundle_amazons_momentum_level_3",
		th_component = "threshold_upper",
		blood_oath_num_units = 5,
		remaining_momentum_after_blood_oath = 50,
	},
	[4] = {
		min_value = 350,
		max_value = 400,
		bundle_key = "effect_bundle_amazons_momentum_level_4",
		th_component = "icon_waaargh",
		blood_oath_num_units = 9,
		remaining_momentum_after_blood_oath = 50,
	}
}

PENTHESILEA_DEFAULT_MOMENTUM = 0
PENTHESILEA_MIN_MOMENTUM = 0
PENTHESILEA_MAX_MOMENTUM = 400

penthesilea_ui = {
	parent_panel = "units_panel",
	momentum_panel = "fm_blood_oath",
	army_momentum_bar = {
		root = "fm_penthesilea_momentum",
		src_path = "ui/campaign ui/fm_penthesilea_momentum",
		target_path = {"units_panel", "main_units_panel"},
		tooltips = {
			momentum_title = "city_info_bar_capture_bonus_momentum_title", -- this is not related to capture bonuses. Bad naming of the loc string
			momentum_description = "amazon_horde_momentum_description"
		},
		bar = "momentum_bar"
	},
	button_blood_oath = "button_blood_oath",
	dy_remaining_turns_value = "dy_remaining_turns_value"
}

PENTHESILEA_MOMENTUM_GAINED_PER_TURN = -30
PENTHESILEA_AI_MOMENTUM_GAINED_PER_TURN_LOWER_BOUND = 30
PENTHESILEA_AI_MOMENTUM_GAINED_PER_TURN_UPPER_BOUND = 50

-- Land Battles momentum modifiers
PENTHESILEA_MOMENTUM_GAINED_POST_BATTLE_RELEASE = 0 -- TBD

-- Bonus for ending turn in encamp stance
PENTHESILEA_MOMENTUM_GAINED_ENCAMP_STANCE = 30

PENTHESILEA_MOMENTUM_POST_BATTLE_KILL_EFFECT = {
	key = "troy_effect_dlc1_amazon_horde_option_kill_captives_momentum",
	bundle = "effect_bundle_dlc1_amazon_horde_option_kill_captives_momentum"
}

PENTHESILEA_MOMENTUM_POST_BATTLE_RAZE_KILL_EFFECT = {
	key = "troy_effect_dlc1_amazon_horde_option_raze_and_kill_momentum",
	bundle = "effect_bundle_dlc1_amazon_horde_option_raze_and_kill_momentum"
}

PENTHESILEA_MOMENTUM_POST_BATTLE_RAZE_ENSLAVE_EFFECT = {
	key = "troy_effect_dlc1_amazon_horde_option_raze_and_kill_momentum",
	bundle = "effect_bundle_dlc1_amazon_horde_option_raze_and_enslave"
}

-- Settlement Battles momentum modifiers
PENTHESILEA_MOMENTUM_GAINED_SETTLEMENT_SACKED = 0 -- TBD

-- momentum bonuses according the character skills
penthesilea_momentum_bonus_skill_mod = {
	["PENTHESILEA_MOMENTUM_GAINED_POST_BATTLE_SLAUGHTER"] = {
		["troy_dlc1_hero_campaign_horde_growth_spec_momentum"] = 25--%
	},

	["PENTHESILEA_MOMENTUM_GAINED_SETTLEMENT_RAZE_AND_KILL_MEN"] = {
		["troy_dlc1_hero_campaign_horde_growth_spec_momentum"] = 25--%
	},

	["PENTHESILEA_MOMENTUM_GAINED_SETTLEMENT_RAZE_AND_ENSLAVE"] = {
		["troy_dlc1_hero_campaign_horde_growth_spec_momentum"] = 25--%
	},
}

-- Bload Oath configuration.
penthesilea_blood_oath = {
	current_tier = 0, -- current tier unlocked by the Player
	max_tier = 3,
	duration = 2, -- duration in turns
	ui_info = {
		not_purchased_title = "amazon_horde_oath_not_purchased_title",
		not_purchased_description = "amazon_horde_oath_not_purchased_description",
		not_enough_momentum_description = "amazon_horde_oath_not_enough_momentum"
	},
	[1] = 	{
				required_momentum = 500, -- requiered playthrough total momentum gained for unlocking
				costs = {-- unlocking cost
							{
								key = "troy_food",
								val = 1000
							},
							{
								key = "troy_gold",
								val = 100
							},
						},
				ui_details = {
								icon_path = "dlc1_blood_oath_1.png",
								title = "amazon_horde_oath_of_unity_title",
								description = "amazon_horde_oath_of_unity_description",
								title_tooltip = "amazon_horde_oath_of_unity_title_description",
								after_purchase_description = "amazon_horde_oath_of_unity_tip",
							},
				unit_key = "troy_dlc1_ama_pen_warband_bloodsworn", -- key of the provided unit
				background_state = "level_2", -- background image
				ai_unlock_turn = 10,
			},
	[2] = 	{
				required_momentum = 1800, -- requiered playthrough total momentum gained for unlocking
				costs = {-- unlocking cost
							{
								key = "troy_food",
								val = 4000
							},
							{
								key = "troy_gold",
								val = 300
							},
						},
				ui_details = {
								icon_path = "dlc1_blood_oath_2.png",
								title = "amazon_horde_oath_of_vengence_title",
								description = "amazon_horde_oath_of_vengence_description",
								title_tooltip = "amazon_horde_oath_of_vengence_title_description",
								after_purchase_description = "amazon_horde_oath_of_vengence_tip",
							},
				unit_key = "troy_dlc1_ama_pen_labrys_wielders_bloodsworn", -- key of the provided unit
				background_state = "level_3", -- background image
				ai_unlock_turn = 25,
			},
	[3] = 	{
				required_momentum = 4000, -- requiered playthrough total momentum gained for unlocking
				costs = {-- unlocking cost
							{
								key = "troy_food",
								val = 7000
							},
							{
								key = "troy_gold",
								val = 500
							},
						},
				ui_details = {
								icon_path = "dlc1_blood_oath_3.png",
								title = "amazon_horde_oath_of_warbringer_title",
								description = "amazon_horde_oath_of_warbringer_description",
								title_tooltip = "amazon_horde_oath_of_warbringer_title_description",
								after_purchase_description = "amazon_horde_oath_of_warbringer_tip",
							},
				unit_key = "troy_dlc1_ama_pen_daughters_of_ares_bloodsworn", -- key of the provided unit
				background_state = "level_4", -- background image
				ai_unlock_turn = 50,
			}
}

-- Blood Oath purchase factor
penthesilea_blood_oath_factor = "troy_resource_factor_faction"

-- function that aplies the character skill modification for momentum value
local function character_skill_mod(character, value, ref_table, ref_key)
	if not ref_key or type(ref_table) ~= "table" or type(ref_table[ref_key]) ~= "table" or not character then
		return value
	end

	local mod = 0

	for skill, value in pairs(ref_table[ref_key]) do
		if character:has_skill(skill) then
			mod = mod + value
		end
	end

	mod = math.max(mod, -100)
	if mod ~= 0 then
		return value * (100 + mod) / 100
	end

	return value
end

-- VARIABLES

-- Table to store the current momentum for all armies. The armies are indexed by military force cqi
penthesilea_armies_momentum = {}

-- Table to hold the cqi of the armies that have active Blood Oath and the cqi of their bonus units (if any)
-- The bonus units must be created on PendingBattle and destroyed immediately after the battle
penthesilea_blood_oath_active_on_force = {}

-- Total accumulated momentum for all armies from the beginning of the game
penthesilea_total_momentum_gained = 0

penthesilea_selected_force_cqi = nil -- Local UI only!!!

-- Action points after razing a settlement
penthesilea_action_points_after_raze = 0.3

-- FUNCTIONS

function PenthesileaMomentum_UpdateArmyBloodOathIcons()
	if cm:get_faction(penthesilea_faction) then
		local armies = cm:get_faction(penthesilea_faction):military_force_list()

		for i = 0, armies:num_items() - 1 do
			local cqi = armies:item_at(i):command_queue_index()

			if penthesilea_blood_oath_active_on_force[cqi] then
				cm:set_custom_army_info_icon(
					cqi,
					"icon_blood_oath",
					"",
					"amazon_horde_blood_oath_icon_title",
					"amazon_horde_blood_oath_icon_description",
					penthesilea_blood_oath_active_on_force[cqi].num_units,
					penthesilea_blood_oath_active_on_force[cqi].remaining_turns)
			else
				cm:set_custom_army_info_icon_visibility(cqi, "icon_blood_oath", false)
			end
		end
	end
end

-- Get the current momentum tier for the specified character
function currentMomentumTier(force_cqi)
	print_debug("currentMomentumTier()")

	local momentum = penthesilea_armies_momentum[force_cqi]

	if not momentum then
		print_debug("Error: there is no record about this character", true)
		return
	end

	for key, value in ipairs(penthesilea_momentum_tiers) do
		if momentum >= value.min_value and
			momentum <= value.max_value then
			return value;
		end
	end

	print_debug("Error: " .. momentum .. " has invalid value", true)
end

-- Get the current momentum tier index for the specified character
function currentMomentumTierIndex(force_cqi)
	print_debug("currentMomentumTierIndex()")

	local momentum = penthesilea_armies_momentum[force_cqi]

	if not momentum then
		print_debug("Error: there is no record about this character", true)
		return
	end

	for key, value in ipairs(penthesilea_momentum_tiers) do
		if momentum >= value.min_value and
			momentum <= value.max_value then
			return key;
		end
	end

	print_debug("Error: " .. momentum .. " has invalid value", true)
end

-- Returns the momentum of the currently selected military force
function PenthesileaMomentum_SelectedArmyMomentum()
	print_debug("PenthesileaMomentum_SelectedArmyMomentum()")

	local momentum = penthesilea_armies_momentum[penthesilea_selected_force_cqi]

	if not momentum then
		print_debug("Error: there is no record about this character", true)
		return nil
	end

	return momentum
end

function PenthesileaMomentum_OnSettlementWithCaptureBonusMomentumRazed(force_cqi, value)
	if not penthesilea_armies_momentum[force_cqi] then
		script_error(string.format("An army with cqi %s has captured a settlement with Capture Bonus Momentum but this army can't use the Momentum mechanic", force_cqi))
		return
	end

	increaseMomentum(force_cqi, value)
end

-- Increase momentum and apply the new effect bundle
function increaseMomentum(force_cqi, value, should_update_ui)
	print_debug("increaseMomentum(" .. force_cqi .. ", " .. value ..")")
	should_update_ui = should_update_ui == nil and true or false

	if not penthesilea_armies_momentum[force_cqi] then
		print_debug("Error: there is no record about this character", true)
		return
	end

	local previous_momentum_tier = currentMomentumTier(force_cqi)

	if value > 0 then
		penthesilea_total_momentum_gained = penthesilea_total_momentum_gained + value
		

		-- Victory conditions reporting. It reports the total Battle Glory acumulated by all armies since the begining of the campaign.
		core:trigger_event(
		"ScriptEventFactionVictoryConditionProgress",
		penthesilea_total_momentum_gained,
		"troy_amazons_trj_penthesilea_personal_objective_accumulate_battle_glory",
		cm:model():world():faction_by_key(penthesilea_faction)
	)
	end

	penthesilea_armies_momentum[force_cqi] = math.clamp(penthesilea_armies_momentum[force_cqi] + value, PENTHESILEA_MIN_MOMENTUM, PENTHESILEA_MAX_MOMENTUM)
	local new_momentum_tier = currentMomentumTier(force_cqi)

	if previous_momentum_tier ~= new_momentum_tier then
		print_debug("tier changed")

		cm:remove_effect_bundle_from_force(previous_momentum_tier.bundle_key, force_cqi)
		cm:apply_effect_bundle_to_force(new_momentum_tier.bundle_key, force_cqi, 0)
	end

	if should_update_ui then PenthesileaMomentum_UpdateArmyRelatedUI() end
end

function PenthesileaMomentum_IsBattleWithPenthesileaFaction()
	return cm:model():pending_battle():has_attacker() and cm:model():pending_battle():attacker():faction():name() == penthesilea_faction or
		cm:model():pending_battle():has_defender() and cm:model():pending_battle():defender():faction():name() == penthesilea_faction
end

-- Returns the general in the pending battle for Penthesilea's faction
function PenthesileaMomentum_GetPendingBattleGeneralForPenthesileaFaction()
	local general = nil

	if cm:model():pending_battle():has_attacker() and cm:model():pending_battle():attacker():faction():name() == penthesilea_faction then
		general = cm:model():pending_battle():attacker()
	elseif cm:model():pending_battle():has_defender() and cm:model():pending_battle():defender():faction():name() == penthesilea_faction then
		general = cm:model():pending_battle():defender()
	end

	return general
end

function PenthesileaMomentum_SetEffectsDescription(momentum_bar)
	for _, tier in ipairs(penthesilea_momentum_tiers) do
		local tooltip_key = "effect_bundles_localised_description_" .. tier.bundle_key
		find_uicomponent(momentum_bar, tier.th_component):SetTooltipText(common.get_localised_string(tooltip_key), tooltip_key, true)
	end
end

--- @function PenthesileaMomentum_ShowMomentumBar
--- @desc Shows the Momentum bar for the selected force
--- @p [opt=true] table target_path, Table specifying the path where the bar will be created.
--- @p [opt=3 TOP_RIGHT] number dock_point, Dockpoint of the momentum bar.
--- @p [opt=0] number offset_x, X offset of the momentum bar
--- @p [opt=-momentum_parent:Height()] number offset_y, Y offset of the momentum bar
--- @return UIComponent the root component of the momentum bar
function PenthesileaMomentum_ShowMomentumBar(target_path, dock_point, offset_x, offset_y)
	if penthesilea_armies_momentum[penthesilea_selected_force_cqi] == nil then
		script_error("ShowMomentumBar called but there is no record for the selected military force")
		return
	end

	target_path = target_path or penthesilea_ui.army_momentum_bar.target_path
	dock_point = dock_point or 3 --[[TOP_RIGHT--]]

	local containing_component = core:get_ui_root():SequentialFind(unpack(target_path))
	local momentum_bar = core:get_ui_root():SequentialFind(unpack(target_path), penthesilea_ui.army_momentum_bar.bar)

	if not momentum_bar then
		local momentum_bar_layout_root = UIComponent(containing_component:CreateComponent(penthesilea_ui.army_momentum_bar.root, penthesilea_ui.army_momentum_bar.src_path))
		momentum_bar = momentum_bar_layout_root:SequentialFind(penthesilea_ui.army_momentum_bar.bar)
		momentum_bar:InterfaceFunction("set_max_momentum", PENTHESILEA_MAX_MOMENTUM)
		momentum_bar:InterfaceFunction("set_momentum_tiers", penthesilea_momentum_tiers)
		momentum_bar:InterfaceFunction("set_momentum_icon_tooltip", penthesilea_ui.army_momentum_bar.tooltips.momentum_title, penthesilea_ui.army_momentum_bar.tooltips.momentum_description, -PENTHESILEA_MOMENTUM_GAINED_PER_TURN)

		-- fix to show the bar under units panel title bar
		local unit_panel_title_bar = containing_component:SequentialFind("unit_panel_title_bar")
		if unit_panel_title_bar then
			local unit_panel_title_bar_index = 2
			containing_component:Divorce(momentum_bar_layout_root:Address())
			containing_component:Adopt(momentum_bar_layout_root:Address(), unit_panel_title_bar_index)
		end

		local momentum_parent = UIComponent(momentum_bar:Parent())
		momentum_parent:SetDockingPoint(dock_point)

		offset_x = offset_x or 0
		offset_y = offset_y or -momentum_parent:Height()
		momentum_parent:SetDockOffset(offset_x, offset_y)
	else
		UIComponent(momentum_bar:Parent()):SetVisible(true)
	end

	momentum_bar:InterfaceFunction("set_current_momentum", penthesilea_armies_momentum[penthesilea_selected_force_cqi])

	if penthesilea_blood_oath_active_on_force[penthesilea_selected_force_cqi] then
		local oath_tier = penthesilea_blood_oath[penthesilea_blood_oath.current_tier]
		local num_units = penthesilea_blood_oath_active_on_force[penthesilea_selected_force_cqi].num_units
		local remaining_turns = penthesilea_blood_oath_active_on_force[penthesilea_selected_force_cqi].remaining_turns

		momentum_bar:InterfaceFunction("set_blood_oath_mode", num_units, oath_tier.unit_key, oath_tier.ui_details.title, remaining_turns)
	end

	return UIComponent(momentum_bar:Parent())
end

function PenthesileaMomentum_HideMomentumBar()
	local momentum_bar = core:get_ui_root():SequentialFind(unpack(penthesilea_ui.army_momentum_bar.target_path), penthesilea_ui.army_momentum_bar.root)

	if momentum_bar then
		momentum_bar:SetVisible(false)
	end
end

function PenthesileaMomentum_ShowBloodOathButton()
	local button_blood_oath = core:get_ui_root():SequentialFind(penthesilea_ui.button_blood_oath)

	if not button_blood_oath then
		script_error("Blood Oath button on units panel not found")
		return
	end

	button_blood_oath:SetVisible(true)

	local tooltip_title_key = nil
	local tooltip_description_key = nil
	local button_icon = nil
	local button_state = nil

	local is_blood_oath_active = penthesilea_blood_oath_active_on_force[penthesilea_selected_force_cqi] ~= nil
	local is_blood_oath_available = penthesilea_blood_oath.current_tier > 0 and currentMomentumTier(penthesilea_selected_force_cqi).blood_oath_num_units > 0

	if is_blood_oath_active or is_blood_oath_available then
		local uid = penthesilea_blood_oath[penthesilea_blood_oath.current_tier].ui_details
		tooltip_title_key = uid.title
		tooltip_description_key = uid.description
		button_icon = "ui/campaign ui/skills/" .. uid.icon_path
		button_state = is_blood_oath_active and "selected_inactive" or "active"
	elseif penthesilea_blood_oath.current_tier == 0 then
		tooltip_title_key = penthesilea_blood_oath.ui_info.not_purchased_title
		tooltip_description_key = penthesilea_blood_oath.ui_info.not_purchased_description
		button_icon = "ui/campaign ui/skills/" .. penthesilea_blood_oath[1].ui_details.icon_path
		button_state = "inactive"
	else --if currentMomentumTier(penthesilea_selected_force_cqi).blood_oath_num_units == 0 then
		tooltip_title_key = penthesilea_blood_oath.ui_info.not_purchased_title
		tooltip_description_key = penthesilea_blood_oath.ui_info.not_enough_momentum_description
		button_icon = "ui/campaign ui/skills/" .. penthesilea_blood_oath[1].ui_details.icon_path
		button_state = "inactive"
	end

	button_blood_oath:SetTooltipWithTitle(tooltip_title_key, tooltip_description_key, true)
	button_blood_oath:SetImagePath(button_icon)
	button_blood_oath:SetState(button_state)
end

function PenthesileaMomentum_HideBloodOathButton()
	local button_blood_oath = core:get_ui_root():SequentialFind(penthesilea_ui.button_blood_oath)

	if button_blood_oath then
		button_blood_oath:SetVisible(false)
	end
end

function PenthesileaMomentum_RefreshRemainingTurns()
	local dy_remaining_turns_value = core:get_ui_root():SequentialFind(penthesilea_ui.dy_remaining_turns_value)
	if not dy_remaining_turns_value then
		script_error("Blood Oath " .. penthesilea_ui.dy_remaining_turns_value .. " on units panel not found")
		return
	end

	local remaining_turns = 0
	if penthesilea_blood_oath_active_on_force[penthesilea_selected_force_cqi] then
		remaining_turns = penthesilea_blood_oath_active_on_force[penthesilea_selected_force_cqi].remaining_turns
	end

	dy_remaining_turns_value:SetVisible(remaining_turns > 0)
	dy_remaining_turns_value:SetText(remaining_turns)
end

function PenthesileaMomentum_UpdateArmyRelatedUI()
	print_debug("PenthesileaMomentum_UpdateArmyRelatedUI()")

	if cm:get_local_faction_name(true) == penthesilea_faction then
		local is_units_panel_opened = (find_uicomponent(core:get_ui_root(), unpack(penthesilea_ui.army_momentum_bar.target_path)) ~= false)

		if penthesilea_selected_force_cqi ~= nil and
			cm:get_military_force_by_cqi(penthesilea_selected_force_cqi):faction():name() == penthesilea_faction and
			penthesilea_armies_momentum[penthesilea_selected_force_cqi] ~= nil and
			is_units_panel_opened
		then
			PenthesileaMomentum_ShowMomentumBar()
			PenthesileaMomentum_ShowBloodOathButton()
			PenthesileaMomentum_RefreshRemainingTurns()
		else
			PenthesileaMomentum_HideMomentumBar()
			PenthesileaMomentum_HideBloodOathButton()
		end
	end
end

function PenthesileaMomentum_RefreshFactionMechanicPanel()
	print_debug("PenthesileaMomentum_RefreshFactionMechanicPanel()")

	local oath_panel = find_uicomponent(core:get_ui_root(), penthesilea_ui.momentum_panel)

	if oath_panel then
		oath_panel:InterfaceFunction('set_penthesilea_oath', penthesilea_blood_oath, penthesilea_total_momentum_gained)
	end

end

-- Here we just save that the character has active Blood Oath. The bonus units are then handled in PenthesileaMomentum_AddBonusUnitsToForce and PenthesileaMomentum_RemoveBonusUnitsFromForce
function PenthesileaMomentum_ActivateBloodOath(force_cqi)
	if not penthesilea_blood_oath_active_on_force[force_cqi] then

		if penthesilea_blood_oath.current_tier == 0 then
			script_error("Trying to add Blood Oath units to character with cqi = " .. force_cqi .. ", but the player didn't unlock any blood oath tier.")
			return
		end

		if cm:model():world():model():faction_is_local(penthesilea_faction) then
			local button_blood_oath = core:get_ui_root():SequentialFind(penthesilea_ui.button_blood_oath)
			if button_blood_oath then
				button_blood_oath:SetState("selected_inactive")
			end
		end

		penthesilea_blood_oath_active_on_force[force_cqi] = {}
		penthesilea_blood_oath_active_on_force[force_cqi].remaining_turns = penthesilea_blood_oath.duration
		penthesilea_blood_oath_active_on_force[force_cqi].num_units = currentMomentumTier(force_cqi).blood_oath_num_units

		PenthesileaMomentum_UpdateArmyBloodOathIcons()
	end
end

function PenthesileaMomentum_DeactivateBloodOath(force_cqi)
	if penthesilea_blood_oath_active_on_force[force_cqi] then
		penthesilea_blood_oath_active_on_force[force_cqi] = nil

		local new_momentum_value = currentMomentumTier(force_cqi).remaining_momentum_after_blood_oath
		local current_momentum_value = penthesilea_armies_momentum[force_cqi]
		increaseMomentum(force_cqi, new_momentum_value - current_momentum_value)

		PenthesileaMomentum_UpdateArmyBloodOathIcons()
	end
end

-- Called on PendingBattle. Grants the bonus units from Blood Oath if it is active for this character
function PenthesileaMomentum_AddBonusUnitsToForce(force_cqi)
	if penthesilea_blood_oath_active_on_force[force_cqi] and penthesilea_blood_oath_active_on_force[force_cqi].bonus_units == nil
	then
		penthesilea_blood_oath_active_on_force[force_cqi].bonus_units = {}
		local num_units = penthesilea_blood_oath_active_on_force[force_cqi].num_units
		local unit_key = penthesilea_blood_oath[penthesilea_blood_oath.current_tier].unit_key

		local new_units = cm:grant_unit_to_character_above_limit("character_cqi:" .. cm:get_military_force_by_cqi(force_cqi):general_character():command_queue_index(), unit_key, num_units)

		for _, unit_cqi in ipairs(new_units) do
			table.insert(penthesilea_blood_oath_active_on_force[force_cqi].bonus_units, unit_cqi)
		end
	end
end

-- Called on BattleCompleted. Removes the bonus units from Blood Oath if it is active for this character
function PenthesileaMomentum_RemoveBonusUnitsFromForce(force_cqi)
	if penthesilea_blood_oath_active_on_force[force_cqi] then
		if penthesilea_blood_oath_active_on_force[force_cqi].bonus_units then
			for k,v in ipairs(penthesilea_blood_oath_active_on_force[force_cqi].bonus_units) do
				cm:remove_unit_by_cqi(v)
			end
			penthesilea_blood_oath_active_on_force[force_cqi].bonus_units = nil
		end
	end
end

function PenthesileaMomentum_PurchaseBloodOath(oath_tier)
	for idx, cost in pairs(penthesilea_blood_oath[oath_tier].costs) do
		local resource_key = cost.key
		local resource_value = -cost.val

		cm:faction_add_pooled_resource(penthesilea_faction, resource_key, penthesilea_blood_oath_factor, resource_value)
	end

	penthesilea_blood_oath.current_tier = oath_tier

	if penthesilea_blood_oath.current_tier == 1 then
		core:trigger_event("PenthesileaBloodOath", cm:get_faction(penthesilea_faction), penthesilea_blood_oath.current_tier)
	end
end

function PenthesileaMomentum_MilitaryForceCreated(force_cqi)
	penthesilea_armies_momentum[force_cqi] = 0
	cm:apply_effect_bundle_to_force(penthesilea_momentum_tiers[1].bundle_key, force_cqi, 0)
	increaseMomentum(force_cqi, PENTHESILEA_DEFAULT_MOMENTUM, false)
end

function PenthesileaMomentum_MilitaryForceDestroyed(force_cqi)
	penthesilea_armies_momentum[force_cqi] = nil
	penthesilea_blood_oath_active_on_force[force_cqi] = nil
	penthesilea_selected_force_cqi = nil
end

--##########################################
-- triggers
--##########################################

core:add_listener(
	"PenthesileaMomentum_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	PenthesileaMomentum_UpdateArmyBloodOathIcons,
	true
)

core:add_listener(
	"PenthesileaMomentum_NewCampaignStarted",
	"NewCampaignStarted",
	true,
	function(context)
		print_debug("PenthesileaMomentum_NewCampaignStarted")
		if cm:get_faction(penthesilea_faction) then
			local penthesilea_army_cqi = cm:get_faction(penthesilea_faction):faction_leader():military_force():command_queue_index()
			PenthesileaMomentum_MilitaryForceCreated(penthesilea_army_cqi)
		end
	end,
	false
)

function PenthesileaMomentum_AddListeners()
	out("PenthesileaMomentum_AddListeners()")

	core:add_listener(
		"PenthesileaMomentum_MilitaryForceCreated",
		"MilitaryForceCreated",
		function(context) return context:military_force_created():faction():name() == penthesilea_faction end,
		function(context)
			print_debug("PenthesileaMomentum_MilitaryForceCreated")
			local force_cqi = context:military_force_created():command_queue_index()
			PenthesileaMomentum_MilitaryForceCreated(force_cqi)
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_MilitaryForceDestroyed",
		"MilitaryForceDestroyed",
		true,
		function(context)
			local cqi = context:cqi()

			if penthesilea_armies_momentum[cqi] then
				PenthesileaMomentum_MilitaryForceDestroyed(cqi)
			end
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_CharacterSelected",
		"CharacterSelected",
		function(context) return cm:get_local_faction_name(true) == penthesilea_faction end,
		function(context)
			print_debug("CharacterSelected")

			if context:character():has_military_force() then
				penthesilea_selected_force_cqi = context:character():military_force():command_queue_index()
			else
				penthesilea_selected_force_cqi = nil
			end

			PenthesileaMomentum_UpdateArmyRelatedUI()
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_UnitsPanelOpened",
		"PanelOpenedCampaign",
		function(context)
			return context.string == penthesilea_ui.parent_panel
					or context.string == penthesilea_ui.momentum_panel
		end,
		function(context)
			print_debug("PenthesileaMomentum_UnitsPanelOpened")

			if context.string == penthesilea_ui.parent_panel then
				PenthesileaMomentum_UpdateArmyRelatedUI()
			elseif context.string == penthesilea_ui.momentum_panel then
				PenthesileaMomentum_RefreshFactionMechanicPanel()
			end

		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_FactionTurnEnd",
		"FactionTurnEnd",
		function(context) return context:faction():name() == penthesilea_faction end,
		function(context)
			print_debug("FactionTurnEnd")

			for force_cqi, _ in pairs(penthesilea_armies_momentum) do
				increaseMomentum(force_cqi, PENTHESILEA_MOMENTUM_GAINED_PER_TURN, false)
				if not context:faction():is_human() then
					local amount = cm:model():random_int(PENTHESILEA_AI_MOMENTUM_GAINED_PER_TURN_LOWER_BOUND,PENTHESILEA_AI_MOMENTUM_GAINED_PER_TURN_UPPER_BOUND)
					increaseMomentum(force_cqi,amount, false)
				end
			end
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_PostBattleRelease",
		"CharacterPostBattleRelease",
		function(context) return context:character():faction():name() == penthesilea_faction end,
		function(context)
			print_debug("CharacterPostBattleRelease")
			increaseMomentum(context:character():military_force():command_queue_index(), PENTHESILEA_MOMENTUM_GAINED_POST_BATTLE_RELEASE)
		end,
		true
	)

	local function get_effect_value_for_effect_bundle_with_effect_key(effect_bundle, effect_key)
		local result = -1
		local effect_bundle = cm:create_new_custom_effect_bundle(effect_bundle)
		if effect_bundle:is_null_interface() then
			out("The provided effect bundle `" .. effect_bundle .. "` is not a valid effect bundle key.")
			return result
		end
		for i = 0, effect_bundle:effects():num_items() - 1 do
			local effect = effect_bundle:effects():item_at(i)
			if effect:is_null_interface() then
				out("Effect bundle " .. effect_bundle:key() .. " contains a null effect.")
				return result
			else
				if effect:key() == effect_key then
					result = effect:value()
				end
			end
		end
		return result
	end

	core:add_listener(
		"PenthesileaMomentum_PostBattleSlaughter",
		"CharacterPostBattleSlaughter",
		function(context) return context:character():faction():name() == penthesilea_faction and not context:is_automatically_selected() end,
		function(context)
			local kill_effect_momentum_value = get_effect_value_for_effect_bundle_with_effect_key(PENTHESILEA_MOMENTUM_POST_BATTLE_KILL_EFFECT.bundle, PENTHESILEA_MOMENTUM_POST_BATTLE_KILL_EFFECT.key)
			if kill_effect_momentum_value < 0 then
				out("There was an error retrieving the momentum value from the effect.")
				return
			end
			print_debug("CharacterPostBattleSlaughter")
			local momentum = character_skill_mod(context:character(), kill_effect_momentum_value, penthesilea_momentum_bonus_skill_mod, "PENTHESILEA_MOMENTUM_GAINED_POST_BATTLE_SLAUGHTER")
			out("Increasing Momentum by " .. momentum)
			increaseMomentum(context:character():military_force():command_queue_index(), momentum)
			local test_faction = context:character():faction();
			test_faction:name()
		end,
		true
	)

	core:add_listener( 
		"PenthesileaMomentum_RazeAndKillMan",
		"CharacterPerformsSettlementOccupationDecision",
		function(context) 
			return context:character():faction():name() == penthesilea_faction 
		end,
		function(context)
			local raze_option = nil
			local skill_mod_key = nil

			if context:occupation_decision_group() == "troy_ama_clt_hordes_occupation_decision_raze_and_kill" or context:occupation_decision_group() == "troy_mth_ama_clt_hordes_occupation_decision_raze_and_kill_myth_monsters" then
				raze_option = PENTHESILEA_MOMENTUM_POST_BATTLE_RAZE_KILL_EFFECT
				skill_mod_key = "PENTHESILEA_MOMENTUM_GAINED_SETTLEMENT_RAZE_AND_KILL_MEN"
			elseif context:occupation_decision_group() == "troy_ama_clt_hordes_occupation_decision_raze_and_enslave" or context:occupation_decision_group() == "troy_mth_ama_clt_hordes_occupation_decision_raze_and_enslave_myth_monsters" then
				raze_option = PENTHESILEA_MOMENTUM_POST_BATTLE_RAZE_ENSLAVE_EFFECT
				skill_mod_key = "PENTHESILEA_MOMENTUM_GAINED_SETTLEMENT_RAZE_AND_ENSLAVE"
			end

			if not raze_option then
				return
			end

			local raze_effect_momentum_value = get_effect_value_for_effect_bundle_with_effect_key(raze_option.bundle, raze_option.key)
			if raze_effect_momentum_value < 0 then
				out("There was an error retrieving the momentum value from the effect.")
				return
			end
			print_debug("CharacterLootedSettlement")
			local momentum = character_skill_mod(context:character(), raze_effect_momentum_value, penthesilea_momentum_bonus_skill_mod, skill_mod_key)
			out("Increasing Momentum by " .. momentum)
			increaseMomentum(context:character():military_force():command_queue_index(), momentum)
		end,
		true
	)

	core:add_listener(
		"CharacterPerformsSettlementOccupationDecision",
		"CharacterSackedSettlement",
		function(context) return context:character():faction():name() == penthesilea_faction and context:occupation_decision_group() == "troy_ama_clt_hordes_occupation_decision_raze_and_enslave" end,
		function(context)
			print_debug("CharacterSackedSettlement")
			increaseMomentum(context:character():military_force():command_queue_index(), PENTHESILEA_MOMENTUM_GAINED_SETTLEMENT_SACKED) end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_ButtonBloodOathClicked",
		"ComponentLClickUp",
		function(context) return context.string == penthesilea_ui.button_blood_oath and cm:get_local_faction_name(true) == penthesilea_faction end,
		function(context)
			if penthesilea_selected_force_cqi then
				CampaignUI.TriggerCampaignScriptEvent(cm:get_faction(penthesilea_faction):command_queue_index(),
					"PenthesileaMomentum_ButtonBloodOathClicked," .. penthesilea_selected_force_cqi)
			else
				script_error("Button button_blood_oath clicked by Penthesilea's faction but the supplied [penthesilea_selected_force_cqi] was nil.")
			end
		end,
		true
	)
	-- we need both events in order for this to work properly in multiplayer
	core:add_listener(
		"PenthesileaMomentum_ButtonBloodOathClickedModelEvent",
		"UITriggerScriptEvent",
		function(context)
			local args = context:trigger():split(",")
			return args[1] == "PenthesileaMomentum_ButtonBloodOathClicked"
		end,
		function(context)
			print_debug("PenthesileaMomentum_ButtonBloodOathClicked")
			local args = context:trigger():split(",")
			local force_cqi = tonumber(args[2])
			PenthesileaMomentum_ActivateBloodOath(force_cqi)

			if cm:get_local_faction_name(true) == penthesilea_faction then
				PenthesileaMomentum_UpdateArmyRelatedUI()
			end
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_PurchaseBloodOathButtonClickedModelEvent",
		"UITriggerScriptEvent",
		function(context)
			local args = context:trigger():split(",")
			return args[1] == "PenthesileaMomentum_PurchaseBloodOathButtonClicked"
		end,
		function(context)
			print_debug("PenthesileaMomentum_PurchaseBloodOathButtonClickedModelEvent")
			local args = context:trigger():split(",")
			local oath_tier = tonumber(args[2])

			PenthesileaMomentum_PurchaseBloodOath(oath_tier)
			PenthesileaMomentum_RefreshFactionMechanicPanel()
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_PurchaseBloodOathForAI",
		"FactionTurnStart",
		function(context)
			local faction = context:faction()
			return faction:name() == penthesilea_faction and not faction:is_human()
		end,
		function(context)
			for i = 1, penthesilea_blood_oath.max_tier do
				if cm:model():turn_number() >= penthesilea_blood_oath[i].ai_unlock_turn then
					penthesilea_blood_oath.current_tier = i
				end
			end

			for force_cqi, _ in pairs(penthesilea_armies_momentum) do
				local current_tier = currentMomentumTier(force_cqi)
				local rand = cm:model():random_int(1,100)
				if  penthesilea_blood_oath.current_tier > 0
					and current_tier.blood_oath_num_units > 0
					and not penthesilea_blood_oath_active_on_force[force_cqi]
					and rand > 50 then
					PenthesileaMomentum_ActivateBloodOath(force_cqi)
				end
			end
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_BloodOathPanelClosed",
		"PanelClosedCampaign",
		function(context)
			return context.string == penthesilea_ui.momentum_panel
		end,
		function(context)
			PenthesileaMomentum_UpdateArmyRelatedUI()
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_PendingBattle",
		"PendingBattle",
		PenthesileaMomentum_IsBattleWithPenthesileaFaction,
		function(context)
			print_debug("PenthesileaMomentum_PendingBattle")
			local character = PenthesileaMomentum_GetPendingBattleGeneralForPenthesileaFaction()

			if character then
				PenthesileaMomentum_AddBonusUnitsToForce(character:military_force():command_queue_index())
			end
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_CharacterMaintainsSiege",
		"CharacterMaintainsSiege",
		PenthesileaMomentum_IsBattleWithPenthesileaFaction,
		function(context)
			print_debug("PenthesileaMomentum_CharacterMaintainsSiege")
			local character = PenthesileaMomentum_GetPendingBattleGeneralForPenthesileaFaction()

			if character then
				PenthesileaMomentum_RemoveBonusUnitsFromForce(character:military_force():command_queue_index())
			end
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_BattleCompleted",
		"BattleCompleted",
		PenthesileaMomentum_IsBattleWithPenthesileaFaction,
		function(context)
			print_debug("PenthesileaMomentum_BattleCompleted")
			local character = PenthesileaMomentum_GetPendingBattleGeneralForPenthesileaFaction()

			if character then
				PenthesileaMomentum_RemoveBonusUnitsFromForce(character:military_force():command_queue_index())
			end
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_CharacterWithdrewFromBattle",
		"CharacterWithdrewFromBattle",
		PenthesileaMomentum_IsBattleWithPenthesileaFaction,
		function(context)
			print_debug("PenthesileaMomentum_CharacterWithdrewFromBattle")
			local character = PenthesileaMomentum_GetPendingBattleGeneralForPenthesileaFaction()

			if character then
				PenthesileaMomentum_RemoveBonusUnitsFromForce(character:military_force():command_queue_index())
			end
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_TurnStart",
		"FactionTurnStart",
		function(context) return context:faction():name() == penthesilea_faction end,
		function(context)
			print_debug("PenthesileaMomentum_TurnStart")

			local factionwide_current_momentum = 0
			for _, value in pairs(penthesilea_armies_momentum) do
				factionwide_current_momentum = factionwide_current_momentum + value
			end
			out("FACTIONWIDE CURRENT MOMENTUM = " .. factionwide_current_momentum)
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_BloodOathExpirationListener",
		"FactionTurnStart",
		function(context) return context:faction():name() == penthesilea_faction end,
		function(context)
			print_debug("PenthesileaMomentum_BloodOathExpirationListener")

			local armies = context:faction():military_force_list()

			for i = 0, armies:num_items() - 1 do
				local cqi = armies:item_at(i):command_queue_index()

				if penthesilea_blood_oath_active_on_force[cqi] then
					penthesilea_blood_oath_active_on_force[cqi].remaining_turns = penthesilea_blood_oath_active_on_force[cqi].remaining_turns - 1

					if penthesilea_blood_oath_active_on_force[cqi].remaining_turns == 0 then
						PenthesileaMomentum_DeactivateBloodOath(cqi)
					end
				end
			end

			PenthesileaMomentum_UpdateArmyBloodOathIcons()
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_MomentumBarOnBattleResults",
		"CharacterCompletedBattle",
		function(context) 
			return cm:get_local_faction_name(true) == penthesilea_faction and 
				context:character():faction():name() == penthesilea_faction and 
				context:character():has_military_force()
		end,
		function(context)
			core:remove_listener("PenthesileaMomentum_BattleResultsOpened")
			core:remove_listener("PenthesileaMomentum_SettlementCapturedOpened")
			local army_cqi = context:character():military_force():command_queue_index()

			core:add_listener(
				"PenthesileaMomentum_BattleResultsOpened",
				"PanelOpenedCampaign",
				function(panel) return cm:get_local_faction_name(true) == penthesilea_faction and panel.string == "popup_battle_results" end,
				function(panel)

					penthesilea_selected_force_cqi = army_cqi
					local bar = PenthesileaMomentum_ShowMomentumBar(
						{"popup_battle_results", "mid", "battle_results", "title_plaque"},
						2 --[[TOP_CENTER--]],
						6)

					local button_blood_oath = bar:SequentialFind(penthesilea_ui.button_blood_oath)
					if button_blood_oath then
						button_blood_oath:SetState("inactive")
						button_blood_oath:SetTooltipText("", "Lua", true)
					end

					PenthesileaMomentum_RefreshRemainingTurns()
				end,
				false
			)

			core:add_listener(
				"PenthesileaMomentum_SettlementCapturedOpened",
				"PanelOpenedCampaign",
				function(panel) return cm:get_local_faction_name(true) == penthesilea_faction and panel.string == "settlement_captured" end,
				function(panel)
					penthesilea_selected_force_cqi = army_cqi
					local bar = PenthesileaMomentum_ShowMomentumBar(
						{"settlement_captured", "tx_title"},
						2 --[[TOP_CENTER--]],
						6)

					local button_blood_oath = bar:SequentialFind(penthesilea_ui.button_blood_oath)
					if button_blood_oath then
						button_blood_oath:SetState("inactive")
						button_blood_oath:SetTooltipText("", "Lua", true)
					end

					PenthesileaMomentum_RefreshRemainingTurns()
				end,
				false
			)
		end, 
		true
	)

	core:add_listener(
		"PenthesileaMomentum_ActionPointsOnRaze",
		"CharacterPerformsSettlementOccupationDecision",
		function(context)
			return context:character():faction():name() == penthesilea_faction
		end,
		function(context)
			cm:replenish_action_points(cm:char_lookup_str(context:character():command_queue_index()), penthesilea_action_points_after_raze)
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_MomentumFromStance",
		"CharacterTurnEnd",
		function(context)
			local char = context:character()
			return char:faction():name() == penthesilea_faction and char:has_military_force() and char:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_SETTLE"
		end,
		function(context)
			increaseMomentum(context:character():military_force():command_queue_index(), PENTHESILEA_MOMENTUM_GAINED_ENCAMP_STANCE, true)
		end,
		true
	)

	core:add_listener(
		"PenthesileaMomentum_MomentumFromPrayer",
		"FactionInitiatesPrayer",
		function(context) return context:faction():name() == penthesilea_faction end,
		function(context)
			local faction = context:faction()
			local bundle = faction:get_effect_bundle(context:effect_bundle_key())
			local effect_list = bundle:effects()
			local momentum_from_prayer = 0

			for i = 0, effect_list:num_items() - 1 do
				local curr_effect = effect_list:item_at(i)
				if curr_effect:key() == "troy_effect_dlc1_gods_hera_prayer_momentum_dummy" then 
					momentum_from_prayer = curr_effect:value()
					break
				end
			end

			if momentum_from_prayer ~= 0 then
				local mf_list = faction:military_force_list()
				for army = 0, mf_list:num_items() - 1 do
					local curr_mf_cqi = mf_list:item_at(army):command_queue_index()
					increaseMomentum(curr_mf_cqi, momentum_from_prayer, true)
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
		cm:save_named_value("PENTHESILEA_ARMIES_MOMENTUM", penthesilea_armies_momentum, context)
		cm:save_named_value("PENTHESILEA_BLOOD_OATH_ACTIVE_CHARACTERS", penthesilea_blood_oath_active_on_force, context)
		cm:save_named_value("PENTHESILEA_TOTAL_MOMENTUM_GAINED" , penthesilea_total_momentum_gained, context)
		cm:save_named_value("PENTHESILEA_CURRENT_BLOOD_OATH_TIER" , penthesilea_blood_oath.current_tier, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		penthesilea_armies_momentum = cm:load_named_value("PENTHESILEA_ARMIES_MOMENTUM", penthesilea_armies_momentum, context)
		penthesilea_total_momentum_gained = cm:load_named_value("PENTHESILEA_TOTAL_MOMENTUM_GAINED", penthesilea_total_momentum_gained, context)

		penthesilea_blood_oath.current_tier = cm:load_named_value("PENTHESILEA_CURRENT_BLOOD_OATH_TIER" , penthesilea_blood_oath.current_tier, context)
		penthesilea_blood_oath.current_tier = math.min(penthesilea_blood_oath.max_tier, penthesilea_blood_oath.current_tier)

		penthesilea_blood_oath_active_on_force = cm:load_named_value("PENTHESILEA_BLOOD_OATH_ACTIVE_CHARACTERS", penthesilea_blood_oath_active_on_force, context)
		for cqi, oath_info in pairs(penthesilea_blood_oath_active_on_force) do
			if not oath_info.num_units then
				oath_info.num_units = penthesilea_momentum_tiers[2].blood_oath_num_units
			end
		end
	end
)