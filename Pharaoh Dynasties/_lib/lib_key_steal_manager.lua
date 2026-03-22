
--- @set_environment frontend
--- @set_environment battle


--- @class key_steal_manager Key Steal Manager
--- @desc The key steal manager provides functionality in battle and frontend game modes related to stealing the ESC key and intercepting key presses.
--- @desc In battle, the @battle_manager automatically creates a key-steal manager and provides a pass-through interface to its functions via @battle_manager:steal_escape_key_with_callback and @battle_manager:release_escape_key_with_callback. Do not try to manually create and use a key-steal manager in battle, but instead use the battle manager's pass-through interface.
--- @desc In the frontend, a key steal manager is automatically created when the libs are loaded. This is called <code>ksm</code>. In frontend, functions listed on this page can be called in the following form:
--- @example ksm:<i>&lt;function_name&gt;</i>(<i>&lt;args&gt;</i>)





key_steal_manager = {

	--[[
	esc_key_steal_list = {}					-- records of scripts that have stolen the esc key. The last to steal the esc key will actually be notified
	]]
}

-- set key steal manager to be of custom type TYPE_KEY_STEAL_MANAGER
set_class_custom_type_and_tostring(key_steal_manager, TYPE_KEY_STEAL_MANAGER);




--- @section Creation


--- @function new
--- @desc Creates and returns a new key-steal manager. This should not be called by client scripts - in battle, the @battle_manager creates a key steal manager internally, and in the frontend a key steal manager is created automatically by the script libraries.
--- @return @key_steal_manager key steal manager
function key_steal_manager:new()

	if core:is_campaign() then
		script_error("ERROR: an attempt was made to create a key steal manager in campaign - campaign key stealing works differently and is provided by the campaign manager");
		return false;
	end;

	local ksm = core:get_static_object("key_steal_manager");
	if ksm then
		return ksm;
	end;

	ksm = {};

	-- set 'ksm' to derive from self ('key_steal_manager')
	set_object_class(ksm, self);

	ksm.esc_key_steal_list = {};

	--
	-- Define an Esc_Key_Pressed function here - this gets called in battle and frontend when script has stolen the ESC key
	function Esc_Key_Pressed()
		ksm:escape_key_pressed();
	end;


	-- Map functions that steal and release the escape key, depending on what game mode we're in
	if core:is_battle() then
		-- Battle
		function key_steal_manager:steal_escape_key()
			bm:steal_escape_key();
		end;

		function key_steal_manager:release_escape_key()
			bm:release_escape_key();
		end;

	elseif core:is_frontend() then
		-- Frontend
		function key_steal_manager:steal_escape_key()
			frontend.steal_escape_key();
		end;

		function key_steal_manager:release_escape_key()
			frontend.release_escape_key();
		end;
	else
		-- Campaign was already filtered at the top of this function
		script_error("ERROR: an attempt was made to create a key steal manager but the game mode was not recognised - how can this be?")
	end;

	core:add_static_object("key_steal_manager", ksm);
		
	return ksm;
end;


-- The ESC key has been pressed while we have stolen it
function key_steal_manager:escape_key_pressed()
	local esc_key_steal_list = self.esc_key_steal_list;

	if #esc_key_steal_list == 0 then
		return;
	end;
	
	-- cache callback to call
	local record = esc_key_steal_list[#esc_key_steal_list]
	local callback = record.callback;
	
	-- remove callback entry from list if we should
	if not record.is_persistent then
		table.remove(esc_key_steal_list);
		
		-- if list is now empty, release the escape key
		if #esc_key_steal_list == 0 then
			self:release_escape_key();
		end;
	end;
	
	-- call the callback
	callback();
end;





--- @section ESC Key Stealing


--- @function steal_escape_key_with_callback
--- @desc Steals the escape key if it wasn't stolen before, and registers a callback to be called if the player presses it. The callback entry must be registered with a unique string name, by which it may be cancelled later if desired.
--- @desc Multiple escape key callbacks may be registered at one time, although only the most recently-registered callback is notified when the ESC key is pressed. Once an ESC key callback is called it is removed from the list, and the next ESC key press causes the next most recent callback to be notified, and so-on.
--- @p @string callback name, Callback name.
--- @p @function callback, Callback to call.
--- @p [opt=false] @boolean is persistent, Key should remain stolen after callback is first called.
function key_steal_manager:steal_escape_key_with_callback(name, callback, is_persistent)
	if not is_string(name) then
		script_error("ERROR: steal_escape_key_with_callback() called but supplied name [" .. tostring(name) .. "] is not a string");
		return false;
	end;
	
	if not is_function(callback) then
		script_error("ERROR: steal_escape_key_with_callback() called but supplied callback [" .. tostring(callback) .. "] is not a function");
		return false;
	end;
	
	local esc_key_steal_list = self.esc_key_steal_list;
	
	-- don't proceed if a keysteal entry with this name currently exists in the list
	for i = 1, #esc_key_steal_list do
		if esc_key_steal_list[i].name == name then
			script_error("ERROR: steal_escape_key_with_callback() called but another process has already stolen the esc key with name [" .. name .. "]");
			return false;
		end;
	end;
	
	-- create a key steal entry
	local key_steal_entry = {
		["name"] = name,
		["callback"] = callback,
		["is_persistent"] = not not is_persistent
	};
	
	-- add this key steal entry at the end of the list
	table.insert(esc_key_steal_list, key_steal_entry);
	
	-- steal the esc key if it wasn't previously
	if #esc_key_steal_list == 1 then
		self:steal_escape_key();
	end;
	
	return true;
end;


--- @function release_escape_key_with_callback
--- @desc Cancels an escape key callback registered with @key_steal_manager:steal_escape_key_with_callback by name.
--- @p @string callback name to cancel
function key_steal_manager:release_escape_key_with_callback(name)
	if not is_string(name) then
		script_error("ERROR: release_escape_key_with_callback() called but supplied name [" .. tostring(name) .. "] is not a string");
		return false;
	end;
	
	local esc_key_steal_list = self.esc_key_steal_list;
	
	for i = 1, #esc_key_steal_list do
		if esc_key_steal_list[i].name == name then
			table.remove(esc_key_steal_list, i);
			break;
		end;
	end;
	
	-- release the esc key if the list is now empty
	if #esc_key_steal_list == 0 then
		self:release_escape_key();
	end;
end;


