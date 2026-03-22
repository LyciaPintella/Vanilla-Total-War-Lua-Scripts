weighted_list = {};

function weighted_list:__tostring()
	return TYPE_WEIGHTED_LIST;
end

function weighted_list:__type()
	return TYPE_WEIGHTED_LIST;
end

function weighted_list:new(o)
	o = o or {};
	setmetatable(o, self);
	self.__index = self;
	o.items = o.items or {}
	o.max_weight = o.max_weight or 0
	return o;
end

function weighted_list:new_from_pairs_list(list)
	local o = weighted_list:new();

	for _, pair in ipairs(list) do
		o:add_item(pair.item, pair.weight)
	end

	return o;
end

function weighted_list:make_copy()
	local copy = self:new()
	copy.items = table_deep_copy(self.items)
	copy.max_weight = self.max_weight
	return copy
end

function weighted_list:add_item(item, weight)
	local list_entry = {};
	list_entry.item = item;
	list_entry.weight = weight;
	table.insert(self.items, list_entry);
	self.max_weight = self.max_weight + weight;
end

function weighted_list:remove_item(i)
	self.max_weight = self.max_weight - self.items[i].weight;
	table.remove(self.items, i);
end

function weighted_list:weighted_select()
	local rand = cm:model():random_float(0,self.max_weight);

	for i = 1, #self.items do
		rand = rand - self.items[i].weight;

		if rand <= 0 then
			return self.items[i].item, i;
		end
	end
end

function weighted_list:random_select()
	local rand = cm:model():random_int(1,#self.items);
	return self.items[rand].item, rand;
end