

--- @set_environment battle
--- @set_environment campaign
--- @set_environment frontend

SECONDS_PER_MONTH = 2678400;


-- Advice levels
-- These are to be used with advice_monitor:set_advice_level.
ADVICE_LEVEL_MINIMAL_LOW_HIGH = 0;
ADVICE_LEVEL_LOW_HIGH = 1;
ADVICE_LEVEL_HIGH = 2;


----------------------------------------------------------------------------
---	@section Volume Types
--- @desc A handful of sound-related functions in battle require a volume type to be specified when they are called. The values described below represent those volume types. They can be passed into functions such as @battle:set_volume and @battle:get_volume to specify a volume type.
----------------------------------------------------------------------------


VOLUME_TYPE_MUSIC = 0;			--- @variable VOLUME_TYPE_MUSIC @number Volume type representing music, that can be used with sound-related functions. Value is <code>0</code>.
VOLUME_TYPE_SFX = 1;			--- @variable VOLUME_TYPE_SFX @number Volume type representing sfx, that can be used with sound-related functions. Value is <code>1</code>.
VOLUME_TYPE_ADVISOR = 2;		--- @variable VOLUME_TYPE_ADVISOR @number Volume type representing advisor sounds, that can be used with sound-related functions. Value is <code>2</code>.
VOLUME_TYPE_VO = 3;				--- @variable VOLUME_TYPE_VO @number Volume type representing voiceover sounds, that can be used with sound-related functions. Value is <code>3</code>.
VOLUME_TYPE_INTERFACE = 1;		--- @variable VOLUME_TYPE_INTERFACE @number Volume type representing user interface sounds, that can be used with sound-related functions. Value is <code>4</code>.
VOLUME_TYPE_MOVIE = 5;			--- @variable VOLUME_TYPE_MOVIE @number Volume type representing movie sounds, that can be used with sound-related functions. Value is <code>5</code>.
VOLUME_TYPE_VOICE_CHAT = 6;		--- @variable VOLUME_TYPE_VOICE_CHAT @number Volume type representing voice chat audio, that can be used with sound-related functions. Value is <code>6</code>.
VOLUME_TYPE_MASTER = 7;			--- @variable VOLUME_TYPE_MASTER @number Volume type representing the master volume level, that can be used with sound-related functions. Value is <code>7</code>.




----------------------------------------------------------------------------
---	@section Game Object Iterators
--- @desc See also the section on @"table:Table Iterators".
----------------------------------------------------------------------------


--- @function model_pairs
--- @desc An iterator for use with model objects in campaign and battle. When used in a for loop with a model list object, the iterator function returns the index and next item provided by the list object each loop pass.
--- @desc In campaign, this iterator supports all model list objects such as <code>region_list</code>, <code>character_list</code>, <code>military_force_list</code> etc. In battle, this iterator supports model list objects such as @battle_alliances, @battle_armies and @battle_units, as well as @script_units script collection objects.
--- @p object parent list object
--- @r object child list item
--- @new_example model_pairs usage in campaign
--- @example local region_list = cm:model():world():region_manager():region_list();
--- @example for i, region in model_pairs(region_list) do
--- @example 	out(i .. " " .. region:name());
--- @example end;
--- @result <i>list of all regions</i>
--- @new_example model_pairs usage in battle
--- @example for i, unit in model_pairs(bm:get_player_army():units()) do
--- @example 	bm:out(i .. ": unit with id " .. unit:unique_ui_id() .. " is at position " .. v_to_s(unit:position()));
--- @example end;
--- @result <i>list of player units</i>


if __game_mode == __lib_type_battle then
	function model_pairs(list)
		local i = 0;
		local max = list:count();

		return function()
			i = i + 1;
			if i <= max then
				return i, list:item(i);
			end;
		end;
	end;
elseif __game_mode == __lib_type_campaign then

	function model_pairs(list)
		local i = -1;
		local max = list:num_items() - 1;

		return function()
			i = i + 1;
			if i <= max then
				return i, list:item_at(i);
			end;
		end;
	end;
end;


--- @function uic_pairs
--- @desc An iterator for use with @uicomponent objects, which returns each child in succession. When used in a for loop with a uicomponent object, the iterator function returns the index number and the child corresponding to that index each loop pass.
--- @p @uicomponent parent uicomponent object
--- @r object child uicomponent iterator
--- @example local uic_parent = find_uicomponent(core:get_ui_root(), "some_parent")
--- @example out("Listing children of some_parent:");
--- @example for i, uic_child in uic_pairs(uic_parent) do
--- @example 	out("\tChild " .. i .. " is " .. uic_child:Id());
--- @example end;
--- @result Listing children of some_parent:
--- @result 	Child 0 is first_child
--- @result 	Child 1 is some_other_child
--- @result 	Child 2 is yet_another_child
function uic_pairs(uic)
	if not validate.is_uicomponent(uic) then
		return false;
	end;

	local i = -1;
	local max = uic:ChildCount() - 1;

	return function()
		i = i + 1;
		if i <= max then
			return i, UIComponent(uic:Find(i));
		end;
	end;
end;




----------------------------------------------------------------------------
---	@section Angle Conversions
----------------------------------------------------------------------------


--- @function r_to_d
--- @desc Converts a supplied angle in radians to degrees.
--- @p number angle, Angle in radians
--- @return number angle in degrees
function r_to_d(value)
	if not is_number(value) then
		return false;
	else
		return value * 57.29578;
	end;
end;


--- @function d_to_r
--- @desc Converts a supplied angle in degrees to radians.
--- @p number angle, Angle in degrees
--- @return number angle in radians
function d_to_r(value)
	if not is_number(value) then
		return false;
	else
		return value * 0.017453;
	end;
end;








----------------------------------------------------------------------------
---	@section File and Folder Paths
--- @desc Functions to help get the filename and path of the calling script.
----------------------------------------------------------------------------


--- @function get_file_and_folder_path_as_table
--- @desc Returns the file and path of the calling script as a table of strings.
--- @p [opt=0] integer stack offset, Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file and folder path of the script file calling the the script file calling this function, for example.
--- @return table table of strings
function get_file_and_folder_path_as_table(stack_offset)
	stack_offset = stack_offset or 0;
	
	if not is_number(stack_offset) then
		script_error("ERROR: get_folder_name_and_shortform() called but supplied stack offset [" .. tostring(stack_offset) .. "] is not a number or nil");
		return false;
	end;
	
	-- path of the file that called this function
	local file_path = debug.getinfo(2 + stack_offset).source;
	
	local retval = {};
	
	if string.len(file_path) == 0 then
		-- don't know if this can happen
		return retval;
	end;
	
	local current_separator_pos = 1;
	local next_separator_pos = 1;
	
	-- list of separators - we have to try each of them each time
	local separators = {"\\/", "\\", "//", "/"};
	
	while true do
		local next_separator_pos = string.len(file_path);
		local separator_found = false;
		
		-- try each of our separators and, if we find any, pick the "earliest"
		for i = 1, #separators do
			-- apologies for variable names in here..
			local this_separator = separators[i];
			
			local this_next_separator_pos = string.find(file_path, this_separator, current_separator_pos);
			
			if this_next_separator_pos and this_next_separator_pos < next_separator_pos then
				next_separator_pos = this_next_separator_pos;
				separator_found = this_separator;
			end;			
		end;

		if separator_found then
			table.insert(retval, string.sub(file_path, current_separator_pos, next_separator_pos - 1));
		else
			-- if we didn't find a separator, we must be the end of the path (and it doesn't end with a separator)
			table.insert(retval, string.sub(file_path, current_separator_pos));
			return retval;
		end;
		
		current_separator_pos = next_separator_pos + string.len(separator_found);
		
		-- stop if we're at the end of our string
		if current_separator_pos >= string.len(file_path) then
			return retval;
		end;
	end;
end;


