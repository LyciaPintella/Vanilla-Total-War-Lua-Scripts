







----------------------------------------------------------------------------
---	@set_environment campaign
--- @c campaign_conversation Campaign Conversations
--- @desc The campaign conversation system provides an interface for easy scripting of conversations. This is when multiple items of advice (or similar types of content, such as VO with subtitles) are played back-to-back with the player observing, and clicking through each.

--- @section At A Glance
--- @desc A conversation is first declared with @campaign_conversation:new. This returns a campaign conversation object.
--- @desc Once declared, a conversation may optionlly be configured with the functions in the @"campaign_conversation:Configuration" section of this documentation. It is mandatory, however, to add actions with @campaign_conversation:add_advice or similar.
--- @desc A conversation that is configured can then be started with @campaign_conversation:start. A running conversation may be skipped by calling @campaign_conversation:skip.

--- @example local conv_example = campaign_conversation:new(
--- @example 	"example_conversation",
--- @example 	function(),
--- @example 		out("Conversation completed!")
--- @example 	true
--- @example )
--- @example 
--- @example conv_example:set_default_delay(1.5)
--- @example 
--- @example conv_example:add_advice("example_advice_key_1")
--- @example conv_example:add_advice("example_advice_key_2")
--- @example conv_example:add_advice("example_advice_key_3")
--- @example conv_example:add_advice("example_advice_key_4")
--- @example 
--- @example conv_example:start()
----------------------------------------------------------------------------


campaign_conversation = {
	--[[
		conversation_records = {}
	]]
	name = false,										-- string name for conversation, used for output
	full_name = false,									-- full string name for conversation, same as the name but with "conversation_" added at the start
	end_callback = false,								-- callback to call when conversation is finished
	is_playing = false,									-- is the conversation currently playing
	play_with_cutscene_bars = false,					-- should black cutscene bars show while the conversation is playing
	current_index = -1,									-- index of what stage of the conversation we're currently at
	default_dismiss_advice_before_playing = true,		-- whether we should dismiss one item of advice being playing another
	default_proceed_on_advice_finished = false,			-- should the conversation automatically proceed when a given piece of advice has finished playing
	default_delay_s = 0.5,								-- default delay in s between one conversation item finishing and the next starting
};


-- set campaign_conversation to be of custom type TYPE_CAMPAIGN_CONVERSATION, with a custom tostring() response
set_class_custom_type(campaign_conversation, TYPE_CAMPAIGN_CONVERSATION);
set_class_tostring(
	campaign_conversation,
	function(obj)
		return TYPE_CAMPAIGN_CONVERSATION .. "_" .. obj.name
	end
);







----------------------------------------------------------------------------
--- @section Declaration
----------------------------------------------------------------------------


--- @function new
--- @desc Creates and returns a new campaign conversation object.
--- @p @string name, String name for the conversation. This is used for output.
--- @p [opt=nil] @function end callback, Callback to call when the conversation ends.
function campaign_conversation:new(name, end_callback)

	if not validate.is_string(name) then
		return false;
	end;

	if end_callback and not validate.is_function(end_callback) then
		return false;
	end;

	local cc = {};

	-- set 'cc' to derive from self ('campaign_conversation')
	set_object_class(cc, self);

	cc.name = name;
	cc.full_name = "conversation_" .. name;

	if end_callback then
		cc.end_callback = end_callback;
	end;

	cc.conversation_records = {};

	return cc;
end;






----------------------------------------------------------------------------
--- @section Configuration
----------------------------------------------------------------------------


--- @function set_proceed_on_advice_finished
--- @desc Sets whether the conversation should automatically proceed to the next section when advice audio has finished playing. By default this is set to <code>false</code> which means the player will need to dismiss advice items manually to progress.
--- @desc This default value can also be overridden on a per-advice basis as it is added with @campaign_conversation:add_advice.
--- @p [opt=true] @boolean proceed automatically, Proceed automatically on advice audio finished.
function campaign_conversation:set_proceed_on_advice_finished(value)
	if value == false then
		self.default_proceed_on_advice_finished = false;
	else
		self.default_proceed_on_advice_finished = true;
	end;
end;


--- @function set_default_delay
--- @desc Sets the default delay between one conversation item finishing and the next starting. By default this is half a second.
--- @desc This default value can also be overridden on a per-advice basis as it is added with @campaign_conversation:add_advice.
--- @p @number delay interval s, Delay interval in seconds.
function campaign_conversation:set_default_delay(value)
	if not validate.is_non_negative_number(value) then
		return false;
	end;

	self.default_delay_s = value;
