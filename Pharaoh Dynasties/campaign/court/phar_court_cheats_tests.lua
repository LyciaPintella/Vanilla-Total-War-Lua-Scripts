out("Loading phar_court_cheats_tests.lua")

-- main file phar.court.lua

-- this is file is aimed at testing the court

court_feature_tests = 
{
	-- this should have a test on all functional features
	test_all = function()
		court.output("///////////////////////////////////////////////////")
		court.output("///////////////////////////////////////////////////")
		court.output("/////test_all started")

		court_feature_tests.clear_court()
		court_cheat.positions.fill_all_positions()

		court_feature_tests.requests.vizier_small_request()
		court_feature_tests.requests.vizier_large_request()

		-- most factions have 2 actions per turn, so we need to simulate the next turn
		court.util_functions.on_round_start()
		court_feature_tests.requests.first_commander_small_request()
		court_feature_tests.requests.first_commander_large_request()

		court.util_functions.on_round_start()
		court_feature_tests.requests.treasurer_small_request()
		court_feature_tests.requests.treasurer_large_request()

		court.util_functions.on_round_start()
		court_feature_tests.requests.kush_small_request()
		court_feature_tests.requests.priest_large_request()

		court.util_functions.on_round_start()
		court_feature_tests.requests.kush_small_request()
		court_feature_tests.requests.kush_large_request()

		court.util_functions.on_round_start()
		court_feature_tests.requests.judge_small_request()
		court_feature_tests.requests.judge_large_request()

		court_feature_tests.intrigues.all_intrigues_on_treasurer()

		court_feature_tests.requests.bodyguards_small_request()

		court_feature_tests.plots.test_plots()
		court_feature_tests.clear_court()

		court_cheat.positions.set_player_vizier()
		court_cheat.positions.set_player_commander()
		court_cheat.positions.set_player_treasurer()
		court_cheat.positions.set_player_priest()
		court_cheat.positions.set_player_kush()

		court_feature_tests.test_gods()
		court_feature_tests.test_notifications()
		court_feature_tests.test_treasurer_bonuses()
		court_feature_tests.clear_court()

		court.output("/////test_all ended")
		court.output("///////////////////////////////////////////////////")
		court.output("///////////////////////////////////////////////////")
	end,

	clear_court = function()
		court.output("///////////////////////////////////////////////////")
		court.output("/////clearing court")
		cheat_force_shemsu_hor()
		for _, court_obj in ipairs(court.all_courts) do
			court_feature_tests.clear_faction_court(court_obj)
		end

		court.persistent.factions_data = {}
		-- order does not matter here
		for _, faction_config in pairs(court.factions_config) do
			faction_config.faction_persistent_data = nil
		end

		court.output("///// end of clearing court")
	end,

	clear_faction_court = function(faction_court)
		for available_position_name, _ in pairs(faction_court.config.available_positions) do
			court_cheat.positions.safe_remove_from_position(faction_court, available_position_name)
			local player_faction_key = cm:get_local_faction_name(true)
			court.position_functions.set_regard_towards_faction_by_name(faction_court, available_position_name, player_faction_key, 0)
		end
	end,

	requests = 
	{
		vizier_small_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test of small request for vizier")
			court_cheat.positions.set_amemnesse_vizier()
			court_cheat.regard.set_vizier_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_vizier_small_request()
			court.output("////end of batch test of small request for vizier")
		end,

		vizier_large_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test of large request for vizier")
			--court_cheat.print_court_state()
				
			court_cheat.positions.set_amemnesse_vizier()
			court_cheat.positions.set_seti_priest()
			court_cheat.regard.set_vizier_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_vizier_large_request()
			court.output("////end of batch test of large request for vizier")
		end,

		first_commander_small_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test of small request for first commander")
			--court_cheat.print_court_state()
				
			court_cheat.positions.set_faiyum_commander()
			court_cheat.regard.set_first_commander_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_first_commander_small_request()
			court.output("////end of batch test of small request for commander")
		end,

		first_commander_large_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test of large request for first commander")
			--court_cheat.print_court_state()
				
			court_cheat.positions.set_faiyum_commander()
			court_cheat.regard.set_first_commander_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_first_commander_large_request()
			court.output("////end of batch test of large request for commander")
		end,

		treasurer_small_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test of small request for treasurer")
			cheat_force_shemsu_hor()
			court_cheat.positions.set_tausret_treasurer()
			court_cheat.regard.set_treasurer_50()
			local player_faction_key = cm:get_local_faction_name(true)

			local court_obj = court.util_functions.get_faction_court_for_faction(player_faction_key)
			if not court_obj then
				return
			end

			local before = court.position_functions.can_faction_see_discount_plans(court_obj, player_faction_key)
			court.util_functions.on_round_start()
			local call_successful = court_cheat.request.make_treasurer_small_request()
			local after = court.position_functions.can_faction_see_discount_plans(court_obj, player_faction_key)

			if after then
				if before then
					court.output("Warning: we can see court discount plans even before request, calling Shemsu Hor had problems")
				else
					court.output("-- after request we can see court discount plans, as designed")
				end
			elseif call_successful then
				court.output("!!!ERROR: can not see court discount plans even after successful request!!")
			end

			court.output("////end of batch test of small request for treasurer")
		end,

		treasurer_large_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test of large request for treasurer")

			cheat_force_shemsu_hor()
			court_cheat.positions.set_tausret_treasurer()
			court_cheat.regard.set_treasurer_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_treasurer_large_request(1)

			local treasurer_position_obj = court.util_functions.get_court_position(court.egyptian_court, "royal_treasurer")
			court_cheat.regard.set_treasurer_50()
			court.output("-- this should output error for values different from the fixed")
			court.discount_functions.choose_discount_amounts(treasurer_position_obj, court.egyptian_court, {20, 20, 10} )
			court.util_functions.on_round_start()
			court_cheat.request.make_treasurer_large_request(2)

			court_cheat.regard.set_treasurer_50()
			court.util_functions.on_round_start()
			court.output("-- this should output error for too many large requests")
			court_cheat.request.make_treasurer_large_request(3)

			cheat_force_shemsu_hor()
			shemsu_hor.advance()
			court.util_functions.on_round_start()
			court.discount_functions.choose_discount_amounts(treasurer_position_obj, court.egyptian_court, {20, 20, 10} )

			court.output("////end of batch test of large request for treasurer")
		end,

		priest_large_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test of large request for High Priest of Amun")
			
			court_cheat.positions.set_seti_priest()
			court_cheat.regard.set_priest_50()
			local player_faction_key = cm:get_local_faction_name(true)
			deities.worship_god(player_faction_key, 1, "amun")
			court.util_functions.on_round_start()
			court_cheat.request.make_priest_large_request()

			court.output("////end of batch test of large request for High Priest of Amun")
		end,

		kush_small_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("/////batch test of small request for kush")

			court_cheat.positions.set_setnakhte_kush()
			court_cheat.regard.set_kush_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_kush_small_request()

			court.output("////end of batch test of small request for kush")
		end,

		kush_large_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("/////batch test of large request for kush")

			court_cheat.positions.set_setnakhte_kush()
			court_cheat.regard.set_kush_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_kush_large_request()

			court.output("////end of batch test of large request for kush")
		end,

		judge_small_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("/////batch test of small request for judge")

			court_cheat.positions.set_hubishna_high_judge()
			court_cheat.regard.set_high_judge_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_judge_small_request()

			court.output("////end of batch test of small request for judge")
		end,

		judge_large_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("/////batch test of large request for judge")

			court_cheat.positions.set_hubishna_high_judge()
			court_cheat.regard.set_high_judge_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_judge_large_request()

			court.output("////end of batch test of large request for judge")
		end,

		bodyguards_small_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("/////batch test of small request for bodyguards")

			court_cheat.positions.set_carchemish_bodyguard()
			court_cheat.positions.set_hubishna_high_judge()

			court_cheat.regard.set_bodyguard_50("phar_main_hubishna")
			court.util_functions.on_round_start()
			court_cheat.request.make_bodyguard_small_request("phar_main_hubishna")

			court.util_functions.on_round_start()
			court_cheat.regard.set_high_judge_50("phar_main_carchemish")
			court.output("- intrigue should fail due to protection")
			court_cheat.intrigue.assist_high_judge("phar_main_carchemish")
			court.output("////end of batch test of small request for bodyguards")
		end,

		bodyguards_large_request = function()
			court.output("///////////////////////////////////////////////////")
			court.output("/////batch test of large request for bodyguards")

			court_cheat.positions.set_carchemish_bodyguard()
			court_cheat.regard.set_bodyguard_50()
			court.util_functions.on_round_start()
			court_cheat.request.make_bodyguard_large_request()

			court.output("////end of batch test of large request for bodyguards")
		end,
	},

	intrigues = 
	{
		all_intrigues_on_treasurer = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test of all intrigues on treasurer")
			--court_cheat.print_court_state()
			cheat_force_shemsu_hor()
			court_feature_tests.clear_court()
			court_cheat.positions.set_tausret_treasurer()
			court_cheat.intrigue.assist()
			court.output("--- second assist should fail due to being unaffordable, or due to already being used this Shemsu Hor if resource cheat was used")
			court_cheat.intrigue.assist()
			
			-- most factions have 2 actions per turn, so we need to simulate the next turn
			court.util_functions.on_round_start()
			--cheat_force_shemsu_hor()
			court_cheat.intrigue.request_support()
			court.output("--- court action could fail due to max_court_actions_per_turn, unless player is Ramesses who has more actions per turn")

			court_cheat.positions.set_amemnesse_vizier()
			court.util_functions.on_round_start()
			court_cheat.intrigue.gossip()
			cheat_force_shemsu_hor()
			court.util_functions.on_round_start()
			court.util_functions.on_round_start()

			--court_cheat.print_court_state()
			court.output("////end of batch test of all intrigues on treasurer")
		end,
	},

	plots = 
	{
		test_plots = function()
			court.output("////batch test plots")
			cheat_force_shemsu_hor()
			court_cheat.positions.set_tausret_treasurer()
			court_cheat.positions.set_amemnesse_vizier()

			court_cheat.plots.discredit_treasurer()
			court_cheat.plots.threaten_treasurer()
			court_cheat.plots.assassinate_treasurer()
			court_cheat.plots.embezzle_vizier()
			court_cheat.plots.blackmail_vizier()
			court_cheat.plots.threaten_vizier("phar_main_faiyum")
			court_cheat.plots.threaten_vizier("phar_main_amenmesse")

			--court_cheat.intrigue.gossip()
			court_cheat.intrigue.conspire()
			court_cheat.plots.force_fail()
			--court.plot_functions:pay_to_remove_plot(court.egyptian_court.court_name, "phar_main_seti", 1, true)
			--court.plot_functions:resolve_plots(court.egyptian_court)
			--court.plot_functions:resolve_plots(court.hittite_court)
			court.output("////end of batch test plots")
		end,

		-- use to setup a plot in each UI category - own, against me, other
		test_setup_plots_ui = function()
			court_cheat.positions.set_player_treasurer()
			court_cheat.plots.threaten_vizier()
			court_cheat.plots.threaten_treasurer("phar_main_merneptah")
			court_cheat.clear_faction_turn_actions("phar_main_merneptah")
			local plot_id = court_cheat.plots.threaten_vizier("phar_main_merneptah")
			--court_cheat.plots.reveal_plot(plot_id)
		end,

		test_threaten_treasurer = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test plot threaten treasurer")
			cheat_force_shemsu_hor()
			-- for testing in isolation
			court_cheat.plots.remove_all_plots()

			-- we want the treasurer position filled, so we can target it
			court_cheat.positions.set_tausret_treasurer()

			-- creates the plot
			court_cheat.plots.threaten_treasurer()
			-- comment both or uncomment one to test success or failure
			court_cheat.plots.force_success()
			--court_cheat.plots.force_fail()
			court_cheat.plots.resolve_all_plots()
			court_cheat.plots.remove_chance_hacks()

			court.output("////end of batch test plot threaten vizier")
		end,

		test_discredit_treasurer = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test plot threaten treasurer")
			cheat_force_shemsu_hor()
			-- for testing in isolation
			court_cheat.plots.remove_all_plots()

			-- we want the treasurer position filled, so we can target it
			court_cheat.positions.set_tausret_treasurer()

			-- creates the plot
			court_cheat.plots.threaten_treasurer()
			-- comment both or uncomment one to test success or failure
			court_cheat.plots.force_success()
			--court_cheat.plots.force_fail()
			court_cheat.plots.resolve_all_plots()
			court_cheat.plots.remove_chance_hacks()

			court.output("////end of batch test plot threaten vizier")
		end,

		test_assassinate_treasurer = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test treasurer plot assassination")
			cheat_force_shemsu_hor()
			-- for testing in isolation
			court_cheat.plots.remove_all_plots()

			-- we want the treasurer position to be filled, so we can target it
			court_cheat.positions.set_hubishna_treasurer()

			-- assassination requires the player to be Vizier for now
			court_cheat.positions.set_player_vizier()

			-- creates the plot
			court_cheat.plots.assassinate_treasurer()
			-- comment both or uncomment one to test success or failure
			court_cheat.plots.force_success()
			--court_cheat.plots.force_fail()
			court_cheat.plots.resolve_all_plots()
			court_cheat.plots.remove_chance_hacks()

			court.output("////end of batch test treasurer plot assassination")
		end,

		test_assassinate_pharaoh = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test pharaoh plot assassination")
			cheat_force_shemsu_hor()
			-- for testing in isolation
			court_cheat.plots.remove_all_plots()

			-- assassination requires the player to be Vizier for now
			court_cheat.positions.set_player_vizier()
			-- we add legitimacy so the player can proclaim as a leader after assassinating the leader
			court_cheat.add_legitimacy()
			court_cheat.add_legitimacy()
			court_cheat.add_legitimacy()
			court_cheat.add_legitimacy()

			-- creates the plot
			court_cheat.plots.assassinate_pharaoh()
			court_cheat.plots.force_success()
			court_cheat.plots.resolve_all_plots()
			court_cheat.plots.remove_chance_hacks()
			court.output("////end of batch test pharaoh plot assassination")
		end,

		test_embezzle_vizier = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test embezzle plot agaist vizier")
			cheat_force_shemsu_hor()
			-- for testing in isolation
			court_cheat.plots.remove_all_plots()
			-- we want the vizier position to be filled, so we can target it
			court_cheat.positions.set_amemnesse_vizier()

			-- embezzle requires the player to be Treasurer with current design
			court_cheat.positions.set_player_treasurer()

			-- creates the plot
			court_cheat.plots.embezzle_vizier()

			-- comment both or uncomment one to test success or failure
			--court_cheat.plots.force_success()
			court_cheat.plots.force_fail()
			court_cheat.plots.resolve_all_plots()
			court_cheat.plots.remove_chance_hacks()

			court.output("////end of batch test embezzle plot agaist vizier")
		end,

		test_blackmail_vizier = function()
			court.output("///////////////////////////////////////////////////")
			court.output("////batch test blackmail plot agaist vizier")
			cheat_force_shemsu_hor()
			-- for testing in isolation
			court_cheat.plots.remove_all_plots()
			-- we want the vizier position to be filled, so we can target it
			court_cheat.positions.set_amemnesse_vizier()

			-- creates the plot
			court_cheat.plots.blackmail_vizier()

			-- comment both or uncomment one to test success or failure
			court_cheat.plots.force_success()
			--court_cheat.plots.force_fail()
			court_cheat.plots.resolve_all_plots()
			court_cheat.plots.remove_chance_hacks()

			court.output("////end of batch test blackmail plot agaist vizier")
		end,
	},

	test_gods = function()
		court.output("///////////////////////////////////////////////////")
		court.output("////batch test gods")
		court_cheat.positions.set_player_priest()
		deities_tests.worship_gods()
		deities_tests.rededicate_god()
		court.output("////end of batch test gods")
	end,

	test_notifications = function()
		court.output("///////////////////////////////////////////////////")
		court.output("////batch test notifications")

		court.output("-- adding phar_main_clt_kemet to the hittite acceptable cultures")
		table.insert(court.hittite_court.config.acceptable_cultures, "phar_main_clt_kemet")
		-- we need to be chief of bodyguards to receive notifications of intrigues between other factions
		court_cheat.positions.set_player_bodyguard()
		court_cheat.positions.set_hubishna_high_commander()
		court.output("-- we should get a notification from this")
		court.intrigue_functions.use_intrigue(court.hittite_court, "phar_main_carchemish", "request_support", "high_commander")
		court.output("-- removing phar_main_clt_kemet from the hittite acceptable cultures")
		table.remove(court.hittite_court.config.acceptable_cultures)
		court.output("////end of batch test notifications")
	end,

	test_treasurer_bonuses = function()
		court.output("///////////////////////////////////////////////////")
		court.output("////batch test treasurer bonuses")

		cheat_force_shemsu_hor()
		shemsu_hor.advance()
		court_cheat.positions.set_player_treasurer()
		local treasurer_position_obj = court.util_functions.get_court_position(court.egyptian_court, "royal_treasurer")
		court.output("-- this should output errors for valid range, divisibility, and sum")
		court.discount_functions.choose_discount_amounts(treasurer_position_obj, court.egyptian_court, {30, 2, -10} )

		court.output("-- setting valid values now")
		court.discount_functions.choose_discount_amounts(treasurer_position_obj, court.egyptian_court, {20, 20, 10} )
		-- this is the direct way to set them
		--court.discount_functions.give_shemsu_hor_discounts(treasurer_position_obj, court.egyptian_court)

		cheat_force_shemsu_hor()
		-- bonuses are applied the turn after Shemsu hor
		court.util_functions.on_round_start()
		court.output("////end of batch test treasurer bonuses")
	end,

	test_high_judge_shemsu_hor = function()
		court.output("///////////////////////////////////////////////////")
		court.output("////batch test high judge shemsu hor dilemma")

		court.output("-- adding phar_main_clt_kemet to the hittite acceptable cultures")
		table.insert(court.hittite_court.config.acceptable_cultures, "phar_main_clt_kemet")

		court_cheat.positions.set_player_high_judge()
		cheat_force_shemsu_hor()

		court.output("-- removing phar_main_clt_kemet from the hittite acceptable cultures")
		table.remove(court.hittite_court.config.acceptable_cultures)
		court.output("////end of batch test high judge shemsu hor dilemma")
	end,
}