--- @function get_folder_name_and_shortform
--- @desc Returns the folder name of the calling file and the shortform of its filename as separate return parameters. The shortform of the filename is the portion of the filename before the first "_", if one is found. If no shortform is found the function returns only the folder name.
--- @desc A shortform used to be prepended on battle script files to allow them to be easily differentiated from one another in text editors e.g. "TF_battle_main.lua" vs "PY_battle_main.lua" rather than two "battle_main.lua"'s.
--- @p [opt=0] integer stack offset, Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the folder name/shortform of the script file calling the the script file calling this function, for example.
--- @return string name of folder containing calling file
--- @return string shortform of calling filename, if any
function get_folder_name_and_shortform(stack_offset)
	stack_offset = stack_offset or 0;
	
	if not is_number(stack_offset) then
		script_error("ERROR: get_folder_name_and_shortform() called but supplied stack offset [" .. tostring(stack_offset) .. "] is not a number or nil");
		return false;
	end;
	
	local path = get_file_and_folder_path_as_table(stack_offset + 1);
	
	-- folder name is the last-but-one element in the returned path
	if #path < 2 then
		script_error("ERROR: get_folder_name_and_shortform() called but couldn't determine a valid path to folder? Investigate");
		return false;
	end;
	
	folder_name = path[#path - 1];
	
	local shortform_end = string.find(folder_name, "_");
	
	-- if we didn't find a "_" character pass back the whole folder name as a single return value
	if not shortform_end then
		return folder_name;
	end;
	
	-- pass back the substring before the first "_" as the folder shortform
	local shortform = string.sub(folder_name, 1, shortform_end - 1);
	
	return folder_name, shortform;
end;


--- @function get_full_file_path
--- @desc Gets the full filepath and name of the calling file.
--- @p [opt=0] integer stack offset, Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file path of the script file calling the the script file calling this function, for example.
--- @return string file path
function get_full_file_path(stack_offset)
	stack_offset = stack_offset or 0;
	
	if not is_number(stack_offset) then
		script_error("ERROR: get_full_file_path() called but supplied stack offset [" .. tostring(stack_offset) .. "] is not a number or nil");
		return false;
	end;
	
	return debug.getinfo(2 + stack_offset).source;
end;


--- @function get_file_name_and_path
--- @desc Returns the filename and the filepath of the calling file as separate return parameters.
--- @p [opt=0] integer stack offset, Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file name and path of the script file calling the the script file calling this function, for example.
--- @return string file name
--- @return string file path
function get_file_name_and_path(stack_offset)
	stack_offset = stack_offset or 0;
	
	if not is_number(stack_offset) then
		script_error("ERROR: get_file_name_and_path() called but supplied stack offset [" .. tostring(stack_offset) .. "] is not a number or nil");
		return false;
	end;
	
	-- path of the file that called this function
	local file_path = debug.getinfo(2 + stack_offset).source;
	local current_pointer = 1;
	
	while true do
		local separator = "\\";
		local next_separator_pos = string.find(file_path, separator, current_pointer);
		
		if not next_separator_pos then
			separator = "/";
			next_separator_pos = string.find(file_path, separator, current_pointer);
			
			if not next_separator_pos then
				separator = "\\/";
				next_separator_pos = string.find(file_path, separator, current_pointer);
			end;
		end;
		
		if not next_separator_pos then
			-- there are no more separators in the file path
			
			if current_pointer == 1 then
				-- no file path was detected for some reason
				return file_path, "";
			end;
			-- otherwise return the file name and the file path as separate parameters
			return string.sub(file_path, current_pointer), string.sub(file_path, 1, current_pointer - 2);
		end;
		
		current_pointer = next_separator_pos + string.len(separator);
	end;
end;







----------------------------------------------------------------------------
---	@section Tables
----------------------------------------------------------------------------


--- @function table_find
--- @desc Returns the first occurance of the provided object, if find is not a function, or the first object for which find returns a true value if find is a function. Returns nil otherwise.
--- @p table subject table
--- @p object or function find
--- @p [opt=false] boolean If set to true and an object is found, return its index instead of the object
--- @return object or nil the first occurance or satisfying ojbect in the table
function table_find(t, find, return_index)
	local is_function = is_function(find)
	for i = 1, #t do
		if is_function and find(t[i]) or t[i] == find then
			return return_index and i or t[i]
		end
	end
	return nil
end

--- @function table_find_extremum
--- @desc  Returns the extremum among the elements of a table (such as minimum or maximum).
--- @p table subject table 
--- @p function compare
--- @p [opt=false] boolean If set to true and an object is found, return its index instead of the object
--- @return  The extremum in the table, such as minimum or maximum.
function table_find_extremum(t, comp, return_index)
    if #t == 0 then
		return nil    
	end
	res_index = 1    
	for i = 2, #t do        
		if not comp(t[res_index], t[i]) then
			res_index = i
		end    
	end    
	return return_index and res_index or t[res_index]
end

--- @function table_get_random_element
--- @desc Returns a randomly chosen element regardless of whether the table uses keys or not (or mixed). MP safe as long as keys/indexes have deterministic 'tostring'. Inefficient, not suitable for large tables and frequent use
--- @p table subject table
--- @return a randomly chosen element of the table and the key of that element
function table_get_random_element(t)
	local keyset = {}
	for k in pairs(t) do
		table.insert(keyset, k)
	end
	keyset = table_stable_sort(keyset, function(a, b) return tostring(a) < tostring(b) end)
	local random_index = cm:model():random_int(1, #keyset)
	local random_key = keyset[random_index]
	local random_element = t[random_key]
	return random_element, random_key
end

--- @function table_contains
--- @desc Returns true if the supplied indexed table contains the supplied object.
--- @p table subject table
--- @p object object
--- @return boolean table contains object
function table_contains(t, obj)
	for i = 1, #t do
		if t[i] == obj then
			return true;
		end;
	end;
	return false;
end;


--- @function table_append
--- @desc Append the contents of the indexed table destination with the contents of the index table source.
--- @p destination destination table
--- @p source source table
--- @return destination table
function table_append(destination, source)
	for i = 1, #source do
		table.insert(destination, source[i])
	end
	return destination
end


--- @function table_erase
--- @desc Erase from the indexed table the supplied element. Returns true if the table contains the object and it was erased.
--- @p table subject table
--- @p object object
--- @return boolean table contained object
function table_erase(t, obj)
	for i = 1, #t do
		if t[i] == obj then
			table.remove(t, i)
			return true;
		end;
	end;
	return false;
end;


--- @function table_erase_if
--- @desc Erase from the indexed table all elements that fullfil the supplied predicate. Returns true if any elements were removed.
--- @p table subject table
--- @p filter filter function
--- @return boolean table contained elements that fullfilled the filter
function table_erase_if(t, filter)
	local initial_count = #t
	local i = 1
	while i <= #t do
		if filter(t[i]) then
			table.remove(t, i)
		else
			i = i + 1
		end
	end
	return #t < initial_count
end

--- @function table_erase_if_first_only
--- @desc Erase from the indexed table only the first element that fullfils the supplied predicate. Returns true if the table contains the object and it was erased.
--- @p table subject table
--- @p filter filter function
--- @return boolean table contained elements that fullfilled the filter
function table_erase_if_first_only(t, filter)
	for i = 1, #t do
		if filter(t[i]) then
			table.remove(t, i)
			return true;
		end;
	end;
	return false;
end


--- @function table_add_unique
--- @desc Add to the end of the indexed table the supplied element, but only if it did not already exist inside it. Returns true if the table did not contain the object and it was added.
--- @p table subject table
--- @p object object
--- @return boolean table did not contain object
function table_add_unique(t, obj)
	for i = 1, #t do
		if t[i] == obj then
			return false;
		end;
	end;
	table.insert(t, obj)
	return true;
end;


--- @function table_stable_sort
--- @desc Stable sort the contents of the indexed table using the provided comp function. A very simple and inefficient not-in-place way to do this, but probably OK for small tables.
--- @p table subject table
--- @p comp comparison function
--- @p [opt=false] in_place A flag whether the operation should be done in-place. Slower than to simply assign to the result, but could be useful if working with a passed as a parameter table.
--- @return sorted table
function table_stable_sort(t, comp, in_place)
	if not is_table(t) then
		script_error("ERROR: table_stable_sort() called but supplied list [" .. tostring(t) .. "] is not a table");
		return {}
	end

	if #t <= 1 then
		return t
	end

	local a = {}
	a[1] = t[1]
	for i = 2, #t do
		for j = 1, #a do
			-- t[i] < a[j]
			if comp(t[i], a[j]) then
				table.insert(a, j, t[i])
				break
			end
		end
		if #a < i then
			table.insert(a, t[i])
		end
	end

	if in_place then
		-- Now we have the sorted table in a. First clear t, then insert into it every element from a in the sorted order.
		while #t > 0 do
			table.remove(t)
		end
		for i, e in ipairs(a) do
			table.insert(t, e)
		end
		return t
	end
	
	return a
end;


--- @function table_accumulate
--- @desc Accumulate the contents of the indexed table using the provided op function or + if no function is provided.
--- @p table subject table
--- @p obj initial value
--- @p [opt=+] op operator function, taking as first argument the so far accumulated value and as second argument the next element of the table. If not provided, + is used
--- @return accumulated value of the table
function table_accumulate(t, initial_value, op)
	local is_function = is_function(op)
	local value = initial_value
	for i = 1, #t do
		if is_function then
			value = op(value, t[i])
		else
			value = value + t[i]
		end
	end
	return value
end;


--- @function table_read_only
--- @desc Prevents to edit a table
--- @p table subject table
function table_read_only (t)
	local proxy = {}
	local mt = {       -- create metatable
		__index = t,
		__newindex = function (t,k,v)
			error("cant edit a read-only table", 2)
		end
	}
	setmetatable(proxy, mt)
	return proxy
end

--- @function table_deep_copy
--- @desc Makes a deep copy (recursive copy by value, not reference) of all objects, including tables
--- @p object_to_copy - the object we want a copy of
--- @return - the copy of obj
function table_deep_copy(object_to_copy)
	-- copied form https://gist.github.com/tylerneylon/81333721109155b2d244
	local deep_copy_recursion = {
		run = function(self, obj, seen)
			-- Handle non-tables and previously-seen tables.
			if type(obj) ~= 'table' then return obj end
			if seen and seen[obj] then return seen[obj] end

			-- New table; mark it as seen an copy recursively.
			local s = seen or {}
			local res = {}
			s[obj] = res
			for k, v in next, obj do
				res[self:run(k, s)] = self:run(v, s)
			end

			return setmetatable(res, getmetatable(obj))
		end
	}

	return deep_copy_recursion:run(object_to_copy)
end

--- @function table_print
--- @desc Iterates through the table and prints it in the console
--- @p node - the table we want to print
function table_print(node)
	-- for better visibility of the _debug.print function, if someone searches printing tables specifically
	_debug.print(node)
end


--- @function table_size
--- @desc Returns the amount of elements in the table
--- @p t: the supplied table
--- @p [opt=1] table_dimension: if positive integer N then consider t as an N-dimensional table and recurse accordingly (N-1 times) to find its length, if true then recurse infinitely-deep
--- @p seen: the function should NOT be called with a value for this parameter; it is nil by default and it is used as a safeguard against infinite recursion and cyclical tables
--- @return integer size of the table, or nil if error
function table_size(t, table_dimension, seen)
	local local_seen = nil
	if table_dimension == true then
		local_seen = seen or {}
		if local_seen[t] then
			return 0
		end
		local_seen[t] = true
	end

	if table_dimension == 0 then
		return 1
	elseif not is_table(t) and (table_dimension ~= true or not is_number(table_dimension)) then
		script_error("ERROR: table_size() called but provided argument is not a table.");
		return
	elseif is_number(table_dimension) and (not is_integer(table_dimension) or table_dimension < 0) then
		script_error("ERROR: table_size() called with invalid `table_dimension` argument: " .. table_dimension .. ".");
		return
	end

	if table_dimension == nil then
		table_dimension = 1
	end

	local size = 0
	for _, element in next, t do
		if is_table(element) then
			if table_dimension == true then
				size = size + table_size(element, true, local_seen)
			elseif table_dimension > 0 then
				size = size + table_size(element, table_dimension - 1, local_seen)
			end
		else
			size = size + 1
		end
	end
	return size
end


----------------------------------------------------------------------------
---	@section UIComponents
----------------------------------------------------------------------------


--- @function find_child_uicomponent
--- @desc Takes a uicomponent and a string name. Searches the direct children (and no further - not grandchildren etc) of the supplied uicomponent for another uicomponent with the supplied name. If a uicomponent with the matching name is found then it is returned, otherwise <code>false</code> is returned.
--- @p uicomponent parent ui component
--- @p string name
--- @return uicomponent child, or false if not found
function find_child_uicomponent(parent, name)
	for i = 0, parent:ChildCount() - 1 do
		local uic_child = UIComponent(parent:Find(i));
		if uic_child:Id() == name then
			return uic_child;
		end;
	end;
	
	return false;
end;


--- @function find_child_uicomponent_by_property
--- @desc Takes a uicomponent, and a string property key and value. Searches the direct children (and no further - not grandchildren etc) of the supplied uicomponent for a uicomponent where the property key/value matches what has been supplied. If a uicomponent where the value of the specified property matches the supplied value then it is returned, otherwise <code>false</code> is returned.
--- @p uicomponent parent ui component
--- @p string property key
--- @p string property value
--- @p [opt=nil] @table exception ids, An optional table of component ids/names that are excluded from the search criteria.
--- @return uicomponent child, or false if not found
function find_child_uicomponent_by_property(parent, property_key, property_value, except_ids)
	if not is_table(except_ids) then
		except_ids = {}
	end

	for i = 0, parent:ChildCount() - 1 do
		local uic_child = UIComponent(parent:Find(i))
		local uic_child_id = uic_child:Id()
		if uic_child:GetProperty(property_key) == property_value and not table_contains(except_ids, uic_child_id) then
			return uic_child
		end
	end

	return false
end

--- @function find_children_uicomponents
--- @desc Takes a uicomponent and an arbitrary predicate function. Searches the direct children (and no further grandchildren) of the supplied uicomponent for other uicomponents for which the supplied predicate function returns <code>true</code>. All such found uicomponents are returned into an array; the array could be empty.
--- @p uicomponent parent : the ui component to start the search from
--- @p function func : a predicate function 
--- @return table of uicomponent(s) or empty table
function find_children_uicomponents(parent, func)
	local valid_children = {}

	for i = 0, parent:ChildCount() - 1 do
		local uic_child = UIComponent(parent:Find(i))
		if func(uic_child) then
			table.insert(valid_children, uic_child)
		end
	end
	
	return valid_children
end


--- @function find_uicomponent
--- @desc Finds and returns a uicomponent based on a set of strings that define its path in the ui hierarchy. This parent uicomponent can be supplied as the first argument - if omitted, the root uicomponent is used. Starting from the parent or root, the function searches through all descendants for a uicomponent with the next supplied uicomponent name in the sequence. If a uicomponent is found, its descendants are then searched for a uicomponent with the next name in the list, and so on until the list is finished or no uicomponent with the supplied name is found. A fragmentary path may be supplied if it still unambiguously specifies the intended uicomponent.
--- @p [opt=nil] @uicomponent parent ui component
--- @p ... list of string names
--- @return uicomponent child, or false if not found.
function find_uicomponent(...)

	local args_to_use;
	local start_uicomponent;

	if is_uicomponent(arg[1]) then
		
		-- The first argument is a uicomponent from which we will start the search, therefore we must build the
		-- args_to_use table out of the rest of the arguments this function was given
		args_to_use = {};
		for i = 2, arg.n do
			table.insert(args_to_use, arg[i]);
		end;

		start_uicomponent = arg[1];
	else
		start_uicomponent = core:get_ui_root();
		args_to_use = arg;
	end;

	-- We do this test as the UI fires events that trigger scripts that call find_uicomponent() during the UI reloading process, after the UIDestroyed event 
	-- is received but unhelpfully before the subsequent UICreated event occurs. This test guards against core:get_ui_root() returning false which can happen
	-- in this unfortunate window.
	if start_uicomponent then
		return start_uicomponent:SequentialFind(unpack(args_to_use));
	end;
end;


--- @function find_uicomponent_from_table
--- @desc Takes a start uicomponent and a numerically-indexed table of string uicomponent names. Starting from the supplied start uicomponent, the function searches through all descendants for a uicomponent with the next supplied uicomponent name in the table. If a uicomponent is found, its descendants are then searched for a uicomponent with the next name in the list, and so on until the list is finished or no uicomponent with the supplied name is found. This allows a uicomponent to be searched for by matching its name and part of or all of its path.
--- @p uicomponent parent ui component, Parent uicomponent.
--- @p table table of string names, Table of string names, indexed by number.
--- @return uicomponent child, or false if not found.
function find_uicomponent_from_table(parent, t)
	if not is_uicomponent(parent) then
		script_error("ERROR: find_uicomponent_from_table() called but supplied starting component [" .. tostring(parent) .. "] is not a uicomponent");
		return false;
	end;

	if not is_table(t) then
		script_error("ERROR: find_uicomponent_from_table() called but supplied path list [" .. tostring(t) .. "] is not a table");
		return false;
	end;

	return parent:SequentialFind(unpack(t));
end;


--- @function uicomponent_descended_from
--- @desc Takes a uicomponent and a string name. Returns true if any parent ancestor component all the way up to the ui root has the supplied name (i.e. the supplied component is descended from it), false otherwise.
--- @p uicomponent subject uic
--- @p string parent name
--- @p boolean [opt=nil] include_parent : if true it takes into account the possibility for uic's id to be the parent_name requested (effectively turning the function into "uicomponent_descended_from_or_is")
--- @return boolean uic is descended from a component with the supplied name.
function uicomponent_descended_from(uic, parent_name, include_parent)
	if not is_uicomponent(uic) then
		script_error("ERROR: uicomponent_descended_from() called but supplied uicomponent [" .. tostring(uic) .. "] is not a ui component");
		return false;
	end;
	
	if not is_string(parent_name) then
		script_error("ERROR: uicomponent_descended_from() called but supplied parent name [" .. tostring(parent_name) .. "] is not a string");
		return false;
	end;

	if include_parent and uic:Id() == parent_name then
		return true
	end

	while true do
		-- uic is now the address of the parent uic
		uic = uic:Parent();

		-- if this address is nil then there was no parent, so return false
		if not uic then
			return false;
		end;

		-- the address is not nil, so wrap it as a uicomponent
		uic = UIComponent(uic);

		-- if it's not valid then return false
		if not uic:IsValid() then
			return false;
		end;

		-- we now have a valid uicomponent, see if the name matches
		if uic:Id() == parent_name then
			return true;
		end;
	end;
end;


local function uicomponent_find_test(uic, specifier)
	if is_string(specifier) then
		-- we now have a valid uicomponent, see if the name matches
		if uic:Id() == specifier then 
			return uic
		end
	else
		-- we now have a valid uicomponent, see if the supplied function returns true when called with it
		if specifier(uic) then
			return uic
		end
	end
end;


--- @function uicomponent_find_up
--- @desc Searches within the ui hierarchy above a supplied @uicomponent, and finds and returns a uicomponent that matches a specifier argument. The specifier argument can be a @string or a function, and the parent of the supplied uicomponent, then the parent of that parent, and so on back to the ui root are queried until a match is found.
--- @desc If a @string specifier is given, that is tested against the name of each parent uicomponent in turn. If a @function specifier is given instead, then that function is called for each parent in sequence, with the parent candidate being supplied to the function as a single argument. If the function returns a value other than @nil or <code>false</code> then that is considered a match.
--- @desc If a match is found, then that particular parent @uicomponent is returned. Otherwise, @nil is returned.
--- @p @uicomponent subject uic
--- @p @string parent specifier, Parent specifier. This can either be a @string name, or a @function that, when called with the candidate uicomponent, returns <code>true</code>.
--- @r @uicomponent parent uicomponent, or @nil if no matching parent was found
function uicomponent_find_up(uic, specifier)
	if not is_uicomponent(uic) then
		script_error("ERROR: uicomponent_find_up() called but supplied uicomponent [" .. tostring(uic) .. "] is not a valid ui component")
		return nil
	end
	
	if not is_string(specifier) and not is_function(specifier) then
		script_error("ERROR: uicomponent_find_up() called but supplied specifier [" .. tostring(specifier) .. "] is not a string or function")
		return nil
	end

	while true do
		-- uic is now the address of the parent uic
		uic = uic:Parent()

		-- if this address is nil then there was no parent, so return nil
		if not uic then
			break 
		end

		-- the address is not nil, so wrap it as a uicomponent
		uic = UIComponent(uic)

		-- if it's not valid then return nil
		if not uic:IsValid() then
			break
		end

		local result = uicomponent_find_test(uic, specifier)
		if result then
			return result
		end
	end
end


--- @function uicomponent_find_down
--- @desc Searches within the ui hierarchy below a supplied @uicomponent, and finds and returns a uicomponent that matches a specifier argument. The specifier argument can be a @string or a function, and the supplied uicomponent itself, then its children recursively are queried until a match is found. The search is depth-first, so the children of the first child are queried before the second child is.
--- @desc If a @string specifier is given, that is tested against the name of each child uicomponent. If a @function specifier is given instead, then that function is called for each child uicomponent, with the candidate child being supplied to the function as a single argument. If the function returns a value other than @nil or <code>false</code> then that is considered a match.
--- @desc If a match is found, then that particular child @uicomponent is returned. Otherwise, @nil is returned.
--- @desc Use this function with caution with a uicomponent that has many children, as the search could be expensive.
--- @p @uicomponent subject uic
--- @p @string child specifier, Child specifier. This can either be a @string name, or a @function that, when called with the candidate uicomponent, returns <code>true</code>.
--- @r @uicomponent child uicomponent, or @nil if no matching child was found
function uicomponent_find_down(uic, specifier)
	if not is_uicomponent(uic) or not uic:IsValid() then
		script_error("ERROR: uicomponent_find_down() called but supplied uicomponent [" .. tostring(uic) .. "] is not a ui component")
		return nil
	end

	if not is_string(specifier) and not is_function(specifier) then
		script_error("ERROR: uicomponent_find_down() called but supplied specifier [" .. tostring(specifier) .. "] is not a string or function")
		return nil
	end

	local result = uicomponent_find_test(uic, specifier)
	if result then
		return result
	end

	for i, uic_child in uic_pairs(uic) do
		local result = uicomponent_find_down(uic_child, specifier)
		if result then 
			return result
		end
	end
end


--- @function uicomponent_to_str
--- @desc Converts a uicomponent to a string showing its path, for output purposes.
--- @p uicomponent subject uic
--- @return string output
function uicomponent_to_str(uic)
	if not is_uicomponent(uic) then
		return "";
	end;
	
	if uic:Id() == "root" then
		return "root";
	else
		local parent = uic:Parent();
		
		if parent then
			return uicomponent_to_str(UIComponent(parent)) .. " > " .. uic:Id();
		else
			-- this can happen if a click has resulted in some uicomponents being destroyed
			return uic:Id();
		end;
	end;	
end;


--- @function output_uicomponent
--- @desc Outputs extensive debug information about a supplied uicomponent to the console.
--- @p uicomponent subject uic, Subject uicomponent.
--- @p [opt=false] boolean omit children, Do not show information about the uicomponent's children.
function output_uicomponent(uic, omit_children, include_animation_data)
	if not is_uicomponent(uic) then
		script_error("ERROR: output_uicomponent() called but supplied object [" .. tostring(uic) .. "] is not a ui component");
		return;
	end;
	
	-- not sure how this can happen, but it does ...
	if not pcall(function() out.ui("uicomponent " .. tostring(uic:Id()) .. ":") end) then
		out.ui("output_uicomponent() called but supplied component seems to not be valid, so aborting");
		return;
	end;
	
	out.ui("");
	out.ui("path from root:\t\t" .. uicomponent_to_str(uic));
	
	if __game_mode == __lib_type_campaign then
		out.inc_tab("ui");
	end;
	
	local pos_x, pos_y = uic:Position();
	local size_x, size_y = uic:Bounds();

	out.ui("position on screen:\t" .. tostring(pos_x) .. ", " .. tostring(pos_y));
	out.ui("size:\t\t\t" .. tostring(size_x) .. ", " .. tostring(size_y));
	out.ui("state:\t\t" .. tostring(uic:CurrentState()));
	out.ui("visible:\t\t" .. tostring(uic:Visible(true)));
	out.ui("priority:\t\t" .. tostring(uic:Priority()));
	out.ui("opacity:\t\t" .. tostring(uic:Opacity()));

	if include_animation_data then
		local animation_names = uic:GetAnimationNames();

		out.ui("animations:");

		local animation_frame_data_types = {
			"colour",
			"position",
			"scale",
			"shader_values",
			"rotation",
			"image",
			"opacity",
			"text",
			"interpolation_time",
			"font_scale",
			"material_params"
		};

		for i = 1, #animation_names do
			local current_animation_name = animation_names[i];
			local current_num_frames = uic:NumAnimationFrames(current_animation_name);

			out.ui("\tanimation [" .. current_animation_name .. "]");
			for j = 0, current_num_frames - 1 do
				out.ui("\t\tframe " .. j .. ":");
				for k = 1, #animation_frame_data_types do
					local data_a, data_b, data_c, data_d = uic:GetAnimationFrameProperty(current_animation_name, j, animation_frame_data_types[k]);
					out.ui("\t\t\t" .. animation_frame_data_types[k] .. ": [" .. tostring(data_a) .. ", " .. tostring(data_b) .. ", " .. tostring(data_c) .. ", " .. tostring(data_d) .. "] ");
				end;
			end;
		end;
	end
	
	if not omit_children then
		out.ui("children:");
		
		if __game_mode == __lib_type_campaign then
			out.inc_tab("ui");
		end;
		
		for i = 0, uic:ChildCount() - 1 do
			local child = UIComponent(uic:Find(i));
			
			out.ui(tostring(i) .. ": " .. child:Id());
		end;
	end;
	
	if __game_mode == __lib_type_campaign then
		out.dec_tab("ui");
		out.dec_tab("ui");
	end;

	out.ui("");
end;


--- @function output_uicomponent_on_click
--- @desc Starts a listener which outputs information to the console about every uicomponent that's clicked on.
function output_uicomponent_on_click()	
	out.ui("*** output_uicomponent_on_click() called ***");
	
	core:add_listener(
		"output_uicomponent_on_click",
		"ComponentLClickUp",
		true,
		function(context) output_uicomponent(UIComponent(context.component), true) end,
		true
	);
end;


--- @function print_all_uicomponent_children
--- @desc Prints the name and path of the supplied uicomponent and all its descendents. Very verbose, and can take a number of seconds to complete.
--- @p [opt=uiroot] @uicomponent subject uic
--- @p [opt=false] @boolean full output
function print_all_uicomponent_children(uic, full_output)
	
	uic = uic or core:get_ui_root();

	if full_output then
		output_uicomponent(uic, true);
	else
		out.ui(uicomponent_to_str(uic));
	end;

	for i = 0, uic:ChildCount() - 1 do
		local uic_child = UIComponent(uic:Find(i));
		print_all_uicomponent_children(uic_child, full_output);
	end;
end;


--- @function pulse_uicomponent
--- @desc Activates or deactivates a pulsing highlight effect on the supplied uicomponent. This is primarily used for scripts which activate when the player moves the mouse cursor over certain words in the help pages, to indicate to the player what UI feature is being talked about on the page.
--- @p uicomponent ui component, Subject ui component.
--- @p boolean should pulse, Set to <code>true</code> to activate the pulsing effect, <code>false</code> to deactivate it.
--- @p [opt=0] number brightness, Pulse brightness. Set a higher number for a more pronounced pulsing effect.
--- @p [opt=false] boolean progagate, Propagate the effect through the component's children. Use this with care, as the visual effect can stack and often it's better to activate the effect on specific uicomponents instead of activating this.
--- @p [opt=nil] string state name, Optional state name to affect. If a string name is supplied, the pulsing effect is only applied to the specified state instead of to all states on the component.
function pulse_uicomponent(uic, should_pulse, brightness_modifier, propagate, state_name)
	
	brightness_modifier = brightness_modifier or 0;
	silent = silent or false;

	if not is_uicomponent(uic) then
		script_error("ERROR: pulse_uicomponent() called but supplied uicomponent [" .. tostring(uic) .. "] is not a ui component");
		return false;
	end;
	
	if should_pulse then
		if state_name then
			uic:StartPulseHighlight(brightness_modifier, state_name);
		else
			uic:StartPulseHighlight(brightness_modifier);
		end;
	else
		if state_name then
			uic:StopPulseHighlight(state_name);
		else
			uic:StopPulseHighlight();
		end;
	end;
	
	if propagate then
		for i = 0, uic:ChildCount() - 1 do
			pulse_uicomponent(UIComponent(uic:Find(i)), should_pulse, brightness_modifier, propagate, state_name);
		end;
	end;
end;


--- @function is_fully_onscreen
--- @desc Returns true if the uicomponent is fully on-screen, false otherwise.
--- @p @uicomponent uicomponent
--- @return @boolean is onscreen
function is_fully_onscreen(uicomponent)
	local screen_x, screen_y = core:get_screen_resolution();
	
	local min_x, min_y = uicomponent:Position();
	local size_x, size_y = uicomponent:Bounds();
	local max_x = min_x + size_x;
	local max_y = min_y + size_y;
	
	return min_x >= 0 and max_x <= screen_x and min_y >= 0 and max_y <= screen_y;	
end;


--- @function is_partially_onscreen
--- @desc Returns true if the uicomponent is partially on-screen, false otherwise.
--- @p @uicomponent uicomponent
--- @return @boolean is onscreen
function is_partially_onscreen(uicomponent)
	local screen_x, screen_y = core:get_screen_resolution();
	
	local min_x, min_y = uicomponent:Position();
	local size_x, size_y = uicomponent:Bounds();
	local max_x = min_x + size_x;
	local max_y = min_y + size_y;
	
	return ((min_x >= 0 and min_x <= screen_x) or (max_x >= 0 and max_x <= screen_x)) and ((min_y >= 0 and min_y <= screen_y) or (max_y >= 0 and max_y <= screen_y));	
end;




--- @function set_component_visible
--- @desc Sets a uicomponent visible or invisible by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for @global:find_uicomponent_from_table, which performs the search).
--- @p boolean set visible
--- @p ... list of string names
function set_component_visible(visible, ...)
	local parent = core:get_ui_root();

	local arg_list = {};
	
	for i = 1, arg.n do
		table.insert(arg_list, arg[i]);
	end;
	
	local uic = find_uicomponent_from_table(parent, arg_list);
	
	if is_uicomponent(uic) then
		uic:SetVisible(not not visible);
	end;
end;


--- @function set_component_visible_with_parent
--- @desc Sets a uicomponent visible or invisible by its path. The path should be one or more strings which when sequentially searched for from a supplied uicomponent parent lead to the target uicomponent (see documentation for @global:find_uicomponent_from_table, which performs the search).
--- @p boolean set visible
--- @p uicomponent parent uicomponent
--- @p ... list of string names
function set_component_visible_with_parent(visible, parent, ...)
	local arg_list = {};
	
	for i = 1, arg.n do
		table.insert(arg_list, arg[i]);
	end;
	
	local uic = find_uicomponent_from_table(parent, arg_list)

	if is_uicomponent(uic) then
		uic:SetVisible(not not visible);
	end;
end;


--- @function set_component_active
--- @desc Sets a uicomponent to be active or inactive by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for @global:find_uicomponent_from_table, which performs the search).
--- @p boolean set active
--- @p ... list of string names
function set_component_active(is_active, ...)
	local parent = core:get_ui_root();
	
	local arg_list = {};
	
	for i = 1, arg.n do
		table.insert(arg_list, arg[i]);
	end;
	
	local uic = find_uicomponent_from_table(parent, arg_list);
	
	if is_uicomponent(uic) then
		set_component_active_action(is_active, uic);
	end;
