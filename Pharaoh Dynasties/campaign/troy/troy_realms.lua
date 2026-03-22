out("Loading troy_realms.lua")

TROY_REALM_TITLES_MIN_TURN = 23

function Add_Realms_Listeners()
	out("Listener for Realms titles started")
	core:add_listener (
	"Troy_realms",
	"FactionTurnStart",
	true,
	function(context) Realm_titles(context) end,
	true
	)
end

function Realm_titles(context)
	if cm:turn_number() < TROY_REALM_TITLES_MIN_TURN then
		return
	end

	local faction = context:faction()
	for capital,details in pairs(troy_realms) do
		-- Check if the faction owns the capital of the "Realm"
		if not cm:model():world():region_manager():region_by_key(capital):is_null_interface() then

		local owns_capital = cm:model():world():region_manager():region_by_key(capital):owning_faction() == faction
		local has_trait = false
		if faction:is_rebel() then 
			return
		else 
			has_trait = faction:faction_leader():has_trait(details.trait)
		end 
		local all_owned = true
		
		if owns_capital and not has_trait then 
			
			for __,region_key in pairs(details.regions) do
				-- Time to check if all regions in the "Realm" are owned by the faction in question
				local region_owned = cm:model():world():region_manager():region_by_key(region_key):owning_faction() == faction
				if not region_owned then
					all_owned = false
				end 
			end
			
			-- If all regions are owned - give the title 
			if all_owned then 
				Grant_title(details.trait,faction:name())
				core:trigger_event("GainRealmTitle", faction, details.trait)
			end

		elseif not owns_capital and has_trait then
			-- If the capital is not owned, but the trait is - remove it  
			Remove_title(details.trait,faction:name()) 
		end 
		end
		
	end 
end

function Remove_title(title, faction)
	local faction_leader = cm:model():world():faction_by_key(faction):faction_leader()
	local char_str = cm:char_lookup_str(faction_leader)
	
	if faction_leader:has_trait(title) == true then
		out("Removing trait " .. tostring(title) .. " to faction leader of faction " .. faction)
		
		troy_realm_title_lost_event_primary_detail = "character_trait_levels_onscreen_name_" .. title .. "_1"
		local event_pic = troy_realm_title_lost_event_pic[faction] or troy_realm_title_lost_event_pic.default

		cm:show_message_event(
			faction,
			troy_realm_title_lost_event_title,
			troy_realm_title_lost_event_primary_detail,
			"character_trait_levels_onscreen_name_" .. title .. "_1",
			troy_realm_title_lost_is_event_persistent,
			event_pic,
			troy_realm_title_lost_event_end_callback,
			troy_realm_title_lost_event_delay,
			troy_realm_title_lost_event_suppress_whitelist
		)

		cm:force_remove_trait(char_str, title)
	end 
end

function Grant_title(title, faction)
	local faction_leader = cm:model():world():faction_by_key(faction):faction_leader()
	local char_str = cm:char_lookup_str(faction_leader:command_queue_index())
	if faction_leader:has_trait(title) == false then
		out("Giving trait " .. tostring(title) .. " to faction leader of faction " .. faction)
		
		troy_realm_title_gained_event_primary_detail = "character_trait_levels_onscreen_name_" .. title .. "_1"
		local event_pic = troy_realm_title_gained_event_pic[faction] or troy_realm_title_gained_event_pic.default

		cm:show_message_event(
			faction,
			troy_realm_title_gained_event_title,
			troy_realm_title_gained_event_primary_detail,
			"character_trait_levels_onscreen_name_" .. title .. "_1",
			troy_realm_title_gained_is_event_persistent,
			event_pic,
			troy_realm_title_gained_event_end_callback,
			troy_realm_title_gained_event_delay,
			troy_realm_title_gained_event_suppress_whitelist
		)

		cm:force_add_trait(char_str, title, true)
	end
end