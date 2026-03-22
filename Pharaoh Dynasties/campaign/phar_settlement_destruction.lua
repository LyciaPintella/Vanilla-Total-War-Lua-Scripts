out("Loading phar_settlement_destruction.lua")

--[[
This is the campaign representation of the Settlement destruction feature. 
The feature applies penalties to the defenders of a siege based on the amount of 
settlement destruction (buildings burned). The latter is based on the current damage the buildings 
in the settlement have, with the siege applying some damage after certain amount of turns.

We want the feature to have some effect in the campaign too, so if the player doesn’t fight the battle on the field,
but rather uses the autoresolver, it still has some impact. However, we want the battle UI to properly show the penalties 
due to the settlement destruction and have in mind that this penalty is dynamically changing during the battle as buildings get burned.

To achieve this, we take the following hacky approach:
In the campaign we apply some custom effect bundle to the armed citizenry and garrisoned military forces, with the penalty 
values proportional to the settlement destruction level, and remove them before the start of the on field battle. 
We take these directly from the table used for the battle values.
Those penalties should be observable in the campaign UI when hovering over the forces.
Remove the bundle before starting an on field battle, as otherwise the penalties would be 
prebaked into the units’ stats and will appear as their base value, rather than as a “temporary” debuff.
--]]

phar_settlement_destruction = {
	is_enabled_for_sally_battles = false,
	is_enabled_for_relief_battles = false,
	is_enabled_for_ai_faction = true,
	effect_bundle_key = "phar_main_settlement_destruction_defender_unit_penalties",
}

-- local alias for the table
local psd = phar_settlement_destruction

function phar_settlement_destruction.is_component_inside_prebattle_panel(component)
	if not is_uicomponent(component) then
		return false
	end

	while component:Address() ~= core:get_ui_root():Address() do
		if component:Id() == "popup_pre_battle" then
			return true
		end

		component = UIComponent(component:Parent())
	end

	return false
end

function phar_settlement_destruction.is_settlement_battle()
	return string.find(cm:model():pending_battle():battle_type(), "settlement_")
end

function phar_settlement_destruction.update_effect_bundle_for_settlement_defending_forces(garrison)
	local burned_ratio = garrison:settlement_interface():burned_buildings_percent() * 0.01
	if burned_ratio <= 0 then
		return -- no need to clear it here because no effect should be added yet
	end

	local custom_effect_bundle = cm:create_new_custom_effect_bundle(psd.effect_bundle_key)
	for i = 0, custom_effect_bundle:effects():num_items() - 1 do
		local effect = custom_effect_bundle:effects():item_at(i)
		local new_value = math.round(effect:value() * burned_ratio)
		custom_effect_bundle:set_effect_value(effect, new_value)
	end

	local update_bundle_for_force = function(force)
		if not force:is_null_interface() then
			cm:remove_effect_bundle_from_force(psd.effect_bundle_key, force:command_queue_index())
			cm:apply_custom_effect_bundle_to_force(custom_effect_bundle, force)
		end
	end

	update_bundle_for_force(garrison:garrison_army()) -- armed citizenry
	update_bundle_for_force(garrison:army()) -- garrisoned army if any
end

function phar_settlement_destruction.remove_effect_bundle_for_settlement_defending_forces(garrison)
	local remove_bundle = function(force)
		if not force:is_null_interface() then
			cm:remove_effect_bundle_from_force(psd.effect_bundle_key, force:command_queue_index())
		end
	end

	remove_bundle(garrison:garrison_army()) -- armed citizenry
	remove_bundle(garrison:army()) -- garrisoned army if any
end

-- Remove the effect bundle from both attacker and defender. When playing sally battle, 
-- the roles are reversed and it doesn't hurt to just remove the bundle from everyone
function phar_settlement_destruction.remove_effect_bundle_from_all_participants()
	local pb = cm:model():pending_battle()

	local remove_bundle_from_characters_force = function(character)
		if not character:is_null_interface() and character:has_military_force() then
			cm:remove_effect_bundle_from_force(psd.effect_bundle_key, character:military_force():command_queue_index())
		end
	end

	remove_bundle_from_characters_force(pb:attacker())
	remove_bundle_from_characters_force(pb:defender())

	local secondary_attackers = pb:secondary_attackers()
	for i = 0, secondary_attackers:num_items() - 1 do
		remove_bundle_from_characters_force(secondary_attackers:item_at(i))
	end

	local secondary_defenders = pb:secondary_defenders()
	for i = 0, secondary_defenders:num_items() - 1 do
		remove_bundle_from_characters_force(secondary_defenders:item_at(i))
	end