court_cheat = 
{
	add_legitimacy = function(target_faction_cqi, legitimacy_added)
		if not legitimacy_added then
			legitimacy_added = 25
		end

		local target_faction_name = ""
		if target_faction_cqi then
			target_faction_name = cm:model():faction_for_command_queue_index(target_faction_cqi):name()
		else
			target_faction_name = cm:get_local_faction_name(true)
		end

		local faction_court = court.util_functions.get_faction_court_for_faction(target_faction_name)
		faction_court.court_legitimacy():add_legitimacy(target_faction_name, faction_court.config.court_legitimacy_factor_key, legitimacy_added)
	end,

	remove_legitimacy = function(target_faction_cqi, legitimacy_removed)
		if not legitimacy_removed then
			legitimacy_removed = 25
		end

		local target_faction_name = ""
		if target_faction_cqi then
			target_faction_name = cm:model():faction_for_command_queue_index(target_faction_cqi):name()
		else
			target_faction_name = cm:get_local_faction_name(true)
		end

		local faction_court = court.util_functions.get_faction_court_for_faction(target_faction_name)
		faction_court.court_legitimacy():add_legitimacy(target_faction_name, faction_court.config.court_legitimacy_factor_key, -legitimacy_removed)
	end,

	add_pschent_crown = function()
		local player_faction_key = cm:get_local_faction_name(true)
		local player_leader_char = cm:get_faction(player_faction_key):faction_leader()
		local char_lookup_str = cm:char_lookup_str(player_leader_char:command_queue_index())
		cm:force_add_and_equip_ancillary(char_lookup_str, court.config.pschent_crown_ancillary_name)
	end,

	remove_pschent_crown = function()
		local player_faction_key = cm:get_local_faction_name(true)
		local player_leader_char = cm:get_faction(player_faction_key):faction_leader()
		local char_lookup_str = cm:char_lookup_str(player_leader_char:command_queue_index())
		cm:force_remove_ancillary(char_lookup_str, court.config.pschent_crown_ancillary_name, true)
	end,

	clear_player_faction_turn_actions = function()
		court.output("!! clear_player_faction_turn_actions cheat used, MP may be broken!!!!")
		local player_faction_key = cm:get_local_faction_name(true)
		local faction_table = court.util_functions.get_faction_persistent_data(player_faction_key)
		faction_table.actions_used_this_turn = nil
	end,

	clear_faction_turn_actions = function(faction_key)
		court.output("!! clear_faction_turn_actions cheat used, MP may be broken!!!!")
		local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
		faction_table.actions_used_this_turn = nil
	end,

	-- cheat intended for local testing
	-- ! the feature unlock turn does not persist in the save
	-- !! if the faction already is in another court and holds a position it !will! cause problems
	-- ! you also need to refresh the HUD for it to enable the court button
	-- ! use responsibly
	-- faction_key is optional, defaults to local faction
	unlock_court_for_faction = function(court_name, faction_key)
		local court_obj = court.util_functions.get_faction_court_by_name(court_name)
		if not court_obj then
			return
		end
		court_cheat.unlock_court_obj_for_faction(court_obj, faction_key)
	end,

	unlock_court_obj_for_faction = function(unlocked_court_obj, faction_key)
		if not faction_key then
			faction_key = cm:get_local_faction_name(true)
		end

		if not faction_key then
			return
		end

		-- we exit all the positions we may have had
		local old_court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
		if old_court_obj then
			court.util_functions.clear_court_position_for_faction(faction_key, old_court_obj)
		end

		-- we clear the cache
		court.factions_court_cache[faction_key] = nil
		local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
		faction_table.faction_court_name = unlocked_court_obj.court_name

		feature_unlock.cheat_unlock_feature(faction_key, feature_ids_config.court)

		if faction_key == cm:get_local_faction_name(true) then
			court.ui:update_court_button_visibility(true)
			common.toggle_fm_panel("court")
		end
	end,

	remove_unlock_court_cheat_for_faction = function(faction_key)
		if not faction_key then
			faction_key = cm:get_local_faction_name(true)
		end
		local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
		faction_table.factions_court_cache = nil

		if faction_key == cm:get_local_faction_name(true) then
			court.ui:update_court_button_visibility()
		end
	end,

	positions = 
	{
		set_player_vizier = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.positions.safe_set_position(court.egyptian_court, player_faction_key, "vizier")
		end,

		set_player_commander = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.positions.safe_set_position(court.egyptian_court, player_faction_key, "first_commander")
		end,

		set_player_treasurer = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.positions.safe_set_position(court.egyptian_court, player_faction_key, "royal_treasurer", true)
		end,
		
		set_player_priest = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.positions.safe_set_position(court.egyptian_court, player_faction_key, "high_priest_of_amun", true)
		end,

		set_player_kush = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.positions.safe_set_position(court.egyptian_court, player_faction_key, "viceroy_of_kush")
		end,

		set_amemnesse_vizier = function()
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_amenmesse", "vizier")
		end,

		set_faiyum_commander = function()
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_faiyum", "first_commander")
		end,

		set_tausret_treasurer = function()
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_tausret", "royal_treasurer")
		end,

		set_seti_priest = function()
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_seti", "high_priest_of_amun")
		end,

		set_sherden_priest = function()
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_sea_sherden", "high_priest_of_amun")
		end,

		set_setnakhte_kush = function()
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_setnakhte", "viceroy_of_kush")
		end,

		set_character_to_egyptian_position = function(character, position) 
			court_cheat.positions.safe_set_position(court.egyptian_court, character, position, true)
		end,

		-- hittite
		set_player_bodyguard = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.positions.safe_set_position(court.hittite_court, player_faction_key, "chief_of_royal_bodyguards")
		end,

		set_player_high_judge = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.positions.safe_set_position(court.hittite_court, player_faction_key, "high_judge")
		end,

		set_hubishna_vizier = function()
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_hubishna", "vizier")
		end,

		set_ancyra_vizier = function()
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_ancyra", "vizier")
		end,

		set_hubishna_high_commander = function()
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_hubishna", "high_commander")
		end,

		set_cibyra_high_commander = function()
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_cibyra", "high_commander")
		end,

		set_hubishna_treasurer = function()
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_hubishna", "royal_treasurer")
		end,

		set_kanesh_high_treasurer = function()
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_kanesh", "royal_treasurer")
		end,

		set_hubishna_high_judge = function()
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_hubishna", "high_judge")
		end,

		set_carchemish_bodyguard = function()
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_carchemish", "chief_of_royal_bodyguards")
		end,

		set_character_to_hittite_position = function(character, position) 
			court_cheat.positions.safe_set_position(court.hittite_court, character, position, true)
		end,

		-- checks if the position is filled and sets the faction if it is vacant
		-- for non-vacant positions force_if_needed controls if we vacate it and set the faction or leave it as it is
		safe_set_position = function(faction_court, faction_key, position_name, force_if_needed)
			local court_position = court.util_functions.get_court_position(faction_court, position_name)
			if court_position.persistent.current_holder then
				if force_if_needed then
					court.position_functions.remove_character_from_position(faction_court, position_name)
				else
					return
				end
			end

			-- we zero out the legitimacy requirement so the claim goes through
			local local_min_legitimacy_to_claim_position = court.config.min_legitimacy_to_claim_position
			court.config.min_legitimacy_to_claim_position = 0
			court.position_functions.claim_position(faction_court, faction_key, position_name, true, true)
			-- we bring it back once the cheat goes through
			court.config.min_legitimacy_to_claim_position = local_min_legitimacy_to_claim_position
		end,

		-- checks if the position is filled and sets it to vacant if it is
		-- avoids error messages if no action is needed
		safe_remove_from_position = function(faction_court, position_name)
			local court_position = court.util_functions.get_court_position(faction_court, position_name)
			if court_position.position_config.quit_forbidden
				or (not court_position.persistent.current_holder)
			then
				return
			end

			court.position_functions.remove_character_from_position(faction_court, position_name)
		end,

		fill_all_positions = function () 
			court.output("///////////////////////////////////////////////////")
			court.output("/////filling all positions")
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_amenmesse", "vizier")
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_tausret", "first_commander")
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_tausret", "royal_treasurer")
			court_cheat.positions.safe_set_position(court.egyptian_court, "phar_main_seti", "high_priest_of_amun")
			court.position_functions.claim_position(court.egyptian_court, "phar_main_setnakhte", "viceroy_of_kush")

			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_suppiluliuma", "high_judge")
			court_cheat.positions.safe_set_position(court.hittite_court, "phar_main_carchemish", "chief_of_royal_bodyguards")
			court.output("/////end of filling all positions")
		end,
	},

	intrigue = 
	{
		-- egyptian 
		assist = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.intrigue_functions.use_intrigue(court.egyptian_court, faction_key, "assist", "royal_treasurer")
		end,

		request_support = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.intrigue_functions.use_intrigue(court.egyptian_court, faction_key, "request_support", "royal_treasurer")
		end,

		gossip = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.intrigue_functions.use_intrigue(court.egyptian_court, faction_key, "gossip", "royal_treasurer")
		end,

		conspire = function (faction_key, targeted_position)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			if not targeted_position then
				targeted_position = "vizier"
			end

			-- we are looking for any plot by faction_key so we can improve it
			for plot_resolve_turn, plots_by_resolve_turn in dpairs(court.egyptian_court.persistent.plots_persistent_data_by_resolve_turn) do
				for plot_key, plots_of_type in dpairs(plots_by_resolve_turn) do
					for __, plot in ipairs(plots_of_type) do
						if plot.plotting_faction == faction_key 
							and plot.plot_level < court.plot_functions:get_plot_max_level(plot.plotting_faction)
							and plot.targeted_position ~= targeted_position 
						then
							court.intrigue_functions.use_intrigue(court.egyptian_court, faction_key, "conspire", targeted_position, plot.plot_id)
							return
						end
					end
				end
			end
		end,

		-- hittite
		assist_high_judge = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.intrigue_functions.use_intrigue(court.hittite_court, faction_key, "assist", "high_judge")
		end,

		-- other
		get_tauset_intrigues = function ()
			local intrigues = court.intrigue_functions.get_list_of_accessible_intrigues("phar_main_tausret")
			court.output("intrigues available to phar_main_tausret are: " .. table.concat(intrigues,", "))
		end,
	
		get_default_intrigues = function ()
			local intrigues = court.intrigue_functions.get_list_of_accessible_intrigues()
			court.output("intrigues available to default factions are: " .. table.concat(intrigues,", "))
		end,
	
		tausret_gossip_visier = function ()
			court.intrigue_functions.use_intrigue(court.egyptian_court, "phar_main_tausret", "gossip", "vizier")
		end,

		tausret_conspire_visier = function ()
			court.intrigue_functions.use_intrigue(court.egyptian_court, "phar_main_tausret", "conspire", "vizier")
		end,
	},

	plots = 
	{
		threaten_treasurer = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.plot_functions.create_plot("egyptian_court", faction_key, "threaten", "royal_treasurer", true)
		end,

		threaten_vizier = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.plot_functions.create_plot("egyptian_court", faction_key, "threaten", "vizier", true)
		end,

		threaten_hatti_treasurer = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.plot_functions.create_plot("hittite_court", faction_key, "threaten", "royal_treasurer", true)
		end,

		threaten_hatti_commander = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.plot_functions.create_plot("hittite_court", faction_key, "threaten", "first_commander", true)
		end,

		discredit_treasurer = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.plot_functions.create_plot("egyptian_court", faction_key, "discredit", "royal_treasurer", true)
		end,

		assassinate_treasurer = function (faction_key, court_key)
			court_key = court_key or "egyptian_court"
			faction_key = faction_key or cm:get_local_faction_name(true)
			return court.plot_functions.create_plot(court_key, faction_key, "assassinate", "royal_treasurer", true)
		end,

		assassinate_pharaoh = function (faction_key, court_key)
			court_key = court_key or "egyptian_court"
			faction_key = faction_key or cm:get_local_faction_name(true)
			return court.plot_functions.create_plot(court_key, faction_key, "assassinate", "pharaoh", true)
		end,

		embezzle_vizier = function (faction_key, court_key)
			court_key = court_key or "egyptian_court"
			faction_key = faction_key or cm:get_local_faction_name(true)
			return court.plot_functions.create_plot(court_key, faction_key, "embezzle", "vizier", true)
		end,

		blackmail_vizier = function (faction_key, court_key)
			court_key = court_key or "egyptian_court"
			faction_key = faction_key or cm:get_local_faction_name(true)
			return court.plot_functions.create_plot(court_key, faction_key, "blackmail", "vizier", true)
		end,

		reveal_plot = function(plot_id, faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
			return court.plot_functions:reveal_plot_to_faction(court_obj.court_name, faction_key, plot_id)
		end,

		force_success = function()
			court_cheat.plots.force_result = true
		end,

		force_fail = function()
			court_cheat.plots.force_result = false
		end,

		remove_chance_hacks = function()
			court_cheat.plots.force_result = nil
		end,

		resolve_all_plots = function()
			local turn_number = cm:model():turn_number()
			local turns_ahead = shemsu_hor:get_shemsu_hor_period()
			for i = 0, turns_ahead do
				local resolve_turn = turn_number + i
				for _, court_obj in ipairs(court.all_courts) do
					court.plot_functions:resolve_plots(court_obj, resolve_turn)
				end
			end
		end,

		-- removes the plots without resolving them
		remove_all_plots = function()
			for _, court_obj in ipairs(court.all_courts) do
				court_cheat.plots.remove_all_plots_in_court(court_obj)
			end
		end,

		remove_all_plots_in_court = function(faction_court_obj)
			faction_court_obj.persistent.plots_persistent_data_by_resolve_turn = {}
		end,

		reveal_all_plots = function(court_obj, faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
			if not court_obj then
				return
			end

			-- the order of revealing is irrelevant, so pairs is fine
			for plot_resolve_turn, plots_by_resolve_turn in dpairs(court_obj.persistent.plots_persistent_data_by_resolve_turn) do
				for plot_key, plots_of_type in dpairs(plots_by_resolve_turn) do
					for _, plot_persistent_data in ipairs(plots_of_type) do
						if not table_find(plot_persistent_data.revealed_to, faction_key) then
							court.plot_functions:reveal_plot_to_faction(court_obj.court_name, faction_key, plot_persistent_data.plot_id)
						end
					end
				end
			end
		end,

		toggle_autoreveal = function()
			if court_cheat.plots.force_reveal then
				court_cheat.plots.force_reveal = nil
				court.output("Court Cheat Disabled: plots will no longer automatically reveal")
			else
				court_cheat.plots.force_reveal = true
				court.output("Court Cheat Enabled: plots will automatically reveal")
			end
		end,

		toggle_autogeneration = function()
			if court_cheat.plots.stop_generation then
				court_cheat.plots.stop_generation = nil
				court.output("Court Cheat Disabled: AI will generate plots as normal", 100)
			else
				court_cheat.plots.stop_generation = true
				court.output("Court Cheat Enabled: AI will no longer generate plots as normal", 100)
			end
		end,
	},

	request = 
	{
		make_vizier_small_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.egyptian_court, faction_key, "vizier", court.developer_config.small_request_index)
		end,

		make_vizier_large_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.egyptian_court, faction_key, "vizier", court.developer_config.large_request_index, "high_priest_of_amun")
		end,

		make_first_commander_small_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.egyptian_court, faction_key, "first_commander", court.developer_config.small_request_index)
		end,

		make_first_commander_large_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.egyptian_court, faction_key, "first_commander", court.developer_config.large_request_index)
		end,

		make_treasurer_small_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.egyptian_court, faction_key, "royal_treasurer", court.developer_config.small_request_index)
		end,

		make_treasurer_large_request = function (index)
			local player_faction_key = cm:get_local_faction_name(true)
			return court.position_functions.call_request(court.egyptian_court, player_faction_key, "royal_treasurer", court.developer_config.large_request_index, index or 1)
		end,

		make_priest_large_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.egyptian_court, faction_key, "high_priest_of_amun", court.developer_config.large_request_index)
		end,

		make_kush_small_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.egyptian_court, faction_key, "viceroy_of_kush", court.developer_config.small_request_index)
		end,

		make_kush_large_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.egyptian_court, faction_key, "viceroy_of_kush", court.developer_config.large_request_index)
		end,

		make_judge_small_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.hittite_court, faction_key, "high_judge", court.developer_config.small_request_index)
		end,

		make_judge_large_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.call_request(court.hittite_court, faction_key, "high_judge", court.developer_config.large_request_index)
		end,

		--protects the position of high_judge
		make_bodyguard_small_request = function (faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			return court.position_functions.call_request(court.hittite_court, faction_key, "chief_of_royal_bodyguards", court.developer_config.small_request_index, "high_judge")
		end,
	},

	regard = 
	{
		-- egyptian
		set_vizier_50 = function(faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.set_regard_towards_faction_by_name(court.egyptian_court, "vizier", faction_key, 50)
		end,

		set_first_commander_50 = function(faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.set_regard_towards_faction_by_name(court.egyptian_court, "first_commander", faction_key, 50)
		end,

		set_treasurer_50 = function(faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.set_regard_towards_faction_by_name(court.egyptian_court, "royal_treasurer", faction_key, 50)
		end,

		set_priest_50 = function(faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.set_regard_towards_faction_by_name(court.egyptian_court, "high_priest_of_amun", faction_key, 50)
		end,

		set_kush_50 = function(faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.set_regard_towards_faction_by_name(court.egyptian_court, "viceroy_of_kush", faction_key, 50)
		end,

		-- hittite
		set_high_commander_50 = function(faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.set_regard_towards_faction_by_name(court.hittite_court, "high_commander", faction_key, 50)
		end,

		set_high_judge_50 = function(faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.set_regard_towards_faction_by_name(court.hittite_court, "high_judge", faction_key, 50)
		end,

		set_bodyguard_50 = function(faction_key)
			if not faction_key then
				faction_key = cm:get_local_faction_name(true)
			end
			court.position_functions.set_regard_towards_faction_by_name(court.hittite_court, "chief_of_royal_bodyguards", faction_key, 50)
		end,
	},

	print_court_state = function()
		local output_str = "\nTurns to Shemsu Hor:" .. shemsu_hor.get_turns_to_shemsu_hor()

		output_str = output_str .. "\nEgyptian court:\n"
		local egypt_output = court_cheat.print_faction_court_state(court.egyptian_court)
		output_str = output_str .. egypt_output

		local output_str = output_str .. "\nHittite court:\n"
		local hittite_output = court_cheat.print_faction_court_state(court.hittite_court)
		output_str = output_str .. hittite_output

		court.output(output_str, 100)
	end,

	print_faction_court_state = function (faction_court)
		local court_factions = {}
		local output_str = "ruling_faction:'" .. faction_court:ruling_faction() .. "'\n"
		for _, position in ipairs(faction_court.positions) do
			if position.persistent.current_holder then 
				output_str = output_str .. position.name .. " - '" .. tostring(position.persistent.current_holder) .. "' of '"
				output_str = output_str ..position.persistent.current_holder_faction .. "' \n"
				if position.persistent.regard then
					output_str = output_str .. "    regards:\n"
					for faction_key, regard_num in pairs(position.persistent.regard) do
						output_str = output_str .. "        " .. faction_key .. ":" .. regard_num .. "\n"
					end
				end

				-- we mark the owning faction as belonging to court, so we can print it later
				-- but only once, if may hold more positions!
				if not table_contains(court_factions, position.persistent.current_holder_faction) then
					table.insert(court_factions, position.persistent.current_holder_faction)
				end
			else 
				output_str = output_str .. position.name .. " - vacant \n"
			end
		end

		for _, faction_key in ipairs(court_factions) do
			local faction_config = court.util_functions.get_faction_config(faction_key)
			local faction_table = faction_config.faction_persistent_data
			if faction_table then
				output_str = output_str .. "Court data for " .. faction_table.faction_key .. ":\n"

				if faction_table.units and #faction_table.units > 0 then 
					output_str = output_str .. "    Units given for Special Recruitment:\n"
					for _, unit_table in ipairs(faction_table.units) do
						output_str = output_str .. "        " .. unit_table.unit_key .. " via " .. unit_table.unit_key .. ":\n"
					end
				end

				if faction_table.favour and #faction_table.favour > 0 then 
					output_str = output_str .. "    Favour towards the Gods:\n"
					for _, god_table in ipairs(faction_table.favour) do
						output_str = output_str .. "        " .. god_table.god_key .. ": " .. god_table.favour_amount .. ":\n"
					end
				end
			end
		end

		return output_str
	end,

	court_leaders = 
	{
		set_me_egypt_court_leader = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.court_leaders.set_cheat_court_leader(court.egyptian_court, player_faction_key)
		end,
		
		set_me_hatti_court_leader = function()
			local player_faction_key = cm:get_local_faction_name(true)
			court_cheat.court_leaders.set_cheat_court_leader(court.hittite_court, player_faction_key)
		end,

		set_cheat_court_leader = function(faction_court, faction_key)
			local original_leader_faction = faction_court:ruling_faction()
			court.util_functions.clear_court_position_for_faction(faction_key)

			if original_leader_faction then
				court.util_functions.clear_court_position_for_faction(original_leader_faction)
			end

			faction_court.ruling_faction = function() 
				return faction_key
			end
			court.position_functions.set_court_ruling_position_faction_after_legitimacy_war(faction_court)
			faction_court.persistent.leader_hacked = true
		end,
	},

	ai_dilemmas = 
	{
		force_human_trigger_ai_dilemma_next_turn = function()
			court_cheat.force_humans_generate_dilemma = true
		end,

		fake_turn_start = function(faction_court)
			court.dilemma_generation.on_turn_start(cm:get_local_faction(true))
		end,

		force_trigger_dilemma = function(dilemma_key)
			if dilemma_key then
				local dilemma_config = court.dilemma_generation.get_dilemma_by_court_ai_type(dilemma_key, true)
				if not dilemma_config then
					dilemma_config = court.dilemma_generation.get_dilemma_by_db_key(dilemma_key)
					if not dilemma_config then
						court.output("no AI dilemma found with key '" .. dilemma_key .. "'", 10)
						return
					end
				end

				court_cheat.ai_dilemmas.forced_dilemma = dilemma_config.court_ai_dilemma_type
			end
			local faction_name = cm:get_local_faction_name(true)
			local court_obj = court.util_functions.get_faction_court_for_faction(faction_name)
			-- no court - no court dilemmas
			if not court_obj then
				court.output("ERROR: 'force_trigger_dilemma' used but the faction '" .. tostring(faction_name) .. "' does not belong to a court!", 100)
				return
			end
			local faction_table = court.util_functions.get_faction_persistent_data(faction_name)
			court.dilemma_generation.generate_dilema(faction_table, court_obj)
			court_cheat.ai_dilemmas.forced_dilemma = nil
		end,
	},

	judge_dilemmas = 
	{
		force_trigger_dilemma = function(dilemma_key)
			local dilemma_config = table_find(court.judge_dilemmas.dilemmas, function(e) return e.court_judge_dilemma_type == dilemma_key end)
			if not dilemma_config then
				dilemma_config = court.judge_dilemmas.get_dilemma_by_db_key(dilemma_key)
				if not dilemma_config then
					court.output("no judge dilemma found with key '" .. dilemma_key .. "'")
					return
				end
			end

			court_cheat.judge_dilemmas.forced_dilemma = dilemma_config.court_judge_dilemma_type
			local faction_name = cm:get_local_faction_name(true)
			court.judge_dilemmas.pick_and_trigger_judge_dilemma(faction_name)
			court_cheat.judge_dilemmas.forced_dilemma = nil
		end,
	},
}

-- these are UI interactions with cheats that need to work in MP - so they send events to all machines
court_cheat_interaction = 
{
	on_add_regard_interacted = function(position_key)
		local faction_court_name = court.ui.data.faction_court.court_name
		local calling_faction_key = court.ui.data.local_faction_key
		local local_faction_obj = cm:get_faction(calling_faction_key)
		local local_faction_cqi = local_faction_obj:command_queue_index()

		local param_str = "court_mp_cheat:add_regard:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. position_key
		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
	end,

	on_remove_regard_interacted = function(position_key)
		local faction_court_name = court.ui.data.faction_court.court_name
		local calling_faction_key = court.ui.data.local_faction_key
		local local_faction_obj = cm:get_faction(calling_faction_key)
		local local_faction_cqi = local_faction_obj:command_queue_index()

		local param_str = "court_mp_cheat:remove_regard:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. position_key
		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
	end,

	on_remove_character_interacted = function(position_key)
		local faction_court_name = court.ui.data.faction_court.court_name
		local calling_faction_key = court.ui.data.local_faction_key
		local local_faction_obj = cm:get_faction(calling_faction_key)
		local local_faction_cqi = local_faction_obj:command_queue_index()

		local param_str = "court_mp_cheat:remove_character:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. position_key
		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
	end,

	on_set_character_interacted = function(position_key)
		local faction_court_name = court.ui.data.faction_court.court_name
		local calling_faction_key = court.ui.data.local_faction_key
		local local_faction_obj = cm:get_faction(calling_faction_key)
		local local_faction_cqi = local_faction_obj:command_queue_index()

		local param_str = "court_mp_cheat:set_player:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. position_key
		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
	end,

	on_set_ai_interacted = function(position_key)
		local faction_court_name = court.ui.data.faction_court.court_name
		local calling_faction_key = court.ui.data.local_faction_key
		local local_faction_obj = cm:get_faction(calling_faction_key)
		local local_faction_cqi = local_faction_obj:command_queue_index()

		local param_str = "court_mp_cheat:set_ai:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. position_key
		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
	end,

	on_generate_ai_plot_interacted = function(position_key)
		local faction_court_name = court.ui.data.faction_court.court_name
		local calling_faction_key = court.ui.data.local_faction_key
		local local_faction_obj = cm:get_faction(calling_faction_key)
		local local_faction_cqi = local_faction_obj:command_queue_index()

		local param_str = "court_mp_cheat:generate_ai_plot:" .. faction_court_name .. ":" .. position_key
		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
	end,
}

-- these are multiplayer events from cheats
court_cheat_events = 
{
	on_add_regard_event = function(params)
		local faction_court_name = 		params[1]
		local calling_faction_key = 	params[2]
		local selected_position_str = 	params[3]
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
		court.position_functions.change_regard_towards_faction_by_name(faction_court_obj, selected_position_str, calling_faction_key, 25)
		if calling_faction_key == cm:get_local_faction_name(true) then
			court.ui.refresh_ui()
		end
	end,

	on_remove_regard_event = function(params)
		local faction_court_name = 		params[1]
		local calling_faction_key = 	params[2]
		local selected_position_str = 	params[3]
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
		court.position_functions.change_regard_towards_faction_by_name(faction_court_obj, selected_position_str, calling_faction_key, -25)
		if calling_faction_key == cm:get_local_faction_name(true) then
			court.ui.refresh_ui()
		end
	end,

	on_remove_character_event = function(params)
		local faction_court_name = 		params[1]
		-- technically not needed, but might be useful for debug reasons
		local calling_faction_key = 	params[2]
		local selected_position_str = 	params[3]
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
		court.position_functions.remove_character_from_position(faction_court_obj, selected_position_str)
		if calling_faction_key == cm:get_local_faction_name(true) then
			court.ui.refresh_ui()
		end
	end,

	on_set_character_event = function(params)
		local faction_court_name = 		params[1]
		local calling_faction_key = 	params[2]
		local selected_position_str = 	params[3]
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
		court_cheat.positions.safe_set_position(faction_court_obj, calling_faction_key, selected_position_str, true)
		if calling_faction_key == cm:get_local_faction_name(true) then
			court.ui.refresh_ui()
		end
	end,

	on_set_ai_event = function(params)
		local faction_court_name = 		params[1]
		-- technically not needed, but might be useful for debug reasons
		local calling_faction_key = 	params[2]
		local selected_position_str = 	params[3]
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
		court.ui.cheat_interaction.position_put_AI_as_leader(faction_court_obj, selected_position_str)
		if calling_faction_key == cm:get_local_faction_name(true) then
			court.ui.refresh_ui()
		end
	end,

	on_generate_ai_plot = function(params)
		local faction_court_name = 		params[1]
		local selected_position_str = 	params[2]
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
		court_cheat.plots.force_against_pos = selected_position_str
		court.plot_generation.generate_ai_plots(faction_court_obj)
		court_cheat.plots.force_against_pos = nil
		if court.ui.data.court_ui_opened then
			court.ui.refresh_ui()
		end
	end,
}

--CourtCheat_ContextTriggerEvent
-- interactions with cheat buttons - local events may or may not send events to all machines for MP safe
core:add_listener (
	"CourtCheat_ContextTriggerEvent",
	"ContextTriggerEvent",
	function(context)
		return context.string:split(":")[1] == "CourtCheat"
	end,
	function(context)
		local params = context.string:split(":")
		local button_key = params[2]
		-- position cheats - working in MP
		if button_key == "AddRegard" then
			local position_key = params[3]
			court_cheat_interaction.on_add_regard_interacted(position_key)
		elseif button_key == "RemoveRegard" then
			local position_key = params[3]
			court_cheat_interaction.on_remove_regard_interacted(position_key)
		elseif button_key == "RemoveCharacter" then
			local position_key = params[3]
			court_cheat_interaction.on_remove_character_interacted(position_key)
		elseif button_key == "SetPlayer" then
			local position_key = params[3]
			court_cheat_interaction.on_set_character_interacted(position_key)
		elseif button_key == "SetAI" then
			local position_key = params[3]
			court_cheat_interaction.on_set_ai_interacted(position_key)
		elseif button_key == "GenerateAIPlot" then
			local position_key = params[3]
			court_cheat_interaction.on_generate_ai_plot_interacted(position_key)
		-- own faction cheats
		elseif button_key == "AddLegitimacy" then
			court.ui.cheat_interaction.add_legitmacy()
		elseif button_key == "RemoveLegitimacy" then
			court.ui.cheat_interaction.remove_legitmacy()
		-- other cheats
		elseif button_key == "ForceShemsuHor" then
			court.ui.cheat_interaction.force_shemsu_hor()
		elseif button_key == "AdvanceShemsuHor" then
			if shemsu_hor.is_active then
				shemsu_hor.advance()
			else
				court.util_functions.on_round_start()
			end
		elseif button_key == "ResetCourtActions" then
			court.ui.cheat_interaction.reset_court_actions()
		elseif button_key == "ClearCourt" then
			court.ui.cheat_interaction.clear_court()
		elseif button_key == "MakePlayerCourtLeader" then
			court.ui.cheat_interaction.make_player_court_leader()
		elseif button_key == "ForcePlotSuccess" then
			court.ui.cheat_interaction.hack_plots_success()
		elseif button_key == "ForcePlotFailure" then
			court.ui.cheat_interaction.hack_plots_fail()
		elseif button_key == "RemovePlotSuccessHack" then
			court.ui.cheat_interaction.remove_plots_chance_hack()
		elseif button_key == "RevealAllPlots" then
			court_cheat.plots.reveal_all_plots(court.ui.data.faction_court, court.ui.data.local_faction_key)
		elseif button_key == "ResolveAllPlots" then
			court_cheat.plots.resolve_all_plots()
		elseif button_key == "RemoveAllPlots" then
			court_cheat.plots.remove_all_plots()
		elseif button_key == "TogglePlotAutoreveal" then
			court_cheat.plots.toggle_autoreveal()
		elseif button_key == "TogglePlotAutogeneration" then
			court_cheat.plots.toggle_autogeneration()
		elseif button_key == "DecreasePlotLevel" then
			local plot_id = tonumber(params[3])
			court.plot_functions:change_plot_level(court.ui.data.faction_court.court_name, plot_id, -1)
		elseif button_key == "IncreasePlotLevel" then
			local plot_id = tonumber(params[3])
			court.plot_functions:change_plot_level(court.ui.data.faction_court.court_name, plot_id, 1)
		elseif button_key == "ResolvePlot" then
			local plot_id = tonumber(params[3])
			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court.ui.data.faction_court.court_name, plot_id)
			if not plot_persistent_data then
				-- this could happen due to double click - the second resolve request being sent before the first one is handled
				return
			end
			court.plot_functions:resolve_plot(court.ui.data.faction_court, plot_persistent_data)
			court.plot_functions:remove_plot(court.ui.data.faction_court.court_name, plot_id)
		elseif button_key == "RevealPlot" then
			local plot_id = tonumber(params[3])
			court_cheat.plots.reveal_plot(plot_id, court.ui.data.local_faction_key)
		elseif button_key == "RemovePlot" then
			local plot_id = tonumber(params[3])
			court.plot_functions:remove_plot(court.ui.data.faction_court.court_name, plot_id)
		elseif button_key == "UnlockCourt" then
			local court_name = tonumber(params[3])
			court_cheat.unlock_court_for_faction(court_name)
		else
			court.output("Error: unknown cheat '".. button_key .. "'")
		end

		court.ui.refresh_ui()
	end,
	true
)

--CourtButton_UITriggerScriptEvent
-- events from court cheats - model-changing interactions that are sent to all machines
core:add_listener (
	"CourtPosition_UITriggerScriptEvent",
	"UITriggerScriptEvent",
	function(context)
		return context:trigger():split(":")[1] == "court_mp_cheat"
	end,
	function(context)
		local params = context:trigger():split(":")
		local action_type = params[2]
		-- we remove all the params we used up, and pass on the remainder
		table.remove(params, 1)
		table.remove(params, 1)

		if action_type == "add_regard" then
			court_cheat_events.on_add_regard_event(params)
		elseif action_type == "remove_regard" then
			court_cheat_events.on_remove_regard_event(params)
		elseif action_type == "remove_character" then
			court_cheat_events.on_remove_character_event(params)
		elseif action_type == "set_player" then
			court_cheat_events.on_set_character_event(params)
		elseif action_type == "set_ai" then
			court_cheat_events.on_set_ai_event(params)
		elseif action_type == "generate_ai_plot" then
			court_cheat_events.on_generate_ai_plot(params)
		else
			court.output("Error: unknown court mp cheat: '".. action_type .. "'")
		end
	end,
	true
)

court_cheat.dev_ui = function()
	--court.output("court_cheat.dev_ui", 10)
	local dev_ui_court = core:get_ui_root():SequentialFind("dev_ui_court")
	if dev_ui_court then
		dev_ui_court:Destroy()
		return
	end

	dev_ui_court = UIComponent(core:get_ui_root():CreateComponent("dev_ui_court", "UI/dev_ui/dev_ui_court"))

	-- get cheat button template
	local cheat_button_template = dev_ui_court:SequentialFind("dev_button_template")
	cheat_button_template:SetVisible(false)

	-- get cheat category template
	local cheat_category_template = dev_ui_court:SequentialFind("dev_category_template")
	cheat_category_template:SetVisible(false)

	local cheats = {
		positions = {
			"set_player_vizier",
			"set_player_commander",
			"set_player_treasurer",
			"set_player_priest",
			"set_player_kush",
			"set_amemnesse_vizier",
			"set_faiyum_commander",
			"set_tausret_treasurer",
			"set_seti_priest",
			"set_character_to_egyptian_position",
			"set_character_to_hittite_position",
			"set_setnakhte_kush",
			"set_hubishna_high_commander",
			"set_hubishna_high_judge",
			"set_carchemish_bodyguard"
		},
		intrigue = {
			"assist",
			"gossip",
			"discredit",
		}
	}

	-- add the unlock court category
	local uic_category = dev_ui_court:SequentialFind("courts_category")
	if not uic_category then
		uic_category = UIComponent(dev_ui_court:CreateFromComponent(cheat_category_template:Address(), "unlock court"))
		uic_category:SetVisible(true)
	end
	for court_index, court_object in ipairs(court.all_courts) do
		-- add cheat buttons
		local cheat_button = uic_category:SequentialFind(court_object.court_name)
		if not cheat_button then
			cheat_button = UIComponent(uic_category:CreateFromComponent(cheat_button_template:Address(), court_object.court_name))
			local command = "lua court_cheat.unlock_court_obj_for_faction(court." .. court_object.court_name ..")"
			cheat_button:SetProperty("cli_command", command)
			cheat_button:SetVisible(true)
		end
	end

	local remove_court_cheat_button = uic_category:SequentialFind("remove_court_cheats")
	if not remove_court_cheat_button then
		remove_court_cheat_button = UIComponent(uic_category:CreateFromComponent(cheat_button_template:Address(), "remove_court_cheats"))
		local command = "lua court_cheat.remove_unlock_court_cheat_for_faction()"
		remove_court_cheat_button:SetProperty("cli_command", command)
		remove_court_cheat_button:SetVisible(true)
	end

	for category_id, funcs in pairs(cheats) do
		-- add category
		local uic_category = dev_ui_court:SequentialFind(category_id)
		if not uic_category then
			uic_category = UIComponent(dev_ui_court:CreateFromComponent(cheat_category_template:Address(), category_id))
			uic_category:SetVisible(true)
		end

		-- add cheat buttons
		for _,v in ipairs(funcs) do
			local cheat_button_id = v
			local cheat_button = uic_category:SequentialFind(cheat_button_id)
			if not cheat_button then
				cheat_button = UIComponent(uic_category:CreateFromComponent(cheat_button_template:Address(), cheat_button_id))
				cheat_button:SetProperty("cli_command", "lua court_cheat." .. category_id ..".".. cheat_button_id .. "()")
				cheat_button:SetVisible(true)
			end
		end
	end
end