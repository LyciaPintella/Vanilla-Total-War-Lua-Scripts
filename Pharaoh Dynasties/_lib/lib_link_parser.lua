

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--
--	LINK PARSER
--
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------


----------------------------------------------------------------------------
--	Definition
----------------------------------------------------------------------------


link_parser = {
	links = {},
	
	-- colour profiles now in ui_colours table
	link_colour_str = "col:help_page_link", 								-- 206, 100, 8
	visited_link_colour_str = "col:help_page_link_visited",					-- 168, 122, 84
	tooltip_colour_str = "col:help_page_link_inactive",						-- 255, 231, 127
	colour_str_terminator = "col"
};


-- set link_parser to be of custom type TYPE_LINK_PARSER
set_class_custom_type_and_tostring(link_parser, TYPE_LINK_PARSER);


----------------------------------------------------------------------------
--	Declaration
----------------------------------------------------------------------------

__link_parser = nil;

function link_parser:new()

	local lp = core:get_static_object("link_parser");
	if lp then
		return lp;
	end;
	
	local lp = {};
	
	-- set 'lp' to derive from self ('link_parser')
	set_object_class(lp, self);
	
	lp.links = {};
	
	lp.parse_for_links_func = function(key, text)
		local link_record = lp.links[key];
		
		if not link_record then
			script_error("ERROR: couldn't find a link record for supplied key [" .. tostring(key) .. "]");
			return text;
		end;
		
		local script_link = link_record.script_link;
		
		if not link_record then
			script_error("record " .. key .. " doesn't exist !");
			return text;
		end;
		
		-- if this record has no tooltip key then don't include a tooltip tag
		if link_record.tooltip_key == "" then
			script_error("record " .. key .. " has no tooltip tag");
			return "[[url:" .. link_record.script_link .. "]]" .. text .. "[[/url]]";
		end;
		
		
		-- if common.get_advice_history_string_seen(script_link) then
		-- 	-- player has seen this link before
		-- 	-- return "[[url:" .. link_record.script_link .. "]][[tooltip:{{tt:" .. link_record.tooltip_key .. "}}]][[" .. lp.visited_link_colour_str .. "]]" .. text .. "[[/" .. lp.colour_str_terminator .. "]][[/tooltip]][[/url]]";
		-- 	return "[[url:" .. link_record.script_link .. "]]" .. text .. "[[/url]]";
		-- else
		-- 	-- player has not seen this link before
		-- 	-- return "[[url:" .. link_record.script_link .. "]][[tooltip:{{tt:" .. link_record.tooltip_key .. "}}]][[" .. lp.link_colour_str .. "]]" .. text .. "[[/" .. lp.colour_str_terminator .. "]][[/tooltip]][[/url]]";
		-- 	return "[[url:" .. link_record.script_link .. "]]" .. text .. "[[/url]]";
		-- end;

		return "[[url:" .. link_record.script_link .. "]]" .. text .. "[[/url]]";
	end;
	
	lp.parse_for_tooltips_func = function(key, text)
		local link_record = lp.links[key];
		
		if not link_record then
			script_error("ERROR: couldn't find a link record for supplied key [" .. tostring(key) .. "]");
			return "";
		end;
		
		-- if this record has no tooltip key then don't include any tags at all
		if not link_record or link_record.tooltip_key == "" then
			return text;
		end;
		
		return "[[tooltip:{{tt:" .. link_record.tooltip_key .. "}}]][[" .. lp.tooltip_colour_str .. "]]" .. text .. "[[/" .. lp.colour_str_terminator .. "]][[/tooltip]]";
	end;
	
	lp.parse_for_no_links_func = function(key, text)
		-- don't tag the text at all
		return text;
	end;
	
	core:add_static_object("link_parser", lp);
	
	return lp;
end;


function get_link_parser()
	return link_parser:new();
end;


----------------------------------------------------------------------------
--	Adding link records
----------------------------------------------------------------------------

