
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--
--	CAMPAIGN CUTSCENES
--
---	@set_environment campaign
---	@class campaign_cutscene Campaign Cutscenes
--- @desc The campaign cutscene library provides an interface for the relatively easy creation and setup of scripted cutscenes in campaign. A cutscene object is first declared with @campaign_cutscene:new, configured with the variety of configuration commands available, loaded with actions (things that happen within the cutscene) using repeated calls to @campaign_cutscene:action, and finally started with @campaign_cutscene:start to start the visual cutscene itself. Each campaign cutscene object represents an individual cutscene.
--- @desc See also the @"campaign_manager:Camera Movement" functions on the campaign manager, which allow the camera to be scrolled within a cutscene without having to manually set up a campaign cutscene object.
--
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------



campaign_cutscene = {
	name = "",
	cutscene_length = 0,
	action_list = {},
	cinematic_triggers = {},
	skip_callback = nil,
	is_debug = false,
	is_skippable = true,
	is_running = false,
	is_skipped = false,
	wait_offset = 0,
	skip_callback = nil,
	end_callback = nil,
	advisor_wait = false,
	skip_cam_x = false,
	skip_cam_y = false,
	skip_cam_d = false,
	skip_cam_b = false,
	skip_cam_h = false,
	restore_cam_time = -1,
	restore_cam_x = false,
	restore_cam_y = false,
	restore_cam_d = false,
	restore_cam_b = false,
	restore_cam_h = false,
	dismiss_advice_on_end = true,
	disable_settlement_labels = true,
	neighbouring_regions_visible = false,
	use_cinematic_borders = true,
	do_not_end = false,
	do_not_skip_on_next_advice_dismissal = false,
	call_end_callback_when_skipped = true,
	disable_shroud = false,
	playing_cindy_camera = false,
	event_panels_enabled = true,
	restore_shroud = true,
	enable_ui_hiding_on_release = true,
	should_send_recieve_metrics_data = false,
	cindy_scene = false,
	cindy_scene_blend_in_duration = 0,
	cindy_scene_blend_out_duration = 0,
	cindy_scene_start_fade_to_picture_duration = false,
	pre_cindyscene_fade_to_black_duration = 0,
	pre_cindyscene_hold_on_black_duration = 0,
	should_fade_on_skip = nil,						-- If this is nil then the default behaviour is used - the cutscene fades if a cindyscene is playing, but not if a cindyscene is not playing
	hold_on_black_duration_on_skip = 0.5,
	fade_to_picture_duration_on_skip = 0.5,
	should_play_sound_on_cindyscene_start = true,
	should_play_sound_on_finish = true,
	should_play_sound_on_skip = true,
	game_saving_was_disabled_before_start = true
};


-- set campaign_cutscene to be of custom type TYPE_CAMPAIGN_CUTSCENE, with a custom tostring() response
set_class_custom_type(campaign_cutscene, TYPE_CAMPAIGN_CUTSCENE);
set_class_tostring(
	campaign_cutscene, 
	function(obj)
		return TYPE_CAMPAIGN_CUTSCENE .. "_" .. obj.name
	end
);



----------------------------------------------------------------------------
--- @section Creation
----------------------------------------------------------------------------


--- @function new
--- @desc Creates a cutscene object. A cutscene must be given a unique string name, a length in seconds and optionally an end callback.
--- @p @string name, Unique name for the cutscene.
--- @p [opt=nil] @number duration, Cutscene duration in seconds. If nil or 0 is specified then the cutscene will be set to not end, and will only finish when skipped by the player or ended by an external process - see @campaign_cutscene:set_do_not_end.
--- @p [opt=nil] function end callback, End callback.
--- @return campaign_cutscene cutscene object
function campaign_cutscene:new(name, length, end_callback, send_metrics_data)

	send_metrics_data = send_metrics_data or false;

	-- type-check our parameters
	if not is_string(name) then
		script_error("ERROR: tried to create a campaign_cutscene but supplied name [" .. tostring(name) .."] is not a string");
		return false;
	end;
	
	local full_name = "Campaign_Cutscene_" .. name;
	
	if length then
		if length == 0 then
			length = nil;
		elseif not is_number(length) or length < 0 then
			script_error(full_name .. " ERROR: tried to create a campaign_cutscene but supplied length [" .. tostring(length) .. "] is not a number, 0 or nil");
			return false;
		end;
	end;
	
	if not is_function(end_callback) and not is_nil(end_callback) then
		script_error(full_name .. " ERROR: tried to create a campaign_cutscene but supplied end callback [" .. tostring(end_callback) .. "] is not a function or nil");
		return false;
	end;
		
	local cc = {};
	
	-- set 'cc' to derive from self ('campaign_cutscene')
	set_object_class(cc, self);
	
	cc.name = full_name;

	-- if a length has not been supplied then set this cutscene to only end when skipped
	if length then
		cc.cutscene_length = length;
	else
		cc.do_not_end = true;
	end;

	cc.end_callback = end_callback;
	cc.should_send_recieve_metrics_data = send_metrics_data;
	
	cc.action_list = {};
	cc.cinematic_triggers = {};
	
	return cc;
end;


