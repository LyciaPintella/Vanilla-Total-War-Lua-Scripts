-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 513.04577636719;
cam_start_y = 679.38757324219;
cam_start_d = 14.837951660156;
cam_start_b = 0;
cam_start_h = 15.844873428345;

ramesses_forename_id = "266691888";
seti_forename_id = "599305130";
tausret_forename_id = "862248711";
amenmesse_forename_id = "922529854";
irsu_forename_id = "792338714";
bay_forename_id = "1366019581";
suppi_forename_id = "594798676";
kurunta_forename_id = "697761829";
wawletes_forename_id = "1125480268";
iolaos_forename_id = "341405456";

---------------------------------------------------------------
--	First-Tick callbacks
---------------------------------------------------------------

cm:add_first_tick_callback_sp_new(
	function()
		local random_start_pos_enabled = (mdm.state["random_startpos"] and mdm.state["random_startpos"].value == 1) and true or false

		if not random_start_pos_enabled then 
			-- set pre-intro-cutscene camera position
			cm:set_camera_position(cam_start_x, cam_start_y, cam_start_d, cam_start_b, cam_start_h);
--[[
			-- put faction-specific calls that should only gets triggered in a new singleplayer game here
			cm:start_intro_cutscene_on_loading_screen_dismissed(
				function()
					cm:show_benchmark_if_required(
						function()
							play_cutscene_intro()
						end,																					-- function to call if not in benchmark mode
						"script/benchmarks/phar_campaign_benchmark/scenes/amenmesse_start.CindyScene",			-- benchmark cindy scene
						120.00,																					-- duration of cindy scene
						435,																					-- cam position x at start of scene
						690,																					-- cam position y at start of scene
						18,																						-- cam position d at start of scene
						0,																						-- cam position b at start of scene
						4																						-- cam position h at start of scene
					);
				end
			);
			]]
		else
			core:progress_on_loading_screen_dismissed(
				function()
					cm:position_camera_at_primary_military_force("phar_main_merneptah")
				end
			);
		end
	end
);

cm:add_first_tick_callback_sp_each(
	function() 
		-- put faction-specific calls that should get triggered each time a singleplayer game loads here
	end
);

---------------------------------------------------------------
--	Intro cutscene
---------------------------------------------------------------
--[[
function play_cutscene_intro()

end
]]