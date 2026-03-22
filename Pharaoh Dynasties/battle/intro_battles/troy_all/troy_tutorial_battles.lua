tutorial_battles = {
	BASIC = {
		loading_screen = "troy_main_intro_battle_1_quote_1",
		xml_path = "script/battle/intro_battles/troy_all/basic/basic_battle.xml",
		button_id = "tutorial_battle_1",
		button_listener_id = "tutorial_battle_1_ButtonClicked",
		confirmation_loc_key = "random_localisation_strings_string_troy_tutorial_menu_battle_confirmation_string"
	},
	ADVANCED = {
		loading_screen = "troy_main_intro_battle_2_quote_1",
		xml_path = "script/battle/intro_battles/troy_all/advanced/advanced_battle.xml",
		button_id = "tutorial_battle_2",
		button_listener_id = "tutorial_battle_2_ButtonClicked",
		confirmation_loc_key = "random_localisation_strings_string_troy_tutorial_menu_battle_confirmation_string"
	}
}

tutorial_battles_methods = {
	get_button = function(self)
		local tutorial_menu = core:get_ui_root():SequentialFind("options_tutorial_menu")
		return tutorial_menu:SequentialFind(self.button_id)
	end,

	enable_button = function(self, should_enable)
		local button = self:get_button()
		if button then
			button:SetState(should_enable and "active" or "inactive")
		end
	end,

	is_button_enabled = function(self)
		local button = self:get_button()

		if button then
			return button:CurrentState() ~= "inactive"
		end

		return false
	end
}

tutorial_battles_methods.__index = tutorial_battles_methods
for _, battle in pairs(tutorial_battles) do
	setmetatable(battle, tutorial_battles_methods)
end

function enable_tutorial_battles_buttons(should_enable)
	for _, b in pairs(tutorial_battles) do
		b:enable_button(should_enable)
	end
end

core:add_listener(
	"DisableTutorialBattlesOnTutorialMenuOpened",
	"TutorialMenuOpened",
	function(context) 
		return context.is_opening and core:is_campaign() 
	end,
	function(context)
		core:remove_listener("RestoreTutorialBattlesOnTutorialMenuClosed") -- clean up just in case

		local uim = cm:get_campaign_ui_manager()

		if uim:is_panel_open("popup_pre_battle") or uim:is_panel_open("popup_battle_results") or not cm:is_local_players_turn() then
			local should_enable_basic_battle = tutorial_battles.BASIC:is_button_enabled()
			local should_enable_advanced_battle = tutorial_battles.ADVANCED:is_button_enabled()

			core:add_listener(
				"RestoreTutorialBattlesOnTutorialMenuClosed",
				"TutorialMenuOpened",
				function(context_restore)
					return not context_restore.is_opening and core:is_campaign()
				end,
				function(context_restore)
					if should_enable_basic_battle then
						tutorial_battles.BASIC:enable_button(true)
					end

					if should_enable_advanced_battle then
						tutorial_battles.ADVANCED:enable_button(true)
					end
				end,
				false
			)

			enable_tutorial_battles_buttons(false)
		end
	end,
	true
)