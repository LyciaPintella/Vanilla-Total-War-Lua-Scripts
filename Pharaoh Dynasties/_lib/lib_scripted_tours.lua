


----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--
--	SCRIPTED TOURS
--
--- @set_environment battle
--- @set_environment campaign
--- @set_environment frontend
--- @class scripted_tour Scripted Tours
--- @desc A scripted tour is a linear section of scripted gameplay where the script locks all player interaction with the game barring the minimum necessary for the player to perform a series of actions, often with the intention of showcasing a particular game feature to the player. The actions within a typical tour might include playing advice, showing text pointers, or placing fullscreen highlights around UI elements.
--- @desc Scripted tours are commonly composed from multiple sections, or sequences. Each sequence, once started, triggers a series of actions that do things like show advice or scrolling the camera. At the end of each sequence a point which requires player input is typically reached, such as a button-click to dismiss the advisor or a text pointer. Once the player input is received it's usual for the tour to move on to the next sequence, or complete.
--- @desc For example, a short tour may be composed of two action sequences - a main sequence and a second sequence with a particular name. In the main sequence, which plays by default when the tour is started, a fullscreen highlight is shown over some ui elements, some advice is played, and a text pointer with a close button points out a particular UI element. All this would be set up in one or more action callbacks associated with the main sequence. Once the text pointer close button is clicked, the script may direct the second action sequence to begin, which shows a different fullscreen highlight and a second text pointer - all set up in actions associated with the second sequence. Once the second text pointer is dismissed the script may direct the scripted tour to end, releasing the UI and control back to the player.
--- @desc An example screenshot of a scripted tour, showing advice, a fullscreen highlight and a text pointer:
--- @desc <img alt="scripted tour" width=650px" src="../images/scripted_tour.jpg" \>
--- @desc If a scripted tour is intended to be shown during live campaign gameplay then it's strongly recommended to always trigger it from within an @intervention in order to control the flow of events around the tour that is triggering. Scripted tours may also be triggered in battle and the frontend.
--- @desc Actions may be added to a scripted tour with @scripted_tour:action. Along with the action callback to call, an interval must be specified for each action. A sequence name for the action may also be specified. If no such name is given, the actions are associated with the main sequence, which is played by default when the tour is first started. Actions added to a tour are called after the specified interval when the related tour sequence is started.
--- @desc Once constructed, a tour may be started with @scripted_tour:start. This function may be called again within the tour with a sequence name specified, in order to start a particular action sequence.
--- @desc @scripted_tour:complete may be called within the tour sequence to end the tour. If an end callback was supplied to @scripted_tour:new it will be called at this time. Furthermore, when a scripted tour finishes it will trigger the script event <code>ScriptEventScriptedTourCompleted</code>, with the scripted tour name as the context string.


--- @section Navigable Tours
--- @desc See also the @navigable_tour interface. Navigable tours are a extension of scripted tours.


--- @section At A Glance
--- @desc Each scripted tour must be declared with @scripted_tour:new. A unique name for the tour must be given, and an optional function to call when the tour ends (or is skipped) may also be supplied.
--- @desc Once declared, actions may be added to the tour with @scripted_tour:action. Each action is a function to be called at some timed interval after a sequence within the tour has started. It is through actions that events during the tour occur, such advice being displayed and buttons being highlighted. If no sequence name is supplied when declaring an action it is associated with the main action sequence, which is triggered by default when the tour is first started.
--- @desc Once a scripted tour is declared and configured it may be started with @scripted_tour:start. Supply no arguments to this function to start the main action sequence, or specify a sequence name to start a particular named action sequence.
--- @desc From within the tour actions, all running sequences and the tour as a whole may be ended by calling @scripted_tour:complete. Alternatively, the tour ends immediately if the player clicks on the skip button or if @scripted_tour:skip is called. The tour must be ended by calling @scripted_tour:complete or @scripted_tour:skip after it has been started.
--
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------


scripted_tour = {
	name = "",													-- unique string name for this scripted tour
	end_callback = false,										-- function to call when this scripted tour ends
	action_list = {},											-- list of actions to perform during scripted tour
	registered_text_pointers = {},								-- list of registered text pointers
	skip_actions = {},											-- list of cleanup functions to call if the scripted tour is skipped
	validation_rules = {},										-- a list of validation rules that must all return true for this tour to start
	is_running = false,											-- flag to indicate whether this scripted tour is currently running
	should_hide_text_pointers_on_completion = true,				-- all visible text pointers should hide automatically when the tour completes
	should_dismiss_advice_on_completion = true,					-- advice should be dismissed when the tour completes
	close_info_overlays = true,									-- sets whether the tour should close any open info overlays when it starts
	allow_camera_movement = false,								-- sets whether the player should be able to move the camera while the tour is active. Currently battle-only.
	last_validation_state = true,								-- validation state when is_currently_valid was last called
	last_validation_reason = nil,								-- validation reason when is_currently_valid was last called
	cached_infotext_attached_to_advisor = true,					-- cached state of infotext <-> advisor attachment at the start of the tour, which we will restore at the end
	exit_on_battle_start = true,								-- should the tour automatically exit if a battle begins
	steal_esc_key_on_tour_start = false,						-- should the escape key be stolen on start
	disable_all_shortcuts_in_campaign = true,					-- sets whether UI shortcuts are disabled when the scripted tour starts
	all_shortcuts_disabled_in_campaign = false,					-- have all shortcuts been disabled in campaign
	tour_is_shutting_down = false								-- tour is currently in the process of shutting down
};


-- set scripted_tour to be of custom type TYPE_SCRIPTED_TOUR, with a custom tostring() response
set_class_custom_type(scripted_tour, TYPE_SCRIPTED_TOUR);
set_class_tostring(
	scripted_tour,
	function(obj)
		return TYPE_SCRIPTED_TOUR .. "_" .. obj.name
	end
);





-- Local wrapper functions for steal_escape_key_with_callback/release_escape_key_with_callback that handle what game mode we're in.
-- TODO: refactor this, probably involving a further refactor to the key steal manager, so that these kinds of wrapper functions are
-- globally available and there's no need for client scripts to laboriously test the game mode and decide which interface to call
-- the function on.
local function steal_escape_key_with_callback(process_name, callback, is_persistent)
	if core:is_campaign() then
		cm:steal_escape_key_with_callback(process_name, callback, is_persistent);
	elseif core:is_battle() then
		bm:steal_escape_key_with_callback(process_name, callback, is_persistent);
	else
		-- frontend
		ksm:steal_escape_key_with_callback(process_name, callback, is_persistent);
	end;
end;


local function release_escape_key_with_callback(process_name)
	if core:is_campaign() then
		cm:release_escape_key_with_callback(process_name);
	elseif core:is_battle() then
		bm:release_escape_key_with_callback(process_name);
	else
		-- frontend
		ksm:release_escape_key_with_callback(process_name);
	end;
end;





----------------------------------------------------------------------------
--- @section Creation
----------------------------------------------------------------------------


--- @function new
--- @desc Creates a scripted tour object. Each scripted tour must be given a unique string name and, optionally, an end callback which will be called when the scripted tour ends or is skipped.
--- @p @string name, Unique name for the scripted tour.
--- @p [opt=nil] @function end callback, End callback.
--- @r scripted_tour scripted tour
function scripted_tour:new(name, end_callback)
	if not is_string(name) then
		script_error("ERROR: scripted_tour:new() called but supplied name [" .. tostring(name) .. "] is not a string");
		return false;
	end;

	if end_callback and not is_function(end_callback) then
		script_error("ERROR: scripted_tour:new() called but supplied end callback [" .. tostring(end_callback) .. "] is not a function");
		return false;
	end;

	local st = {};
	
	st.name = "scripted_tour_" .. name;

	-- set 'st' to derive from self ('scripted_tour')
	set_object_class(st, self);

	st.end_callback = end_callback;

	st.action_list = {};
	st.skip_actions = {};
	st.validation_rules = {};
	st.registered_text_pointers = {};

	return st;
end;











----------------------------------------------------------------------------
---	@section Usage
----------------------------------------------------------------------------
--- @desc Once a <code>scripted_tour</code> object has been created with @scripted_tour:new, functions on it may be called in the form showed below.
--- @new_example Specification
--- @example <i>&lt;scripted_tour_object&gt;</i>:<i>&lt;function_name&gt;</i>(<i>&lt;args&gt;</i>)
--- @new_example Creation and Usage
--- @example local st = scripted_tour:new(
--- @example 	"deployment",
--- @example 	function() end_deployment_scripted_tour() end
--- @example );
--- @example 
--- @example st_deployment:add_validation_rule(		-- calling a function on the object once created
--- @example 	function()
--- @example 		return bm:get_current_phase_name() == "Deployment";
--- @example 	end,
--- @example 	"not in deployment phase"
--- @example );











----------------------------------------------------------------------------
--- @section Validation
--- @desc Validation rules may be built into a scripted tour using @scripted_tour:add_validation_rule, to allow it to know when it can be triggered. Validation rules added to a scripted tour are checked when that tour is started with @scripted_tour:start, and should any fail then the scripted tour will fail to trigger.
--- @desc Client scripts may also ask a scripted tour whether it is currently valid to trigger by calling @scripted_tour:is_currently_valid. Should the tour not currently be valid then a reason value, supplied to @scripted_tour:add_validation_rule when the rule is established, is returned to the calling script. This can be used by UI scripts, for example, to determine whether to enable or disable a scripted tour button, and to customise its appearance (e.g. change the tooltip) to indicate a reason why the tour can't currently be triggered.
--- @desc Furthermore, context change listeners may be added to a scripted tour with @scripted_tour:add_validation_context_change_listener by which a scripted tour may listen for events that may indicate its validation state changing. Should a scripted tour detect that a context change has altered its validation state it will trigger the script event <code>ScriptEventScriptedTourValidationStateChanged</code> which can be listened for by scripts elsewhere.
----------------------------------------------------------------------------


--- @function add_validation_rule
--- @desc Adds a validation callback. The supplied function will be called when the scripted tour is triggered with @scripted_tour:start, or validated with @scripted_tour:is_currently_valid, and it must return a boolean value that indicates whether the validation rule passes.
--- @desc Validation rules are checked in the same order in which they are added.
--- @p @function callback, Validation function.
--- @p value reason, Reason value. This can be a value of any type. It will be returned to scripts that call @scripted_tour:is_currently_valid if this validation rule fails.
function scripted_tour:add_validation_rule(callback, reason_value)
	if not is_function(callback) then
		script_error(self.name .. ":add_validation_rule() called but supplied validation rule callback [" .. tostring(callback) .. "] is not a function");
		return false;
	end;

	local validation_rule_record = {
		callback = callback,
		reason_value = reason_value
	};

	table.insert(self.validation_rules, validation_rule_record);