end;


--- @function set_play_with_cutscene_bars
--- @desc Sets whether the conversation should play out with cutscene bars. This is disabled by default - use this function to enable this behaviour.
--- @p [opt=true] @boolean play with cutscene bars
function campaign_conversation:set_play_with_cutscene_bars(value)
	if self.is_playing then
		script_error(self.full_name .. " ERROR: set_play_with_cutscene_bars() called but the conversation is already active");
		return false;
	end;

	if value == false then
		self.play_with_cutscene_bars = false;
	else
		self.play_with_cutscene_bars = true;
	end;
end;







----------------------------------------------------------------------------
--- @section Actions
----------------------------------------------------------------------------


--- @function add_advice
--- @desc Adds an advice record to play in sequence as part of the conversation.
--- @p @string advice key, Advice key, from the <code>advice_threads</code> database table.
--- @p [opt=nil] @table infotext, Infotext to show with the advice. This should be a table of strings.
--- @p [opt=false] @boolean show topic leader, Use the first line of infotext as a topic leader.
--- @p [opt=nil] @boolean dismiss before playing, Dismiss the advisor before playing this item of advice. This happens by default, but this flag can be set to <code>false</code> to disable this behaviour.
--- @p [opt=nil] @number initial delay, Delay in seconds between this section of the conversation starting and the advice being triggered. If supplied, this value overrides the default behaviour set with @campaign_conversation:set_default_delay, but just for this advice.
--- @p [opt=nil] @boolean proceed on advice finished, Proceed immediately after this advice has finished playing to the next advice (or end of the conversation). If supplied, this value overrides the default behaviour set with @campaign_conversation:set_proceed_on_advice_finished, but just for this advice.
--- @p [opt=nil] @function start callback, Optional callback to call when this conversation item starts playing.
function campaign_conversation:add_advice(advice_key, infotext, show_infotext_topic_leader, dismiss_advice_before_playing, initial_delay_s, proceed_on_advice_finished, start_callback)
	if not validate.is_string(advice_key) then
		return false;
	end;

	if infotext and not validate.is_table(infotext) then
		return false;
	end;

	if start_callback and not validate.is_function(start_callback) then
		return false;
	end;

	if initial_delay_s and not validate.is_non_negative_number(initial_delay_s) then
		return false;
	end;

	local record = {
		advice_key = advice_key,
		infotext = infotext,
		show_infotext_topic_leader = show_infotext_topic_leader,
		start_callback = start_callback,
		dismiss_advice_before_playing = dismiss_advice_before_playing,
		initial_delay_s = initial_delay_s,
		proceed_on_advice_finished = proceed_on_advice_finished
	};

	table.insert(self.conversation_records, record);
end;







----------------------------------------------------------------------------
--- @section Starting and Stopping
----------------------------------------------------------------------------


--- @function start
--- @desc Starts the conversation. Conversation records need to have been added with @campaign_conversation:add_advice or equivalent before this function is called.
function campaign_conversation:start()

	if self.is_playing then
		script_error(self.full_name .. " ERROR: start() called but this conversation is already playing");
		return false;
	end;

	if #self.conversation_records == 0 then
		script_error(self.full_name .. " ERROR: start() called but no records have been added to this conversation");
		return false;
	end;

	self.is_playing = true;
	self.current_index = 0;

	self:out("Starting");

	if self.play_with_cutscene_bars then
		CampaignUI.EnableCinematicMode(true);
	end;

	self:advance_conversation(true);
end;


-- For console output
function campaign_conversation:out(msg)
	if msg == "" then
		out("");
	else
		out("[" .. self.full_name .. "]: " .. msg);
	end;
end;


-- Internal function to advance to the next conversation section after the required delay
function campaign_conversation:advance_conversation(is_first_section)
	
	self.current_index = self.current_index + 1;

	local current_record = self.conversation_records[self.current_index];

	if not current_record then
		self:finish();
		return;
	end;
	
	-- For the first section the default delay is 0 rather than what's been set, but we still allow this to be overwritten by the current record
	local delay;
	if current_record.initial_delay_s == nil then
		delay = is_first_section and 0 or self.default_delay_s;
	else
		delay = current_record.initial_delay_s;
	end;

	cm:callback(
		function()
			self:play_current_conversation_section(current_record);
		end,
		delay,
		self.full_name
	);