end;


--- @function set_component_active_with_parent
--- @desc Sets a uicomponent to be active or inactive by its path. The path should be one or more strings which when sequentially searched for from a supplied uicomponent parent lead to the target uicomponent (see documentation for @global:find_uicomponent_from_table, which performs the search).
--- @p boolean set active
--- @p uicomponent parent uicomponent
--- @p ... list of string names
function set_component_active_with_parent(is_active, parent, ...)
	local arg_list = {};
	
	for i = 1, arg.n do
		table.insert(arg_list, arg[i]);
	end;
	
	local uic = find_uicomponent_from_table(parent, arg_list);
	
	if is_uicomponent(uic) then
		set_component_active_action(is_active, uic);
	end;
end;


-- for internal use
function set_component_active_action(is_active, uic)
	local active_str = nil;
	
	if is_active then
		active_str = "active";
	else
		active_str = "inactive";
	end;

	uic:SetState(active_str);
	uic:SetInteractive(is_active);
end;


--- @function highlight_component
--- @desc Highlights or unhighlights a uicomponent by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for @global:find_uicomponent_from_table, which performs the search).
--- @p boolean activate highlight, Set <code>true</code> to activate the highlight, <code>false</code> to deactivate.
--- @p boolean is square, Set to <code>true</code> if the target uicomponent is square, <code>false</code> if it's circular.
--- @p ... list of string names
function highlight_component(value, is_square, ...)
	return highlight_component_action(false, value, is_square, unpack(arg));