end;


--- @function add_validation_context_change_listener
--- @desc Starts a listener for the supplied scripted event. Should it be received, and should the optional condition also pass, the current validation state is checked against that previously cached. If the validation state has changed then the <code>ScriptEventScriptedTourValidationStateChanged</code> is triggered which scripts elsewhere can listen for and react to. This allows UI scripts that may be displaying an option to launch a scripted tour to update the state of that launch option as the game context changes.
--- @p @string event name, Name of script event to monitor.
--- @p [opt=true] @function condition, Condition to check if the event is received. 
function scripted_tour:add_validation_context_change_listener(event, condition)
	if not is_string(event) then
		script_error(self.name .. " ERROR: add_validation_context_change_listener() called but supplied event name [" .. tostring(event) .. "] is not a string");
		return false;
	end;

	if condition == nil then
		condition = true;
	elseif not is_function(condition) and not condition == true then
		script_error(self.name .. " ERROR: add_validation_context_change_listener() called but supplied event condition [" .. tostring(condition) .. "] is not, nil, true or a function");
		return false;
	end;

	core:add_listener(
		self.name,
		event,
		condition,
		function()
			local last_validation_state = self.last_validation_state;
			local last_validation_reason = self.last_validation_reason;

			local current_validation_state, current_validation_reason = self:is_currently_valid();

			if current_validation_state ~= last_validation_state or current_validation_reason ~= last_validation_reason then
				core:trigger_event("ScriptEventScriptedTourValidationStateChanged", self.name);
			end;
		end,
		true
	);
end;


--- @function is_currently_valid
--- @desc Checks whether this scripted tour is currently able to trigger. If the tour is not currently valid to trigger then the reason specified when setting the rule up with @scripted_tour:add_validation_rule is returned.
--- @r @boolean currently valid
--- @r value reason value if invalid
function scripted_tour:is_currently_valid()
	for i = 1, #self.validation_rules do
		if not self.validation_rules[i].callback() then
			local reason_value = self.validation_rules[i].reason_value;
			self.last_validation_state = false;
			self.last_validation_reason = reason_value;

			return false, reason_value;
		end;
	end;

	self.last_validation_state = true;
	self.last_validation_reason = nil;

	return true, true;
end;









----------------------------------------------------------------------------
--- @section Enqueuing Actions
--- @desc Actions must be added to a scripted tour if it is to do anything. Action callbacks added to a tour are called by that tour once the tour is started with @scripted_tour:start. Actions are added with an action time, which specifies how long the scripted tour should wait after being started before calling the action. Pending actions are cancelled when a tour is skipped or completed, so if this happens before an action is called then it will never be called.
--- @desc Actions may optionally be added to a 'sequence' by specifying a string sequence name when calling @scripted_tour:action. Different sequences in a scripted tour may be started by calling @scripted_tour:start with the sequence name.
----------------------------------------------------------------------------


--- @function action
--- @desc Adds an action to the scripted tour to be called at a specified time after the scripted tour starts. If no sequence is specified then the action is added to the main tour sequence, otherwise the action will be added to the sequence given.
--- @p function callback, Callback function to call.
--- @p number interval, Interval after the scripted tour starts at which the specified action should be triggered. This should be given in seconds in campaign, and in ms in battle and the frontend.
--- @p [opt=nil] string sequence, Sequence to add the action to. If no sequence name is specified then the action will be added to the main sequence.
function scripted_tour:action(action, action_time, sequence_name)
	if self.is_running then
		script_error(self.name .. " ERROR:action() called but the scripted tour is currently running");
		return false;
	end;

	if not is_function(action) then
		script_error(self.name .. " ERROR: action() called but the supplied action [" .. tostring(action) .. "] is not a function");
		return false;
	end;

	if not is_number(action_time) or action_time < 0 then
		script_error(self.name .. " ERROR: action() called but the supplied action time [" .. tostring(action_time) .. "] is not a positive number");
		return false;
	end;

	if sequence_name then
		if not is_string(sequence_name) then
			script_error(self.name .. " ERROR: action() called but the supplied sequence name [" .. tostring(sequence_name) .. "] is not a string");
			return false;
		end;
	else
		sequence_name = "default"; -- default sequence
	end;

	local action_record = {
		action = action,
		action_time = action_time
	};

	-- create the action list for this sequence if it has not already been created
	if not self.action_list[sequence_name] then
		self.action_list[sequence_name] = {};
	end;

	-- insert this action record in the correct chronological place in the action list
	local action_list_for_sequence = self.action_list[sequence_name];

	for i = 1, #action_list_for_sequence do
		if action_list_for_sequence[i].action_time > action_time then
			table.insert(action_list_for_sequence, i, action_record);
			return;
		end;
	end;

	table.insert(action_list_for_sequence, action_record);
end;


--- @function append_action
--- @desc Adds an action to the scripted tour to be called at the same time as the last currently-registered action of the specified sequence. If no sequence is specified then the action is added to the main tour sequence, otherwise the action will be added to the sequence given. If additional actions are added after <code>append_action</code> is called 
--- @p function callback, Callback function to call.
--- @p number interval, Interval after the scripted tour starts at which the specified action should be triggered. This should be given in seconds in campaign, and in ms in battle and the frontend.
--- @p [opt=nil] string sequence, Sequence to add the action to. If no sequence name is specified then the action will be added to the main sequence.
function scripted_tour:append_action(action, sequence_name)

	if not is_function(action) then
		script_error(self.name .. " ERROR: append_action() called but supplied action [" .. tostring(action) .. "] is not a function");
		return false;
	end;

	if sequence_name then
		if not is_string(sequence_name) then
			script_error(self.name .. " ERROR: append_action() called but supplied sequence name [" .. tostring(sequence_name) .. "] is not a string or nil");
			return false;
		end;
	else
		sequence_name = "default";
	end;

	-- create the action list for this sequence if it has not already been created
	if not self.action_list[sequence_name] then
		self.action_list[sequence_name] = {};
	end;

	local action_list_for_sequence = self.action_list[sequence_name];

	local last_action_time = 0;
	for i = #action_list_for_sequence, 1, -1 do
		if action_list_for_sequence[i].action_time > last_action_time then
			last_action_time = action_list_for_sequence[i].action_time;
		end;
	end;

	self:action(action, last_action_time, sequence_name);
end;


--- @function add_skip_action
--- @desc Adds a skip action to the scripted tour, which will be called if the scripted tour is skipped (but not called if it is completed normally). This can be used to register callbacks that clean up after the tour if it is skipped suddenly - stop listeners, undo changes to the UI etc.
--- @desc A name may be given for the skip action, by which it can be removed later. Some rules apply here:
--- @desc <ul><li>If no name is given then, after it is registered, the skip action will be removed whenever one scripted tour sequence ends and another begins.</li>
--- @desc <li>If a name is given, then after it is registered the skip action will not be removed as a new sequence starts, but only if @scripted_tour:remove_skip_action is called.</li>
--- @desc <li>If <code>true</code> is supplied as a name then the skip action will not be removed when a new sequence starts, and will always be called if the tour is skipped.</li></ul>
--- @p @function skip action, Skip callback to call if this scripted tour is skipped.
--- @p [opt=nil] @string name, Name for this skip action. This may also be <code>true</code> to not apply a name (see explanation above).
function scripted_tour:add_skip_action(skip_action, name)
	if not is_function(skip_action) then
		script_error(self.name .. " ERROR: add_skip_action() called but supplied callback [" .. tostring(skip_action) .. "] is not a function");
		return false;
	end;

	if name == nil then
		-- Give this skip action a name which means it will be removed whenever a new sequence starts
		name = "remove_on_new_sequence";

	elseif name == true then
		-- This skip action is to apply to the whole tour, so remove its name
		name = nil;

	elseif not is_string(name) then
		script_error(self.name .. " ERROR: add_skip_action() called but supplied cancellation name [" .. tostring(name) .. "] is not a string, true or nil");
		return false;
	end;
	
	local skip_action_record = {
		skip_action = skip_action,
		name = name
	};
	
	table.insert(self.skip_actions, skip_action_record);
end;


--- @function remove_skip_action
--- @desc Remove a skip action from the scripted tour by name. If multiple skip actions share the same name then all will be removed.
--- @p @string name
function scripted_tour:remove_skip_action(name)
	if not is_string(name) then
		script_error(self.name .. " ERROR: remove_skip_action() called but supplied cancellation name [" .. tostring(name) .. "] is not a string");
		return false;
	end;
	
	for i = #self.skip_actions, 1, -1 do
		if self.skip_actions[i].name == name then
			table.remove(self.skip_actions, i);
		end;
	end;
end;















----------------------------------------------------------------------------
--- @section Misc Configuration
----------------------------------------------------------------------------


--- @function set_should_hide_text_pointers_on_completion
--- @desc Scripted tours will hide all visible @text_pointer objects upon completion by default. This function may be used to suppress this behaviour if desired.
--- @p [opt=true] @boolean should hide
function scripted_tour:set_should_hide_text_pointers_on_completion(value)
	if value == false then
		self.should_hide_text_pointers_on_completion = false;
	else
		self.should_hide_text_pointers_on_completion = true;
	end;
end;


--- @function set_should_dismiss_advice_on_completion
--- @desc Scripted tours will dismiss advice upon completion by default. This function may be used to suppress this behaviour if desired.
--- @p [opt=true] @boolean should dismiss
function scripted_tour:set_should_dismiss_advice_on_completion(value)
	if value == false then
		self.should_dismiss_advice_on_completion = false;
	else
		self.should_dismiss_advice_on_completion = true;
	end;
end;


--- @function set_steal_esc_key
--- @desc Instructs the scripted tour to steal the escape key on start. If the ESC key is pressed the tour is skipped.
--- @p [opt=true] @boolean steal esc key
function scripted_tour:set_steal_esc_key(value)
	if value == false then
		self.steal_esc_key_on_tour_start = false;
	else
		self.steal_esc_key_on_tour_start = true;
	end;
end;