end;


-- Internal function to play the current conversation section
function campaign_conversation:play_current_conversation_section(current_record)

	if current_record.advice_key then
		--
		-- We're playing advice for this conversation section
		--

		-- Determine whether we should proceed automatically after the advice audio finishes playing
		local proceed_on_advice_finished;
		if current_record.proceed_on_advice_finished == nil then
			proceed_on_advice_finished = self.default_proceed_on_advice_finished;
		else
			proceed_on_advice_finished = current_record.proceed_on_advice_finished;
		end;

		local dismiss_advice_before_playing = false;

		local uic_advisor = find_uicomponent("advice_interface");
		if uic_advisor and is_fully_onscreen(uic_advisor) then

			if current_record.dismiss_advice_before_playing == nil then
				dismiss_advice_before_playing = self.default_dismiss_advice_before_playing;
			else
				dismiss_advice_before_playing = current_record.dismiss_advice_before_playing;
			end;
		end;

		-- Potentially introduce an additional short delay while we wait for the previous advice to be dismissed
		local additional_delay_while_advice_dismisses = 0;
		if dismiss_advice_before_playing then
			cm:dismiss_advice();
			additional_delay_while_advice_dismisses = 0.3;
		end;

		-- Play the advice
		cm:callback(
			function()
				self:play_conversation_advice(current_record, proceed_on_advice_finished, dismiss_advice_before_playing);
			end,
			additional_delay_while_advice_dismisses,
			self.full_name
		);
	else
		script_error(self.full_name .. " ERROR: attempting to advance conversation but couldn't figure out what to do with record at index [" .. self.current_index .. "]");
	end;
end;


-- Internal function to actually play advice
function campaign_conversation:play_conversation_advice(current_record, proceed_on_advice_finished, advice_dismissed_before_playing)
	local advice_key = current_record.advice_key;

	self:out("Playing item " .. self.current_index .. " of " .. #self.conversation_records .. ", advice with key [" .. advice_key .. "]" .. (advice_dismissed_before_playing and ", there was a short delay before playing to wait for the previous advice to be dismissed" or ""));

	out.inc_tab();

	-- Ensure advisor progress button is shown but without being highlighted
	-- cm:modify_advice(true, false);	

	-- Show advice
	cm:show_advice(
		advice_key,
		true,
		false,
		function()
			if not self.is_playing then
				return;
			end;

			-- This advice has finished playing - work out what to do now
			if proceed_on_advice_finished then
				-- We should proceed to the next conversation section automatically
				self:advance_conversation();
			else
				-- We should wait for the advisor to be dismissed
				cm:progress_on_advice_dismissed(
					self.full_name,
					function()
						self:advance_conversation();
					end
				);

				-- Highlight advisor button
				cm:modify_advice(true, true);
			end;
		end,
		5
	);

	-- Show infotext, if we have any
	if current_record.infotext then
		if current_record.show_infotext_topic_leader then
			cm:add_infotext_with_leader(unpack(current_record.infotext));
		else
			cm:add_infotext(unpack(current_record.infotext));
		end;
	end;

	-- Call start callback if we have one
	if current_record.start_callback then
		current_record.start_callback();
	end;

	out.dec_tab();
end;


--- @function is_active
--- @desc Returns whether this conversation is currently playing or not.
--- @r @boolean is conversation playing
function campaign_conversation:is_active()
	return self.is_playing;
end;


--- @function skip
--- @desc Skips the running conversation, ending it immediately. A string reason may be supplied for output purposes.
--- @p @string reason
function campaign_conversation:skip(reason)
	if not self.is_playing then
		script_error(self.name .. " WARNING: skip() called but this conversation is not active");
		return;
	end;

	cm:remove_callback(self.full_name);
	cm:cancel_progress_on_advice_dismissed(self.full_name);
	
	if is_string(reason) then
		self:out("Skipping conversation, reason: " .. reason);
	else
		self:out("Skipping conversation, no reason given");
	end;

	self:release();
end;


-- Internal function to end conversation without skipping
function campaign_conversation:finish()
	self:release();
end;


-- Internal function, clean up the conversation and complete
function campaign_conversation:release()
	self:out("Conversation ending");

	if self.play_with_cutscene_bars then
		CampaignUI.EnableCinematicMode(false);
	end;

	if self.end_callback then
		self.end_callback();
	end;
end;