end;


--- @function highlight_visible_component
--- @desc Highlights or unhighlights a uicomponent by its path, but only if it's visible. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for @global:find_uicomponent_from_table, which performs the search).
--- @p boolean activate highlight, Set <code>true</code> to activate the highlight, <code>false</code> to deactivate.
--- @p boolean is square, Set to <code>true</code> if the target uicomponent is square, <code>false</code> if it's circular.
--- @p ... list of string names
function highlight_visible_component(value, is_square, ...)
	return highlight_component_action(true, value, is_square, unpack(arg));
end;


function highlight_component_action(visible_only, value, is_square, ...)
	local uic = find_uicomponent_from_table(core:get_ui_root(), arg);
	
	if is_uicomponent(uic) then
		if not visible_only or uic:Visible() then
			uic:Highlight(value, is_square, 0);
		end;
		return true;
	else
		script_error("WARNING: highlight_component_action() could not find uicomponent with path [" .. table.concat(arg, ",") .. "]");
	end;
	
	return false;
end;


--- @function highlight_all_visible_children
--- @desc Draws a box highlight around all visible children of the supplied uicomponent. A padding value in pixels may also be supplied to increase the visual space between the highlight and the components being highlighted.
--- @p uicomponent parent
--- @p [opt=0] number visual padding
function highlight_all_visible_children(uic, padding)
	
	if not is_uicomponent(uic) then
		script_error("ERROR: highlight_all_visible_children() called but supplied uicomponent [" .. tostring(uic) .. "] is not a uicomponent");
		return false;
	end;
	
	padding = padding or 0;
	
	local components_to_highlight = {};
	
	for i = 0, uic:ChildCount() - 1 do
		local uic_child = UIComponent(uic:Find(i));
			
		if uic_child:Visible(true) then
			table.insert(components_to_highlight, uic_child);
		end;
	end;
	
	highlight_component_table(padding, unpack(components_to_highlight));