--- @function new_from_cindyscene
--- @desc Creates a cutscene object that is bound to a cindyscene. When started, the scripted cutscene will automatically start the cindyscene, and will terminate when the cindyscene ends.
--- @p @string name, Unique name for the cutscene.
--- @p [opt=nil] @function end callback, End callback.
--- @p @string cindy scene, Cindy scene path.
--- @p [opt=0] @number blend in, Blend in time, in seconds. This is passed to the call to @cinematics:cindy_playback when the cindyscene is started.
--- @p [opt=10] @number blend out, Blend out time, in seconds. This is passed to the call to @cinematics:cindy_playback when the cindyscene is started.
--- @p [opt=false] @number fade duration, Fade to picture duration, in seconds. If a number value is supplied, a fade to picture action will be performed when the cindyscene is started, over the given duration. If @nil is supplied then no fade-to-picture action is performed.
-- send_metrics_data hidden parameter
--- @return campaign_cutscene cutscene object
function campaign_cutscene:new_from_cindyscene(name, end_callback, cindy_scene, blend_in_duration, blend_out_duration, fade_to_picture_duration, send_metrics_data)

	if not is_string(cindy_scene) then
		script_error("ERROR: campaign_cutscene:new_from_cindyscene() called but supplied cindy scene path [" .. tostring(cindy_scene) .. "] is not a string");
		return false;
	end;

	if fade_to_picture_duration and not validate.is_non_negative_number(fade_to_picture_duration) then
		return false;
	end;

	local cc = campaign_cutscene:new(
		name,
		nil,
		end_callback,
		send_metrics_data
	);

	if not cc then
		return false;
	end;

	cc.cindy_scene = cindy_scene;
	cc.cindy_scene_blend_in_duration = blend_in_duration or 0;
	cc.cindy_scene_blend_out_duration = blend_out_duration or 10;
	cc.cindy_scene_start_fade_to_picture_duration = fade_to_picture_duration or false;
	
	return cc;
end;











----------------------------------------------------------------------------
---	@section Usage
--- @desc Once a cutscene object has been created with @campaign_cutscene:new, functions on it may be called using the following form.
--- @new_example Specification
--- @example <i>&lt;cutscene_object&gt;</i>:<i>&lt;function_name&gt;</i>(<i>&lt;args&gt;</i>)
--- @new_example Creation and Usage
--- @example local cutscene_intro = campaign_cutscene:new(
--- @example 	"intro",
--- @example 	48,
--- @example 	function() intro_cutscene_has_ended() end
--- @example )
--- @example cutscene_intro:set_debug(true)				-- calling a function on the object once created
----------------------------------------------------------------------------






----------------------------------------------------------------------------
--- @section Debug
----------------------------------------------------------------------------


--- @function set_debug
--- @desc Sets the cutscene into debug mode for more output.
--- @p [opt=true] boolean set debug
function campaign_cutscene:set_debug(is_debug)
	if is_debug == nil then
		self.is_debug = true;
	else
		self.is_debug = is_debug;
	end;
end;


--- @function set_debug_all
--- @desc Sets all campaign cutscenes into debug mode for more output.
--- @p [opt=true] boolean set debug
function campaign_cutscene:set_debug_all(is_debug)
	cm:set_campaign_cutscene_debug(is_debug);
end;










----------------------------------------------------------------------------
--- @section Configuration and Querying
----------------------------------------------------------------------------


--- @function set_skippable
--- @desc Sets whether the cutscene should be skippable or not, and also allows the optional specification of a callback to be called if the cutscene is skipped. Note that if a skip callback and end callback are both set, both will be called (in that order).
--- @p [opt=true] boolean set skippable
--- @p [opt=nil] function skip callback
function campaign_cutscene:set_skippable(skippable, callback)
	if value == nil then
		self.is_skippable = true;
	else
		self.is_skippable = skippable;
	end;
	
	if is_function(callback) then
		self.skip_callback = callback;
	end;
end;



--- @function set_dismiss_advice_on_end
--- @desc Sets whether the dismiss the advisor at the end of the cutscene. By default the advisor is skipped - use this function to disable this behaviour.
--- @p [opt=true] boolean dismiss advice
function campaign_cutscene:set_dismiss_advice_on_end(value)
	if value == false then
		self.dismiss_advice_on_end = false;
	else
		self.dismiss_advice_on_end = true;
	end;
end;


--- @function set_do_not_end
--- @desc Sets the cutscene to not terminate once its duration is reached. If this is enabled, the cutscene can only be ended by being skipped or by being terminated by external script.
--- @p [opt=true] boolean do not end
function campaign_cutscene:set_do_not_end(value)
	if value == false then
		self.do_not_end = false;
	else
		self.do_not_end = true;
	end;
end;


--- @function set_use_cinematic_borders
--- @desc Sets the cutscene to show cinematic borders whilst playing, or not. Cutscenes by default will show cinematic borders - use this function to disable this behaviour.
--- @p [opt=true] boolean show borders
function campaign_cutscene:set_use_cinematic_borders(value)
	if value == false then
		self.use_cinematic_borders = false;
	else
		self.use_cinematic_borders = true;
	end;
end;


--- @function set_disable_settlement_labels
--- @desc Tells the cutscene whether to show settlement labels while playing or not. Cutscenes by default will hide settlement labels - use this function to disable this behaviour.
--- @p [opt=true] boolean disable labels
function campaign_cutscene:set_disable_settlement_labels(value)
	if value == false then
		self.disable_settlement_labels = false;
	else
		self.disable_settlement_labels = true;
	end;
end;


--- @function set_neighbouring_regions_visible
--- @desc Tells the cutscene whether to make neighbouring regions visible or not. Cutscenes by default will not do this - use this function to enable this behaviour if required. The 'neighbouring' regions in this case are those regions adjacent to the regions currently unshrouded.
--- @desc Setting this property to true also enables the shroud.
--- @p [opt=true] boolean disable labels
function campaign_cutscene:set_neighbouring_regions_visible(value)
	if value == false then
		self.neighbouring_regions_visible = false;
	else
		self.neighbouring_regions_visible = true;
		self.disable_shroud = false;
	end;