--- @function set_disable_all_shortcuts_in_campaign
--- @desc Sets whether all UI shortcuts are disabled in campaign, while the tour is running. UI shortcuts are disabled by default - use this function to change this behaviour.
--- @p [opt=true] @boolean should disable
function scripted_tour:set_disable_all_shortcuts_in_campaign(value)
	if value == false then
		self.disable_all_shortcuts_in_campaign = false;
	else
		self.set_disable_all_shortcuts_in_campaign = true;
	end;
end;


--- @function set_exit_on_battle_start
--- @desc Sets whether the scripted tour should automatically complete if a battle is started in campaign. This behaviour is enabled by default - use this function to disable it.
--- @p [opt=true] @boolean should exit
function scripted_tour:set_exit_on_battle_start(value)
	if value == false then
		self.exit_on_battle_start = false;
	else
		self.exit_on_battle_start = true;
	end;
end;


--- @function set_allow_camera_movement
--- @desc Scripted tours will prevent camera movement whilst active, by default. Use this function to allow the player to move the camera while the scripted tour is active. It can be used before the tour starts or while the tour is running.
--- @p [opt=true] @boolean allow movement
function scripted_tour:set_allow_camera_movement(value)
	if value == false then
		self.allow_camera_movement = false;
	else
		self.allow_camera_movement = true;
	end;

	-- if the scripted tour is running then make this change immediately
	if self.is_running then
		self:allow_camera_movement_action();
	end;
end;


-- internal function to actually allow or disallow camera movement
function scripted_tour:allow_camera_movement_action(scripted_tour_ending)

	if scripted_tour_ending or self.allow_camera_movement then
		if core:is_battle() then
			bm:enable_camera_movement(true);
		elseif core:is_campaign() then
			-- TBD: enable camera movement in campaign
		end;
		
	elseif not self.allow_camera_movement then
		if core:is_battle() then
			bm:enable_camera_movement(false);
		elseif core:is_campaign() then
			-- TBD: disable camera movement in campaign
		end;
	end;
end;


--- @function set_close_info_overlays
--- @desc Sets whether the tour should close any open info overlays when it starts. By default, this behaviour is enabled - use this function to suppress it.
--- @p [opt=true] @boolean should close
function scripted_tour:set_close_info_overlays(value)
	if value == false then
		self.close_info_overlays = false;
	else
		self.close_info_overlays = true;
	end;
end;











----------------------------------------------------------------------------
--- @section Starting and Stopping
--- @desc A scripted tour will do nothing until it is started with @scripted_tour:start. If no argument is specified with this call then the main sequence of actions (i.e. those that were not added to a sequence) is started, otherwise the action sequence with the specified string name is started.
--- @desc Once started, a scripted tour will remain active until it is skipped or until the main action sequence is completed using @scripted_tour:complete. Calling this function with no arguments will complete the main action sequence (and the tour as a whole), whereas calling it with the name of a sequence will stop just that sequence. It is the responsibility of external scripts, usually those called within a scripted tour action, to complete the scripted tour.
--- @desc A scripted tour may be skipped by the player clicking on the skip button (if it is shown), which calls @scripted_tour:skip. Alternatively, this function may be called directly.
--- @desc When a scripted tour finishes it will trigger the script event <code>ScriptEventScriptedTourCompleted</code>, with the scripted tour name as the context string.
----------------------------------------------------------------------------

function scripted_tour:register_text_pointer(text_pointer)
	if not text_pointer then
		script_error("ERROR: scripted_tour:register_text_pointer called but parameter is invalid")
		return false
	end

	out.design("adding text pointer with full name: " .. text_pointer:get_full_name())
	self.registered_text_pointers[text_pointer] = text_pointer:get_full_name()
	return true
end

--- @function start
--- @desc Starts the scripted tour or a scripted tour sequence. The first time this function is called the scripted tour as a whole starts. If no arguments are supplied the main action sequence commences, otherwise the actions associated with the specified sequence will start.
--- @p [opt=nil] string sequence name
function scripted_tour:start(sequence_name)
	if self.is_running and not sequence_name then
		script_error(self.name .. " WARNING: start() called with no sequence name but this scripted tour is already started");
		return false;
	end;

	if not self:is_currently_valid() then
		script_error(self.name .. " ERROR: start() called but this tour cannot start as it is not currently valid. Reason value: [" .. (is_string(self.last_validation_reason) and common.get_localised_string(self.last_validation_reason) or "<no reason>") .. "]");
		return false;
	end;

	sequence_name = sequence_name or "default";

	local action_list_for_sequence = self.action_list[sequence_name];

	if not is_table(action_list_for_sequence) or #action_list_for_sequence == 0 then
		script_error(self.name .. " ERROR: start() called for sequence [" .. sequence_name .. "] but no actions have been added to this sequence");
		return false;
	end;

	if action_list_for_sequence.is_sequence_running then
		script_error(self.name .. " ERROR: start() called for sequence [" .. sequence_name .. "] but this sequence is already running");
		return false;
	end;

	-- mark the sequence as running
	action_list_for_sequence.is_sequence_running = true;

	-- remove any skip actions that were not registered as persistent skip actions
	self:remove_skip_action("remove_on_new_sequence");
	
	local tm = core:get_tm();

	if self.disable_all_shortcuts_in_campaign and core:is_campaign() then
		self.all_shortcuts_disabled_in_campaign = true;
		cm:disable_all_shortcuts(true);
	end;

	-- if this scripted tour is not already running then start it for the first time
	if not self.is_running then
		out(self.name .. ":: starting tour, sequence is " .. sequence_name);

		self.is_running = true;

		core:register_active_scripted_tour(self);

		-- Close any open info overlay
		if self.close_info_overlays then
			core:close_info_overlays();
		end;

		-- set up a listener which skips this scripted tour if a ScriptEventSkipAllScriptedTours event is received
		core:add_listener(
			self.name .. "_skip_all_scripted_tours",
			"ScriptEventSkipAllScriptedTours",
			true,
			function()
				self:skip()
			end,
			false
		);

		-- set up a listener which skips the scripted tour if an EndTurnEvent is received
		core:add_listener(
			self.name .. "_skip_all_scripted_tours_turn_end",
			"FactionAboutToEndTurn",
			true,
			function()
				core:trigger_event("ScriptEventSkipAllScriptedTours")
			end,
			false
		);
		

		-- Steal the ESC key on start if we should
		if self.steal_esc_key_on_tour_start then
			self:enable_global_escape_key_listener(true);
		end;

		-- cache advisor to infotext association
		if not core:is_frontend() then
			self.cached_infotext_attached_to_advisor = get_infotext_manager():is_attached_to_advisor();
		end;

		-- Prevent generic advice from triggering while this tour is active
		if core:is_battle() then
			get_advice_manager():lock_advice();
		end;

		-- set the advisor to be topmost so it appears over the top of any fullscreen highlight
		core:cache_and_set_advisor_priority(1500, true);

		-- restrict camera movement if we should (the function checks a set flag)
		self:allow_camera_movement_action();
	else
		out(self.name .. ":: starting sequence " .. sequence_name);
	end;

	-- enqueue actions to be called for this sequence
	local action_name = self.name .. "_action_" .. sequence_name;
	for i = 1, #action_list_for_sequence do
		tm:callback(function() action_list_for_sequence[i].action() end, action_list_for_sequence[i].action_time, action_name);
	end;

	-- Automatically complete the tour if a battle starts while in campaign
	-- TODO: make this a more generic mechanism
	if core:is_campaign() and self.exit_on_battle_start then
		core:add_listener(
			self.name .. "_battle_start_listener",
			"PanelOpenedCampaign",
			function(context)
				return context.string == "popup_pre_battle"
			end,
			function(context)
				self:complete();
			end,
			false
		);
	end;
end;


-- enable or disable the tour-wide escape key listener - not to be called externally
function scripted_tour:enable_global_escape_key_listener(enable)
	local process_name = "global_esc_key_listener_" .. self.name;

	if enable then
		if not self.global_escape_key_listener_enabled then
			self.global_escape_key_listener_enabled = true;

			steal_escape_key_with_callback(
				process_name,
				function()
					self:skip();
				end
			);
		end;
	else
		if self.global_escape_key_listener_enabled then
			self.global_escape_key_listener_enabled = false;

			release_escape_key_with_callback(process_name);
		end;
	end;
end;