end

core:add_listener(
	"settlement_destruction_region_turn_start",
	"RegionTurnStart",
	function(context)
		local region = context:region()
		local owning_faction = region:owning_faction()

		return region:garrison_residence():is_under_siege()
			and (owning_faction:is_human() or psd.is_enabled_for_ai_faction)
	end,
	function(context)
		psd.update_effect_bundle_for_settlement_defending_forces(context:region():garrison_residence())
	end,
	true
)

-- Add the effect bundle if the settlement is already damaged
-- Needs to happen before the pending battle is created in order to appear in the UI
core:add_listener(
	"settlement_destruction_pending_battle_about_to_be_created_siege_battle",
	"PendingBattleAboutToBeCreated",
	function(context)
		local garrison = context:target_garrison()
		if garrison:is_null_interface() or not garrison:is_settlement() then
			return
		end

		return garrison:faction():is_human() or psd.is_enabled_for_ai_faction
	end,
	function(context)
		psd.update_effect_bundle_for_settlement_defending_forces(context:target_garrison())
	end,
	true
)

-- Remove the effect if disabled for Sally or Relief battles
core:add_listener(
	"settlement_destruction_pending_battle_about_to_be_created_sally_or_relief",
	"PendingBattleAboutToBeCreated",
	function(context)
		local battle_type = context:battle_type()
		return (battle_type == "settlement_relief" and not psd.is_enabled_for_relief_battles) or
			(battle_type == "settlement_sally" and not psd.is_enabled_for_sally_battles)
	end,
	function(context)
		local siege = context:target_character():military_force():get_siege()
		if not siege:is_null_interface() then
			phar_settlement_destruction.remove_effect_bundle_for_settlement_defending_forces(siege:get_garrison_residence_under_siege())
		end
	end,
	true
)

core:add_listener(
	"settlement_destruction_attack_button_clicked_UI",
	"ComponentLClickUp",
	function(context)
		return context.string == "button_attack" and 
			psd.is_component_inside_prebattle_panel(UIComponent(context.component)) and
			psd.is_settlement_battle()
	end,
	function(context)
		CampaignUI.TriggerCampaignScriptEvent(0--[[not used--]], "settlement_destruction_battle_will_be_fought_mannually")
	end,
	true
)

core:add_listener(
	"settlement_destruction_battle_will_be_fought_mannually",
	"UITriggerScriptEvent",
	function(context)
		return context:trigger() == "settlement_destruction_battle_will_be_fought_mannually"
	end,
	psd.remove_effect_bundle_from_all_participants,
	true
)


core:add_listener(
	"settlement_destruction_battle_conflict_finished",
	"CharacterEndsBesiegingSettlement",
	true,
	psd.remove_effect_bundle_from_all_participants,
	true
)

core:add_listener(
	"settlement_destruction_first_tick",
	"FirstTickAfterWorldCreated",
	function(context)
		local pending_battle = cm:model():pending_battle()
		if not pending_battle:is_active() then
			return false
		end
		if not pending_battle:has_contested_garrison() then
			return false
		end

		local garrison = pending_battle:contested_garrison()
		if garrison:is_null_interface() or not garrison:is_settlement() then
			return false
		end

		return garrison:faction():is_human() or psd.is_enabled_for_ai_faction
	end,
	function(context)
		local garrison = cm:model():pending_battle():contested_garrison()
		psd.update_effect_bundle_for_settlement_defending_forces(garrison)

		-- refresh UI, since it it's created before the first tick
		local settlement_destruction_component = core:get_ui_root():SequentialFind("settlement_destruction")
		if settlement_destruction_component then
			settlement_destruction_component:InterfaceFunction("reinitialise")
		end
	end,
	false
)