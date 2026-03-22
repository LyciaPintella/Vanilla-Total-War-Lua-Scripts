sea_peoples_prebattle_options = {
	config = {
		activation_display_settings = 
		{
			activation_layout = "UI/Campaign UI/sea_announcement_popup",
			-- time before we destroy the component
			layout_exist_duration_seconds = 5,
			-- when there is a display active and we want to show another - we wait this amount of seconds before retrying
			layout_retry_seconds = 1,
			-- all the items below are components in the activation_layout
			icon_component = "dy_icon",
			title_component = "dy_title",
			text_component = "dy_text",
		},
		-- Configuration data for the pre-battle options. Most settings overlap. Each option is faction-specific and requires a specific title.
		-- When the player selects the option, success/failure is determined randomly according to the following formula:
		-- (success probability in %) = 50 + (player character's score) - (other character's score)
		-- (player character's score) = (authority) + (zeal) + (score for the option-specific title)
		-- (other character's score)  = (authority) + (zeal) + (subterfuge) + (title score if this character also has the title)
		-- NOTE: The player's character must have the title in order to use the option in the first place.
		options = {
			--  option_id = {
			--     faction_key    - faction for which the option is available
			--     title          - the key of the title required to use the option
			--     title_score    - how many % does having the title add to a character's score
			--     failure_bundle - an effect bundle applied to the player's force for this battle on failure
			--     button         - id of the button for this option in the pre/post-battle layout
			--     ...            - option-specific parameters
			-- }
			false_attack = {
				faction_key = "phar_sea_sherden",
				title = "phar_sea_title_3", -- First Blade
				title_score = 15,
				failure_bundle = "phar_sea_pre_battle_options_false_attack_failure",
				button = "button_false_attack",
				display_chance = true,
				ui_title = "hp_title_pre_battle_option_false_attack",
				ui_text = "phar_sea_shr_battle_false_attack",
				ui_flavor = "phar_sea_shr_battle_false_attack_flavour",
				ui_action = "phar_sea_eminence_battle_action",
				ui_chance = "phar_sea_battle_combat_percentile",
				ui_blocker_missing_title = "phar_sea_shr_battle_false_attack_blocker_1",
				ui_blocker_already_used = "phar_sea_shr_battle_false_attack_blocker_2",
				ui_blocker_target_cannot_retreat = "phar_sea_shr_battle_false_attack_blocker_3",
				ui_blocker_not_available_siege = "phar_sea_false_attack_blocker_siege",
				ui_blocker_not_available_reinforce = "phar_sea_shr_battle_false_attack_blocker_reinforce",
				activation_setup = 
				{
					icon = "UI/skins/default/pre_battle_post_battle/icon_sea_false_attack.png",
					title = "ui_text_replacements_localised_text_hp_title_pre_battle_option_false_attack",
					text_success = "ui_text_replacements_localised_text_phar_sea_false_attack_success_text",
					text_failure = "ui_text_replacements_localised_text_phar_sea_false_attack_failed_text",
				},
				-- this is shown when this is used against you in MP
				reverse_activation_setup = 
				{
					icon = "UI/skins/default/pre_battle_post_battle/icon_sea_false_attack.png",
					title = "ui_text_replacements_localised_text_hp_title_pre_battle_option_false_attack",
					text_success = "ui_text_replacements_localised_text_phar_sea_false_attack_enemy_success_text",
					text_failure = "ui_text_replacements_localised_text_phar_sea_false_attack_enemy_failed_text",
				},
			},
			single_combat = {
				faction_key = "phar_sea_peleset",
				title = "phar_sea_title_16", -- Single Combat Champion
				title_score = 15,
				failure_bundle = "phar_sea_pre_battle_options_failure",
				button = "button_single_combat",

				failure_hp_percentage_lost = 15,

				display_chance = true,
				ui_title = "hp_title_pre_battle_option_single_combat",
				ui_text = "phar_sea_pel_battle_single_combat",
				ui_flavor = "phar_sea_pel_battle_single_combat_flavour",
				ui_action = "phar_sea_eminence_battle_action",
				ui_chance = "phar_sea_battle_combat_percentile",
				ui_blocker_missing_title = "phar_sea_pel_battle_single_combat_blocker_1",
				ui_blocker_already_used = "phar_sea_pel_battle_single_combat_blocker_2",
				ui_blocker_target_army_too_small = "phar_sea_pel_battle_single_combat_blocker_4",
				ui_blocker_not_available_reinforce = "phar_sea_pel_single_combat_blocker_reinforce",
				activation_setup = 
				{
					icon = "UI/skins/default/pre_battle_post_battle/icon_sea_single_combat.png",
					title = "ui_text_replacements_localised_text_hp_title_pre_battle_option_single_combat",
					text_success = "ui_text_replacements_localised_text_phar_sea_single_combat_success_text",
					text_failure = "ui_text_replacements_localised_text_phar_sea_single_combat_failed_text",
				},
				-- this is shown when this is used against you in MP
				reverse_activation_setup = 
				{
					icon = "UI/skins/default/pre_battle_post_battle/icon_sea_single_combat.png",
					title = "ui_text_replacements_localised_text_hp_title_pre_battle_option_single_combat",
					text_success = "ui_text_replacements_localised_text_phar_sea_single_combat_enemy_success_text",
					text_failure = "ui_text_replacements_localised_text_phar_sea_single_combat_success_text",
				},
			}
		}
	},
}


-- These are used to store and query the list of CQIs of characters a pre-battle action has already been
-- attempted against at the current turn. Stored as "|CQI1|CQI2|...|" to avoid corner cases when querying.
function sea_peoples_prebattle_options:add_cqi_to_list(list_as_string, cqi)
	return (list_as_string and list_as_string ~= "") and (list_as_string .. tostring(cqi) .. "|") or ("|" .. tostring(cqi) .. "|")
end

function sea_peoples_prebattle_options:list_contains_cqi(list_as_string, cqi)
	return list_as_string and string.find(list_as_string, "|" .. tostring(cqi) .. "|") ~= nil
end


function sea_peoples_prebattle_options:get_player_and_other_character(local_faction)
	local pending_battle = cm:model():pending_battle()

	local attacker = pending_battle:attacker()
	local defender = pending_battle:defender()

	if attacker:is_null_interface() or defender:is_null_interface() then
		return nil, nil
	end

	local is_player_reinforcement = false
	local player_character, is_from_attacking_side = cm:get_pending_battle_general_for_faction(local_faction, false)

	if not player_character then
		player_character, is_from_attacking_side = cm:get_pending_battle_general_for_faction(local_faction, true)
		is_player_reinforcement = true
	end
	 
	local other_character = is_from_attacking_side and defender or attacker

	return player_character, other_character, is_player_reinforcement

end


function sea_peoples_prebattle_options:handle_popup_pre_battle_open(component)
	local local_faction = cm:get_local_faction(true)
	local pending_battle = cm:model():pending_battle()

	local player_character, other_character, is_player_reinforcement = self:get_player_and_other_character(local_faction)
	local is_opponent_human = other_character:faction():is_human()
	if not player_character or is_opponent_human then
		-- this can happen in MP if the game settings allow one player to fight on the side of the AI vs the other player
		return 
	end
	-- Determine which Sea Peoples' pre-battle options are visible and enabled. The buttons are always visible to the correct faction
	-- and enabled if the other prerequisites are met (having the respective title, not having used the option for this battle)
	for option_key, option_data in pairs(sea_peoples_prebattle_options.config.options) do
		local button = find_uicomponent(component, option_data.button)
		if local_faction:name() == option_data.faction_key then
			local character_has_title = player_character:has_ancillary_equipped(option_data.title)

			local option_already_used = self:list_contains_cqi(cm:get_string_script_state(player_character, "used_prebattle_option_" .. option_key), other_character:military_force():command_queue_index())
			local false_attack_target_cannot_retreat = option_key == "false_attack" and not other_character:allowed_to_flee_from_battle() -- An additional check for False Attack
			local not_available_siege = option_key == "false_attack" and pending_battle:siege_battle()
			local single_combat_target_army_too_small = option_key == "single_combat" and other_character:military_force():unit_list():num_items() <= 1
			local option_is_available = character_has_title 
				and not option_already_used 
				and not false_attack_target_cannot_retreat
				and not not_available_siege
				and not single_combat_target_army_too_small
				and not is_player_reinforcement

			button:SetVisible(true)
			button:SetState(option_is_available and "active" or "inactive")

			local cco_table = {}
			cco_table.DisplayName = get_localised_text_replacement(option_data.ui_title)
			cco_table.Text = get_localised_random_string(option_data.ui_text)
			cco_table.Flavor = get_localised_random_string(option_data.ui_flavor)
			if option_data.display_chance and option_is_available then
				local player_character_winning_chance = sea_peoples_prebattle_options:calculate_chance(player_character, other_character, self.config.options.single_combat)
				local localized_chance = get_localised_random_string(option_data.ui_chance)
				local formatted_chance = common.string_safe_format(localized_chance, player_character_winning_chance)
				cco_table.Alert = formatted_chance
			end

			if option_is_available then
				cco_table.Action = get_localised_random_string(option_data.ui_action)
			else
				local warning = ""
				if not character_has_title then
					warning = append_with_newline(warning, get_localised_random_string(option_data.ui_blocker_missing_title))
				end

				if option_already_used then
					warning = append_with_newline(warning, get_localised_random_string(option_data.ui_blocker_already_used))
				end

				if false_attack_target_cannot_retreat then
					warning = append_with_newline(warning, get_localised_random_string(option_data.ui_blocker_target_cannot_retreat))
				end

				if single_combat_target_army_too_small then
					warning = append_with_newline(warning, get_localised_random_string(option_data.ui_blocker_target_army_too_small))
				end

				if not_available_siege then
					warning = append_with_newline(warning, get_localised_random_string(option_data.ui_blocker_not_available_siege))
				end

				if is_player_reinforcement then
					warning = append_with_newline(warning, get_localised_random_string(option_data.ui_blocker_not_available_reinforce))
				end

				cco_table.Warning = warning -- "put reasons why you can't use it here" --get_localised_random_string(option_data.ui_flavor)
			end
			local script_id = option_data.button .. "_script_id"
			button:SetProperty("script_id", script_id)
			common.set_context_value(script_id, cco_table)
		else
			button:SetVisible(false)
			button:SetState("inactive")
		end
	end
end

-- Determines if player_character's attempt to use the given option is successful.
function sea_peoples_prebattle_options:calculate_chance(player_character, other_character, option_data)
	local player_character_score =
		player_character:attribute_level("authority") +
		player_character:attribute_level("zeal") +
		(player_character:has_ancillary(option_data.title) and option_data.title_score or 0)
	local other_character_score =
		other_character:attribute_level("authority") +
		other_character:attribute_level("zeal") +
		other_character:attribute_level("subterfuge") +
		(other_character:has_ancillary(option_data.title) and option_data.title_score or 0)
	local player_character_winning_chance = player_character_score - other_character_score + 50
	return math.clamp(player_character_winning_chance, 0, 100)
end

-- Determines if player_character's attempt to use the given option is successful.
function sea_peoples_prebattle_options:calculate_result(player_character, other_character, option_data)
	local player_character_winning_chance = sea_peoples_prebattle_options:calculate_chance(player_character, other_character, option_data)
	local player_succeeded = cm:model():random_percent(player_character_winning_chance)
	--out("Chance to succeed = " .. tostring(player_character_score) .. " - " .. tostring(other_character_score) .. " + 50 = " .. tostring(player_character_winning_chance))
	--out("Succeeded: " .. tostring(player_succeeded))
	return player_succeeded
end


function sea_peoples_prebattle_options:perform_single_combat(faction_cqi)
	local faction = cm:model():faction_for_command_queue_index(faction_cqi)
	if not faction then
		return
	end
	local player_character, other_character = self:get_player_and_other_character(faction)

	if not (player_character and other_character) then
		return
	end
	
	local is_successful = sea_peoples_prebattle_options:calculate_result(player_character, other_character, self.config.options.single_combat)

	local usage_log = cm:get_string_script_state(player_character, "used_prebattle_option_single_combat")
	usage_log = self:add_cqi_to_list(usage_log, other_character:military_force():command_queue_index())
	cm:set_script_state(player_character, "used_prebattle_option_single_combat", usage_log)

	-- we need to setup the UI annoucement before we kill the character, as the character script interface could be invalid
	if cm:get_campaign_ui_manager():is_panel_open("popup_pre_battle") then
		local acting_character_state = "default"
		local target_character_state = "default"
	
		if is_successful then
			if other_character:is_immortal() then
				target_character_state = "disabled"
			else
				target_character_state = "wounded"
			end
		else
			-- TODO: put the proper state for when the character loses single combat - they are neither wounded nor disabled, but not fully healthy either
			-- acting_character_state = "disabled"
		end

		if cm:get_campaign_ui_manager():is_panel_open("popup_pre_battle") then
			local display_setup = nil
			local local_faction_name = cm:get_local_faction_name(true)
			if local_faction_name == faction:name() then
				display_setup = self.config.options.single_combat.activation_setup
			elseif local_faction_name == other_character:faction():name() then
				display_setup = self.config.options.single_combat.reverse_activation_setup
			end
			if display_setup then
				campaign_anouncement:display_announcement(display_setup, is_successful, 
					player_character, other_character,
					acting_character_state, target_character_state)
			end
		end

		sea_peoples_prebattle_options:handle_popup_pre_battle_open(core:get_ui_root())
	end

	if is_successful then
		local military_force = other_character:military_force()
		-- On success, kill/wound the other general but leave their army intact.
		local character_lookup_string = "character_cqi:" .. other_character:command_queue_index()
		cm:kill_character(character_lookup_string, false)

		local new_commander = military_force:general_character()
		if new_commander:allowed_to_flee_from_battle() then
			local pending_battle = cm:model():pending_battle()
			local defender_cqi = pending_battle:defender():command_queue_index()
			local new_commander_cqi = new_commander:command_queue_index()
			-- if the battle is a siege and the defender are besieged they can't retreat, so we check when this is false
			if not (pending_battle:siege_battle() and defender_cqi == new_commander_cqi) then
				cm:force_retreat_from_pending_battle(new_commander)
				cm:zero_action_points(cm:char_lookup_str(new_commander_cqi))
			end
		end

		cm:notify_single_combat_used(faction_cqi, true)
	elseif is_successful ~= nil then
		-- On failure, apply the specified debuff for the option on the player's army and damage the general's unit for the specified % HP.
		cm:apply_effect_bundle_to_characters_force(self.config.options.single_combat.failure_bundle, player_character:command_queue_index(), 0)
		local player_bodyguard_unit = player_character:military_force():unit_list():item_at(0)
		local new_bodyguard_hp = player_bodyguard_unit:num_soldiers_or_hitpoints() * (100 - self.config.options.single_combat.failure_hp_percentage_lost) / 100.0
		cm:set_unit_soldiers_or_hitpoints(player_bodyguard_unit, new_bodyguard_hp)
		cm:notify_single_combat_used(faction_cqi, false)
	end

	if cm:get_campaign_ui_manager():is_panel_open("popup_pre_battle") then
		sea_peoples_prebattle_options:handle_popup_pre_battle_open(core:get_ui_root())
	end
end


function sea_peoples_prebattle_options:perform_false_attack(faction_cqi)
	local faction = cm:model():faction_for_command_queue_index(faction_cqi)
	if not faction then
		return
	end
	local player_character, other_character = self:get_player_and_other_character(faction)

	if not (player_character and other_character) then
		return
	end
	
	local is_successful = sea_peoples_prebattle_options:calculate_result(player_character, other_character, self.config.options.false_attack)

	local usage_log = cm:get_string_script_state(player_character, "used_prebattle_option_false_attack")
	usage_log = self:add_cqi_to_list(usage_log, other_character:military_force():command_queue_index())
	cm:set_script_state(player_character, "used_prebattle_option_false_attack", usage_log)

	if is_successful then
		-- On success, force the other army to retreat.
		cm:force_retreat_from_pending_battle(other_character)
		cm:zero_action_points(cm:char_lookup_str(other_character))
		cm:notify_false_attack_used(faction_cqi, true)
	elseif is_successful ~= nil then
		-- On failure, apply the specified debuff for the option on the player's army.
		cm:apply_effect_bundle_to_characters_force(self.config.options.false_attack.failure_bundle, player_character:command_queue_index(), 0)
		cm:notify_false_attack_used(faction_cqi, false)
	end

	if cm:get_campaign_ui_manager():is_panel_open("popup_pre_battle") then
		local display_setup = nil
		local local_faction_name = cm:get_local_faction_name(true)
		if local_faction_name == faction:name() then
			display_setup = self.config.options.false_attack.activation_setup
		elseif local_faction_name == other_character:faction():name() then
			display_setup = self.config.options.false_attack.reverse_activation_setup
		end
		if display_setup then
			campaign_anouncement:display_announcement(display_setup, is_successful, 
				player_character, other_character)
		end

		sea_peoples_prebattle_options:handle_popup_pre_battle_open(core:get_ui_root())
	end
end

function sea_peoples_prebattle_options:cleanup_character_and_force(character)
	cm:remove_effect_bundle_from_characters_force(self.config.options.single_combat.failure_bundle, character:command_queue_index())
	cm:remove_effect_bundle_from_characters_force(self.config.options.false_attack.failure_bundle, character:command_queue_index())
end


function sea_peoples_prebattle_options:cleanup_after_battle(pending_battle)
	-- Called after a battle finishes. Remove any instances of the temporary effect bundles and script states applied before the battle.
	if pending_battle:has_attacker() then
		self:cleanup_character_and_force(pending_battle:attacker())
	end
	if pending_battle:has_defender() then
		self:cleanup_character_and_force(pending_battle:defender())
	end
end


-- On panel opened
core:add_listener(
	"SeaPeoples_PreBattleOptions_PanelOpenedCampaign",
	"PanelOpenedCampaign",
	function(context) 
		return cm.game_is_running and context.string == "popup_pre_battle"
	end,
	function(context)
		local component = UIComponent(context.component)
		sea_peoples_prebattle_options:handle_popup_pre_battle_open(component)
	end,
	true
)


-- On first tick, update any open pre-battle panel (for pre-battle save files).
core:add_listener(
	"SeaPeoples_PreBattleOptions_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		if cm:get_campaign_ui_manager():is_panel_open("popup_pre_battle") then
			sea_peoples_prebattle_options:handle_popup_pre_battle_open(core:get_ui_root())
		end
	end,
	true
)


sea_peoples_prebattle_options.prebattle_triggers = {
	SeaPeoples_PreBattle_SingleCombat = sea_peoples_prebattle_options.perform_single_combat,
	SeaPeoples_PreBattle_FalseAttack = sea_peoples_prebattle_options.perform_false_attack,
}


core:add_listener(
	"SeaPeoples_PreBattleOptions_UITriggerScriptEvent",
	"UITriggerScriptEvent",
	function(context) return sea_peoples_prebattle_options.prebattle_triggers[context:trigger()] ~= nil end,
	function(context) return sea_peoples_prebattle_options.prebattle_triggers[context:trigger()](sea_peoples_prebattle_options, context:faction_cqi()) end,
	true
)


core:add_listener(
	"SeaPeoples_PreBattleOptions_BattleConflictFinished",
	"BattleConflictFinished",
	true,
	function(context)
		sea_peoples_prebattle_options:cleanup_after_battle(context:pending_battle())
	end,
	true
)


core:add_listener(
	"SeaPeoples_PreBattleOptions_CharacterWithdrewFromBattle",
	"CharacterWithdrewFromBattle",
	true,
	function(context)
		sea_peoples_prebattle_options:cleanup_character_and_force(context:character())
	end,
	true
)


core:add_listener(
	"SeaPeoples_PreBattleOptions_CharacterTurnStart",
	"CharacterTurnStart",
	function(context)
		return context:character():has_military_force()
	end,
	function(context)
		-- At the start of a character's turn, forget their targets for false attack/single combat
		-- from the previous turn so that they can try again.
		local character = context:character()
		cm:remove_script_state(character, "used_prebattle_option_single_combat")
		cm:remove_script_state(character, "used_prebattle_option_false_attack")
	end,
	true
)