end;


--- @function set_should_play_sound_on_cindyscene_start
--- @desc Tells the cutscene whether to play a sound at the start of a cindyscene
--- @p [opt=true] boolean enable sound on cindyscene start
function campaign_cutscene:set_should_play_sound_on_cindyscene_start(enable)
	if enable == false then
		self.should_play_sound_on_cindyscene_start = false;
	else
		self.should_play_sound_on_cindyscene_start = true
	end;
end;

--- @function set_should_play_sound_on_finish
--- @desc Tells the cutscene whether to play a sound at the end of the cutscene
--- @p [opt=true] boolean enable sound on finish
function campaign_cutscene:set_should_play_sound_on_finish(enable)
	if enable == false then
		self.should_play_sound_on_finish = false;
	else
		self.should_play_sound_on_finish = true
	end;
end;

--- @function set_should_play_sound_on_skip
--- @desc Tells the cutscene whether to play a sound after it is skipped
--- @p [opt=true] boolean enable sound on skip
function campaign_cutscene:set_should_play_sound_on_skip(enable)
	if enable == false then
		self.should_play_sound_on_skip = false;
	else
		self.should_play_sound_on_skip = true
	end;
end;


--- @function set_disable_shroud
--- @desc Tells the cutscene whether to show the shroud during playback, or not. By default the shroud is displayed - use this function to disable it if required.
--- @p [opt=true] boolean disable shroud
function campaign_cutscene:set_disable_shroud(value)
	if value == false then
		self.disable_shroud = false;
	else
		self.disable_shroud = true;
		self.neighbouring_regions_visible = false;
	end;
end;


--- @function set_restore_shroud
--- @desc Tells the cutscene whether to restore the shroud after completion to the state it was in before the cutscene started, or not. By default the shroud is restored - use this function to disable this behaviour if required.
--- @p [opt=true] boolean restore shroud
function campaign_cutscene:set_restore_shroud(value)
	if value == false then
		self.restore_shroud = false;
	else
		self.restore_shroud = true;
	end;
end;


--- @function set_end_callback
--- @desc Sets the cutscene end callback. This replaces any end callback previously set (e.g. with @campaign_cutscene:new).
--- @p function end callback
function campaign_cutscene:set_end_callback(callback)
	if not is_function(callback) then
		script_error(self.name .. " ERROR: set_end_callback() called but supplied callback [" .. tostring(callback) .. "] is not a function");
		return false;
	end;
	
	self.end_callback = callback;
end;


--- @function has_end_callback
--- @desc Returns <code>true</code> if the cutscene has an end callback specified, <code>false</code> otherwise.
--- @return boolean has end callback
function campaign_cutscene:has_end_callback()
	return not not self.end_callback;
end;


--- @function set_call_end_callback_when_skipped
--- @desc Sets whether the cutscene should call the end callback (supplied when the cutscene is created with @cutscene:new) when skipped. By default the cutscene does call this callback - supply <code>false</code> as an argument to prevent it from doing so.
--- @p [opt=true] boolean should call callback
function campaign_cutscene:set_call_end_callback_when_skipped(new_value)
	if new_value == false then
		self.call_end_callback_when_skipped = false;
	else
		self.call_end_callback_when_skipped = true;
	end;
end;


--- @function set_fade_on_skip
--- @desc Sets whether the cutscene should immediately fade to black, and then back to picture, if the cutscene is skipped, and also the duration over which it should hold on black and fade to picture.
--- @desc By default, a cutscene that is not playing a cindyscene will not perform any fade to black/back to picture, while a cutscene playing a cindyscene will instantly fade to black, hold on black for half a second, and then fade to picture over another half-second. Use this function to change any aspect of this default behaviour.
--- @desc These settings will have no effect if the cutscene is not skipped.
--- @p [opt=true] @boolean should fade, Cutscene should cut to black and fade back to picture when skipped.
--- @p [opt=0.5s] @number hold on black, Duration for which the cutscene should hold on black after being skipped, in seconds.
--- @p [opt=0.5s] @number fade to picture, Duration over which the cutscene should fade to picture after being skipped, in seconds.
function campaign_cutscene:set_fade_on_skip(should_fade, hold_on_black_duration, fade_to_picture_duration)
	if not is_boolean(should_fade) then
		should_fade = true;
	end;

	if hold_on_black_duration then
		if not validate.is_non_negative_number(hold_on_black_duration) then
			return false;
		end;
	else
		hold_on_black_duration = 0.5;
	end;

	if fade_to_picture_duration then
		if not validate.is_non_negative_number(fade_to_picture_duration) then
			return false;
		end;
	else
		fade_to_picture_duration = 0.5;
	end;

	self.should_fade_on_skip = should_fade;
	self.hold_on_black_duration_on_skip = hold_on_black_duration;
	self.fade_to_picture_duration_on_skip = fade_to_picture_duration;
end;