end;


--- @function unhighlight_all_visible_children
--- @desc Cancels any and all highlights created with @global:highlight_all_visible_children.
function unhighlight_all_visible_children()
	unhighlight_component_table();
end;


--- @function highlight_component_table
--- @desc Draws a box highlight stretching around the supplied list of components. A padding value in pixels may also be supplied to increase the visual space between the highlight and the components being highlighted.
--- @p number visual padding, Visual padding in pixels.
--- @p ... uicomponents, Variable number of uicomponents to draw highlight over.
function highlight_component_table(padding, ...)
	
	local component_list = arg;

	if not is_number(padding) or padding < 0 then
		-- if the first parameter is a uicomponent then insert it at the start of our component list
		if is_uicomponent(padding) then
			table.insert(component_list, 1, padding);
			padding = 0;
		else
			script_error("ERROR: highlight_component_table() called but supplied padding value [" .. tostring(padding) .. "] is not a positive number (or a uicomponent)");
			return false;
		end;
	end;
	
	local min_x = 10000000;
	local min_y = 10000000;
	local max_x = 0;
	local max_y = 0;
	
	for i = 1, #component_list do
		local current_component = component_list[i];
		
		if not is_uicomponent(current_component) then
			script_error("ERROR: highlight_component_table() called but parameter " .. i .. " in supplied list is a [" .. tostring(current_component) .. "] and not a uicomponent");
			return false;
		end;
		
		local current_min_x, current_min_y = current_component:Position();
		local size_x, size_y = current_component:Dimensions();
		
		local current_max_x = current_min_x + size_x;
		local current_max_y = current_min_y + size_y;
		
		if current_min_x < min_x then
			min_x = current_min_x;
		end;
		
		if current_min_y < min_y then
			min_y = current_min_y;
		end;
		
		if current_max_x > max_x then
			max_x = current_max_x;
		end;
		
		if current_max_y > max_y then
			max_y = current_max_y;
		end;
	end;
	
	-- apply padding
	min_x = min_x - padding;
	min_y = min_y - padding;
	max_x = max_x + padding;
	max_y = max_y + padding;
	
	-- create the dummy component if we don't already have one lurking around somewhere
	local ui_root = core:get_ui_root();
	
	local uic_dummy = find_uicomponent(ui_root, "highlight_dummy");
	
	if not uic_dummy then
		ui_root:CreateComponent("highlight_dummy", core.path_to_dummy_component);
		uic_dummy = find_uicomponent(ui_root, "highlight_dummy");
	end;
	
	if not uic_dummy then
		script_error("ERROR: highlight_component_table() cannot find uic_dummy, how can this be?");
		return false;
	end;
	
	-- resize and move the dummy
	local size_x = max_x - min_x;
	local size_y = max_y - min_y;
	
	-- uic_dummy:SetMoveable(true);
	uic_dummy:MoveTo(min_x, min_y);
	uic_dummy:Resize(size_x, size_y);
	
	local new_pos_x, new_pos_y = uic_dummy:Position();
	
	uic_dummy:Highlight(true, true, 0);
