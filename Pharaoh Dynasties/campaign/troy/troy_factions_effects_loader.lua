out("Loading troy_factions_effects_loader.lua")
cm:add_pre_first_tick_callback(function() setup_factions_effects() end)

-- This functionality is intended to replace the frontend faction effect groups tables 

function setup_factions_effects()
	-- Iterate all factions and if you find one that needs a special bundle added - do so
	local factions_list = cm:model():world():faction_list()
	for i=0,factions_list:num_items() -1 do 
		local curr_faction = factions_list:item_at(i):name()
		if factions_effects[curr_faction] then 
			for bundle_key in pairs(factions_effects[curr_faction]) do 
				cm:apply_effect_bundle(bundle_key, curr_faction, -1)
			end
		end
	end
end