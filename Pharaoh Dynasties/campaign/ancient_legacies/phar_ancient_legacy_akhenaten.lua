out("Loading phar_ancient_legacies_akhenaten.lua")

local function output(str)
	if str then
		out("*** _ANCIENT LEGACY AKHENATEN_ ***: " .. str)
	end
end

ancient_legacies_akhenaten_config =
{}
-- This script is managed by ancient_legacy_common!
-- there will be a separate script instance for every faction that claims this
-- this means you should use self.persistent instead of ancient_legacy_akhenaten.persistent
-- self.persistent will be your data, while ancient_legacy_akhenaten.persistent will be the template

-- Most of the code for Akhenaten is in phar_local_deities.lua as he is tied closely to the Local deities
ancient_legacy_akhenaten = {

	config = ancient_legacies_akhenaten_config,

	persistent = {
		active_faction = false,
	},

	on_legacy_claimed = function(self, faction_key)
		deities.claim_akhenaten(faction_key)

		local local_faction = cm:get_local_faction_name(true)
		if (faction_key == local_faction) then
			egypt_political_states:activate_button(deities.component_ids.akhenaten_fm_button, true)
		end

		self.persistent.active_faction = faction_key
	end,

	get_listeners = function(self)
		return
		{
			{
				event = "FirstTickAfterWorldCreated",
				-- there is no context.faction in this event, so cannot use auto_check_faction
				condition = function(self, context) 
					local local_faction = cm:get_local_faction_name(true)
					return local_faction == self.persistent.active_faction
				end,
				callback = function(self, context)
					egypt_political_states:activate_button(deities.component_ids.akhenaten_fm_button, false)
				end,
				persistent = false,
			},
		}
	end,

	-- persistent data is already loaded by ancient_legacy_common, we are just informed we are loaded
	on_loading_game = function(self, context)
	end,

	add_listeners = function(self, faction_key)
	end,
}

return ancient_legacy_akhenaten