end;


--- @function unhighlight_component_table
--- @desc Cancels any and all highlights created with @global:highlight_component_table.
function unhighlight_component_table()
	local uic_dummy = find_uicomponent("highlight_dummy");
	if uic_dummy then
		uic_dummy:Highlight(false);
		uic_dummy:Destroy();
	end;
end;


--- @function play_component_animation
--- @desc Plays a specified component animation on a uicomponent by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for @global:find_uicomponent_from_table, which performs the search).
--- @p string animation name
--- @p ... list of string names
function play_component_animation(animation, ...)
	
	local uic = find_uicomponent_from_table(core:get_ui_root(), arg);
	
	if is_uicomponent(uic) then
		uic:TriggerAnimation(animation);
	else
		script_error("WARNING: play_component_animation() could not find uicomponent with path [" .. table.concat(arg, ",") .. "]");
	end;
end;


--- @function uicomponent_has_parent_filter
--- @desc Returns <code>true</code> if the supplied uicomponent has a parent or ancestor that matches the supplied filter, or <code>false</code> otherwise. The filter should be a function that accepts a uicomponent as a single argument and returns <code>true</code> or <code>false</code> depending on whether the uicomponent passes the filter. The first matching ancestor is also returned.
--- @p @uicomponent uicomponent
--- @p @function filter
--- @return @boolean uic parent passes filter
--- @return @uicomponent first matching ancestor
function uicomponent_has_parent_filter(uic, filter)
	while true do
		uic = uic:Parent();

		if not uic then
			return false;
		end;

		uic = UIComponent(uic);

		if filter(uic) then
			return true, uic;
		end;
	end;
end;


--- @function create_confirmation_box
--- @desc Creates confirmation box component with the specified id, text and accept / cancel callbacks
--- @p string id of the uicomponent that is going to be created
--- @p string localisation_key
--- @p [opt=nil] function on_accept_callback
--- @p [opt=nil] function on_cancel_callback
--- @p [opt=nil] uicomponent uic_parent, Parent uicomponent
--- @return nil
function create_confirmation_box(id, localisation_key, on_accept_callback, on_cancel_callback, uic_parent)
	local localised_text = common.get_localised_string(localisation_key)

	create_confirmation_box_with_text_from_script(id, localised_text, localisation_key, on_accept_callback, on_cancel_callback, uic_parent)
end

--- @function create_confirmation_box_with_text_from_script
--- @desc Creates confirmation box component with the specified id, localised_text constructed in the scripts and accept / cancel callbacks
--- @p string id of the uicomponent that is going to be created
--- @p string text Localised text constructed in lua
--- @p string text_source Source of the localised text
--- @p [opt=nil] function on_accept_callback
--- @p [opt=nil] function on_cancel_callback
--- @p [opt=nil] uicomponent uic_parent, Parent uicomponent
--- @p [opt=nil] string title_text Localised title text constructed in lua
--- @p [opt=nil] string title_text_source Source of the localised title text constructed in lua
--- @return nil
function create_confirmation_box_with_text_from_script(id, text, text_source, on_accept_callback, on_cancel_callback, uic_parent, title_text, title_text_source)
	local confirmation_box = core:get_or_create_component(id, "ui/Common UI/scripted_dialogue_box", uic_parent)
	confirmation_box:SetVisible(true)
	confirmation_box:RegisterTopMost()
	confirmation_box:SequentialFind("ok_group"):SetVisible(false)
	confirmation_box:PropagatePriority(5000)

	local dy_text = find_uicomponent(confirmation_box, "DY_text")
	dy_text:SetStateText(text, text_source)

	local dy_title = find_uicomponent(confirmation_box, "title_text")
	if dy_title then
		if title_text_source then
			dy_title:SetVisible(true)
			dy_title:SetStateText(title_text, title_text_source)
		else
			dy_title:SetVisible(false)
		end
	end

	local steal_input
	local release_input

	local accept_fn = function()
			confirmation_box:UnLockPriority()
			confirmation_box:Destroy()

			if on_accept_callback then
				on_accept_callback()
			end
		end

	local cancel_fn = function()
			confirmation_box:UnLockPriority()
			confirmation_box:Destroy()

			if on_cancel_callback then
				on_cancel_callback()
			end
		end

	local on_closed = function()
			core:remove_listener(id .. "_confirmation_box_accept")
			core:remove_listener(id .. "_confirmation_box_reject")
			core:remove_listener(id .. "_confirmation_box_closed")

			release_input()
		end

	steal_input = function()
		if core:is_campaign() then
			cm:steal_user_input(true)

			cm:steal_escape_key_with_callback(id .. "_confirmation_box_esc", cancel_fn)

			cm:steal_key_with_callback(id .. "_confirmation_box_enter", "NUMPADENTER", accept_fn)
			cm:steal_key_with_callback(id .. "_confirmation_box_enter2", "RETURN", accept_fn)
		elseif core:is_battle() then
			bm:steal_escape_key_with_callback(id .. "_confirmation_box_esc", cancel_fn)
		end

		confirmation_box:LockPriority()
	end

	release_input = function()
		if core:is_campaign() then
			cm:steal_user_input(false)

			cm:release_escape_key_with_callback(id .. "_confirmation_box_esc")

			cm:release_key_with_callback(id .. "_confirmation_box_enter2", "RETURN", accept_fn)
			cm:release_key_with_callback(id .. "_confirmation_box_enter", "NUMPADENTER", accept_fn)
		elseif core:is_battle() then
			bm:release_escape_key_with_callback(id .. "_confirmation_box_esc")
		end
	end

	core:add_listener(
		id .. "_confirmation_box_accept",
		"ComponentLClickUp",
		function(context)
			return context.string == "button_tick"
		end,
		accept_fn,
		false
	)

	core:add_listener(
		id .. "_confirmation_box_reject",
		"ComponentLClickUp",
		function(context)
			return context.string == "button_cancel"
		end,
		cancel_fn,
		false
	)

	core:add_listener(
		id .. "_confirmation_box_closed",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger():split(":")[1] == "ScriptedDialogueBoxClose"
		end,
		on_closed,
		false
	)

	steal_input()