function link_parser:add_record(key, script_link, tooltip_key)
	if not is_string(key) then
		script_error("ERROR: add_record() called but supplied key [" .. tostring(key) .. "] is not a string");
		return false;
	end;
	
	if not is_string(script_link) then
		script_error("ERROR: add_record() called but supplied script link [" .. tostring(script_link) .. "] is not a string");
		return false;
	end;
	
	if not tooltip_key then
		tooltip_key = "";
	end;
	
	if not is_string(tooltip_key) then
		script_error("ERROR: add_record() called but supplied tooltip key [" .. tostring(tooltip_key) .. "] is not a string or nil");
		return false;
	end;
	
	local record = {};
	record.script_link = script_link;
	record.tooltip_key = tooltip_key;
	
	self.links[key] = record;
end;


----------------------------------------------------------------------------
--	Parse functions
----------------------------------------------------------------------------

function link_parser:parse_component_for_links(uic)
	if not is_uicomponent(uic) then
		script_error("ERROR: parse_component_for_links() called but supplied object [" .. tostring(uic) .. "] is not a uicomponent");
		return false;
	end;
	
	local unparsed_text, source = uic:GetStateText();
	local parsed_text = self:parse(unparsed_text, self.parse_for_links_func);
	
	if parsed_text then
		uic:SetStateText(parsed_text, source);
	end;
end;


function link_parser:parse_for_links(str)
	if not is_string(str) then
		script_error("ERROR: parse_for_links() called but supplied object [" .. tostring(str) .. "] is not a string");
		return false;
	end;
	
	return self:parse(str, self.parse_for_links_func);
end;


function link_parser:parse_component_for_tooltips(uic)
	if not is_uicomponent(uic) then
		script_error("ERROR: parse_component_for_links() called but supplied object [" .. tostring(uic) .. "] is not a uicomponent");
		return false;
	end;
	
	local unparsed_text, source = uic:GetStateText();
	local parsed_text = self:parse(unparsed_text, self.parse_for_tooltips_func);
	
	if parsed_text then
		uic:SetStateText(parsed_text, source);
	end;
end;


function link_parser:parse_for_tooltips(str)
	if not is_string(str) then
		script_error("ERROR: parse_for_tooltips() called but supplied object [" .. tostring(str) .. "] is not a string");
		return false;
	end;
	
	return self:parse(str, self.parse_for_tooltips_func);
end;


function link_parser:parse_for_no_links(str)
	if not is_string(str) then
		script_error("ERROR: parse_for_no_links() called but supplied object [" .. tostring(str) .. "] is not a string");
		return false;
	end;
	
	return self:parse(str, self.parse_for_no_links_func);
end;