--- @function skip
--- @desc Skips the scripted tour. This is called when the player clicks on the skip button, but may be called by external scripts. This will immediately terminate the tour and all running action sequences.
function scripted_tour:skip()

	if not self.is_running then
		script_error(self.name .. " WARNING: skip() called but this scripted tour is not running, disregarding");
		return false;
	end;

	out(self.name .. ":: skipping");

	-- make a duplicate of our skip action list
	local skip_action_list = {};

	for i = 1, #self.skip_actions do
		skip_action_list[i] = self.skip_actions[i];
	end;

	if #skip_action_list == 1 then
		out("\tcalling 1 skip action");
	else
		out("\tcalling " .. #skip_action_list .. " skip actions");
	end;

	-- call all of our skip actions
	for i = 1, #skip_action_list do
		skip_action_list[i].skip_action();
	end;

	self:complete();
end;


--- @function complete_sequence
--- @desc Instructs the scripted tour to complete an action sequence. Do this to cancel the sequence and prevent any further actions from that sequence being triggered. If no sequence name is specified then the main action sequence is completed.
--- @desc Note that calling this function does not complete the tour as a whole, which must still be terminated with @scripted_tour:complete.
--- @p [opt=nil] string sequence name
function scripted_tour:complete_sequence(sequence_name, scripted_tour_is_ending)

	sequence_name = sequence_name or "default";

	if not is_string(sequence_name) then
		script_error(self.name .. " ERROR: complete_sequence() called but supplied sequence name [" .. tostring(sequence_name) .. "] is not a string");
		return false;
	end;

	-- get the action list for the specified sequence_name
	local action_list_for_sequence = self.action_list[sequence_name];

	if not is_table(action_list_for_sequence) or #action_list_for_sequence == 0 then
		script_error(self.name .. " ERROR: start() called for sequence [" .. sequence_name .. "] but no actions have been added to this sequence");
		return false;
	end;
	
	if not action_list_for_sequence.is_sequence_running then
		return false;
	end;
	
	action_list_for_sequence.is_sequence_running = false;
	
	if not scripted_tour_is_ending then
		out(self.name .. ":: completing sequence " .. sequence_name);
	end;

	-- remove pending callbacks related to this sequence
	core:get_tm():remove_callback(self.name .. "_action_" .. sequence_name);
end;


--- @function complete
--- @desc Instructs the scripted tour to end after it has been started. All running action sequences will be terminated.
function scripted_tour:complete()

	if not self.is_running then
		script_error(self.name .. " WARNING: complete() called but this scripted tour is not running, disregarding");
		return false;
	end;

	out(self.name .. ":: ending");

	self.tour_is_shutting_down = true;

	core:remove_listener(self.name .. "_skip_all_scripted_tours");
	core:remove_listener(self.name .. "_battle_start_listener");
	core:remove_listener(self.name .. "_skip_all_scripted_tours_turn_end");

	-- cancel any pending fullscreen highlight callback
	core:get_tm():remove_callback(self.name .. "_fullscreen_highlight");

	-- complete all running sequences
	for sequence_name, action_list_for_sequence in pairs(self.action_list) do
		if action_list_for_sequence.is_sequence_running then
			self:complete_sequence(sequence_name, true);
		end;
	end;

	self.action_list = nil;
	self.skip_actions = nil;

	core:hide_fullscreen_highlight();

	self:stop_text_pointer_listeners();
	self:enable_global_escape_key_listener(false);

	-- hide any text pointers if we should
	if self.should_hide_text_pointers_on_completion then
		core:hide_all_text_pointers()
	end;

	-- dismiss advice if we should
	if self.should_dismiss_advice_on_completion then
		if core:is_campaign() then
			cm:dismiss_advice();
		elseif core:is_battle() then
			bm:stop_advisor_queue(true);

			-- Allow generic advice
			get_advice_manager():unlock_advice();
		end;
	end;

	-- unrestrict camera movement if we should
	self:allow_camera_movement_action(true);

	-- restore cached advisor to infotext association
	if not core:is_frontend() then
		get_infotext_manager():attach_to_advisor(self.cached_infotext_attached_to_advisor);
	end;

	core:register_active_scripted_tour(false);
	
	self.is_running = false;

	if core:is_campaign() then
		cm:steal_escape_key(false);

		-- relese any disabled shortcuts
		if self.all_shortcuts_disabled_in_campaign then
			cm:disable_all_shortcuts(false);
		end;
	end;

	-- call end callback
	if is_function(self.end_callback) then
		self.end_callback();
	end;

	-- trigger ending event
	core:trigger_event("ScriptEventScriptedTourCompleted", self.name);

	self.tour_is_shutting_down = false;
end;


function scripted_tour:stop_text_pointer_listeners()
	for k, v in pairs(self.registered_text_pointers) do
		k:stop_all_listeners();
		self.registered_text_pointers[k] = nil;
	end;
end;

function scripted_tour:complete_if_uicomponent_obj_is_invalid(uicomponent_obj)
	if is_uicomponent(uicomponent_obj) and uicomponent_obj:IsValid() then
		return false
	end
	self:complete()
	return true
end

































----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--
--	NAVIGABLE TOURS
--
--- @c navigable_tour Navigable Tours
--- @desc A navigable tour is a particular type of @scripted_tour which provides a control panel to the player, allowing them to rewind back and forth between tour sections. The player may also exit the tour at any time from the control panel provided.
--- @desc Navigable tours are built on top of the functionality that scripted tours provide, and extend and wrap the scripted tour interface. One crucial difference is that actions are associated with a navigable tour through an intermediate @navigable_tour_section objects. Once created, actions are added to @navigable_tour_section objects and then they are registered with the parent navigable tour with @navigable_tour:add_navigable_section. Actions cannot be directly added to a navigable tour, asides from start and end actions.


--- @section Navigable Tours and Scripted Tours
--- @desc When created, a navigable tour creates a @scripted_tour object and stores it internally. Calls made to the navigable tour object that the navigable tour interface does not provide are automatically passed through to the internal scripted tour object. An exception to this is @scripted_tour:action - this is explicitly overridden by the navigable tour interface and will throw a script error if called.


--- @section At A Glance
--- @desc A navigable tour is declared with @navigable_tour:new. A name and a function to call when the tour ends (or is skipped) must be specified here, as well as an optional tour name as a full localisation key.
--- @desc Once the tour is created, separately-created @navigable_tour_section objects may be assigned to it with @navigable_tour:add_navigable_section. These objects contain the underlying actions that are ultimately played - much of the complexity of setting up a narrative tour comes from setting up the sections.
--- @desc Startup and finishing actions may be added to the navigable tour with @navigable_tour:start_action and @navigable_tour:end_action. These are played when the tour starts or ends.
--- @desc Once configured with sections, a tour may be started with @navigable_tour:start.
--
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------


navigable_tour = {
	--[[
	sections = {},															-- navigable tour sections
	start_actions = {},														-- actions to perform at the start of the tour
	end_actions = {},														-- actions to perform at the end of the tour
	]]
	name = false,															-- string name for this navigable tour
	tour_title = false,														-- optional string localisation key to use as the tour title
	st = false,																-- underlying scripted tour object
	section_currently_playing = false,										-- the navigable tour section currently playing
	uic_scripted_tour_controls = false,										-- handle to tour controls panel
	scripted_tour_controls_end_button_replacing_next = false,				-- is the end button current showing in place of the next button
	scripted_tour_controls_next_button_active = false,						-- is the next/end button currently active
	scripted_tour_controls_back_button_active = false,						-- is the back button currently active
	is_exiting = false,														-- is the navigable tour currently in the process of exiting
	interval_before_tour_controls_visible = 1000,							-- interval at the start of the tour after which the controls become visible - 1 second by default. This is reset in the constructor in campaign to use seconds.
	start_first_section_automatically = true,								-- should the first navigable tour section be started automatically when the last start action is called
	first_valid_section = false,											-- reference to the first valid section
	unhide_scripted_tour_controls_when_cinematic_ui_disabled = false,		-- should the scripted tour controls be unhidden when cinematic ui is disabled. Set to true if tour controls were hidden by the appearance of the cinematic ui
	close_button_visible = true,											-- should the tour close button be visible by default when the tour is playing.
	close_button_active = true,												-- should the tour close button be active by default when the tour is playing. A close button that is not visible and active means the tour cannot be skipped or exited until final section is reached.

	-- cached values for uicomponents that we may shuffle around in the course of playing the navigable tour
	infotext_cached_dock_x = false,
	infotext_cached_dock_y = false,
	objectives_cached_dock_x = false,
	objectives_cached_dock_y = false,
	scripted_tour_controls_default_width = false,
	cached_scripted_tour_controls_priority = -1, 
	cached_scripted_tour_controls_topmost = false
}


set_class_custom_type(navigable_tour, TYPE_NAVIGABLE_TOUR);
set_class_tostring(
	navigable_tour,
	function(obj)
		return TYPE_NAVIGABLE_TOUR .. "_" .. obj.name
	end
);

local NAVIGABLE_TOUR_PROGRESS_BUTTONS_ARE_SQUARE = false;









----------------------------------------------------------------------------
--- @section Creation
----------------------------------------------------------------------------


--- @function new
--- @desc Creates and returns a navigable tour object. Each navigable tour must be given a unique string name and, optionally, an end callback which will be called when the scripted tour ends or is skipped.
--- @desc An optional tour title may also be supplied as a full <code>[table]_[field]_[key]</code>-style localised key. If supplied, the title of the navigable tour control panel will be set to the localised text specified by the key.
--- @p @string name, Unique name for the scripted tour.
--- @p [opt=nil] @function end callback, End callback.
--- @p [opt=nil] @string tour title, Full localisation key to use for navigable tour title.
--- @r @navigable_tour navigable tour
function navigable_tour:new(name, end_callback, tour_title)
	local st = scripted_tour:new(name, end_callback);

	if not st then
		return false;
	end;

	if tour_title and not is_string(tour_title) then
		script_error("ERROR: navigable_tour:new() called but supplied tour title [" .. tostring(tour_title) .. "] is not a string or nil");
		return false;
	end;

	local nt = {};

	nt.name = "navigable_tour_" .. name;

	set_object_class(nt, self, st);

	nt.st = st;
	nt.sections = {};
	nt.start_actions = {};
	nt.end_actions = {};

	-- If we're in campaign then reset this value to use seconds rather than ms
	if core:is_campaign() then
		nt.interval_before_tour_controls_visible = nt.interval_before_tour_controls_visible / 1000;
	end;

	if tour_title then
		nt.tour_title = tour_title;
	end;

	return nt;
end;










----------------------------------------------------------------------------
---	@section Usage
----------------------------------------------------------------------------
--- @desc Once a <code>navigable_tour</code> object has been created with @navigable_tour:new, functions on it may be called in the form showed below. Any functions that are not recognised on the navigable tour are passed through to the @scripted_tour object created internally.
--- @new_example Specification
--- @example <i>&lt;scripted_tour_object&gt;</i>:<i>&lt;function_name&gt;</i>(<i>&lt;args&gt;</i>)
--- @new_example Creation and Usage
--- @example local nt_siege_defence = navigable_tour:new(
--- @example 	"siege_battle_defence",																		-- unique name
--- @example 	end_siege_battle_defence_tour,																-- end callback
--- @example	"ui_text_replacements_localised_text_wh3_main_battle_scripted_tour_siege_defence_name"		-- title
--- @example );
--- @example 
--- @example -- calling a function on the object once created
--- @example nt_siege_defence:set_allow_camera_movement(true);
--- @example 
--- @example -- calling a function on the underlying scripted tour
--- @example -- (the function call is passed through automatically)
--- @example nt_siege_defence:add_validation_rule(
--- @example 	function()
--- @example 		return core:is_battle()
--- @example 	end,
--- @example 	"random_localisation_strings_string_scripted_tour_invalid_not_battle"
--- @example );









----------------------------------------------------------------------------
---	@section Configuration
----------------------------------------------------------------------------


--- @function set_tour_controls_above_infotext
--- @desc Sets the tour controls to appear above the infotext panel in the top-right of the screen. The tour controls panel will also be stretched horizontally to be the same width as the infotext panel.
--- @desc If <code>false</code> is supplied as an argument then the tour controls revert back to being underneath the infotext panel.
--- @p [opt=true] @boolean tour controls above infotext
function navigable_tour:set_tour_controls_above_infotext(value)
	
	if core:is_frontend() then
		script_error("ERROR: set_tour_controls_above_infotext() has been called in the frontend script environment - this is not currently supported");
		return false;
	end;
	
	local uic_under_advisor_docker = find_uicomponent("under_advisor_docker");

	if not uic_under_advisor_docker then
		script_error("ERROR: set_tour_controls_above_infotext() called but uic_under_advisor_docker could not be found? How can this be?");
		return false;
	end;

	local uic_scripted_tour_controls = self:get_scripted_tour_controls_uicomponent();

	if not uic_scripted_tour_controls then
		script_error("ERROR: set_tour_controls_above_infotext() called but uic_scripted_tour_controls could not be found? How can this be?");
		return false;
	end;

	local uic_objectives_docker = find_uicomponent(uic_under_advisor_docker, "scripted_objectives_docker");

	if not uic_objectives_docker then
		script_error("ERROR: set_tour_controls_above_infotext() called but uic_objectives_docker could not be found? How can this be?");
		return false;
	end;

	local uic_infotext = get_infotext_manager():get_infotext_panel();

	local uic_advice = find_uicomponent("advice_interface");
	if uic_advice then
		uic_advice:InterfaceFunction("set_advisor_should_displace_under_advisor_docker", not value);
	end;

	if value == false then
		uic_under_advisor_docker:Adopt(uic_scripted_tour_controls:Address());

		if self.scripted_tour_controls_default_width then
			uic_scripted_tour_controls:Resize(self.scripted_tour_controls_default_width, uic_scripted_tour_controls:Height(), true);
		end;

		if self.infotext_cached_dock_x and self.infotext_cached_dock_y then
			uic_infotext:SetDockOffset(self.infotext_cached_dock_x, self.infotext_cached_dock_y);
		end;

		if self.objectives_cached_dock_x and self.objectives_cached_dock_y then
			uic_infotext:SetDockOffset(self.objectives_cached_dock_x, self.objectives_cached_dock_y);
		end;
	else
		uic_under_advisor_docker:Adopt(uic_scripted_tour_controls:Address(), 0);

		if not uic_infotext then
			script_error("ERROR: set_tour_controls_above_infotext() called but uic_infotext could not be found? How can this be?");
			return false;
		end;

		-- TODO: change this script as it goes wrong the second time around (i.e when a second scripted tour is loaded), and fights with the infotext docking offset caching behaviour in code
		local infotext_dock_x, infotext_dock_y = uic_infotext:GetDockOffset();
		uic_infotext:SetDockOffset(infotext_dock_x, infotext_dock_y + 10);
		self.infotext_cached_dock_x = infotext_dock_x;
		self.infotext_cached_dock_y = infotext_dock_y;

		local objectives_dock_x, objectives_dock_y = uic_objectives_docker:GetDockOffset();
		uic_objectives_docker:SetDockOffset(objectives_dock_x, objectives_dock_y + 10);
		self.objectives_cached_dock_x = objectives_dock_x;
		self.objectives_cached_dock_y = objectives_dock_y;

		self.scripted_tour_controls_default_width = uic_scripted_tour_controls:Width();

		-- Only do this once. Ideally refactor all this in the future.
		core:call_once(
			"scripted_tour_controls_resize",
			function()
				uic_scripted_tour_controls:Resize(uic_infotext:Width(), uic_scripted_tour_controls:Height());
			end
		);
	end;
end;


--- @function set_interval_before_tour_controls_visible
--- @desc Sets the interval at the start of the tour before the tour controls are animated to visible. By default this value is set to 1 second. This value should be set in seconds in campaign, and milliseconds elsewhere.
--- @p @number interval
function navigable_tour:set_interval_before_tour_controls_visible(interval)
	if not validate.is_non_negative_number(interval) then
		return false;
	end;

	self.interval_before_tour_controls_visible = interval;
end;


--- @function set_start_first_section_automatically
--- @desc Sets the scripted tour to start the first section automatically or not. By default, the first section is started automatically. Disable this behaviour with this function if the start action sequence is not of a predetermined length, such as a cutscene that must be dismissed.
--- @desc If the first section is not started automatically then it must be started manually with @navigable_tour:start_next_section.
--- @p [opt=true] @boolean should start automatically
function navigable_tour:set_start_first_section_automatically(value)
	if value == false then
		self.start_first_section_automatically = false;
	else
		self.start_first_section_automatically = true;
	end;
end;


--- @function set_close_button_visible
--- @desc Sets whether the close button should be visible or active for the duration of the tour. By default, the close button is visible and active while the tour is running - use this function to change this behaviour. This setting may be overridden on a tour section-by-section basis using @navigable_tour_section:set_close_button_visible.
--- @p [opt=true] @boolean visible, Close button should be visible for the duration of the tour.
--- @p [opt=true] @boolean active, Close button should be active and interactive for the duration of the tour. If the button is set to be invisible (either with the previous argument or with @navigable_tour_section:set_close_button_visible) then this setting makes no difference.
function navigable_tour:set_close_button_visible(visible, active)
	if visible == false then
		self.close_button_visible = false;
	else
		self.close_button_visible = true;
	end;

	if active == false then
		self.close_button_active = false;
	else
		self.close_button_active = true;
	end;
end;











----------------------------------------------------------------------------
---	@section Start and End Actions
--- @desc Navigable tours contain start and end sequences, to which action callbacks may be added using the functions in this section. These sequences can be zero-length and don't have to contain any actions.
--- @desc The starting sequence is played as the tour is started, and can be used to set up the tour or play a one-time intro sequence. The main tour sequences will start when the start action with the longest interval is called.
--- @desc The end sequence is played as the tour is exited and can be used to play an outro or clean up after the tour. The tour will fully exit when the end action with the longest interval is called.
----------------------------------------------------------------------------


--- @function start_action
--- @desc Adds an action to the navigable tour's starting sequence.
--- @p @function action, Action callback.
--- @p [opt=0] @number action time, Interval after the start of the tour at which to trigger the action. This should be given in seconds in campaign, and milliseconds otherwise.
function navigable_tour:start_action(action, action_time)
	if not is_function(action) then
		script_error(self.name .. " ERROR: start_action() called but supplied action callback [" .. tostring(action) .. "] is not a function");
		return false;
	end;

	if action_time then
		if not is_number(action_time) then
			script_error(self.name .. " ERROR: start_action() called but supplied action time [" .. tostring(action_time) .. "] is not a positive number or nil");
			return false;
		end;
	else
		action_time = 0;
	end;

	if self.st.is_running then
		script_error(self.name .. " ERROR: start_action() called but this tour is already running");
		return false;
	end;

	table.insert(
		self.start_actions,
		{
			action = action,
			action_time = action_time
		}
	);
end;


--- @function end_action
--- @desc Adds an action to the navigable tour's ending sequence.
--- @p @function action, Action callback.
--- @p @function action time, Interval after the start of the tour at which to trigger the action. This should be given in seconds in campaign, and milliseconds otherwise.
function navigable_tour:end_action(action, action_time)
	if not is_function(action) then
		script_error(self.name .. " ERROR: end_action() called but supplied action callback [" .. tostring(action) .. "] is not a function");
		return false;
	end;

	if action_time then
		if not is_number(action_time) then
			script_error(self.name .. " ERROR: end_action() called but supplied action time [" .. tostring(action_time) .. "] is not a positive number or nil");
			return false;
		end;
	else
		action_time = 0;
	end;

	if self.st.is_running then
		script_error(self.name .. " ERROR: end_action() called but this tour is already running");
		return false;
	end;

	table.insert(
		self.end_actions,
		{
			action = action,
			action_time = action_time
		}
	);
end;


-- action override
function navigable_tour:action()
	script_error(self.name .. " WARNING: action() called but this is a navigable tour - actions should not be added directly, but associated with the tour through navigable tour sections. Disregarding this.");
end;











----------------------------------------------------------------------------
---	@section Main Construction
--- @desc The @navigable_tour:add_navigable_section function can be used to add @navigable_tour_section objects to the navigable tour. This is the intended method for building a navigable tour - actions are added to a section, and sections are added to a tour. When the navigable tour is started, the navigable tour sections are added as segments to the underlying @scripted_tour object, should their preconditions pass.
----------------------------------------------------------------------------


--- @function add_navigable_section
--- @desc Adds a @navigable_tour_section to the navigable tour. Navigable tour sections should be added in the order in which they should be shown in game.
--- @p @navigable_tour_section navigable tour section
function navigable_tour:add_navigable_section(section)
	if not is_navigabletoursection(section) then
		script_error(self.name .. " ERROR: add_navigable_section() called but supplied argument [" .. tostring(section) .. "] is not a valid navigable tour section");
		return false;
	end;

	if self.st.is_running then
		script_error(self.name .. " ERROR: add_navigable_section() called but this tour is already running");
		return false;
	end;

	table.insert(self.sections, section);
	section.navigable_tour = self;
end;


-- Internal function to add the actions for a particular tour section when the tour is started
function navigable_tour:add_section_actions_on_start(current_section, current_section_index, num_sections)

	local st = self.st;
	local current_section_name = current_section.name;
	local current_actions = current_section.actions;

	st:action(
		function()
			-- mark this section as playing
			self:mark_section_as_playing(current_section);

			-- clear the current skip actions on this section - these get added during the section's actions
			current_section:reset_skip_actions();

			-- set up the tour counter
			self:set_tour_controls_count(current_section_index, num_sections);

			-- hide all text pointers at the start of each section
			core:hide_all_text_pointers();
		end,
		0,
		current_section_name
	);

	-- enqueue each action within the tour section, and work out which one has the longest interval
	for j = 1, #current_actions do
		local current_action = current_actions[j];
		st:action(current_action.action, current_action.action_time, current_section_name);
	end;

	if current_section.activate_tour_controls_on_start then
		-- if the tour section is set to allow controls on start then enable them when the section begins
		st:action(
			function()
				self:enable_tour_controls_for_current_section();
			end,
			0,
			current_section_name
		);
	else
		-- if the tour section is not set to allow controls on start then add an action to disable them at the start
		st:action(
			function()
				self:disable_tour_controls_buttons(
					not current_section.next_section				-- true if this is the last section, which causes end button to be shown
				);
			end,
			0,
			current_section_name
		);

		-- also append a failsafe action to enable them at the end of the section, if they're not already enabled
		st:append_action(
			function()
				self:enable_tour_controls_for_current_section();
			end,
			current_section_name
		);
	end;
end;












----------------------------------------------------------------------------
---	@section Starting
----------------------------------------------------------------------------


--- @function start
--- @desc Starts the navigable tour.
-- the section_name parameter should not be used externally.
function navigable_tour:start(section_name)

	-- if we have a section name then we just pass that to the underlying scripted tour
	if section_name then
		self.st:start(section_name);
		return;
	end;

	if #self.sections == 0 then
		script_error(self.name .. " ERROR: start() called but this navigable tour contains no sections");
		return false;
	end;

	local valid_sections = {};
	local sections = self.sections;

	self.is_exiting = false;

	-- check section preconditions - sections that pass go into valid_sections
	for i = 1, #sections do
		local current_section = sections[i];

		if #current_section.actions == 0 then
			script_error(self.name .. " ERROR: start() called but navigable tour section [" .. i .. "] (" .. tostring(current_section) .. ") has no actions registered");
			return false;
		end;

		local precondition_result, err_msg = current_section:check_preconditions();

		if precondition_result then
			table.insert(valid_sections, current_section);
		elseif err_msg then
			script_error(self.name .. " WARNING: start() called and the precondition of navigable tour section [" .. i .. "] (" .. tostring(current_section) .. ") failed with the following error: " .. err_msg);
		end;
	end;

	-- if we have no valid sections left then error
	local num_valid_sections = #valid_sections;
	if num_valid_sections == 0 then
		script_error(self.name .. " ERROR: no valid sections remain in this navigable tour after preconditions check");
		return false;
	end;
	
	-- add actions to the underlying scripted tour from all valid sections
	for i = 1, num_valid_sections do
		local current_section = valid_sections[i];

		if i > 1 then
			current_section.previous_section = valid_sections[i - 1];
		end;

		if i < num_valid_sections then
			current_section.next_section = valid_sections[i + 1];
		end;
		
		self:add_section_actions_on_start(current_section, i, num_valid_sections);
	end;
	
	local st = self.st;

	-- add the start sequence for the navigable tour to the underlying scripted tour
	local start_actions = self.start_actions;
	for i = 1, #start_actions do
		local current_action = start_actions[i];
		st:action(current_action.action, current_action.action_time);
	end;

	-- append an action to the starting sequence of the tour to start the first valid section
	if self.start_first_section_automatically then
		st:append_action(function() st:start(valid_sections[1].name) end);
	end;

	self.first_valid_section = valid_sections[1];

	-- add the end sequence for the navigable tour to the underlying scripted tour
	local end_actions = self.end_actions;

	st:action(
		function() 
			-- destroy controls panel
			self:hide_tour_controls();
		end,
		0,
		"end_actions"
	);

	for i = 1, #end_actions do
		local current_action = end_actions[i];
		st:action(current_action.action, current_action.action_time, "end_actions");
	end;

	-- append an action to the ending sequence of the tour to actually end the tour
	st:append_action(
		function()
			-- set all tour sections as not playing
			self:mark_section_as_playing(nil);

			-- complete the tour
			st:complete();
		end, 
		"end_actions"
	);

	-- make the tour controls visible
	st:action(
		function()
			local uic_tour_controls = self:get_scripted_tour_controls_uicomponent();
			
			if (core:is_battle() and bm:is_cinematic_ui_enabled()) or (core:is_campaign() and CampaignUI.IsCinematicModeEnabled()) then
				-- Cinematic UI is enabled, so don't show the controls immediately
				uic_tour_controls:SetVisible(false);
				self.unhide_scripted_tour_controls_when_cinematic_ui_disabled = true;
			else
				-- Cinematic UI is not enabled, go ahead and show the controls
				uic_tour_controls:SetVisible(true);
				uic_tour_controls:TriggerAnimation("show");
			end;			

			-- Start listeners for the cinematic UI being shown/hidden, and hide the tour controls if they are visible
			core:add_listener(
				"navigable_tour_cinematic_ui_listener",
				"CinematicUIEnabled",
				true,
				function()
					if self.uic_scripted_tour_controls then
						self.uic_scripted_tour_controls:SetVisible(false);
						self.unhide_scripted_tour_controls_when_cinematic_ui_disabled = true;
					end;
				end,
				true
			);

			core:add_listener(
				"navigable_tour_cinematic_ui_listener",
				"CinematicUIDisabled",
				true,
				function()
					if self.unhide_scripted_tour_controls_when_cinematic_ui_disabled then
						self.unhide_scripted_tour_controls_when_cinematic_ui_disabled = false;
						self.uic_scripted_tour_controls:SetVisible(true);
						self.uic_scripted_tour_controls:TriggerAnimation("show");
					end;
				end,
				true
			);
		end,
		self.interval_before_tour_controls_visible
	);

	-- start the tour
	st:start();
	
	
	if st.is_running then
		-- Hide the close button
		self:set_tour_close_button_visible(false, false);

		-- set tour title
		if self.tour_title then
			self:set_tour_controls_title(self.tour_title);
		end;
	end;

end;


-- mark a particular section as playing
function navigable_tour:mark_section_as_playing(nts)
	local sections = self.sections;

	for i = 1, #sections do
		local current_section = sections[i];

		-- mark the section as playing if it was the section passed in to this function
		current_section.playing = not not (current_section == nts);
	end;

	self.section_currently_playing = nts;
end;













----------------------------------------------------------------------------
---	@section Playback
--- @desc The functions in this section are for use while the tour is playing.
----------------------------------------------------------------------------


-- Internal function which skips the current section, and start the ending section
function navigable_tour:begin_exit()

	if not self.st.is_running then
		script_error(self.name .. " ERROR: begin_exit() called but this navigable tour is not running");
		return false;
	end;

	if self.is_exiting then
		return;
	end;

	self.is_exiting = true;

	-- skip the current section
	self:skip_current_section(true);

	-- start the end sequence
	self.st:start("end_actions");
end;


-- Internal function to activate the tour controls (called during playback of each section)
function navigable_tour:enable_tour_controls_for_current_section()
	if not self.st.is_running then
		script_error(self.name .. " ERROR: enable_tour_controls_for_current_section() called but tour is not running");
		return false;
	end;

	if self.scripted_tour_controls_next_button_active then
		-- controls are already enabled
		return;
	end;

	local current_section = self.section_currently_playing;

	-- set up state of next button
	if current_section.next_section then
		self:set_tour_controls_next_button_state(
			true, 
			function()
				self:start_next_section();
			end
		);
	else
		self:set_tour_controls_next_button_state(
			true, 
			function()
				-- skip the tour as a whole
				self:begin_exit();
			end,
			true				-- show the end button rather than next button
		);
	end;

	-- set up state of previous button
	if current_section.previous_section then
		self:set_tour_controls_back_button_state(
			true, 
			function()
				self:start_previous_section();
			end
		);
	end;

	-- set up close button state
	local close_button_visible = self.close_button_visible;
	if is_boolean(current_section.close_button_visible_override) then
		close_button_visible = current_section.close_button_visible_override;
	end;

	local close_button_active = self.close_button_active;
	if is_boolean(current_section.close_button_active_override) then
		close_button_active = current_section.close_button_active_override;
	end;

	self:set_tour_close_button_visible(close_button_visible, close_button_active);

	-- always hide infotext close button
	self:set_infotext_close_button_visible(false);
end;


--- @function next_section_exists
--- @desc Returns whether a section exists after the section currently playing. If no next section exists, or the navigable tour is not currently playing, then <code>false</code> is returned.
--- @desc If this function returns <code>true</code>, then @navigable_tour:start_next_section can safely be called.
--- @r @boolean next section exists
function navigable_tour:next_section_exists()
	local current_section = self.section_currently_playing;
	if self.st.is_running and current_section and current_section.next_section then
		return true;
	end;

	return false;
end;


--- @function start_next_section
--- @desc Cause the navigable tour to skip to the next section. If the start actions are being played then the first section of the tour is started.
function navigable_tour:start_next_section()
	if not self.st.is_running then
		script_error(self.name .. " ERROR: start_next_section() called but tour is not running");
		return false;
	end;

	local current_section = self.section_currently_playing;

	if current_section then
		if not current_section.next_section then
			script_error(self.name .. " WARNING: start_next_section() called but current section with name " .. current_section.name .. " has no next section, disregarding");
			return false;
		end;

		-- skip the current section
		self:skip_current_section(false, false);
	
		-- start the next section of the tour
		self:start(current_section.next_section.name);
		
	elseif self.first_valid_section then
		-- assume we're playing the start actions, and start the first section
		self:start(self.first_valid_section.name);
	else
		script_error(self.name .. " ERROR: start_next_section() called but current section could not be determined, how can this be?");
		return false;
	end;
end;


--- @function previous_section_exists
--- @desc Returns whether a section exists before the section currently playing. If no prior section exists, or the navigable tour is not currently playing, then <code>false</code> is returned.
--- @desc If this function returns <code>true</code>, then @navigable_tour:start_previous_section can safely be called.
--- @r @boolean previous section exists
function navigable_tour:previous_section_exists()
	local current_section = self.section_currently_playing;
	if self.st.is_running and current_section and current_section.previous_section then
		return true;
	end;

	return false;
end;


--- @function start_previous_section
--- @desc Cause the navigable tour to skip to the previous section.
function navigable_tour:start_previous_section()
	if not self.st.is_running then
		script_error(self.name .. " ERROR: start_previous_section() called but tour is not running");
		return false;
	end;

	local current_section = self.section_currently_playing;

	if not current_section then
		script_error(self.name .. " ERROR: start_previous_section() called but current section could not be determined, how can this be?");
		return false;
	end;

	if not current_section.previous_section then
		script_error(self.name .. " WARNING: start_previous_section() called but current section with name " .. current_section.name .. " has no previous section, disregarding");
		return false;
	end;

	-- skip the current section
	self:skip_current_section(false, true);

	-- start the previous section of the tour
	self:start(current_section.previous_section.name);
end;


-- Internal function to skip/complete the section currently playing
function navigable_tour:skip_current_section(is_tour_ending, is_skipping_backwards)
	local current_section = self.section_currently_playing;

	if not current_section then
		script_error(self.name .. " ERROR: skip_current_section() called but section is currently playing");
		return;
	end;

	-- remove any additional actions related to this sequence
	self.st:complete_sequence(current_section.name);

	-- call skip actions
	current_section:call_skip_actions(is_tour_ending, is_skipping_backwards);
end;


--- @function get_scripted_tour_controls_uicomponent
--- @desc Gets the scripted tour controls panel, creating it if it doesn't already exist. This is mainly for internal use but could feasibly be called externally.
--- @p [opt=false] @boolean do not create, Do not create - if set to <code>true</code>, the tour controls are not created if they do not already exist.
--- @r @uicomponent tour controls
function navigable_tour:get_scripted_tour_controls_uicomponent(do_not_create)

	if self.uic_scripted_tour_controls or do_not_create then
		return self.uic_scripted_tour_controls;
	end;

	if not self.st.is_running then
		script_error(self.name .. " ERROR: get_scripted_tour_controls_uicomponent() called but tour is not running");
		return false;
	end;

	local uic_scripted_tour_controls = core:get_or_create_component("scripted_tour_controls", "UI/Common UI/scripted_tour_controls.twui.xml");

	if not (uic_scripted_tour_controls and uic_scripted_tour_controls:IsValid()) then
		script_error(self.name .. "ERROR: get_scripted_tour_controls_uicomponent() could not create scripted tour controls? How can this be?");
		return false;
	end;
	
	-- attach the controls to the scripted objectives docker
	local uic_scripted_objectives_docker = find_uicomponent("scripted_objectives_docker");
	if uic_scripted_objectives_docker then
		uic_scripted_objectives_docker:Adopt(uic_scripted_tour_controls:Address());
	else
		script_error(self.name .. " ERROR: get_scripted_tour_controls_uicomponent() could not find scripted objectives docker uicomponent? How can this be? The scripted objective controls will be undocked");
	end;

	-- if we have an interval before tour controls should be visible then make the tour controls transparent initially
	if self.interval_before_tour_controls_visible > 0 then
		uic_scripted_tour_controls:SetVisible(false);
	end;

	self.uic_scripted_tour_controls = uic_scripted_tour_controls;

	core:add_listener(
		"scripted_tour_skip_button",
		"ComponentLClickUp",
		function(context)
			return context.string == "button_close" and uicomponent_descended_from(UIComponent(context.component), "scripted_tour_controls");
		end,
		function()
			-- skip the tour as a whole
			self:begin_exit();
		end,
		false
	);

	return uic_scripted_tour_controls;
end;


-- Internal function to set the title of the tour
function navigable_tour:set_tour_controls_title(key)
	find_uicomponent(self:get_scripted_tour_controls_uicomponent(), "scripted_tour_title"):SetStateText(common.get_localised_string(key), key);
end;


-- Internal function to set the progress counter
function navigable_tour:set_tour_controls_count(current, total)
	find_uicomponent(self:get_scripted_tour_controls_uicomponent(), "scripted_tour_progress_label"):SetStateText(current .. " / "  .. total, "from script - navigable_tour:set_tour_controls_count()");
end;


-- Internal function to disable all tour controls, called at the start of each section
function navigable_tour:disable_tour_controls_buttons(use_end_button)
	self:set_tour_controls_back_button_state(false);
	self:set_tour_controls_next_button_state(false, nil, use_end_button);
end;

-- Internal function to set the infotext close button visible state
function navigable_tour:set_infotext_close_button_visible(visible)
	local uic_confirm_button = core:get_ui_root():SequentialFind("maximised_button_docker" , "button_close")
	if uic_confirm_button then
		uic_confirm_button:SetVisible(not not visible)
	end;
end;


-- Internal function to set the tour close button visible/active state
function navigable_tour:set_tour_close_button_visible(visible, active)
	local uic_close_button = find_uicomponent(self:get_scripted_tour_controls_uicomponent(), "button_close");
	if uic_close_button then
		uic_close_button:SetVisible(not not visible);
		set_component_active_action(not not active, uic_close_button);
	end;
end;


-- Internal function to set the back button state - whether it's active, and what it does if pressed
function navigable_tour:set_tour_controls_back_button_state(active, callback)
	if active and not callback then
		script_error(self.name .. " WARNING: set_tour_controls_back_button_state() has been instructed to set the back button to be active but no callback was specified - the back button will not made active");
		return false;
	end;

	core:remove_listener("scripted_tour_back_button");

	local uic_back_button = find_uicomponent(self:get_scripted_tour_controls_uicomponent(), "scripted_tour_prev_button");
	if not uic_back_button then
		script_error(self.name .. " ERROR: set_tour_controls_back_button_state() could not find scripted_tour_prev_button uicomponent - how can this be?");
		return false;
	end;

	if active then
		core:add_listener(
			"scripted_tour_back_button",
			"ComponentLClickUp",
			function(context)
				return context.string == "scripted_tour_prev_button"
			end,
			function()
				self:set_tour_controls_next_button_highlight(false);
				callback();
			end,
			true
		);

		uic_back_button:SetState("active");
	else
		uic_back_button:SetState("inactive");
	end;

	self.scripted_tour_controls_back_button_active = active;
end;


-- Internal function to set the next button state - whether it's active, and what it does if pressed, and whether to actually use the 'end' button (i.e. on last section of tour)
function navigable_tour:set_tour_controls_next_button_state(active, callback, use_end_button)
	if active and not callback then
		script_error(self.name .. " ERROR: set_tour_controls_next_button_state() has been instructed to set the next button to be active but no callback was specified");
		return false;
	end;

	core:remove_listener("scripted_tour_next_button");

	local uic_next_button = find_uicomponent(self:get_scripted_tour_controls_uicomponent(), "scripted_tour_next_button");
	if not uic_next_button then
		script_error(self.name .. " ERROR: set_tour_controls_next_button_state() could not find scripted_tour_next_button uicomponent - how can this be?");
		return false;
	end;

	local uic_end_button = find_uicomponent(self:get_scripted_tour_controls_uicomponent(), "scripted_tour_end_button");
	if not uic_end_button then
		script_error(self.name .. " ERROR: set_tour_controls_next_button_state() could not find scripted_tour_end_button uicomponent - how can this be?");
		return false;
	end;

	local active_button_name;
	local uic_active_button;

	if use_end_button then
		uic_next_button:SetVisible(false);
		uic_end_button:SetVisible(true);
		active_button_name = "scripted_tour_end_button";
		uic_active_button = uic_end_button;
		self.scripted_tour_controls_end_button_replacing_next = true;
	else
		uic_next_button:SetVisible(true);
		uic_end_button:SetVisible(false);
		active_button_name = "scripted_tour_next_button";
		uic_active_button = uic_next_button;
		self.scripted_tour_controls_end_button_replacing_next = false;
	end;

	if active then
		core:add_listener(
			"scripted_tour_next_button",
			"ComponentLClickUp",
			function(context)
				return context.string == active_button_name
			end,
			function(context)
				self:set_tour_controls_next_button_highlight(false, UIComponent(context.component));
				callback();
			end,
			true
		);

		uic_active_button:SetState("active");
	else
		uic_active_button:SetState("inactive");
	end;

	self.scripted_tour_controls_next_button_active = active;
end;


-- Internal function to set the highlight state of the next/end button (whichever is being used)
function navigable_tour:set_tour_controls_next_button_highlight(active, uic_button)
	if not uic_button then
		if self.scripted_tour_controls_end_button_replacing_next then
			uic_button = find_uicomponent(self:get_scripted_tour_controls_uicomponent(), "scripted_tour_end_button");
		else
			uic_button = find_uicomponent(self:get_scripted_tour_controls_uicomponent(), "scripted_tour_next_button");
		end;
	end;

	if uic_button then
		uic_button:Highlight(not not active, NAVIGABLE_TOUR_PROGRESS_BUTTONS_ARE_SQUARE);
	end;
end;


-- Internal function to hide/clean up the tour controls panel. Called when navigable tour begins its exit sequence
function navigable_tour:hide_tour_controls(immediate)
	if not self.uic_scripted_tour_controls then
		return;
	end;

	core:remove_listener("scripted_tour_next_button");
	core:remove_listener("scripted_tour_back_button");
	core:remove_listener("scripted_tour_skip_button");
	core:remove_listener("navigable_tour_cinematic_ui_listener");

	self.unhide_scripted_tour_controls_when_cinematic_ui_disabled = false;

	-- remove me
	immediate = true;

	if immediate then
		self.uic_scripted_tour_controls:Destroy();
	else
		self.uic_scripted_tour_controls:TriggerAnimation("hide");
	end;

	self.uic_scripted_tour_controls = false;
end;

--- @function cache_and_set_scripted_tour_controls_priority
--- @desc Sets the priority to the supplied value, and caches the value previously set. The scripted tour controls priority can later be restored with <code>restore_scripted_tour_controls_priority</code>.
--- @desc The register_topmost flag can also be set to force the scripted tour controls to topmost.
function navigable_tour:cache_and_set_scripted_tour_controls_priority(new_priority, register_topmost)
	if not is_number(new_priority) then
		script_error("ERROR: cache_and_set_scripted_tour_controls_priority() called but supplied priority [" .. tostring(new_priority) .."] is not a number");
		return false;
	end;
	
	local uic_scripted_tour_controls = self:get_scripted_tour_controls_uicomponent()

	-- cache the current scripted tour controls priority and set it to its new value
	if uic_scripted_tour_controls then

		self.cached_scripted_tour_controls_priority = uic_scripted_tour_controls:Priority()
		uic_scripted_tour_controls:PropagatePriority(new_priority);
		
		if register_topmost then
			uic_scripted_tour_controls:RegisterTopMost();
			self.cached_scripted_tour_controls_topmost = true;
		end;
	end
	
end;


--- @function restore_scripted_tour_controls_priority
--- @desc Restores the scripted tour controls priority to a value previously cached with <code>cache_and_set_scripted_tour_controls_priority</code>.
function navigable_tour:restore_scripted_tour_controls_priority()
	if self.cached_scripted_tour_controls_priority == -1 then
		script_error("WARNING: restore_scripted_tour_controls_priority() called but scripted tour priority hasn't been previously cached with cache_and_set_scripted_tour_controls_priority() - be sure to call that first");
		return false;
	end;
	
	local uic_scripted_tour_controls = self:get_scripted_tour_controls_uicomponent(true); 		-- do not recreate the tour controls if they don't already exist

	if uic_scripted_tour_controls then
		
		if self.cached_scripted_tour_controls_topmost then
			self.cached_scripted_tour_controls_topmost = false;
			uic_scripted_tour_controls:RemoveTopMost();
		end;
	
		uic_scripted_tour_controls:PropagatePriority(self.cached_scripted_tour_controls_priority)
	end;
	
end














----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--
--	NAVIGABLE TOUR SECTIONS
--
--- @c navigable_tour_section Navigable Tour Section
--- @page navigable_tour
--- @desc A navigable tour section is a container for action callbacks that occur during a section of a @navigable_tour. A navigable tour is wrapper for a @scripted_tour, and a navigable tour section represents a scripted tour segment. Declaring navigable tour sections, loading them with actions, and then adding them to a navigable tour is the route by which actions get added to a navigable tour.
--- @desc Navigable tour sections can be reused between different navigable tours.
--
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------


navigable_tour_section = {
	--[[
		preconditions = {},									-- preconditions which must be passed if section is to be added to tour
		actions = {},										-- actions to perform during tour section
		skip_actions = {},									-- actions to perform if this tour section is skipped
	]]
	name = false,											-- unique name for this section
	navigable_tour = false,									-- link to the parent navigable tour
	playing = false,										-- is this navigable tour section playing right now
	activate_tour_controls_on_start = false,				-- this tour section should activate the tour controls (allow next/prev to be clicked) immediately
	previous_section = false,								-- the previous section in the tour - this is set by the tour itself when started
	next_section = false,									-- the next section in the tour - this is set by the tour itself when started
	next_button_highlight_previously_shown = false,			-- has the button highlight for the next button been shown this session? This is not saved between sessions
	close_button_visible_override = nil,					-- override for whether the close button is visible
	close_button_active_override = nil,						-- override for whether the close button is active
	__add_objective_interval = 4000							-- period after which an objective should be added when using a factory function. Not key to the core workings of the navigable tour but is used by client scripts
};


set_class_custom_type(navigable_tour_section, TYPE_NAVIGABLE_TOUR_SECTION);
set_class_tostring(
	navigable_tour_section, 
	function(obj)
		return TYPE_NAVIGABLE_TOUR_SECTION .. "_" .. obj.name
	end
);









----------------------------------------------------------------------------
--- @section Creation
----------------------------------------------------------------------------


--- @function new
--- @desc Creates and returns a new navigable tour section.
--- @p @string name
--- @p [opt=false] @boolean activate controls, Activate scripted tour controls on start of this navigable tour section. Setting this to <code>true</code> means that the tour next/prev buttons will be active as soon as this tour section starts. In this case @navigable_tour_section:activate_tour_controls does not need to be called within a tour action.
--- @r @navigable_tour_section navigable tour section
function navigable_tour_section:new(name, activate_tour_controls_on_start)
	if not is_string(name) then
		script_error("ERROR: navigable_tour_section:new() called but supplied name [" .. tostring(name) .. "] is not a string");
		return false;
	end;

	local nts = {};

	nts.name = "navigable_tour_section_" .. name;
	
	set_object_class(nts, self);

	nts.preconditions = {};
	nts.actions = {};
	nts.skip_actions = {};

	nts.activate_tour_controls_on_start = not not activate_tour_controls_on_start;
	
	return nts;
end;









----------------------------------------------------------------------------
--- @section Configuration
----------------------------------------------------------------------------


--- @function set_close_button_visible
--- @desc Sets whether the close button should be visible or active for this tour section. By default, the close button is visible and active while the tour is running - this function may be used to change this behaviour.
--- @desc This per-section setting overrides the tour-wide setting set with @navigable_tour:set_close_button_visible.
--- @p [opt=true] @boolean visible, Close button should be visible while the section is playing.
--- @p [opt=true] @boolean active, Close button should be active and interactive while the section is playing. If the button is set to be invisible with the previous argument then this setting makes no difference.
function navigable_tour_section:set_close_button_visible(visible, active)
	if visible == false then
		self.close_button_visible_override = false;
	else
		self.close_button_visible_override = true;
	end;

	if active == false then
		self.close_button_active_override = false;
	else
		self.close_button_active_override = true;
	end;
end;


--- @function add_precondition
--- @desc Adds a precondition check to be called when the navigable tour is started. The supplied function will be called and, should it return <code>nil</code> or <code>false</code>, the section will <strong>not</strong> be added to the navigable tour.
--- @desc If an optional error message string is added with the precondition then a script error displaying that message will be triggered should the precondition not pass.
--- @p @function callback, Precondition callback. 
--- @p [opt=nil] @string error message, Error message to display should the precondition fail. If no error message is supplied then no error is triggered.
function navigable_tour_section:add_precondition(callback, error_msg_on_failure)
	if not is_function(callback) then
		script_error(self.name .. " ERROR: add_precondition() called but supplied callback [" .. tostring(callback) .. "] is not a function");
		return false;
	end;

	if error_msg_on_failure and not is_string(error_msg_on_failure) then
		script_error(self.name .. " ERROR: add_precondition() called but supplied error message [" .. tostring(error_msg_on_failure) .. "] is not a string or nil");
		return false;
	end;

	table.insert(
		self.preconditions, 
		{
			callback = callback,
			error_msg_on_failure = error_msg_on_failure
		}
	);
end;


-- local function to check all preconditions prior to adding this tour
function navigable_tour_section:check_preconditions()
	local preconditions = self.preconditions;
	for i = 1, #preconditions do
		if not preconditions[i].callback() then
			return false, preconditions[i].error_msg_on_failure;
		end;
	end;
	return true;
end;


--- @function action
--- @desc Adds an action to be triggered while the navigable tour section is playing. Actions are added with an interval, which is the time after the start of the section that the action should occur.
--- @p function callback, Callback function to call.
--- @p number interval, Interval after the navigable tour section starts at which the specified action should be triggered. This should be given in seconds in campaign, and in ms in battle and the frontend.
function navigable_tour_section:action(action, action_time)
	if not is_function(action) then
		script_error(self.name .. " ERROR: action() called but supplied action callback [" .. tostring(action) .. "] is not a function");
		return false;
	end;

	if not is_number(action_time) or action_time < 0 then
		script_error(self.name .. " ERROR: action() called but supplied action time [" .. tostring(number) .. "] is not a number");
		return false;
	end;

	table.insert(
		self.actions,
		{
			action = action,
			action_time = action_time
		}
	);
end;











----------------------------------------------------------------------------
--- @section Playback Controls
--- @desc The functions in this section should only be called from within a callback registered to @navigable_tour_section:action, so that they are only called while the navigable tour section is actively playing.
----------------------------------------------------------------------------


-- Local function to call current skip actions
function navigable_tour_section:call_skip_actions(is_tour_ending, is_skipping_backwards)

	local skip_actions = self.skip_actions;
	local skip_actions_copy = {};
	
	for i = 1, #skip_actions do
		skip_actions_copy[i] = skip_actions[i];
	end;
	
	for i = 1, #skip_actions_copy do
		skip_actions_copy[i].skip_action(is_tour_ending, is_skipping_backwards);
	end;
end;


-- Local function to reset current skip actions when the section begins to play
function navigable_tour_section:reset_skip_actions()
	if not self.playing then
		script_error(self.name .. " ERROR: reset_skip_actions() called but this navigable tour section isn't currently playing - this shouldn't happen");
		return false;
	end;

	self.skip_actions = {};
end;


--- @function add_skip_action
--- @desc Adds a skip action for this navigable tour section. Navigable tour sections should use skip callbacks to clean up after themselves. The skip action will be called when this section of the tour is skipped by the player during playback, either by navigating forwards or backwards to other tour sections or by closing the tour. Two @boolean argument will be passed to the skip action function - the first, if <code>true</code>, indicates that the entire tour is ending, and the second, if <code>true</code> indicates that the tour is being skipped backwards rather than forwards.
--- @desc Skip actions may be added with an optional name, by which they be later removed.
--- @desc This function should only be called from within an action when the tour section is running.
--- @p @function skip action
--- @p [opt=nil] @string action name
function navigable_tour_section:add_skip_action(skip_action, name)
	if not self.playing then
		script_error(self.name .. " ERROR: add_skip_action() called but this navigable tour section isn't currently playing");
		return false;
	end;

	if not is_function(skip_action) then
		script_error(self.name .. " ERROR: add_skip_action() called but supplied skip callback [" .. tostring(skip_action) .. "] is not a function");
		return false;
	end;

	if name and not is_string(name) then
		script_error(self.name .. " ERROR: add_skip_action() called but supplied skip callback name [" .. tostring(name) .. "] is not a string");
		return false;
	end;

	table.insert(
		self.skip_actions,
		{
			skip_action = skip_action,
			name = name
		}
	);
end;


--- @function remove_skip_action
--- @desc Immediately removes any skip actions from this navigable tour section with the supplied name. This should only be called during an action within the tour section.
--- @p @string action name
function navigable_tour_section:remove_skip_action(name)
	if not self.playing then
		script_error(self.name .. " ERROR: remove_skip_action() called but this navigable tour section isn't currently playing");
		return false;
	end;

	if not is_string(name) then
		script_error(self.name .. " ERROR: remove_skip_action() called but supplied skip callback name [" .. tostring(name) .. "] is not a string");
		return false;
	end;

	local skip_actions = self.skip_actions;
	for i = #skip_actions, 1, -1 do
		if skip_actions[i].name == name then
			table.remove(skip_actions, i);
		end;
	end;
end;


--- @function activate_tour_controls
--- @desc Activates the tour control panel during playback of the navigable tour section. This should only be called during an action within the tour section.
--- @desc If the activate-controls flag is not set when @navigable_tour_section:new is called, as is the default behaviour, then the tour controls will remain inactive until this function is called during playback. If the last action in the tour section is called and the controls are still not active then this function will be called automatically. This failsafe behaviour prevents a situation where a section is playing and the tour controls never become active, but it should probably be avoided by either calling this function directly during an action within the section or setting the appropriate flag when calling @navigable_tour_section:new.
function navigable_tour_section:activate_tour_controls()
	if not self.playing then
		script_error(self.name .. " WARNING: activate_tour_controls() called but this navigable tour section isn't currently playing");
		return false;
	end;

	self.navigable_tour:enable_tour_controls_for_current_section();
end;


--- @function highlight_next_button
--- @desc Highlights the next (or finish) button on the navigable tour controls during playback. This should only be called during an action within the tour section.
function navigable_tour_section:highlight_next_button()
	if not self.playing then
		script_error(self.name .. " WARNING: highlight_next_button() called but this navigable tour section isn't currently playing");
		return false;
	end;

	if self.next_button_highlight_previously_shown then
		return;
	end;

	self.next_button_highlight_previously_shown = true;

	self.navigable_tour:set_tour_controls_next_button_highlight(true);
end;


--- @function is_playing
--- @desc Is this navigable tour section playing right now.
--- @r @boolean is playing
function navigable_tour_section:is_playing()
	return self.playing;
end;