end











----------------------------------------------------------------------------
---	@section Advisor Components
----------------------------------------------------------------------------

local advisor_progress_button_paths = {
	{"advice_interface", "info_text", "button_close"},
	{"under_advisor_docker", "info_text", "button_close"},
	{"advice_interface", "advisor_holder", "button_hide_advisor"}
};

local advisor_controls = {
	{"advice_interface", "advisor_holder", "button_toggle_options"},
	{"advice_interface", "advisor_holder", "button_next"},
	{"advice_interface", "advisor_holder", "button_previous"}
};


--- @function get_advisor_progress_buttons
--- @desc Returns a table containing advisor progress/close button uicomponents, in order of precedence.
--- @r @table of @uicomponent objects
function get_advisor_progress_buttons()
	
	local retval = {};
	local ui_root = core:get_ui_root();

	for i = 1, #advisor_progress_button_paths do
		local uic = find_uicomponent_from_table(ui_root, advisor_progress_button_paths[i]);
		if uic then
			table.insert(retval, uic);
		end;
	end;

	return retval;
end;


--- @function get_advisor_non_progress_controls
--- @desc Returns a table containing advisor back/forward and settings buttons.
--- @r @table of @uicomponent objects
function get_advisor_non_progress_controls()
	local retval = {};
	local ui_root = core:get_ui_root();

	for i = 1, #advisor_controls do
		local current_path = advisor_controls[i];
		local uic = find_uicomponent_from_table(ui_root, current_path);
		if uic then
			table.insert(retval, uic);
		else
			script_error("WARNING: get_advisor_non_progress_controls() could not find uicomponent with path [" .. table.concat(current_path, ",") .. "]");
		end;
	end;

	return retval;
end;


--- @function get_all_advisor_controls
--- @desc Returns a table containing advisor back/forward and settings buttons, as well as advisor close/progress buttons.
--- @r @table of @uicomponent objects
function get_all_advisor_controls()
	local retval = {};
	local ui_root = core:get_ui_root();

	for i = 1, #advisor_progress_button_paths do
		local current_path = advisor_progress_button_paths[i];
		local uic = find_uicomponent_from_table(ui_root, current_path);
		if uic then
			table.insert(retval, uic);
		else
			script_error("WARNING: get_all_advisor_controls() could not find uicomponent with path [" .. table.concat(current_path, ",") .. "]");
		end;
	end;

	for i = 1, #advisor_controls do
		local current_path = advisor_controls[i];
		local uic = find_uicomponent_from_table(ui_root, current_path);
		if uic then
			table.insert(retval, uic);
		else
			script_error("WARNING: get_all_advisor_controls() could not find uicomponent with path [" .. table.concat(current_path, ",") .. "]");
		end;
	end;

	return retval;
end;


--- @function show_advisor_progress_buttons
--- @desc Makes the advisor progress/close buttons active or inactive.
--- @p [opt=true] boolean show button
-- second arg hidden list of progress buttons
function show_advisor_progress_buttons(value, progress_buttons_list)
	if value ~= false then
		value = true;
	end;
	
	progress_buttons_list = progress_buttons_list or get_advisor_progress_buttons();
	local state = value and "active" or "inactive"
	
	for i = 1, #progress_buttons_list do
		progress_buttons_list[i]:SetState(state);
	end;
	
	-- enable or disable the advisor button on the menu bar
	set_component_active(value, "menu_bar", "button_show_advice");
end;


--- @function highlight_advisor_progress_button
--- @desc Activates or deactivates a highlight on the advisor progress/close button.
--- @p [opt=true] boolean show button
-- second arg hidden list of progress buttons
function highlight_advisor_progress_button(value, progress_buttons_list)
	if value ~= false then
		value = true;
	end;

	local process_name = "highlight_advisor_progress_buttons";

	core:remove_listener(process_name);

	-- If we're highlighting, then unhighlight if the advisor gets dismissed
	if value then
		core:add_listener(
			process_name,
			"AdviceDismissed",
			true,
			function()
				highlight_advisor_progress_button(false);
			end,
			false
		);
	end;
	
	progress_buttons_list = progress_buttons_list or get_advisor_progress_buttons();

	local highlighting = value;

	-- Try each progress button in sequence, and highlight the first one that is visible
	for i = 1, #progress_buttons_list do
		local uic = progress_buttons_list[i];
		if uic then
			-- If we're highlighting, highlight the first button that is visible, and unhighlight the rest - we only want one highlighted
			if highlighting and uic:Visible(true) then
				uic:Highlight(true, false, 0);	
				highlighting = false;
			else
				uic:Highlight(false, false, 0);
			end;
		end;
	end;

	set_component_visible(value, "advice_interface", "tut_anim");
end;











--- @section Localised Text


--- @function get_localised_text_replacement_source
--- @desc Returns a full localised text key for the <code>ui_text_replacements</code> database table, corresponding to the supplied key. If the supplied key is already a full localised text key in the [table]_[field]_[key] format then it is returned without modification, otherwise it is assumed to be a key of a record in the <code>ui_text_replacements</code> database table. In this case, the supplied string is returned with <code>"ui_text_replacements_localised_text_"</code> prepended to it, to convert the string to a full localised text key.
--- @p @string record key
--- @r @string full localised text key
function get_localised_text_replacement_source(table_key)
	if string.starts_with(table_key, "ui_text_replacements_localised_text_") then
		return table_key;
	end;
	return "ui_text_replacements_localised_text_" .. table_key;
end


--- @function get_localised_text_replacement
--- @desc Returns the localised text corresponding to the supplied record from the <code>ui_text_replacements</code> database table. The key is passed through @global:get_localised_text_replacement_source, so it may be supplied as the key for a record from the <code>ui_text_replacements</code> table, or as a full localised text key in the [table]_[field]_[key] format.
--- @p @string record key
--- @r @string localised text
function get_localised_text_replacement(table_key)
	return common.get_localised_string(get_localised_text_replacement_source(table_key));
end


--- @function get_localised_text_replacement_safe_formatted
--- @desc Gets the localised text corresponding to the supplied record from the <code>ui_text_replacements</code> database table, and performs a unicode-safe format operation using @common:string_safe_format and the supplied formatting arguments, before returning it. One or more formatting arguments can be provided.
--- @p @string record key, UI text replacements record key.
--- @p ... formatting arguments, Formatting arguments to pass to @common:string_safe_format.
--- @r @string formatted string
--- @example -- Consider a record in the ui_text_replacements db table with key "example_shakespeare_quote" and value "Alas, poor %1%"
--- @example print( get_localised_text_replacement_safe_formatted("example_shakespeare_quote", "Yoric") )
--- @result Alas, poor Yoric
function get_localised_text_replacement_safe_formatted(table_key, ...)
	return common.string_safe_format(get_localised_text_replacement(table_key), unpack(arg));
end


--- @function get_localised_text_replacement_and_source
--- @desc Returns the localised text (by calling @global:get_localised_text_replacement) and text key (by calling @global:get_localised_text_replacement_source) for a specified record from the <code>ui_text_replacements</code> database table. As with @global:get_localised_text_replacement and @global:get_localised_text_replacement_source, the specified key may be a record key from the <code>ui_text_replacements<code> database table, or as a full localised text key in the [table]_[field]_[key] format.
--- @p @string record key
--- @r @string localised text
--- @r @string full localised text key
function get_localised_text_replacement_and_source(table_key)
	return get_localised_text_replacement(table_key), get_localised_text_replacement_source(table_key);