--- @function set_skip_camera
--- @desc Sets a position at which the game camera is repositioned to if the cutscene is skipped. The reposition happens behind a fade to black so the player does not see it.
--- @desc If no position is supplied, the cutscene system takes the current position of the game camera as the skip camera position.
--- @desc Note that this reposition will not happen if the cutscene is not skipped. 
--- @p [opt=nil] number x, x co-ordinate. If no co-ordinates are set here the function takes the camera position at the moment the function is called.
--- @p [opt=nil] number y, y co-ordinate.
--- @p [opt=nil] number d, d co-ordinate.
--- @p [opt=nil] number b, b co-ordinate.
--- @p [opt=nil] number h, h co-ordinate.
function campaign_cutscene:set_skip_camera(x, y, d, b, h)
	
	-- if we have been given no position then use current
	if not x then
		x, y, d, b, h = cm:get_camera_position();
	elseif is_table(x) then
		y = x[2];
		d = x[3];
		b = x[4];
		h = x[5];
		x = x[1];
	else
		if not is_number(x) then
			script_error(self.name .. " ERROR: set_skip_camera() called but supplied x co-ordinate [" .. tostring(x) .. "] is not a number or nil");
			return false
		end;
		
		if not is_number(y) then
			script_error(self.name .. " ERROR: set_skip_camera() called but supplied y co-ordinate [" .. tostring(y) .. "] is not a number");
			return false
		end;
		
		if not is_number(d) then
			script_error(self.name .. " ERROR: set_skip_camera() called but supplied distance [" .. tostring(d) .. "] is not a number");
			return false
		end;
		
		if not is_number(b) then
			script_error(self.name .. " ERROR: set_skip_camera() called but supplied x co-ordinate [" .. tostring(b) .. "] is not a number");
			return false
		end;
		
		if not is_number(h) then
			script_error(self.name .. " ERROR: set_skip_camera() called but supplied x co-ordinate [" .. tostring(h) .. "] is not a number");
			return false
		end;
	end;
	
	if self.is_debug or cm:get_campaign_cutscene_debug() then
		out(self.name .. " setting skip camera to " .. cm:camera_position_to_string(x, y, d, b, h));
	end;
	
	self.skip_cam_x = x;
	self.skip_cam_y = y;
	self.skip_cam_d = d;
	self.skip_cam_b = b;
	self.skip_cam_h = h;
end;


--- @function set_restore_camera
--- @desc Sets co-ordinates to which the game camera is restored when the cutscene ends. If a restore camera position is specified, the camera is scrolled to that position at the end of the cutscene over the supplied time in seconds. This is useful when it's desired to return the camera to the position it started the cutscene at when the cutscene finishes, or to a different position.
--- @desc If no co-ordinates are supplied, the cutscene system takes the current position of the game camera as the restore camera position.
--- @desc Note that if a skip camera position is set with @campaign_cutscene:set_skip_camera, and the cutscene is skipped, the camera will be skipped and not restored. If the cutscene is skipped, has no skip camera position but has a restore camera position set, the camera will be immediately repositioned at the restore camera position while the screen is faded to black.
--- @p number time, Time in seconds over which to scroll the camera.
--- @p [opt=nil] number x, x co-ordinate. If no co-ordinates are set here the function takes the camera position at the moment the function is called.
--- @p [opt=nil] number y, y co-ordinate.
--- @p [opt=nil] number d, d co-ordinate.
--- @p [opt=nil] number b, b co-ordinate.
--- @p [opt=nil] number h, h co-ordinate.
function campaign_cutscene:set_restore_camera(t, x, y, d, b, h)

	if not is_number(t) then
		script_error(self.name .. " ERROR: set_restore_camera() called but supplied time [" .. tostring(t) .. "] is not a number");
		return false;
	end;
	
	self.restore_cam_time = t;
	
	-- if we have been given no position then we will use the current position (later, when the cutscene is started)
	if not x then
		return;
	end;
	
	-- if we've been given a table then convert it
	if is_table(x) then
		y = x[2];
		d = x[3];
		b = x[4];
		h = x[5];
		x = x[1];
	end;
	
	if not is_number(x) then
		script_error(self.name .. " ERROR: set_restore_camera() called but supplied x co-ordinate [" .. tostring(x) .. "] is not a number or nil");
		return false;
	end;
	
	if not is_number(y) then
		script_error(self.name .. " ERROR: set_restore_camera() called but supplied y co-ordinate [" .. tostring(y) .. "] is not a number");
		return false;
	end;
	
	if not is_number(d) then
		script_error(self.name .. " ERROR: set_restore_camera() called but supplied distance [" .. tostring(d) .. "] is not a number");
		return false;
	end;
	
	if not is_number(b) then
		script_error(self.name .. " ERROR: set_restore_camera() called but supplied x co-ordinate [" .. tostring(b) .. "] is not a number");
		return false;
	end;
	
	if not is_number(h) then
		script_error(self.name .. " ERROR: set_restore_camera() called but supplied x co-ordinate [" .. tostring(h) .. "] is not a number");
		return false;
	end;
	
	if self.is_debug or cm:get_campaign_cutscene_debug() then
		out(self.name .. " setting restore camera to " .. cm:camera_position_to_string(x, y, d, b, h));
	end;
	
	self.restore_cam_x = x;
	self.restore_cam_y = y;
	self.restore_cam_d = d;
	self.restore_cam_b = b;
	self.restore_cam_h = h;
end;


--- @function is_active
--- @desc Returns <code>true</code> if the cutscene is currently running, <code>false</code> otherwise.
--- @return boolean is active
function campaign_cutscene:is_active()
	return self.is_running;
end;


--- @function steal_input_immediately
--- @desc Instructs the cutscene to steal input immediately, before @campaign_cutscene:start() is called. This is useful for campaign intro cutscenes as there's a short window of opportunity for the player to interact with the game as the loading screen is fading out, before the cutscene starts.
--- @desc Note that cutscenes don't steal input when debug mode is set with @campaign_cutscene:set_debug or @campaign_cutscene:set_debug_all, which affects this command too.
function campaign_cutscene:steal_input_immediately()
	if not (self.is_debug or cm:get_campaign_cutscene_debug()) then
		cm:steal_user_input(true);
	end;
