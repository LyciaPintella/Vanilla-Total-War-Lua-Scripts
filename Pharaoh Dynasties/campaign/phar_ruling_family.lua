out("Loading phar_ruling_family.lua")

ruling_family = {
	effect_bundles = {
		heir_changed = {
			character = {
				old_heir_bundle = {
					key = "phar_comb_effect_bundle_dynasty_scion_passed_up", -- applied to character if he was an heir and new heir is appointed. Removed if appointed again.
					duration = 10
				},

				new_heir_bundle = {
					key = "phar_map_dynasty_effect_bundle_scion",
					duration = 0
				},
			},

			faction = {

			},
		},

		leader_changed = {
			character = {
				new_leader_bundle = {
					key = "phar_map_dynasty_effect_bundle_faction_leader",
					duration = 0
				},
			},

			faction = {
				heir_was_not_ruling_relative_bundle = {
					key = "phar_comb_effect_bundle_dynasty_troubled_inheritence", -- Design name: Troubled Inheritance
					duration = 10
				},
				automatic_faction_leader_chosen = {
					key = "phar_comb_effect_bundle_dynasty_illegitimate_inheritence", -- Design name: Illegitimate Inheritance
					duration = 10
				},
				no_valid_faction_leader_found = {
					key = "phar_comb_effect_bundle_dynasty_inheritence_crisis", -- Design name: Inheritance Crisis
					duration = 10
				},
			},
		},

		relative_characters = {
			key = "phar_map_dynasty_effect_bundle_relative"
		},
	},

	ai = {
		arrange_marriage_to_a_commoner = {
			required_age = 30,
			cooldown_after_divorce = 10,
			cost_record = "phar_map_arranged_marriage_to_a_commoner_cost",
			ignore_cost = false -- if this is true, the action will not cost any resources for the AI
		}
	}
}

-- Return CHARACTER_SCRIPT_INTERFACE when passing CHARACTER_SCRIPT_INTERFACE, CHARACTER_DETAILS_SCRIPT_INTERFACE, FAMILY_MEMBER_SCRIPT_INTERFACE or nil otherwise (including for NULL_SCRIPT_INTERFACE)
function ruling_family:to_character(object)
	if is_character(object) then
		return object
	end

	if is_character_details(object) or is_familymember(object) then
		return object:character()
	end

	return nil
end


function ruling_family.effect_bundles.relative_characters:is_eligible(character)
	if not is_character(character) then
		return false
	end

	local details = character:character_details()
	return character:faction():is_human() and
		(details:is_male() or character:is_faction_leader()) and
		not details:is_civilian() and
		details:family_member():is_in_faction_leaders_family()
end

function ruling_family.effect_bundles.relative_characters:apply(character)
	if not is_character(character) then
		return
	end

	if not character:has_effect_bundle(self.key) then
		cm:apply_effect_bundle_to_character(self.key, character:command_queue_index(), 0)
	end
end

function ruling_family.effect_bundles.relative_characters:startpos_init()
	local human_factions = cm:get_human_factions()
	for i = 1, #human_factions do
		local faction = cm:get_faction(human_factions[i])

		local characters = faction:character_list()
		for j = 0, characters:num_items() - 1 do
			if self:is_eligible(characters:item_at(j)) then
				self:apply(characters:item_at(j))
			end
		end
	end
end

function ruling_family.effect_bundles.heir_changed:apply_bundles(new_heir, old_heir)
	if is_character(new_heir) then
		local cqi = new_heir:command_queue_index()
		cm:apply_effect_bundle_to_character(self.character.new_heir_bundle.key, cqi, self.character.new_heir_bundle.duration)
	end

	if is_character(old_heir) then
		local cqi = old_heir:command_queue_index()
		cm:apply_effect_bundle_to_character(self.character.old_heir_bundle.key, cqi, self.character.old_heir_bundle.duration)
	end
end

function ruling_family.effect_bundles.heir_changed:remove_bundles(character)
	if is_character(character) then
		local cqi = character:command_queue_index()
		cm:remove_effect_bundle_from_character(self.character.new_heir_bundle.key, cqi)
		cm:remove_effect_bundle_from_character(self.character.old_heir_bundle.key, cqi)
	end
end

function ruling_family.effect_bundles.heir_changed:startpos_init()
	local factions = cm:model():world():faction_list()
	for i = 0, factions:num_items() - 1 do
		ruling_family.effect_bundles.heir_changed:apply_bundles(ruling_family:to_character(factions:item_at(i):faction_heir()), nil)
	end
end