end


--- @function get_localised_text_replacement_and_source_formatted
--- @desc Returns localised text (from @global:get_localised_text_replacement) passed through @string:format with the supplied format arguments, and also the text key (by calling @global:get_localised_text_replacement_source), for a specified record from the <code>ui_text_replacements</code> database table. As with @global:get_localised_text_replacement and @global:get_localised_text_replacement_source, the specified key may be a record key from the <code>ui_text_replacements<code> database table, or as a full localised text key in the [table]_[field]_[key] format.
--- @desc The format arguments are supplied to this function as a variable number of arguments, in exactly the same way that they may be supplied to @string:format. The localised text string is formatted before it is returned.
--- @p @string record key, UI text replacements record key.
--- @p ... formatting arguments, One or more @string formatting arguments.
--- @r @string formatted localised text
--- @r @string full localised text key
function get_localised_text_replacement_and_source_formatted(table_key, ...)
	return string.format(get_localised_text_replacement(table_key), unpack(arg)), get_localised_text_replacement_source(table_key);
end


--- @function get_localised_text_replacement_and_source_safe_formatted
--- @desc Returns localised text (from @global:get_localised_text_replacement) passed through @common:string_safe_format with the supplied format arguments, and also the text key (by calling @global:get_localised_text_replacement_source), for a specified record from the <code>ui_text_replacements</code> database table. @common:string_safe_format provides certain unicode-safe formatting functions - see the documentation of that function for more details.
--- @desc As with @global:get_localised_text_replacement and @global:get_localised_text_replacement_source, the specified key may be a record key from the <code>ui_text_replacements<code> database table, or as a full localised text key in the [table]_[field]_[key] format.
--- @desc The format arguments are supplied to this function as a variable number of arguments, in exactly the same way that they may be supplied to @common:string_safe_format. The localised text string is formatted before it is returned.
--- @p @string record key, UI text replacements record key.
--- @p ... formatting arguments, One or more @string formatting arguments.
--- @r @string formatted localised text
--- @r @string full localised text key
function get_localised_text_replacement_and_source_safe_formatted(table_key, ...)
	return common.string_safe_format(get_localised_text_replacement(table_key), unpack(arg)), get_localised_text_replacement_source(table_key);
end


--- @function get_localised_random_string_source
--- @desc Returns a full localised text key for the <code>random_localisation_strings</code> database table, corresponding to the supplied key. If the supplied key is already a full localised text key in the [table]_[field]_[key] format then it is returned without modification, otherwise it is assumed to be a key of a record in the <code>random_localisation_strings</code> database table. In this case, the supplied string is returned with <code>"random_localisation_strings_string_"</code> prepended to it, to convert the string to a full localised text key.
--- @p @string record key
--- @r @string full localised text key
function get_localised_random_string_source(table_key)
	if string.starts_with(table_key, "random_localisation_strings_string_") then
		return table_key;
	end
	return "random_localisation_strings_string_" .. table_key;
end


--- @function get_localised_random_string
--- @desc Returns the localised text corresponding to the supplied record from the <code>random_localisation_strings</code> database table. The key is passed through @global:get_localised_random_string_source, so it may be supplied as the key for a record from the <code>random_localisation_strings</code> table, or as a full localised text key in the [table]_[field]_[key] format.
--- @p @string record key
--- @r @string localised text
function get_localised_random_string(table_key)
	return common.get_localised_string(get_localised_random_string_source(table_key));
end


--- @function get_localised_random_string_safe_formatted
--- @desc Gets the localised text corresponding to the supplied record from the <code>random_localisation_strings</code> database table, and performs a unicode-safe format operation using @common:string_safe_format and the supplied formatting arguments, before returning it. One or more formatting arguments can be provided.
--- @p @string record key, Random localised strings record key.
--- @p ... formatting arguments, Formatting arguments to pass to @common:string_safe_format.
--- @r @string formatted string
--- @example -- Consider a record in the random_localisation_strings db table with key "example_shakespeare_quote" and value "Alas, poor %1%"
--- @example print( get_localised_random_string_safe_formatted("example_shakespeare_quote", "Yoric") )
--- @result Alas, poor Yoric
function get_localised_text_replacement_safe_formatted(table_key, ...)
	return common.string_safe_format(get_localised_text_replacement(table_key), unpack(arg));
end


--- @function get_localised_random_string_and_source
--- @desc Returns the localised text (by calling @global:get_localised_random_string) and text key (by calling @global:get_localised_random_string_source) for a specified record from the <code>random_localisation_strings</code> database table. As with @global:get_localised_random_string and @global:get_localised_random_string_source, the specified key may be a record key from the <code>ui_text_replacements<code> database table, or as a full localised text key in the [table]_[field]_[key] format.
--- @p @string record key
--- @r @string localised text
--- @r @string full localised text key
function get_localised_random_string_and_source(table_key)
	return get_localised_random_string(table_key), get_localised_random_string_source(table_key);
end


--- @function get_localised_random_string_and_source_formatted
--- @desc Returns localised text (from @global:get_localised_random_string) passed through @string:format with the supplied format arguments, and also the text key (by calling @global:get_localised_random_string_source), for a specified record from the <code>random_localisation_strings</code> database table. As with @global:get_localised_random_string and @global:get_localised_random_string_source, the specified key may be a record key from the <code>ui_text_replacements<code> database table, or as a full localised text key in the [table]_[field]_[key] format.
--- @desc The format arguments are supplied to this function as a variable number of arguments, in exactly the same way that they may be supplied to @string:format. The localised text string is formatted before it is returned.
--- @p @string record key, Random localised strings record key.
--- @p ... formatting arguments, One or more @string formatting arguments.
--- @r @string formatted localised text
--- @r @string full localised text key
function get_localised_random_string_and_source_formatted(table_key, ...)
	return string.format(get_localised_random_string(table_key), unpack(arg)), get_localised_random_string_source(table_key);
end


--- @function get_localised_random_string_and_source_safe_formatted
--- @desc Returns localised text (from @global:get_localised_random_string) passed through @common:string_safe_format with the supplied format arguments, and also the text key (by calling @global:get_localised_random_string_source), for a specified record from the <code>random_localisation_strings</code> database table. @common:string_safe_format provides certain unicode-safe formatting functions - see the documentation of that function for more details.
--- @desc As with @global:get_localised_random_string and @global:get_localised_random_string_source, the specified key may be a record key from the <code>random_localisation_strings<code> database table, or as a full localised text key in the [table]_[field]_[key] format.
--- @desc The format arguments are supplied to this function as a variable number of arguments, in exactly the same way that they may be supplied to @common:string_safe_format. The localised text string is formatted before it is returned.
--- @p @string record key, Random localised strings record key.
--- @p ... formatting arguments, One or more @string formatting arguments.
--- @r @string formatted localised text
--- @r @string full localised text key
function get_localised_random_string_and_source_safe_formatted(table_key, ...)
	return common.string_safe_format(get_localised_random_string(table_key), unpack(arg)), get_localised_random_string_source(table_key);
end

--- @function append_with_newline
--- @desc Small util method to add a string to another string, on a new line
--- @desc Intended to make sure a list has all items on separate lines without a leading new line
--- @p @string message the main string we want to add to
--- @p @string addition the string we want to add to the main one
--- @r @string the two strings combined
function append_with_newline(message, addition)
	if message ~= "" then
		message = message .. "\n"
	end
	message = message .. addition
	return message
end

local roman_numerals = {
	"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
	"XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX",
	"XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX",
	"XXXI", "XXXII", "XXXIII", "XXXIV", "XXXV", "XXXVI", "XXXVII", "XXXVIII", "XXXIX", "XL",
	"XLI", "XLII", "XLIII", "XLIV", "XLV", "XLVI", "XLVII", "XLVIII", "XLIX", "L",
	"LI", "LII", "LIII", "LIV", "LV", "LVI", "LVII", "LVIII", "LIX", "LX"
}

get_roman_numeral_as_string = function(number)
	if number < 1 or number > #roman_numerals then
		return ""
	end
	return roman_numerals[number]
end

----------------------------------------------------------------------------
-- Tutorial Menu
----------------------------------------------------------------------------

function unlock_all_tutorial_cards()
	core:svr_save_registry_bool("battle_tutorial_completed", true)
	core:svr_save_registry_bool("campaign_tutorial_completed", true)
end

function lock_all_tutorial_cards()
	core:svr_save_registry_bool("battle_tutorial_completed", false)
	core:svr_save_registry_bool("campaign_tutorial_completed", false)
end