end;


--- @function set_pre_cindyscene_fade_to_black_duration
--- @desc If the cutscene is playing a cindyscene using the @campaign_cutscene:new_from_cindyscene constructor, the cindyscene starts as soon as the cutscene begins. Use this function to set a fade-to-black duration, and optionally a hold-on-black duration, so that the cutscene fades to black before the cindyscene begins playing.
--- @p @number fade duration, Fade to black duration, in seconds.
--- @p [opt=0] @number hold duration, Hold on black duration, in seconds.
function campaign_cutscene:set_pre_cindyscene_fade_to_black_duration(fade_to_black_duration, hold_on_black_duration)
	if not validate.is_non_negative_number(fade_to_black_duration) then
		return false;
	end;

	if hold_on_black_duration then
		if not validate.is_non_negative_number(hold_on_black_duration) then
			return false;
		end;
	else
		hold_on_black_duration = 0;
	end;

	self.pre_cindyscene_fade_to_black_duration = fade_to_black_duration;
	self.pre_cindyscene_hold_on_black_duration = hold_on_black_duration;
end;










----------------------------------------------------------------------------
--- @section Cinematic Triggers
--- @desc A cindy scene can be configured to send events to script, for which listeners may be established that call script functions. The function @campaign_cutscene:add_cinematic_trigger_listener may be used to establish such a listener. This mechanism allows cinematic artists to more tightly control the timing of events in the cindy scene.
----------------------------------------------------------------------------


--- @function add_cinematic_trigger_listener
--- @desc Registers a new cinematic trigger listener. When the cindy scene triggers a script event with the supplied id in script, the supplied function is called.
--- @p @string id, Cinematic trigger id. This should match the an id of a cinematic event triggered from a cindy scene played during this cutscene.
--- @p function callback, Callback to call.
function campaign_cutscene:add_cinematic_trigger_listener(id, callback)
	if not is_string(id) then
		script_error(self.name .. " ERROR: add_cinematic_trigger_listener() called but supplied id " .. tostring(id) .. " is not a string");
		return false;
	end;
	
	if not is_function(callback) then
		script_error(self.name .. " ERROR: add_cinematic_trigger_listener() called but supplied callback " .. tostring(callback) .. " is not a function");
		return false;
	end;
	
	self.cinematic_triggers[id] = callback;
end;












----------------------------------------------------------------------------
--- @section Enqueuing Actions
--- @desc Actions are the events that happen in a cutscene while the cutscene is running. Examples include camera movements and the playing of advice, subtitles, and potentially composite scenes. A cutscene must be loaded with actions before it is started.
----------------------------------------------------------------------------


--- @function action
--- @desc Registers a new action with the cutscene. The action is supplied a function callback, which is called at the appropriate time after the cutscene has been started (assuming the cutscene is not skipped beforehand).
--- @p function callback, Action callback to call.
--- @p number delay, Delay in seconds after the cutscene starts before calling this action callback.
function campaign_cutscene:action(new_callback, new_delay)
	-- type-check parameters
	if not is_function(new_callback) then
		script_error(self.name .. " ERROR: trying to add an action but supplied action [" .. tostring(new_callback) .."] is not a function");
		return false;
	end;
	
	if not is_number(new_delay) then
		script_error(self.name .. " ERROR: trying to add an action but supplied action [" .. tostring(new_delay) .."] is not a number");
		return false;
	end;
	
	-- debug output
	if self.is_debug or cm:get_campaign_cutscene_debug() then
		out(self.name .. " adding action " .. tostring(new_callback) .. " with delay " .. tostring(new_delay));
	end;
	
	-- add action to our list
	for i = 1, #self.action_list do
		if self.action_list[i].delay > new_delay then
			table.insert(self.action_list, i, {callback = new_callback, delay = new_delay});
			return true;
		end;
	end;
	
	table.insert(self.action_list, {callback = new_callback, delay = new_delay});
	return true;
end;












----------------------------------------------------------------------------
--- @section Starting
----------------------------------------------------------------------------


function campaign_cutscene:new_from_cindyscene_fixup_on_start()

	-- Work out whether we need to insert a fade-to-black/hold-on-black before starting the cindyscene, or can we start it immediately
	local cindy_playback_start_interval = 0;

	local cached_should_fade_on_skip = self.should_fade_on_skip;

	if self.pre_cindyscene_fade_to_black_duration > 0 then
		cindy_playback_start_interval = self.pre_cindyscene_fade_to_black_duration + self.pre_cindyscene_hold_on_black_duration;

		self:action(
			function()
				-- Temporarily override this flag so that, if the cutscene is skipped while we've faded to black, a fade-to-scene is forced
				self.should_fade_on_skip = true;

				-- Fade to black at the start of the cutscene
				cm:fade_scene(0, self.pre_cindyscene_fade_to_black_duration);
			end,
			0
		);
	end;

	self:action(
		function()
			-- Start the cindyscene, and restore the should_fade_on_skip value now that the cindyscene has begun
			self:cindy_playback(self.cindy_scene, self.cindy_scene_blend_in_duration, self.cindy_scene_blend_out_duration)
			self.should_fade_on_skip = cached_should_fade_on_skip;

			-- Start a fade-to-picture if we should
			if self.cindy_scene_start_fade_to_picture_duration then
				cm:fade_scene(1, self.cindy_scene_start_fade_to_picture_duration);
			end;
		end,
		cindy_playback_start_interval
	);

	self:set_do_not_end(true);

	self:add_cinematic_trigger_listener(
		"end_cinematic",
		function()
			self:skip(false, true);
		end
	);
end;


