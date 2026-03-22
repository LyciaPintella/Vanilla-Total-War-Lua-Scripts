

-----------------------------------------------------------------------------------------------------------
-- MODULAR SCRIPTING FOR MODDERS
-----------------------------------------------------------------------------------------------------------
-- The following allows modders to load their own script files without editing any existing game scripts
-- This allows multiple scripted mods to work together without one preventing the execution of another
--
-- Issue: Two modders cannot use the same existing scripting file to execute their own scripts as one
-- version of the script would always overwrite the other preventing one mod from working
--
--
-- The following scripting loads all scripts within a "mod" folder of each campaign and then executes
-- a function of the same name as the file (if one such function is declared)
-- Onus is on the modder to ensure the function/file name is unique which is fine
--
-- Example: The file "data/script/campaign/main_troy/mod/cool_mod.lua" would be loaded and
-- then any function by the name of "cool_mod" will be run if it exists (sort of like a constructor)
--
-- ~ Mitch 18/10/17
-----------------------------------------------------------------------------------------------------------


--- @set_environment battle
--- @set_environment campaign
--- @set_environment frontend


----------------------------------------------------------------------------
---	@section Mod Output
----------------------------------------------------------------------------


--- @function ModLog
--- @desc Writes output to the <code>lua_mod_log.txt</code> text file, and also to the development console.
--- @p @string output text
local logMade = false;
function ModLog(text)
	out(text);
	local logInterface = io.open(os.getenv("APPDATA") .. "/The Creative Assembly/Troy/logs/lua_mod_log.txt", logMade and "a" or "w");
	if logInterface ~= nil then
		logMade = true;
		logInterface:write(text.."\n");
		logInterface:flush();
		logInterface:close();
	end
end;




-- load mods here
if core:is_campaign() then
	-- LOADING CAMPAIGN MODS

	-- load mods on NewSession
	core:add_listener(
		"new_session_mod_scripting_loader",
		"NewSession",
		true,
		function(context)

			core:load_mods(
				"/script/_lib/mod/",								-- general script library mods
				"/script/campaign/mod/",							-- root campaign folder
				"/script/campaign/" .. CampaignName .. "/mod/"		-- campaign-specific folder
			);
		end,
		true
	);

	-- execute mods on first tick
	core:add_listener(
		"first_tick_after_world_created_mod_scripting_loader",
		"FirstTickAfterWorldCreated",
		true,
		function(context)
			core:execute_mods(context);
		end,
		false
	);


elseif core:is_battle() then
	-- LOADING BATTLE MODS
	
	core:load_mods(
		"/script/_lib/mod/",				-- general script library mods
		"/script/battle/mod/"				-- root battle folder
	);
else
	-- LOADING FRONTEND MODS

	core:load_mods(
		"/script/_lib/mod/",				-- general script library mods
		"/script/mod_frontend/"				-- frontend-specific mods
	);
end;