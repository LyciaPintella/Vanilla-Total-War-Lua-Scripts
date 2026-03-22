out("Loading faction_mechanics_ui.lua")

function setup_faction_mechanics_ui()
	local local_faction = cm:get_local_faction_name(true)
	local faction_button_names = {}
	local faction_mythic_button_names = {}

	-- Set the faction mechanics containers.
	local faction_buttons = faction_mechanics_buttons[local_faction]
	if faction_mechanics_containers[local_faction] and faction_buttons then 
		for idx ,container in ipairs(faction_mechanics_containers[local_faction]) do
			local component_name = container
			if type(container) == "table" then
				component_name = container.component
			end

			local button_name = faction_buttons[idx]
			if type(faction_buttons[idx]) == "table" then
				button_name = faction_buttons[idx].component
			end

			local ui_override = uim:override("hide_" .. component_name, true)
			local ui_override_locked = ui_override and ui_override:is_locked()
			local component = find_uicomponent(core:get_ui_root(),"hud_campaign","faction_widget","main_buttons","main_buttons_container", component_name)
			if component then
				if ui_override_locked then
					ui_override.was_visible_in_the_first_place = true
				else
					table.insert(faction_button_names, button_name)
					component:SetVisible(true)
					setup_faction_button_tooltip(local_faction, button_name, component)
				end
			elseif type(container) == "table" then
				local faction_widget = find_uicomponent(core:get_ui_root(), unpack(container.target_path))

				if faction_widget then
					faction_widget:CreateComponent(component_name, container.src_path)
					table.insert(faction_button_names, button_name)
					setup_faction_button_tooltip(local_faction, button_name, faction_widget)
				end
			end
		end

		for container, buttons in pairs(mythic_faction_mechanics_containers) do
			local ui_override = uim:override("hide_" .. container, true)
			local ui_override_locked = ui_override and ui_override:is_locked()
			local component = find_uicomponent(core:get_ui_root(),"hud_campaign","faction_widget","main_buttons","main_buttons_container", container)

			if component then
				if ui_override_locked then
					ui_override.was_visible_in_the_first_place = true
				else
					for idx, button in ipairs(buttons) do
						--table.insert(faction_button_names, button)
						table.insert(faction_mythic_button_names, button)
					end
				end
			end
		end

		for container, button in pairs(pharaoh_mechanics) do
			local ui_override = uim:override("hide_" .. container, true)
			local ui_override_locked = ui_override and ui_override:is_locked()
			local component = find_uicomponent(core:get_ui_root(),"hud_campaign","faction_widget","main_buttons","main_buttons_container", container)

			if component then
				if ui_override_locked then
					ui_override.was_visible_in_the_first_place = true
				else
					table.insert(faction_button_names, button)
				end
			end
		end
	end

	-- Setup the faction mechanics resources in the resources container of the Strat_HUD.
	local component = find_uicomponent(core:get_ui_root(), "hud_campaign")
	local resources = faction_mechanics_ui_resources[local_faction]
	if (resources) then
		component:InterfaceFunction("CreateFactionMechanicsResources", resources)

		-- #HACK: The Dominance resource is specific for AL Atreus and should be shown only if that legacy is chosen.
		-- In principle, a mechanism in the Ancient Legacies common system should be developed to handle this, but as it will likely not be used for anything else,
		-- at this point in the development cycle, it is not worth the effort.
		if table_contains(resources, "troy_dominance") then
			local override = uim:override("hide_resource_troy_dominance")
			if override then
				if ancient_legacy_common:faction_has_claimed_legacy(local_faction, "phar_ancient_legacy_atreus") then
					override:unlock(true)
				else
					override:lock(true)
				end
			end
		end
	end
	if #faction_button_names > 0 then
		component:InterfaceFunction("SetFactionMechanicsButtons", faction_button_names)
	end
end

function setup_faction_button_tooltip(faction_key, button_name, button_parent)
	if faction_mechanics_button_tooltips[faction_key] and faction_mechanics_button_tooltips[faction_key][button_name] then
		local button = button_parent:SequentialFind(button_name)
		if button then
			local localised_text = common.get_localised_string(faction_mechanics_button_tooltips[faction_key][button_name])
			button:SetTooltipText(localised_text, "From troy_faction_mechanics_ui.lua, localised text", true)
		end
	end
end

core:add_listener(
	"show_faction_mechanics_buttons",
	"FirstTickAfterWorldCreated",
	true,
	setup_faction_mechanics_ui,
	false
)

-- Hack - fix buttons when UI is reloaded

core:add_listener(
	"show_faction_mechanics_buttons",
	"UIReloaded",
	true,
	setup_faction_mechanics_ui,
	true
)