--- @function start
--- @desc Starts the cutscene.
function campaign_cutscene:start()
	local uim = cm:get_campaign_ui_manager();
	
	if cm:get_active_cutscene() then
		script_error(self.name .. " ERROR: cannot start, another cutscene is running!");
		return false;
	end;


	-- if this cutscene was constructed from new_from_cindyscene we fix it up here
	if self.cindy_scene then
		self:new_from_cindyscene_fixup_on_start();
	end;

	-- Tell the campaign manager we are playing
	cm:set_active_cutscene(self);
	
	-- prevent player input
	if not (self.is_debug or cm:get_campaign_cutscene_debug()) then
		cm:steal_user_input(true);
		
		if not cm:is_ui_hiding_enabled() then
			self.enable_ui_hiding_on_release = false;		-- ui hiding was disabled prior to the cutscene, so don't re-enable it
		end;
		
		cm:enable_ui_hiding(false);
	end;
	
	-- set up restore camera if we need to
	if self.restore_cam_time >= 0 and not self.restore_cam_x then
		self.restore_cam_x, self.restore_cam_y, self.restore_cam_d, self.restore_cam_b, self.restore_cam_h = cm:get_camera_position();
	end;
	
	-- turn off event panels
	self:enable_event_panels(false);
	
	-- shroud
	if self.restore_shroud then
		cm:take_shroud_snapshot(false);
	end;
	
	if self.neighbouring_regions_visible then
		cm:make_neighbouring_regions_visible_in_shroud();
	end;
	
	if self.disable_shroud then
		cm:show_shroud(false);
	end;

	-- record whether we should enable saving when the cutscene completes, and then disable it for the duration of the cutscene
	self.game_saving_was_disabled_before_start = cm:is_saving_disabled();
	cm:disable_saving_game(true);
	
	-- cinematic borders
	CampaignUI.EnableCinematicMode(not not self.use_cinematic_borders);
	
	-- cache advice back/forwards navigation if a previous cutscene has not already cached it, and disable it too
	local advice_navigation_override = uim:override("advice_navigation");
	advice_navigation_override:cache_if_not_cached();
	advice_navigation_override:lock();
	
	-- cache settlement labels override if a previous cutscene has not already cached it, and enable/disable it as we want
	local settlement_labels_override = uim:override("settlement_labels");
	settlement_labels_override:cache_if_not_cached();
	if self.disable_settlement_labels then
		settlement_labels_override:lock();
	else
		settlement_labels_override:unlock();
	end;

	if self.should_send_recieve_metrics_data then
		-- start collection of performance metrics
		cm:trigger_performance_metrics_start();
	end;
	
	-- start listening for advice dismissed if necessary
	if self.is_skippable then
		core:add_listener(
			self.name .. "_advice_closed",
			"AdviceDismissed",
			true,
			function() self:advice_is_dismissed() end,
			false
		);
		
		cm:steal_escape_key_and_space_bar_with_callback(self.name, function() self:skip() end);
	end;

	-- establish a listener for cinematic triggers from cindy scenes
	core:add_listener(
		self.name .. "_cinematic_trigger_listeners",
		"CinematicTrigger",
		true,
		function(context)
			local trigger_str = context.string;

			if self.cinematic_triggers[trigger_str] then					
				out("* CinematicTrigger event received with id " .. tostring(trigger_str) .. " - triggering callback");
				
				self.cinematic_triggers[trigger_str]();
			else
				out("* CinematicTrigger event received with id " .. tostring(trigger_str) .. " - no callback registered for this id");
			end;
		end,
		true
	);
	
	if not self.do_not_end then
		self:action(function() self:finish() end, self.cutscene_length, self.name);
	end;
	
	-- set internal is_running flag
	self.is_running = true;
	self.is_skipped = false;
	
	-- debug output
	if self.is_debug or cm:get_campaign_cutscene_debug() then
		out(self.name .. " is starting");
	end;
		
	-- start processing actions
	self:process_next_action(1);
	
	return true;
end;


-- performs the next action
function campaign_cutscene:process_next_action(action_ptr)
	if not self.is_running then
		script_error(self.name .. " WARNING:  tried to process an action while not active, the action didn't happen.");		
		return false;
	end;
		
	if action_ptr > #self.action_list then		
		return false;
	end;
	
	-- see if we have to wait for advice to complete
	if self.advisor_wait then
		if common.is_advice_audio_playing() then
		
			-- Advice is playing and we have been instructed to wait for it to complete.
			-- Let's try again in a bit and see if the advice has finished
			cm:callback(function() self:process_next_action(action_ptr) end, 0.5, self.name);
			self.wait_offset = self.wait_offset + 0.5;
			return false;
		else
			-- advisor_wait is true but there is no advice playing, so we can set it to false again
			self.advisor_wait = false;
		end;	
	end;
	
	local next_action = self.action_list[action_ptr];
	local further_action = nil;
	
	if action_ptr < #self.action_list then
		further_action = self.action_list[action_ptr + 1];
	end;
	
	-- debug output
	if self.is_debug or cm:get_campaign_cutscene_debug() then
		out(self.name .. " : processing action " .. action_ptr .. " [" .. tostring(next_action.callback) .. "]");
	end;
	
	-- call the next_action callback
	next_action.callback();
	
	-- if the further_action (what we do after next_action) is due to happen at a later time
	-- as the next_action then queue that up, else run it now. If further_action doesn't exist
	-- then do nothing, we have got to the end of the cutscene
	if further_action then
		if further_action.delay > next_action.delay then
			cm:callback(function() self:process_next_action(action_ptr + 1) end, (further_action.delay - next_action.delay), self.name);
		else
			self:process_next_action(action_ptr + 1);
		end;
	end;
