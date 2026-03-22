---------------------------- DESIGN
local listeners = {

	stalk = {
		event_name = { "CharacterSkillPointAllocated", "CharacterSkillPointDeallocated", "CharacterEntersMilitaryForce", "CharacterLeavesMilitaryForce"},

		stance = "MILITARY_FORCE_ACTIVE_STANCE_TYPE_STALKING",			-- IV!
		skills = {
			{
				id = {"troy_main_hero_campaign_stalk"},
				id_filter = false,
			},
		},
	},

	post_battle_spec_movement = {
		event_name = "CharacterCompletedBattle", 
		action_points_factor = 0.2,										-- IV!
		skills = {
			{
				id = {"troy_main_hero_campaign_casualties_post_battle_spec_movement"},
			},
		},
	},

	sacking_spec_replenishment = {
		event_name = "CharacterSackedSettlement", 
		replenish_factor = 0.15,										-- IV!
		skills = {
			{
				id = {"troy_main_hero_campaign_sacking_razing_spec_replenishment"},
			},
		},
	},

	happiness_spec_favour = {
		event_name = "CharacterTurnStart", 
		favor = 5,														-- IV!
		skills = {
			{
				id = {"troy_main_hero_campaign_happiness_growth_spec_favour"},
			},
		},
	},

	happiness_spec_garrison = {
		event_name = { "CharacterSkillPointAllocated", "CharacterSkillPointDeallocated", "CharacterEntersGarrison", "CharacterLeavesGarrison"},
		bundle = "effect_bundle_hero_campaign_happiness_spec_garrison",		--IV!
		skills = {
			{
				id = {"troy_main_hero_campaign_happiness_growth_spec_garrison_growth"},
				id_filter = false,
			},
		},
	},

	post_battle_spec_favour = {
		event_name = { "CharacterPostBattleEnslave", "CharacterPostBattleRelease", "CharacterPostBattleSlaughter"},
		favor = 2,														-- IV!
		skills = {
			{
				id = {"troy_main_hero_campaign_post_battle_spec_favour"},
			},
		},
	},

	income_raiding_spec_replenishment = {
		event_name = "CharacterTurnEnd",
		replenish_factor = 0.07,										-- IV!
		stance = "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID",			-- IV!
		skills = {
			{
				id = {"troy_main_hero_campaign_income_raiding_attrition_spec_replenishment"},
			},
		},
	},	

	income_raiding_spec_replenishment_settle = {
		event_name = {"CharacterSkillPointAllocated", "CharacterSkillPointDeallocated", "ForceAdoptsStance"},
		-- replenish_factor = 0.05,										-- IV!
		stance = "MILITARY_FORCE_ACTIVE_STANCE_TYPE_SETTLE",			-- IV!
		bundle = "troy_dlc1_hero_campaign_replenishment_spec_settle_hidden",
		skills = {
			{
				id = {"troy_dlc1_hero_campaign_replenishment_spec_settle"},
				id_filter = false,
			},
		},
	},	

	income_raiding_spec_movement = {
		event_name = {"CharacterSkillPointAllocated", "CharacterSkillPointDeallocated", "ForceAdoptsStance"},
		stance = "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID",			-- IV!
		bundle = "effect_bundle_hero_campaign_income_raiding_spec_movement",-- IV!
		skills = {
			{
				id = {"troy_main_hero_campaign_income_raiding_attrition_spec_movement_attrition"},
				id_filter = false,
			},
		},
	},

	razing_spec_influence = {
		event_name = "CharacterRazedSettlement",
		bundle = "effect_bundle_hero_campaign_razing_spec_influence",		-- IV!
		bundle_turns = 5,												-- IV!

		skills = {
			{
				id = {"troy_main_hero_campaign_sacking_razing_spec_damage"},
			},
		},
	},	
	
	razing_spec_citizens = {
		event_name = "CharacterRazedSettlement",
		bundle = "troy_main_hero_campaign_razing_spec_citizens",		-- IV!
		bundle_turns = 5,												-- IV!

		skills = {
			{
				id = {"troy_main_hero_defender_tank_campaign_razing_spec_citizens", "troy_main_hero_fighter_killer_campaign_razing_spec_citizens", "troy_main_hero_warlord_warmonger_campaign_razing_spec_citizens"},
			},
		},
	},	

	self_ranged_attack = {
		event_name = {"CharacterSkillPointAllocated", "CharacterSkillPointDeallocated", "CharacterEntersMilitaryForce"},

		upgrade_table = {
			troy_hero_agamemnon = "troy_hero_agamemnon_ranged" ,
			troy_hero_sarpedon = "troy_hero_sarpedon_ranged" ,
			troy_hero_defender_quick = "troy_hero_defender_quick_ranged" ,
			troy_rem_hero_rhe_defender_quick = "troy_rem_hero_rhe_defender_quick_ranged",
			troy_hero_aeneas ="troy_hero_aeneas_ranged",
		},

		downgrade_table = {
			troy_hero_agamemnon_ranged = "troy_hero_agamemnon",
			troy_hero_sarpedon_ranged = "troy_hero_sarpedon",
			troy_hero_defender_quick_ranged = "troy_hero_defender_quick",
			troy_rem_hero_rhe_defender_quick_ranged = "troy_rem_hero_rhe_defender_quick",
			troy_hero_aeneas_ranged = "troy_hero_aeneas",
		},

		skills = {
			{
				id = {"troy_main_hero_self_ranged_attack"},
				id_filter = false,
			},
		},
	},	

	-- listener structure
	--[[
	placeholder_listener_name = {
		event_name = "placeholder_event_name" | {"placeholder_event_name_01", "placeholder_event_name_02", etc}, 
		skills = {
			{
				id = "placeholder_skill_name" || {"placeholder_skill_name1", "placeholder_skill_name2", "..."},	-- alternative skill names (used when there are multiple skills)
				id_filter = true | false, (if true, callback is no called if skill do not exist in id array; if false -> the callback is responsible for proper filtering)
				callback = function(skill_context, context, event_name)
				{
					--TODO: placeholder function
				}
			},
		},
	},

	--]]
}