function ruling_family.effect_bundles.leader_changed:apply(leader, is_relative_to_old_leader, leader_origin)
	if not is_character(leader) then
		return
	end

	if is_relative_to_old_leader == nil then
		is_relative_to_old_leader = true
	end

	local faction_name = leader:faction():name()
	local apply_faction_bundle = function(bundle) if bundle.key then cm:apply_effect_bundle(bundle.key, faction_name, bundle.duration) end end

	if not is_relative_to_old_leader then
		apply_faction_bundle(self.faction.heir_was_not_ruling_relative_bundle)
	end

	if leader_origin == "automatic" then -- there was no heir assigned
		apply_faction_bundle(self.faction.automatic_faction_leader_chosen)
	elseif leader_origin == "emergency" then -- no heir and no valid candidates
		apply_faction_bundle(self.faction.no_valid_faction_leader_found)			
	end

	local cqi = leader:command_queue_index()
	cm:apply_effect_bundle_to_character(self.character.new_leader_bundle.key, cqi, self.character.new_leader_bundle.duration)
end

function ruling_family.effect_bundles.leader_changed:startpos_init()
	local factions = cm:model():world():faction_list()
	for i = 0, factions:num_items() - 1 do
		ruling_family.effect_bundles.leader_changed:apply(factions:item_at(i):faction_leader())
	end
end

core:add_listener(
	"phar_ruling_relative_FactionHeirChanged",
	"FactionHeirChanged",
	true,
	function(context)
		local new_heir = ruling_family:to_character(context:new_heir())
		local old_heir = ruling_family:to_character(context:old_heir())
		ruling_family.effect_bundles.heir_changed:remove_bundles(new_heir)
		ruling_family.effect_bundles.heir_changed:remove_bundles(old_heir)
		ruling_family.effect_bundles.heir_changed:apply_bundles(new_heir, old_heir)
	end,
	true
)

core:add_listener(
	"phar_ruling_relative_CharacterBecomesFactionLeader",
	"CharacterBecomesFactionLeader",
	true,
	function(context)
		ruling_family.effect_bundles.heir_changed:remove_bundles(context:character())

		ruling_family.effect_bundles.leader_changed:apply(context:character(), context:is_ruling_relative(), context:leader_origin())
	end,
	true
)

core:add_listener(
	"phar_ruling_family_ai_marriage_CharacterTurnStart",
	"CharacterTurnStart",
	function(context)
		local faction = context:character():faction()
		if faction:is_human() or faction:is_rebel() then
			return false
		end

		if not context:character():character_type("general") then
			return false
		end

		local fm = context:character():family_member()
		if fm:character_details():age() < ruling_family.ai.arrange_marriage_to_a_commoner.required_age then
			return false
		end

		local current_turn = cm:model():turn_number()
		if fm:has_spouse() or 
			fm:turn_of_last_divorce() ~= 0 and fm:turn_of_last_divorce() + ruling_family.ai.arrange_marriage_to_a_commoner.cooldown_after_divorce < current_turn
		then
			return false
		end

		if not fm:is_in_faction_leaders_family() then
			return false
		end

		if ruling_family.ai.arrange_marriage_to_a_commoner.ignore_cost then
			return true
		end

		local cost_obj = cm:create_new_custom_resource_cost()
		cost_obj:get_cost_from_record(ruling_family.ai.arrange_marriage_to_a_commoner.cost_record)

		return faction:can_afford_resource_cost_object(cost_obj)
	end,
	function(context)
		cm:arrange_marriage_to_new_random_character(cm:char_lookup_str(context:character()), not ruling_family.ai.arrange_marriage_to_a_commoner.ignore_cost)
	end,
	true
)

core:add_listener(
	"phar_ruling_family_FirstTickAfterNewCampaignStarted",
	"FirstTickAfterNewCampaignStarted",
	true,
	function(context)
		local dynasty_to_legitimacy_object = {
			["phar_legitimacy"] = egypt_legitimacy,
			["phar_hatti_legitimacy"] = hatti_legitimacy,
			["phar_map_aegean_legitimacy"] = aegean_legitimacy,
			["phar_map_mesopotamian_legitimacy"] = meso_legitimacy,
		}

		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local faction = faction_list:item_at(i)

			if faction:has_dynasty() then
				local faction_name = faction:name()
				local dynasty_line_key = faction:dynasty_line_key()
				local legitimacy_object = dynasty_to_legitimacy_object[dynasty_line_key]
				legitimacy_choice:unlock_legitimacy(legitimacy_object, faction_name, true)
			end
		end

		ruling_family.effect_bundles.relative_characters:startpos_init()
		ruling_family.effect_bundles.heir_changed:startpos_init()
		ruling_family.effect_bundles.leader_changed:startpos_init()
	end,
	true
)

core:add_listener(
	"phar_ruling_family_CharacterCreated",
	"CharacterCreated",
	function(context)
		return ruling_family.effect_bundles.relative_characters:is_eligible(context:character())
	end,
	function(context)
		ruling_family.effect_bundles.relative_characters:apply(context:character())
	end,
	true
)