end;


-- internal function to enable or disable event panels
function campaign_cutscene:enable_event_panels(value)
	if self.event_panels_enabled == not value then
		cm:get_campaign_ui_manager():enable_event_panel_auto_open(value);
		self.event_panels_enabled = value;
	end;
end;








----------------------------------------------------------------------------
--- @section During Playback
----------------------------------------------------------------------------


--- @function wait_for_advisor
--- @desc This function, when called, causes the cutscene to repeatedly stall while the advisor is still speaking and only allow the cutscene to progress once the advisor has finished. If the cutscene contains multiple lines of advice that are played one after the other, this function can be used to ensure that each item of advice only triggers once the previous item has finished playing, so they don't speak over the top of each other. This is useful when laying out multiple items of advice in a cutscene where the length of advice items cannot be known in different languages - a localised version of an advice item in German, for example, might be many seconds longer than the equivalent in English.
--- @desc If a delay argument is passed in then the call to this function is enqueued as an @campaign_cutscene:action with that delay. Alternatively, it may be called with no delay within an action.
--- @p [opt=nil] number delay, Delay in seconds after the cutscene starts before invoking this function.
function campaign_cutscene:wait_for_advisor(delay)

	-- if this function is supplied with a delay, then enqueue it as an action
	if delay then
		if not is_number(delay) or delay < 0 then
			script_error(self.name .. " ERROR: wait_for_advisor() called but supplied delay [" .. tostring(delay) .. "] is not a positive number or nil");
			return false;
		end;
		
		self:action(function() self:wait_for_advisor() end, delay);
		return;
	end;
	
	self.advisor_wait = true;
end;


--- @function cindy_playback
--- @desc Immediately starts playback of a cindy scene. This is intended to be called within an @campaign_cutscene:action callback. If a cindy scene is started this way, the cutscene will automatically terminate it if the cutscene is skipped.
--- @p @string path, cindy xml path, from the data/ folder.
--- @p [opt=nil] @number blend in, Blend in duration in seconds.
--- @p [opt=nil] @number blend out, Blend out duration in seconds.
function campaign_cutscene:cindy_playback(file, blend_in_duration, blend_out_duration)
	cm:update_sound_state("Mixer", "Mixer_Campaign_Flyover");
	if self.should_play_sound_on_cindyscene_start then
		cm:trigger_sound_event("UI_CAM_Flyover_Start");
	end;
	self.playing_cindy_camera = true;
	cm:cindy_playback(file, blend_in_duration, blend_out_duration);
end;



--- @function dismiss_advice
--- @desc Issues a call to dismiss the advice without triggering the end of the cutscene. Normally a cutscene skips when advice is dismissed - use this function during an @campaign_cutscene:action to circumvent this behaviour.
function campaign_cutscene:dismiss_advice()
	self.do_not_skip_on_next_advice_dismissal = true;
	
	cm:dismiss_advice();
end;


-- called internally when the advisor is dismissed
function campaign_cutscene:advice_is_dismissed()
	if self.do_not_skip_on_next_advice_dismissal then
		self.do_not_skip_on_next_advice_dismissal = false;
		return;
	end;
	
	out(self.name .. ": advice has been dismissed");
	
	core:remove_listener(self.name .. "_advice_closed");
	self:skip(true);
end;










----------------------------------------------------------------------------
--- @section Skipping
----------------------------------------------------------------------------


--- @function skip
--- @desc This function is called internally when the cutscene has been skipped by the player. Additionally, it may be called by external scripts to force the running cutscene to skip.
function campaign_cutscene:skip(advice_being_dismissed, cindy_scene_ending)
	if not self.is_running then
		return false;
	end;
	
	if cindy_scene_ending then
		out(self.name .. " has ended because cindy scene playback has finished");
	else
		out(self.name .. " has been skipped");
	end;
	

	-- skip audio
	cm:update_sound_state("Mixer", "Mixer_Campaign");
	if self.should_play_sound_on_skip then
		cm:trigger_sound_event("UI_CAM_Flyover_Skip");
	end;

	-- kill any running process
	cm:remove_callback(self.name);
	
	-- remove listener for advice being dismissed before we manually dismiss it
	core:remove_listener(self.name .. "_advice_closed");
	
	cm:stop_camera();

	-- stop any cinematic trigger listeners
	core:remove_listener(self.name .. "_cinematic_trigger_listeners");
	
	if self.dismiss_advice_on_end and not advice_being_dismissed then
		cm:dismiss_advice();
	end;
	
	self.is_skipped = true;

	local cindy_scene_was_playing = self.playing_cindy_camera;
	
	-- stop the cindy camera if one is playing
	if self.playing_cindy_camera then
		self.playing_cindy_camera = false;
		cm:stop_cindy_playback();
	end;

	-- Determine whether we should cut to black and fade to picture: if self.should_fade_on_skip is boolean then take its value, otherwise fade if a cindyscene was playing
	local should_cut_to_black_and_fade_to_picture;

	if cindy_scene_ending then
		-- cindy scene is ending naturally, so never cut
		should_cut_to_black_and_fade_to_picture = false;
	elseif is_boolean(self.should_fade_on_skip) then
		should_cut_to_black_and_fade_to_picture = self.should_fade_on_skip;
	else
		should_cut_to_black_and_fade_to_picture = cindy_scene_was_playing;
	end;

	-- Cut to black, then fade to picture if we should
	if should_cut_to_black_and_fade_to_picture then		
		cm:fade_scene(0, 0);
		cm:callback(
			function()
				cm:fade_scene(1, self.fade_to_picture_duration_on_skip)
			end,
			self.hold_on_black_duration_on_skip
		);
	end;
	
	-- run the skip callback if we have one
	if is_function(self.skip_callback) then
		self.skip_callback();
	end;
	
	-- reposition camera if we have a skip camera (this is delayed in case the cindy scene is still running)
	if self.skip_cam_x then
		if cindy_scene_was_playing then
			cm:callback(function() cm:set_camera_position(self.skip_cam_x, self.skip_cam_y, self.skip_cam_d, self.skip_cam_b, self.skip_cam_h) end, 0.2);

			out("WARNING: set_camera_position delay triggered on skip. To be revised!")
		else
			cm:set_camera_position(self.skip_cam_x, self.skip_cam_y, self.skip_cam_d, self.skip_cam_b, self.skip_cam_h);
		end;
		
	elseif self.restore_cam_time >= 0 and not cindy_scene_ending then
		self:restore_camera_and_release(true, cindy_scene_was_playing);
		return;
	end;
	
	self:release();