---------------------------- CODE IMPLEMENTATION ---------------------------- 

local function output_debug_string(string)
	--out(string)
end

-- utility functions
local function contains(id, element)
	if id == nil or element == nil then return false end

	if is_table(id) then
		for _, id_element in ipairs(id) do 
			if id_element == element then
				return true
			end
		end

		return false
	end

	return id == element
end

local function filter_skill(character, id)
	if id ~= nil then
		if is_table(id) then
			for _, skill_name in ipairs(id) do 
				if character:has_skill(skill_name) then
					return false
				end
			end
		elseif is_string(id) then
			return not character:has_skill(id)
		end
	end

	return true
end


-- callbacks

-- stalk
listeners.stalk.skills[1].callback = function(skill_context, context, event_name)
	local character = context:character()
	local activate_stance = nil;
	if event_name == "CharacterSkillPointAllocated" then
		if not contains(skill_context.id, context:skill_point_spent_on()) then output_debug_string("	-> filtered") return end
		output_debug_string("	-> stalk processing(CharacterSkillPointAllocated)")
		if character:has_military_force() then
			output_debug_string("	-> activating stance (" .. listeners.stalk.stance .. ") to force")
			activate_stance = true
		end
	elseif event_name == "CharacterSkillPointDeallocated" and contains(skill_context.id, context:skill_point_spent_on()) then
		if not character:has_military_force() then output_debug_string("	-> nil army") return end

		output_debug_string("	-> (deallocate) deactivating stance (" .. listeners.stalk.stance .. ") from force")
		activate_stance = false
	else
		-- check if we have this skill
		if filter_skill(character, skill_context.id) then output_debug_string("	-> filtered") return end

		if not character:has_military_force() then output_debug_string("	-> nil army") return end

		output_debug_string("	-> stalk processing" .. "(" .. event_name .. ")")

		if event_name == "CharacterEntersMilitaryForce" then
			output_debug_string("	-> (enter) activating stance (" .. listeners.stalk.stance .. ") to force")
			activate_stance = true
		elseif event_name == "CharacterLeavesMilitaryForce" then
			output_debug_string("	-> (leave) deactivating stance (" .. listeners.stalk.stance .. ") from force")
			activate_stance = false
		end
	end
	if activate_stance ~= nil then
		if not character:has_military_force() then output_debug_string("	-> nil army") return end
		cm:activate_stance_to_force(activate_stance, listeners.stalk.stance, character:military_force():command_queue_index())
	end
end