-- for internal use only
function link_parser:parse(str, default_parse_func)
	local modified_str = str;
	local pointer = 1;
	local next_separator = 1;
	
	-- [[sl:key]]text[[/sl]]
	-- handle localised text lookup
	local start_tag = "[[sl_lookup]]";
	local end_tag = "[[/sl_lookup]]";
	
	while true do
		pointer = 1;
		next_separator = string.find(modified_str, start_tag, pointer);
		
		if not next_separator then
			break;
		end;
		
		local pre_text = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(start_tag);
				
		next_separator = string.find(modified_str, end_tag, pointer);
		
		if not next_separator then
			script_error("ERROR: link parser did not find a correctly-formed closing script-lookup tag. Script lookup tags are closed with [[/sl_lookup]]. The string in question follows on the next line:\n" .. modified_str);
			return false;
		end;
		
		local lookup_text = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(end_tag);
		
		local post_text = string.sub(modified_str, pointer);
		
		modified_str = pre_text .. common.get_localised_string(lookup_text) .. post_text;
	end;
			
	-- [[sl:key]]text[[/sl]]
	-- default tag interpreter
	local start_tag_open = "[[sl:";
	local start_tag_close = "]]";
	end_tag = "[[/sl]]";
	
	while true do
		pointer = 1;
		next_separator = string.find(modified_str, start_tag_open, pointer);
		
		if not next_separator then
			break;
		end;
		
		local pre_text = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(start_tag_open);
		
		next_separator = string.find(modified_str, start_tag_close, pointer);
		
		if not next_separator then
			script_error("ERROR: link parser did not find a correctly-formed opening script-link tag. Script link tags are opened as follows: [[sl:link_name]]. The string in question follows on the next line:\n" .. modified_str);
			return false;
		end;
		
		local link_key = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(start_tag_close);
		
		next_separator = string.find(modified_str, end_tag, pointer);
		
		if not next_separator then
			script_error("ERROR: link parser did not find a correctly-formed closing script-link tag. Script link tags are closed with [[/sl]]. The string in question follows on the next line:\n" .. modified_str);
			return false;
		end;
		
		local link_text = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(end_tag);
		
		local post_text = string.sub(modified_str, pointer);
		
		modified_str = pre_text .. default_parse_func(link_key, link_text) .. post_text;
	end;
	
	-- [[sl_link:key]]text[[/sl_link]]
	-- this tag forces the text to be interpreted as a link
	start_tag_open = "[[sl_link:";
	start_tag_close = "]]";
	end_tag = "[[/sl_link]]";
	
	while true do
		pointer = 1;
		next_separator = string.find(modified_str, start_tag_open, pointer);
		
		if not next_separator then
			break;
		end;
		
		local pre_text = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(start_tag_open);
		
		next_separator = string.find(modified_str, start_tag_close, pointer);
		
		if not next_separator then
			script_error("ERROR: link parser did not find a correctly-formed opening script-link tag (forcing link). Script link tags are opened as follows: [[sl_link:<link_name>]]. The string in question follows on the next line:\n" .. modified_str);
			return false;
		end;
		
		local link_key = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(start_tag_close);
		
		next_separator = string.find(modified_str, end_tag, pointer);
		
		if not next_separator then
			script_error("ERROR: link parser did not find a correctly-formed closing script-link tag (forcing link). Script link tags are closed with [[/sl_link]]. The string in question follows on the next line:\n " .. modified_str);
			return false;
		end;
		
		local link_text = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(end_tag);
		
		local post_text = string.sub(modified_str, pointer);
				
		modified_str = pre_text .. self.parse_for_links_func(link_key, link_text) .. post_text;
	end;
	
	-- [[sl_tooltip:key]]text[[/sl_tooltip]]
	-- this tag forces the text to be interpreted as a tooltip
	start_tag_open = "[[sl_tooltip:";
	start_tag_close = "]]";
	end_tag = "[[/sl_tooltip]]";

	while true do
		pointer = 1;
		next_separator = string.find(modified_str, start_tag_open, pointer);
		
		if not next_separator then
			break;
		end;
		
		local pre_text = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(start_tag_open);
		
		next_separator = string.find(modified_str, start_tag_close, pointer);
		
		if not next_separator then
			script_error("ERROR: link parser did not find a correctly-formed opening script-link tag (forcing tooltip). Script link tags are opened as follows: [[sl_tooltip:<link_name>]]. The string in question follows on the next line:\n" .. modified_str);
			return false;
		end;
		
		local link_key = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(start_tag_close);
		
		next_separator = string.find(modified_str, end_tag, pointer);
		
		if not next_separator then
			script_error("ERROR: link parser did not find a correctly-formed closing script-link tag (forcing tooltip). Script link tags are closed with [[/sl_tooltip]]. The string in question follows on the next line:\n" .. modified_str);
			return false;
		end;
		
		local link_text = string.sub(modified_str, pointer, next_separator - 1);
		
		pointer = next_separator + string.len(end_tag);
		
		local post_text = string.sub(modified_str, pointer);
		
		modified_str = pre_text .. self.parse_for_tooltips_func(link_key, link_text) .. post_text;
	end;
		
	return modified_str;
end;