end


-- called when the campaign intro finishes without skipping
function campaign_cutscene:finish()
	if not self.is_running then
		script_error(self.name .. " ERROR: finish() called but this cutscene is not running - how can this be?")
		return false;
	end;
	
	if self.is_debug or cm:get_campaign_cutscene_debug() then
		out(self.name .. " is finishing");
	end;

	-- stop the cindy camera if one is playing
	if self.playing_cindy_camera then
		self.playing_cindy_camera = false;
		cm:stop_cindy_playback(false);
	end;

	-- stop any cinematic trigger listeners
	core:remove_listener(self.name .. "_cinematic_trigger_listeners");

	-- stop audio
	cm:update_sound_state("Mixer", "Mixer_Campaign");
	if self.should_play_sound_on_finish then
		cm:trigger_sound_event("UI_CAM_Flyover_End");
	end;

	if self.restore_cam_time >= 0 then
		self:restore_camera_and_release(false);
	else
		self:release();
	end;
end


-- called when the cutscene ends (either by skipping or naturally finishing), this function decides whether to restore the camera and then releases the cutscene
function campaign_cutscene:restore_camera_and_release(should_cut, cindy_scene_was_playing)
	local restore_time = self.restore_cam_time;
	
	if should_cut then
		restore_time = 0;
	end;

	-- perform the camera movement
	if restore_time == 0 then
		if cindy_scene_was_playing then
			cm:callback(function() cm:set_camera_position(self.restore_cam_x, self.restore_cam_y, self.restore_cam_d, self.restore_cam_b, self.restore_cam_h) end, 0.5);

			out("WARNING: set_camera_position delay triggered on skip. To be revised!")

			self:release();
		else
		cm:set_camera_position(self.restore_cam_x, self.restore_cam_y, self.restore_cam_d, self.restore_cam_b, self.restore_cam_h);
		self:release();
		end;
	else
		cm:scroll_camera_from_current(true, restore_time, {self.restore_cam_x, self.restore_cam_y, self.restore_cam_d, self.restore_cam_b, self.restore_cam_h});
		cm:callback(function() self:release() end, restore_time, self.name);
	end;
end;


-- cleans up the campaign_cutscene, called when it finishes for either reason
function campaign_cutscene:release()
	
	local uim = cm:get_campaign_ui_manager();
	
	--
	-- RE-ACTIVATE UI (wait a little and check if no other cutscene is running)
	--
	
	cm:callback(
		function()
			-- allow event panels to be shown again
			-- always do this at this time, even if another cutscene is running - the lock the second cutscene will have already placed
			-- on event panels auto-opening will prevent this call from actually enabling the functionality
			self:enable_event_panels(true);
		
			if not cm:get_active_cutscene() then
				-- Disable cinematic mode if another cutscene has not already started
				CampaignUI.EnableCinematicMode(false);
			
				-- Potentially allow settlement labels again
				uim:override("settlement_labels"):restore();
			end;
		end,
		0.1,
		self.name .. "_release"
	);

	-- Potentially allow advice back/forwards navigation
	uim:override("advice_navigation"):restore();
	
	-- shroud
	if self.restore_shroud then
		cm:restore_shroud_from_snapshot();
	end;

	-- allow ui hiding if we should
	if self.enable_ui_hiding_on_release then
		cm:enable_ui_hiding(true);
	end;

	-- allow player input
	if not (self.is_debug or cm:get_campaign_cutscene_debug()) then
		cm:steal_user_input(false);
	end;

	-- allow game saving if we should
	cm:disable_saving_game(self.game_saving_was_disabled_before_start);
	
	-- stop listening for advice being dismissed
	if self.is_skippable then
		core:remove_listener(self.name .. "_advice_closed");
		cm:release_escape_key_and_space_bar_with_callback(self.name);
	end;
		
	-- set internal is_running flag
	self.is_running = false;

	-- Tell the campaign manager we have stopped playing
	cm:set_active_cutscene(nil);
	
	if self.wait_offset > 0 then
		out(self.name .. " was " .. self.wait_offset .. "s longer than specified due to waiting for advice to complete.");
	end;

	if self.should_send_recieve_metrics_data then
		-- report collected performance metrics
		cm:trigger_performance_metrics_stop();
	end;
	
	-- notify listeners that a cutscene has completed
	core:trigger_event("ScriptEventCampaignCutsceneCompleted", self.name);

	-- end callback (must happen last!)
	if not self.is_skipped or self.call_end_callback_when_skipped then
		if is_function(self.end_callback) then
			self.end_callback();
		end;
	end;
end;