--post_battle_spec_movement
listeners.post_battle_spec_movement.skills[1].callback = function(skill_context, context)
	output_debug_string("	-> post_battle_spec_movement processing")
	if context:character():won_battle() then
		output_debug_string("	-> replenish action points (" .. listeners.post_battle_spec_movement.action_points_factor .. ")")
		cm:replenish_action_points(cm:char_lookup_str(context:character():command_queue_index()), 0, listeners.post_battle_spec_movement.action_points_factor)
	end
end

--sacking_spec_replenishment
listeners.sacking_spec_replenishment.skills[1].callback = function(skill_context, context)
	output_debug_string("	-> sacking_spec_replenishment processing (" .. listeners.sacking_spec_replenishment.replenish_factor .. ")")
	cm:replenish_units(cm:char_lookup_str(context:character():command_queue_index()), listeners.sacking_spec_replenishment.replenish_factor)
end

--happiness_spec_favour
listeners.happiness_spec_favour.skills[1].callback = function(skill_context, context)
	output_debug_string("	-> happiness_spec_favour processing")

	local character = context:character()
	local faction = character:faction()

	if character:has_garrison_residence() then 
		local garrison_residence = character:garrison_residence()
		local buildings = garrison_residence:buildings()
		for i=0,buildings:num_items()-1 do 
			if not buildings:item_at(i):is_null_interface() then 
				local name = buildings:item_at(i):name()
				if string.find(name,"religion") then
					for _,effect_key in pairs(gods_effects) do 
						if buildings:item_at(i):get_effect_value(effect_key) ~= 0 then
							local target = effect_key
							target = string.gsub(target,"troy_effect_gods_favour_mod_","troy_god_attitude_")
							if faction:has_pooled_resource(target) then
								cm:faction_add_pooled_resource(faction:name(), target, gods_factors.faction, listeners.happiness_spec_favour.favor)
							end
						end
					end
				end
			end
		end
	end
	
end

--happiness_spec_garrison
listeners.happiness_spec_garrison.skills[1].callback = function(skill_context, context, event_name)
	output_debug_string("	-> happiness_spec_garrison (" .. event_name .. ") processing")
	local character = context:character()

	if event_name == "CharacterSkillPointAllocated" then
		--
		if not contains(skill_context.id, context:skill_point_spent_on()) then output_debug_string("	-> filtered") return end

		if character:has_garrison_residence() then 
			output_debug_string("	-> apply effect bundle to character(" .. listeners.happiness_spec_garrison.bundle .. ")")
			cm:apply_effect_bundle_to_character(listeners.happiness_spec_garrison.bundle, character:command_queue_index(), -1)
		end
	else
		if event_name == "CharacterSkillPointDeallocated" and contains(skill_context.id, context:skill_point_spent_on()) then
			output_debug_string("	-> remove effect bundle from character(" .. listeners.happiness_spec_garrison.bundle .. ")")
			cm:remove_effect_bundle_from_character(listeners.happiness_spec_garrison.bundle, character:command_queue_index())
		end

		-- check if we have this skill
		if filter_skill(character, skill_context.id) then output_debug_string("	-> filtered") return end

		if event_name == "CharacterEntersGarrison" then
			output_debug_string("	-> apply effect bundle to character(" .. listeners.happiness_spec_garrison.bundle .. ")")
			cm:apply_effect_bundle_to_character(listeners.happiness_spec_garrison.bundle, character:command_queue_index(), -1)

		elseif event_name == "CharacterLeavesGarrison" then
			output_debug_string("	-> remove effect bundle from character(" .. listeners.happiness_spec_garrison.bundle .. ")")
			cm:remove_effect_bundle_from_character(listeners.happiness_spec_garrison.bundle, character:command_queue_index())
		end
	end

end

--post_battle_spec_favour
--[[listeners.post_battle_spec_favour.skills[1].callback = function(skill_context, context)
	output_debug_string("	-> post_battle_spec_favour processing")
	local character = context:character()
	local faction = character:faction()

	local gods = cm:model():world():god_manager():gods()
	for i = 0, gods:num_items() - 1 do
		if faction:has_pooled_resource(gods:item_at(i):resource_key()) then
			output_debug_string("	-> " .. gods:item_at(i):resource_key() .. ", " .. gods_factors.faction .. ", " .. listeners.post_battle_spec_favour.favor)
			cm:faction_add_pooled_resource(faction:name(), gods:item_at(i):resource_key(), gods_factors.faction, listeners.post_battle_spec_favour.favor)
		end
	end
end]]

