out("Loading phar_factions_effects_loader.lua")

cm:add_pre_first_tick_callback(
	function()
		setup_factions_effects()
	end)

-- This functionality is intended to replace the frontend faction effect groups tables `start_pos_faction_effect_bundles`
-- Adding anything on that table won't work for non-human factions. That is because the bundles contained inside are cleared by EmpireCampaignFaction.cpp -> FACTION::override_setup() -> m_campaign_effect_bundles.clear()

function setup_factions_effects()
	-- Iterate all factions and if you find one that needs a special bundle added - do so
	local factions_list = cm:model():world():faction_list()
	for i = 0, factions_list:num_items() -1 do
		local faction_name = factions_list:item_at(i):name()
		if factions_effects[faction_name] then
			for _, bundle_key in ipairs(factions_effects[faction_name]) do
				cm:apply_effect_bundle(bundle_key, faction_name, 0)
			end
		end
	end
end