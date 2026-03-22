
victory_points_mechanic = {
	config = {
		victory_points_key = "phar_victory_points",

		victory_types = {
			sp_normal = {	
				{
					victory_points = 70, -- this is only used for UI, real threshold points are set through the victory_objectives.txt (YES .txt !)
					event_feed_message_required_points = 60,
					name_key = "campaign_localised_strings_string_victory_type_title_short",
					full_name_key = "campaign_localised_strings_string_victory_type_title_full_short",
					description_key = "campaign_localised_strings_string_victory_type_description_short",
				},
				{
					victory_points = 110,
					event_feed_message_required_points = 100,
					name_key = "campaign_localised_strings_string_victory_type_title_long",
					full_name_key = "campaign_localised_strings_string_victory_type_title_full_long",
					description_key = "campaign_localised_strings_string_victory_type_description_long",
				},
				{
					victory_points = 160,
					event_feed_message_required_points = 150,
					name_key = "campaign_localised_strings_string_victory_type_title_ultimate",
					full_name_key = "campaign_localised_strings_string_victory_type_title_full_ultimate",
					description_key = "campaign_localised_strings_string_victory_type_description_ultimate",
				},
			},
			mp_co_op_normal = {
				{
					victory_points = 140, -- this is only used for UI, real threshold points are set through the victory_objectives.txt (YES .txt !)
					event_feed_message_required_points = 130,
					name_key = "campaign_localised_strings_string_victory_type_title_short",
					full_name_key = "campaign_localised_strings_string_victory_type_title_full_short",
					description_key = "campaign_localised_strings_string_victory_type_description_short",
				},
				{
					victory_points = 220,
					event_feed_message_required_points = 210,
					name_key = "campaign_localised_strings_string_victory_type_title_long",
					full_name_key = "campaign_localised_strings_string_victory_type_title_full_long",
					description_key = "campaign_localised_strings_string_victory_type_description_long",
				},
				{
					victory_points = 320,
					event_feed_message_required_points = 300,
					name_key = "campaign_localised_strings_string_victory_type_title_ultimate",
					full_name_key = "campaign_localised_strings_string_victory_type_title_full_ultimate",
					description_key = "campaign_localised_strings_string_victory_type_description_ultimate",
				},
			},
		},
	},

	get_victory_types_for_campaign_type = function() 
		local campaign_type = cm:model():campaign_type_string()
		return victory_points_mechanic.config.victory_types[campaign_type]
	end,

	persistent = {
		already_added_event_feed_messages = {}
	},

	add_listeners = function()
		core:add_listener(
			"victory_approaching_event_feed_messages",
			"PooledResourceTransactionEvent",
			function(context)
				return context:faction():is_human() and context:resource():key() == victory_points_mechanic.config.victory_points_key
			end,
			function(context)
				local faction_key = context:faction():name()
				
				local victory_types = victory_points_mechanic.get_victory_types_for_campaign_type()
				local total_victory_points = context:resource():value()
				local next_victory_type_config = nil
				for _, victory_type_config in ipairs(victory_types) do
					if total_victory_points < victory_type_config.victory_points then
						next_victory_type_config = victory_type_config
						break
					end
				end
		
				if next_victory_type_config and total_victory_points >= next_victory_type_config.event_feed_message_required_points then
		
					local already_added_event_feed_messages = victory_points_mechanic.persistent.already_added_event_feed_messages
					local is_already_added = table_contains(already_added_event_feed_messages, next_victory_type_config.victory_points)
		
					if not is_already_added then
						table.insert(already_added_event_feed_messages, next_victory_type_config.victory_points)
		
						cm:add_event_feed_event("approaching_victory", faction_key, 0, next_victory_type_config.full_name_key, "", "",
							total_victory_points, next_victory_type_config.victory_points)
					end
				end
			end, 
			true
		)
	end,
}

-- victory points are only used in SP, for MP we have separate victory objectives
cm:add_first_tick_callback(
	function() 
		if cm:model():campaign_type_string() ~= "mp_vs_normal" then 
			victory_points_mechanic.add_listeners()
		end
	end
)

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("VICTORY_POINTS_MECHANIC_DATA", victory_points_mechanic.persistent, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		victory_points_mechanic.persistent = cm:load_named_value("VICTORY_POINTS_MECHANIC_DATA", victory_points_mechanic.persistent, context)
	end
)