--income_raiding_spec_replenishment
listeners.income_raiding_spec_replenishment.skills[1].callback = function(skill_context, context)
	output_debug_string("	-> income_raiding_spec_replenishment processing")
	local character = context:character()

	if character:has_military_force() and character:military_force():active_stance() == listeners.income_raiding_spec_replenishment.stance then
		output_debug_string("	-> replenish units (" .. listeners.income_raiding_spec_replenishment.replenish_factor .. ")")
		cm:replenish_units(cm:char_lookup_str(character:command_queue_index()), listeners.income_raiding_spec_replenishment.replenish_factor)
	end
end

--income_raiding_spec_replenishment_settle
listeners.income_raiding_spec_replenishment_settle.skills[1].callback = function(skill_context, context, event_name)
	output_debug_string("	-> income_raiding_spec_replenishment_settle processing")
	
	local bundle_key = listeners.income_raiding_spec_replenishment_settle.bundle
	local stance_key = listeners.income_raiding_spec_replenishment_settle.stance

	if event_name == "CharacterSkillPointAllocated" or event_name == "CharacterSkillPointDeallocated" then
		local character = context:character()
		if not contains(skill_context.id, context:skill_point_spent_on()) then output_debug_string("	-> filtered") return end

		if character:has_military_force() then
			local military_force = character:military_force()
			local force_cqi = military_force:command_queue_index()

			-- this bundle is only active in encamp stance
			if military_force:active_stance() == stance_key and event_name == "CharacterSkillPointAllocated" then
				output_debug_string("	-> apply effect bundle to force(" .. bundle_key .. ")")
				cm:apply_effect_bundle_to_force(bundle_key, force_cqi, 0)
			elseif event_name == "CharacterSkillPointDeallocated" then
				output_debug_string("	-> remove effect bundle from force(" .. bundle_key .. ")")
				cm:remove_effect_bundle_from_force(bundle_key, force_cqi)
			end
		end
	elseif event_name == "ForceAdoptsStance" then
		local military_force = context:military_force()

		-- check if we have this skill
		if not military_force:has_general() or filter_skill(military_force:general_character(), skill_context.id) then output_debug_string("	-> filtered or has no general") return end

		local force_cqi = military_force:command_queue_index()

		if military_force:active_stance() == stance_key then
			output_debug_string("	-> apply effect bundle to force(" .. bundle_key .. ")")
			cm:apply_effect_bundle_to_force(bundle_key, force_cqi, 0)
		else
			output_debug_string("	-> remove effect bundle from force(" .. bundle_key .. ")")
			cm:remove_effect_bundle_from_force(bundle_key, force_cqi)
		end
	end
end

--income_raiding_spec_movement
listeners.income_raiding_spec_movement.skills[1].callback = function(skill_context, context, event_name)
	output_debug_string("	-> income_raiding_spec_movement processing")

	if event_name == "CharacterSkillPointAllocated" then
		local character = context:character()
		if not contains(skill_context.id, context:skill_point_spent_on()) then  output_debug_string("	-> filtered") return end

		if character:has_military_force() then
			local military_force = character:military_force()
			-- this bundle is only active during raiding
			if military_force:active_stance() == listeners.income_raiding_spec_movement.stance then
				output_debug_string("	-> apply effect bundle to character(" .. listeners.income_raiding_spec_movement.bundle .. ")")
				cm:apply_effect_bundle_to_force(listeners.income_raiding_spec_movement.bundle, military_force:command_queue_index(), 0)
			end
		end
	elseif event_name == "CharacterSkillPointDeallocated" and contains(skill_context.id, context:skill_point_spent_on()) and context:character():has_military_force() then
		local military_force = context:character():military_force()
		
		if military_force:active_stance() == listeners.income_raiding_spec_movement.stance then
			output_debug_string("	-> remove effect bundle from character(" .. listeners.income_raiding_spec_movement.bundle .. ")")
			cm:remove_effect_bundle_from_force(listeners.income_raiding_spec_movement.bundle, military_force:command_queue_index())
		end
	elseif event_name == "ForceAdoptsStance" then
		local military_force = context:military_force()

		-- check if we have this skill
		if not military_force:has_general() or filter_skill(military_force:general_character(), skill_context.id) then output_debug_string("	-> filtered or has no general") return end

		local force_cqi = military_force:command_queue_index()

		if military_force:active_stance() == listeners.income_raiding_spec_movement.stance then
			output_debug_string("	-> apply effect bundle to character(" .. listeners.income_raiding_spec_movement.bundle .. ")")
			cm:apply_effect_bundle_to_force(listeners.income_raiding_spec_movement.bundle, force_cqi, 0)
			-- cm:replenish_action_points("character_cqi:" .. tostring(force_cqi),0.25,0)
		else
			output_debug_string("	-> remove effect bundle from character(" .. listeners.income_raiding_spec_movement.bundle .. ")")
			cm:remove_effect_bundle_from_force(listeners.income_raiding_spec_movement.bundle, force_cqi)
		end
	end
