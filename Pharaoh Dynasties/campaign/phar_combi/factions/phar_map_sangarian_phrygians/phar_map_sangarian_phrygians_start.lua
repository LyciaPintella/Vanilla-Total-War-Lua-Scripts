out("phar_main_sangarian_phrygians_start.lua LOADED")

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	FACTION SCRIPT
--
--	Custom script for this faction starts here. This script loads in additional
--	scripts depending on the mode the campaign is being started in (first turn vs
--	open), sets up the faction_start object and does some other things
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
---------------------------------------------------------------
--	First-Tick callbacks
---------------------------------------------------------------

cm:add_first_tick_callback_mp_new(
	function() 
		-- put faction-specific calls that should only gets triggered in a new multiplayer game here
		core:progress_on_loading_screen_dismissed(
			function()
				cm:position_camera_at_primary_military_force(cm:get_local_faction_name(true))
				
			end
		)
		cm:override_ui("hide_campaign_customization_button", true)
	end
);

cm:add_first_tick_callback_mp_each(
	function()
		-- put faction-specific calls that should get triggered each time a multiplayer game loads here
	end
);

---------------------------------------------------------------
--	Loading faction scripts
---------------------------------------------------------------

if not cm:is_multiplayer() then
	cm:add_linear_sequence_configuration(
		"open_campaign",                           					-- script name, must be unique and have no spaces
		"_open_start",                                 				-- script to load if this loading config selected
		"",                											-- svr boolean that can force this loading config (will be set to false if successful)
		true,                                       				-- load this config if no other config forced
		"remove_me"               									-- tweaker to force this loading config
	);

	cm:load_linear_sequence_configuration();
end