end


--razing_spec_influence
listeners.razing_spec_influence.skills[1].callback = function(skill_context, context, event_name)
	output_debug_string("	-> razing_spec_influence processing; apply effect bundle to character(" .. listeners.razing_spec_influence.bundle .. ", " .. listeners.razing_spec_influence.bundle_turns .. ")")
	cm:apply_effect_bundle_to_character(listeners.razing_spec_influence.bundle, context:character():command_queue_index(), listeners.razing_spec_influence.bundle_turns)
end

--razing_spec_citizens
listeners.razing_spec_citizens.skills[1].callback = function(skill_context, context, event_name)
	output_debug_string("	-> razing_spec_citizens processing; apply effect bundle to character(" .. listeners.razing_spec_citizens.bundle .. ", " .. listeners.razing_spec_citizens.bundle_turns .. ")")
	cm:apply_effect_bundle_to_character(listeners.razing_spec_citizens.bundle, context:character():command_queue_index(), listeners.razing_spec_citizens.bundle_turns)
end


-- self_ranged_attack
listeners.self_ranged_attack.skills[1].callback = function(skill_context, context, event_name)
	local character = context:character()

	if event_name == "CharacterSkillPointAllocated" or event_name == "CharacterSkillPointDeallocated" then
		if not contains(skill_context.id, context:skill_point_spent_on()) then return end
	elseif event_name == "CharacterEntersMilitaryForce" and filter_skill(character, skill_context.id) then
		return
	end

	output_debug_string("	-> self_ranged_attack processing")

	local upgrade_table = listeners.self_ranged_attack.upgrade_table
	if event_name == "CharacterSkillPointDeallocated" then
		upgrade_table = listeners.self_ranged_attack.downgrade_table
	end

	if character:has_military_force() then
		local military_force = character:military_force()
		local unit_list = military_force:unit_list()

		for i = 0, unit_list:num_items() - 1 do 
			local unit = unit_list:item_at(i)
			local key = unit:unit_key()
			local upgrade = key and upgrade_table[key]
			if upgrade ~= nil then
				output_debug_string("	-> upgrading unit (" .. i .. ") [" .. key .. " -> " .. upgrade .. "]")
				cm:upgrade_unit(unit:command_queue_index(), upgrade)
			end
		end
	end
end


-- Init function
function CharacterSkillsScriptedEffectsInit()
	output_debug_string("CharacterSkillsScriptedEffectsInit")

	for listener_name, listener_data in pairs(listeners) do

		-- register listeners

		-- event_name could be either string or array
		local event_names = { listener_data.event_name }
		if is_table(listener_data.event_name) then 
			event_names = listener_data.event_name 
		end

		--
		for event_index, event_name in ipairs(event_names) do
			output_debug_string("CharacterSkillsScriptedEffects: adding listener: " .. listener_name .. ": " .. event_name .. "[".. event_index .. "]")

			core:add_listener(
				listener_name,
				event_name,
				true,
				function(context)
					local character = context.character and context:character()

					output_debug_string("CharacterSkillsScriptedEffects: triggering event: " .. listener_name .. ": " .. event_name .. "[".. event_index .. "]")

					for index, skill_data in ipairs(listener_data.skills) do
						output_debug_string("	-> skill #" .. index)

						local filter = false
						if skill_data.id_filter == nil or skill_data.id_filter == true then
							filter = filter_skill(character, skill_data.id)
						end

						if not filter then
							output_debug_string("	-> not filtered")

							-- invoke callback
							if skill_data.callback ~= nil and is_function(skill_data.callback) then
								output_debug_string("	-> invoking callback")
								skill_data:callback(context, event_name)
							end
						else
							output_debug_string("	-> filtered")
						end
					end
				end,
				true
			)
		end
	end
end