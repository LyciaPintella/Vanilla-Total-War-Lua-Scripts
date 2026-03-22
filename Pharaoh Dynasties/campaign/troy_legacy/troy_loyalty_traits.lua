-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	CHARACTER LOYALTY TRAITS
--	This script implements the character loyalty trait mechanics.
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

out("Loading troy_loyalty_traits.lua")

default_faction_from_context = function(context) return context:character():faction() end
default_character_from_context = function(context) return context:character() end
proposer_faction_from_context = function(context) return context:proposer() end
recipient_faction_from_context = function(context) return context:recipient() end
direct_faction_from_context = function(context) return context:faction() end
pending_battle_attacker = function(context) return context:pending_battle():attacker() end
pending_battle_defender = function(context) return context:pending_battle():defender() end
pending_battle_secondary_attackers = function(context) return context:pending_battle():secondary_attackers(), true end
pending_battle_secondary_defenders = function(context) return context:pending_battle():secondary_defenders(), true end

loyalty_event_data = {
	CharacterPostBattleRelease = {
		{
			--factionwide = {},
			character = { troy_trait_loyalty_sadist = -1  , troy_trait_loyalty_zealot = -1 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)
				return not context:is_automatically_selected()
			end
		}
	},
	CharacterPostBattleEnslave = {
		{
			--factionwide = {},
			character = { troy_trait_loyalty_trooper = 1, troy_trait_loyalty_opulent = -2, troy_trait_loyalty_greedy = -1 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)
				return not context:is_automatically_selected()
			end
		}
	},
	CharacterPostBattleSlaughter = {
		{
			--factionwide = {},
			character = { troy_trait_loyalty_greedy = -1 , troy_trait_loyalty_sadist = 2 , troy_trait_loyalty_zealot = 2 , troy_trait_loyalty_compassionate = -2, troy_trait_loyalty_opulent = -2 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)
				return not context:is_automatically_selected()
			end
		}
	},
	FactionTurnStart = {
		{
			factionwide = {},
			--character = {},
			extract_faction = direct_faction_from_context,
			--extract_character = default_character_from_context,
			check = function(context)
				loyalty_event_data.FactionTurnStart[1].factionwide = {}
				local faction = context:faction()
				for k,_ in pairs(god_traits) do
					if faction:has_pooled_resource(k) and faction:pooled_resource(k):value() >= 50 then
						for a,b in pairs(god_traits[k]) do
							if loyalty_event_data.FactionTurnStart[1].factionwide[a] == nil then
								loyalty_event_data.FactionTurnStart[1].factionwide[a] = b
							else
								loyalty_event_data.FactionTurnStart[1].factionwide[a] = loyalty_event_data.FactionTurnStart[1].factionwide[a] + b
							end
						end
					end
				end
				return next(loyalty_event_data.FactionTurnStart[1].factionwide) ~= nil --check if table is empty
			end
		}
	},
	CharacterPerformsSettlementOccupationDecision = {
		{
			--factionwide = {},
			character = { troy_trait_loyalty_greedy = 2 , troy_trait_loyalty_zealot = 2, troy_trait_loyalty_immoral = 2, troy_trait_loyalty_spiritual = -2 , troy_trait_loyalty_lawful = -2, troy_trait_loyalty_compassionate = -2 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)
				local occupation_decision = context:occupation_decision_option()
				return occupation_decision == "occupation_decision_loot" or occupation_decision == "occupation_decision_sack" or occupation_decision == "occupation_decision_raze_without_occupy"
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_lawful = 1, troy_trait_loyalty_greedy = -1, troy_trait_loyalty_sadist = -1},
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)
				return context:occupation_decision_option() == "occupation_decision_occupy"
			end
		}
	},
	CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication = {
		{
			factionwide = { troy_trait_loyalty_compassionate = -2 },
			--character = {},
			extract_faction = default_faction_from_context,
			--extract_character = default_character_from_context,
			check = function(context)	
				return context:occupation_decision_option() == "occupation_decision_raze_without_occupy"
			end	
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_danaans = 2 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)	
				return context:garrison_residence():faction():culture() == "troy_main_clt_danaans" and context:occupation_decision_option() ~= "occupation_decision_occupy"
			end	
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_trojans = 2 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)	
				return context:garrison_residence():faction():culture() == "troy_main_clt_trojans" and context:occupation_decision_option() ~= "occupation_decision_occupy"
			end	
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_danaans = -2 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)	
				return context:garrison_residence():faction():culture() == "troy_main_clt_danaans" and context:occupation_decision_option() == "occupation_decision_occupy"
			end	
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_trojans = -2 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)	
				return context:garrison_residence():faction():culture() == "troy_main_clt_trojans" and context:occupation_decision_option() == "occupation_decision_occupy"
			end	
		}
	},
	PositiveDiplomaticEvent = {
		{
			factionwide = { troy_trait_loyalty_warlike = -2 , troy_trait_loyalty_zealot = -2 , troy_trait_loyalty_trooper = -2  },
			--character = nil
			extract_faction = proposer_faction_from_context,
			check = function(context)
				local proposer, recipient = context:proposer(), context:recipient()
				if context:is_peace_treaty() then
					return context:character() == proposer:faction_leader() and are_factions_neighbours(proposer, recipient)
				end
			end
		},
		{
			factionwide = { troy_trait_loyalty_warlike = -2 , troy_trait_loyalty_zealot = -2 , troy_trait_loyalty_trooper = -2 },
			--character = nil
			extract_faction = recipient_faction_from_context,
			check = function(context)
				local proposer, recipient = context:proposer(), context:recipient()
				if context:is_peace_treaty() then
					return context:character() == recipient:faction_leader() and are_factions_neighbours(proposer, recipient)
				end
			end
		},
		{
			factionwide = { troy_trait_loyalty_hates_danaans = -4 },
			--character = nil
			extract_faction = proposer_faction_from_context,
			check = function(context)
				local proposer, recipient = context:proposer(), context:recipient()
				return context:character() == proposer:faction_leader() and context:is_peace_treaty() and recipient:culture() == "troy_main_clt_danaans" and are_factions_neighbours(proposer, recipient)
			end
		},
		{
			factionwide = { troy_trait_loyalty_hates_danaans = -4 },
			--character = nil
			extract_faction = recipient_faction_from_context,
			check = function(context)
				local proposer, recipient = context:proposer(), context:recipient()
				return context:character() == recipient:faction_leader() and context:is_peace_treaty() and proposer:culture() == "troy_main_clt_danaans" and are_factions_neighbours(proposer, recipient)
			end
		},
		{
			factionwide = { troy_trait_loyalty_hates_trojans = -4 },
			--character = nil
			extract_faction = proposer_faction_from_context,
			check = function(context)
				local proposer, recipient = context:proposer(), context:recipient()
				return context:character() == proposer:faction_leader() and context:is_peace_treaty() and recipient:culture() == "troy_main_clt_trojans" and are_factions_neighbours(proposer, recipient)
			end
		},
		{
			factionwide = { troy_trait_loyalty_hates_trojans = -4 },
			--character = nil
			extract_faction = recipient_faction_from_context,
			check = function(context)
				local proposer, recipient = context:proposer(), context:recipient()
				return context:character() == recipient:faction_leader() and context:is_peace_treaty() and proposer:culture() == "troy_main_clt_trojans" and are_factions_neighbours(proposer, recipient)
			end
		}
	},
	BattleConflictFinished = {
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = -2 },
			-- extract_faction = nil
			extract_character = pending_battle_attacker,
			check = function(context)
				local battle = context:pending_battle()
				return battle:has_region() and battle:region():owning_faction() == battle:attacker_faction()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = -2 },
			-- extract_faction = nil
			extract_character = pending_battle_secondary_attackers,
			check = function(context)
				local battle = context:pending_battle()
				return battle:has_region() and battle:region():owning_faction() == battle:attacker_faction()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = -2 },
			-- extract_faction = nil
			extract_character = pending_battle_defender,
			check = function(context)
				local battle = context:pending_battle()
				return battle:has_region() and battle:region():owning_faction() == battle:defender_faction()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = -2 },
			-- extract_faction = nil
			extract_character = pending_battle_secondary_defenders,
			check = function(context)
				local battle = context:pending_battle()
				return battle:has_region() and battle:region():owning_faction() == battle:defender_faction()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = 2 },
			-- extract_faction = nil
			extract_character = pending_battle_attacker,
			check = function(context)
				local battle = context:pending_battle()
				return battle:has_region() and battle:region():owning_faction() ~= battle:attacker_faction() and context:pending_battle():attacker():won_battle()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = 2 },
			-- extract_faction = nil
			extract_character = pending_battle_secondary_attackers,
			check = function(context)
				local battle = context:pending_battle()
				return battle:has_region() and battle:region():owning_faction() ~= battle:attacker_faction() and context:pending_battle():attacker():won_battle()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = 2 },
			-- extract_faction = nil
			extract_character = pending_battle_defender,
			check = function(context)
				local battle = context:pending_battle()
				return battle:has_region() and battle:region():owning_faction() ~= battle:defender_faction() and context:pending_battle():defender():won_battle()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = 2 },
			-- extract_faction = nil
			extract_character = pending_battle_secondary_defenders,
			check = function(context)
				local battle = context:pending_battle()
				return battle:has_region() and battle:region():owning_faction() ~= battle:defender_faction() and context:pending_battle():defender():won_battle()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = 2, troy_trait_loyalty_seafearer = 2 },
			-- extract_faction = nil
			extract_character = pending_battle_attacker,
			check = function(context) 
				return context:pending_battle():naval_battle() and context:pending_battle():attacker():won_battle()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = 2, troy_trait_loyalty_seafearer = 2 },
			-- extract_faction = nil
			extract_character = pending_battle_secondary_attackers,
			check = function(context) 
				return context:pending_battle():naval_battle() and context:pending_battle():attacker():won_battle()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = 2, troy_trait_loyalty_seafearer = 2 },
			-- extract_faction = nil
			extract_character = pending_battle_defender,
			check = function(context) 
				return context:pending_battle():naval_battle() and context:pending_battle():defender():won_battle()
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_adventurer = 2, troy_trait_loyalty_seafearer = 2 },
			-- extract_faction = nil
			extract_character = pending_battle_secondary_defenders,
			check = function(context) 
				return context:pending_battle():naval_battle() and context:pending_battle():defender():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_seafearer = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				local battle = context:pending_battle()
				if not battle:has_contested_garrison() then
					return false
				end
				local building_list = battle:contested_garrison():buildings()
				for i=0,building_list:num_items() -1 do 
					if string.find(building_list:item_at(i):chain(),"sea") then 
						return true
					end					
				end
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_seafearer = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_attackers,
			check = function(context)
				local battle = context:pending_battle()
				if not battle:has_contested_garrison() then
					return false
				end
				local building_list = battle:contested_garrison():buildings()
				for i=0,building_list:num_items() -1 do 
					if string.find(building_list:item_at(i):chain(),"sea") then 
						return true
					end					
				end
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_seafearer = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				local battle = context:pending_battle()
				if not battle:has_contested_garrison() then
					return false
				end
				local building_list = battle:contested_garrison():buildings()
				for i=0,building_list:num_items() -1 do 
					if string.find(building_list:item_at(i):chain(),"sea") then 
						return true
					end					
				end
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_seafearer = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_defenders,
			check = function(context)
				local battle = context:pending_battle()
				if not battle:has_contested_garrison() then
					return false
				end
				local building_list = battle:contested_garrison():buildings()
				for i=0,building_list:num_items() -1 do 
					if string.find(building_list:item_at(i):chain(),"sea") then 
						return true
					end					
				end
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_warlike = 1, troy_trait_loyalty_elitist = 2, troy_trait_loyalty_valorous = 1, troy_trait_loyalty_trooper = 1, troy_trait_loyalty_elated = 1, troy_trait_loyalty_patriot = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return context:pending_battle():attacker():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_warlike = 1, troy_trait_loyalty_valorous = 1, troy_trait_loyalty_trooper = 1, troy_trait_loyalty_servile = 2, troy_trait_loyalty_elated = 1, troy_trait_loyalty_patriot = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_attackers,
			check = function(context)
				return context:pending_battle():attacker():won_battle()
			end
		},
		{
			--factionwide = {},
			character = {  troy_trait_loyalty_warlike = 1, troy_trait_loyalty_elitist = 2, troy_trait_loyalty_valorous = 1, troy_trait_loyalty_trooper = 1, troy_trait_loyalty_sentry = 2, troy_trait_loyalty_elated = 1, troy_trait_loyalty_patriot = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return context:pending_battle():defender():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_warlike = 1, troy_trait_loyalty_valorous = 1, troy_trait_loyalty_trooper = 1, troy_trait_loyalty_servile = 2, troy_trait_loyalty_sentry = 2, troy_trait_loyalty_elated = 1, troy_trait_loyalty_patriot = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_defenders,
			check = function(context)
				return context:pending_battle():defender():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_competitive = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return context:pending_battle():secondary_attackers():is_empty() and context:pending_battle():attacker():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_competitive = -2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return not context:pending_battle():secondary_attackers():is_empty()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_competitive = -2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_attackers,
			check = nil
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_competitive = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return context:pending_battle():secondary_defenders():is_empty() and context:pending_battle():defender():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_competitive = -2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return not context:pending_battle():secondary_defenders():is_empty()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_competitive = -2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_defenders,
			check = nil
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_valorous = -2 , troy_trait_loyalty_elated = -2 , troy_trait_loyalty_patriot = -2, troy_trait_loyalty_prudent = -2, troy_trait_loyalty_elitist = -2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return table_contains(loyalty_traits_defeat_results, context:pending_battle():attacker_battle_result())
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_valorous = -2 , troy_trait_loyalty_elated = -2 , troy_trait_loyalty_patriot = -2, troy_trait_loyalty_prudent = -2, troy_trait_loyalty_elitist = -2  },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_attackers,
			check = function(context)
				return table_contains(loyalty_traits_defeat_results, context:pending_battle():attacker_battle_result())
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_valorous = -2 , troy_trait_loyalty_elated = -2 , troy_trait_loyalty_patriot = -2, troy_trait_loyalty_prudent = -2, troy_trait_loyalty_elitist = -2  },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return table_contains(loyalty_traits_defeat_results, context:pending_battle():defender_battle_result())
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_valorous = -2 , troy_trait_loyalty_elated = -2 , troy_trait_loyalty_patriot = -2, troy_trait_loyalty_prudent = -2, troy_trait_loyalty_elitist = -2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_defenders,
			check = function(context)
				return table_contains(loyalty_traits_defeat_results, context:pending_battle():defender_battle_result())
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_danaans = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return context:pending_battle():defender_faction():culture() == "troy_main_clt_danaans" and context:pending_battle():attacker():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_danaans = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_attackers,
			check = function(context)
				return context:pending_battle():defender_faction():culture() == "troy_main_clt_danaans" and context:pending_battle():attacker():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_danaans = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return context:pending_battle():attacker_faction():culture() == "troy_main_clt_danaans" and context:pending_battle():defender():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_danaans = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_defenders,
			check = function(context)
				return context:pending_battle():attacker_faction():culture() == "troy_main_clt_danaans" and context:pending_battle():defender():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_trojans = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return context:pending_battle():defender_faction():culture() == "troy_main_clt_trojans" and context:pending_battle():attacker():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_trojans = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_attackers,
			check = function(context)
				return context:pending_battle():defender_faction():culture() == "troy_main_clt_trojans" and context:pending_battle():attacker():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_trojans = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return context:pending_battle():attacker_faction():culture() == "troy_main_clt_trojans" and context:pending_battle():defender():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_hates_trojans = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_defenders,
			check = function(context)
				return context:pending_battle():attacker_faction():culture() == "troy_main_clt_trojans" and context:pending_battle():defender():won_battle()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_servile = -1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return context:pending_battle():secondary_attackers():is_empty() == true
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_servile = -1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return context:pending_battle():secondary_defenders():is_empty() == true
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_servile = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return context:pending_battle():attacker():won_battle() and context:pending_battle():secondary_attackers():is_empty() == false
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_servile = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return context:pending_battle():defender():won_battle() and context:pending_battle():secondary_defenders():is_empty() == false
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_prudent = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_attacker,
			check = function(context)
				return context:pending_battle():attacker_is_stronger()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_prudent = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_attackers,
			check = function(context)
				return context:pending_battle():attacker_is_stronger()
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_prudent = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_defender,
			check = function(context)
				return context:pending_battle():attacker_is_stronger() == false
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_prudent = 1 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = pending_battle_secondary_defenders,
			check = function(context)
				return context:pending_battle():attacker_is_stronger() == false
			end
		},
		-- troy_adi -- Teucer specific listeners
		{
			factionwide = { troy_adi_loyalty_brother_of_ajax = -1 },
			--character = {},
			extract_faction = function(context)
				local battle = context:pending_battle()
				local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
				local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
				if battle:attacker_battle_result():ends_with("defeat") and is_ajax_or_teucer_among_the_list(attacking_general, attacking_reinforcing_generals) then
					return ajax_faction_among_the_list(attacking_general, attacking_reinforcing_generals)
				elseif battle:defender_battle_result():ends_with("defeat") and is_ajax_or_teucer_among_the_list(defending_general, defending_reinforcing_generals) then
					return ajax_faction_among_the_list(defending_general, defending_reinforcing_generals)
				end
				return nil
			 end,
			--extract_character = pending_battle_secondary_attackers,
			check = function(context)
				local battle = context:pending_battle()
				local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
				local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
				if battle:attacker_battle_result():ends_with("defeat") and is_ajax_or_teucer_among_the_list(attacking_general, attacking_reinforcing_generals) then
					return true
				elseif battle:defender_battle_result():ends_with("defeat") and is_ajax_or_teucer_among_the_list(defending_general, defending_reinforcing_generals) then
					return true
				end

				return false

			end
		},
		-- this check is the same as the one above with the exception that it checks if BOTH Ajax and Teucer are in the battle so it applies the modified motivation again
		{
			factionwide = { troy_adi_loyalty_brother_of_ajax = -1 },
			--character = {},
			extract_faction = function(context)
				local battle = context:pending_battle()
				local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
				local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
				if battle:attacker_battle_result():ends_with("defeat") and is_ajax_or_teucer_among_the_list(attacking_general, attacking_reinforcing_generals) then
					return ajax_faction_among_the_list(attacking_general, attacking_reinforcing_generals)
				elseif battle:defender_battle_result():ends_with("defeat") and is_ajax_or_teucer_among_the_list(defending_general, defending_reinforcing_generals) then
					return ajax_faction_among_the_list(defending_general, defending_reinforcing_generals)
				end
				return nil
			 end,
			--extract_character = pending_battle_secondary_attackers,
			check = function(context)
				local battle = context:pending_battle()
				local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
				local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
				if battle:attacker_battle_result():ends_with("defeat") and is_ajax_and_teucer_among_the_list(attacking_general, attacking_reinforcing_generals) then
					return true
				elseif battle:defender_battle_result():ends_with("defeat") and is_ajax_and_teucer_among_the_list(defending_general, defending_reinforcing_generals) then
					return true
				end

				return false

			end
		},
		{
			--factionwide = {},
			character = { troy_adi_loyalty_brother_of_ajax = 2 },
			--extract_faction = function(context) return context:pending_battle():defender():faction() end,
			extract_character = function(context)
				local battle = context:pending_battle()
				local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
				local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
				if battle:attacker_battle_result():ends_with("victory") and is_ajax_and_teucer_among_the_list(attacking_general, attacking_reinforcing_generals) then
					return is_ajax_and_teucer_among_the_list(attacking_general, attacking_reinforcing_generals)
				elseif battle:defender_battle_result():ends_with("victory") and is_ajax_and_teucer_among_the_list(defending_general, defending_reinforcing_generals) then
					return is_ajax_and_teucer_among_the_list(defending_general, defending_reinforcing_generals)
				end

				return false

			end,
			check = function(context)
				local battle = context:pending_battle()
				local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
				local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
				if battle:attacker_battle_result():ends_with("victory") and is_ajax_and_teucer_among_the_list(attacking_general, attacking_reinforcing_generals) then
					return true
				elseif battle:defender_battle_result():ends_with("victory") and is_ajax_and_teucer_among_the_list(defending_general, defending_reinforcing_generals) then
					return true
				end

				return false

			end
		},
	},
	CharacterTurnEnd = {
		{
			--factionwide = nil
			character = { troy_trait_loyalty_sentry = -2 },
			--extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if not cm:char_is_mobile_general_with_army(character) then
					return false
				end
				return character:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_MARCH"
			end
		},
		{
			--factionwide = nil
			character = { troy_trait_loyalty_greedy = 1, troy_trait_loyalty_spiritual = -2 },
			--extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if not cm:char_is_mobile_general_with_army(character) then
					return false
				end	
				return character:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID"
			end
		},
		{
			--factionwide = nil
			character = { troy_trait_loyalty_peaceful = 1, troy_trait_loyalty_patriot = 1, troy_trait_loyalty_lawful = 1, troy_trait_loyalty_warlike = -1 },
			--extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if not cm:char_is_mobile_general_with_army(character) then
					return false
				end				
				return character:in_settlement()
			end
		},
		{
			--factionwide = nil
			character = { troy_trait_loyalty_seafearer = -1  },
			--extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if not cm:char_is_mobile_general_with_army(character) then
					return false
				end
				if character:in_settlement() then
					local building_list = character:garrison_residence():buildings()
					for i=0,building_list:num_items() -1 do 
						if string.find(building_list:item_at(i):chain(),"sea") then 
							return false
						end					
					end
					return true
				end
			end
		},
		{
			--factionwide = nil
			character = { troy_trait_loyalty_sentry = 1, troy_trait_loyalty_adventurer = -1 , },
			--extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if not cm:char_is_mobile_general_with_army(character) then
					return false
				end	
				local stance = character:military_force():active_stance()
				return stance == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_SET_CAMP" or character:in_settlement()
			end
		},
		{
			--factionwide = nil
			character = { troy_trait_loyalty_adventurer = 1, troy_trait_loyalty_patriot = -1, troy_trait_loyalty_lawful = -1 },
			--extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if not cm:char_is_mobile_general_with_army(character) then
					return false
				end	
				local influence = character:faction():state_religion()
				if not character:region():is_null_interface() then
					return character:region():province():religion_proportion(influence) < 0.6
				end
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_peaceful = -1, troy_trait_loyalty_sentry = -1, troy_trait_loyalty_servile = -1 },
			-- extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if not character:has_region() then
					return false
				end
				local region = character:region()
				local character_faction, region_faction = character:faction(), region:owning_faction()
				if region_faction:is_null_interface() then
					return false
				end
				return region_faction:at_war_with(character_faction)
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_devout = 1, troy_trait_loyalty_spiritual = 1 },
			-- extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				return loyalty_traits_is_character_in_region_with_priest_or_temple(context:character())
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_elitist = 1, troy_trait_loyalty_immoral = 1, troy_trait_loyalty_opulent = 1, troy_trait_loyalty_devout = -1 },
			-- extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if character:has_region() == false then
					return false
				end
				local region = character:region()
				local character_faction, region_faction = character:faction(), region:owning_faction()
				if region_faction:is_null_interface() then
					return false
				end
				if character_faction:name() == region_faction:name() then
					return region:get_active_edict_key() == "troy_edict_organize_games"
				end
			end
		},
		{
			-- factionwide = nil
			character = { troy_trait_loyalty_sadist = 1, troy_trait_loyalty_elitist = -1, troy_trait_loyalty_valorous = -1, troy_trait_loyalty_elated = -1, troy_trait_loyalty_seafearer = -1, troy_trait_loyalty_prudent = -1 , troy_trait_loyalty_opulent = -1, troy_trait_loyalty_immoral = -1, troy_adi_loyalty_brother_of_ajax = -1  },
			-- extract_faction = nil
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if character:has_region() == false then
					return false
				end
				local region = character:region()
				return region:owning_faction():name() == context:character():faction():name() and region:public_order() <= -25
			end
		},
		{
			--factionwide = {},
			character = { troy_trait_loyalty_elated = 1, troy_trait_loyalty_compassionate = 1 },
			--extract_faction = default_faction_from_context,
			extract_character = default_character_from_context,
			check = function(context)
				local character = context:character()
				if character:has_region() == false then
					return false
				end
				local region = character:region()
				return region:owning_faction():name() == context:character():faction():name() and region:public_order() >= 25
			end	
		}
	},
	FactionGodAttitudeTierChange = {
		{
			factionwide = { troy_trait_loyalty_devout = -2 },
			--character = nil
			extract_faction = function(context) return context:faction() end,
			--extract_character = nil
			check = function(context)
				return context:old_tier() > context:new_tier()
			end
		}
	},
	UITriggerScriptEvent = {
		{
		factionwide = { troy_adi_loyalty_brother_of_ajax = 3 },
			--character = nil
			extract_faction = function(context) return cm:model():faction_for_command_queue_index(context:faction_cqi()) end,
			--extract_character = nil
			check = function(context)
				local args = context:trigger():split(",")
				return #args >= 1 and args[1] == "AjaxRenownCelebration"
			end
		}
	}
}

function loyalty_trait_callback(context, event)
	for _, data in ipairs(event) do
		if not data.check or data.check(context) then
			if is_table(data.factionwide) then
				apply_loyalty_changes_for_faction(data.extract_faction(context), data.factionwide)
			end
			if is_table(data.character) then
				local extracted, is_list = data.extract_character(context)
				if is_list then
					for i = 0, extracted:num_items() - 1 do
						apply_loyalty_changes_for_character(extracted:item_at(i), data.character)
					end
				else
					apply_loyalty_changes_for_character(extracted, data.character)
				end
			end
		end
	end
end

function setup_loyalty_traits()
	core:add_listener(
		"PostBattleScreenOpened",
		"PanelOpenedCampaign",
		function(context) return context.string == "popup_battle_results" end, -- the name of the root component is changed based on whether the layout will be used for pre or post battle
		function(context)
			local panel = find_uicomponent(core:get_ui_root(), context.string)
			local options_loyalty_change = {}

			for event_name, event in pairs(loyalty_event_data) do 		
				if event_name == "CharacterPostBattleRelease" then
					local traits = {}
					for trait_key, loyalty_change in pairs(event[1].character) do
						table.insert(traits, { trait_key = trait_key, loyalty_change = loyalty_change })
					end

					table.insert(options_loyalty_change, {
						option = "release",
						traits = traits
					})
				elseif event_name == "CharacterPostBattleEnslave" then
					local traits = {}
					for trait_key, loyalty_change in pairs(event[1].character) do
						table.insert(traits, { trait_key = trait_key, loyalty_change = loyalty_change })
					end

					table.insert(options_loyalty_change, {
						option = "enslave",
						traits = traits
					})
				elseif event_name == "CharacterPostBattleSlaughter" then
					local traits = {}
					for trait_key, loyalty_change in pairs(event[1].character) do
						table.insert(traits, { trait_key = trait_key, loyalty_change = loyalty_change })
					end

					table.insert(options_loyalty_change, {
						option = "kill",
						traits = traits
					})
				end
			end

			panel:InterfaceFunction("set_post_battle_options_loyalty_change", options_loyalty_change)
		end,
		true
	)

	for event_name, event in pairs(loyalty_event_data) do 		
		if not is_string(event_name) then 
			script_error("ERROR: setup_loyalty_traits() called but provided ".. event_name .." as event name is not a string.")
			return
		end

		core:add_listener(
			"loyalty_" .. event_name,
			event_name,
			true,
			function(context) loyalty_trait_callback(context, event) end,
			true)
	end
end

function apply_loyalty_changes_for_faction(faction, trait_table)
	local faction_name = faction:name()
	for trait_key, loyalty_change in pairs(trait_table) do
		cm:faction_apply_character_loyalty_change(faction_name, trait_key, loyalty_change)
	end
end

function apply_loyalty_changes_for_character(character, traits_table)
	for trait_key, loyalty_change in pairs(traits_table) do
		if character:has_trait(trait_key) and character:has_military_force() then
			local cqi = character:cqi()
			cm:apply_character_loyalty_change(cqi, loyalty_change)
			cm:faction_add_post_battle_motivation_change(cqi, loyalty_change)
		end
	end
end

-----------------------------------------------------------------------------------
-- Helper functions for the loyalty trait checks.
-----------------------------------------------------------------------------------

function are_factions_neighbours(faction1, faction2)
	local region_list = faction1:region_list()
	for i = 0, region_list:num_items() - 1 do
		local adjacent_region_list = region_list:item_at(i):adjacent_region_list()
		for j = 0, adjacent_region_list:num_items() - 1 do
			if adjacent_region_list:item_at(j):owning_faction() == faction2 then
				return true
			end
		end
	end
	return false
end

loyalty_traits_defeat_results = { "close_defeat", "decisive_defeat", "crushing_defeat", "valiant_defeat" }

function loyalty_traits_is_character_in_region_with_priest_or_temple(character)
	if not character:has_region() or character:is_at_sea() then
		return false
	end
	local region = character:region()
	--[[local characters_in_region = region:characters_in_region()
	for i = 0, characters_in_region:num_items() - 1 do
		if characters_in_region:item_at(i):character_subtype("troy_agent_priest") then
			return true
		end
	end]]
	local building_list = region:settlement():building_list()
	for i=0,building_list:num_items() -1 do 
		if string.find(building_list:item_at(i):chain(),"religion") then 
			return true
		end					
	end
	return false
end

------------------------------------------------
------ helper functions for Ajax or Teucer -----
------------------------------------------------
function is_character_ajax(character)
	local ajax_forename = "names_name_648162272"
	return not character:is_null_interface() and character:get_forename() == ajax_forename
end
function is_character_teucer(character)
	local teucer_forename = "names_name_121567699"
	return not character:is_null_interface() and character:get_forename() == teucer_forename
end
function is_character_ajax_or_teucer(character)
	return is_character_ajax(character) or is_character_teucer(character)
end

function ajax_faction_among_the_list(character, characters_list)
	if character and not character:is_null_interface() and is_character_ajax_or_teucer(character) then
		return character:faction()
	end
	if is_characterlist(characters_list) then
		for i = 0, characters_list:num_items() - 1 do
			local list_character = characters_list:item_at(i)
			if not list_character:is_null_interface() and is_character_ajax_or_teucer(list_character) then
				return list_character:faction()
			end
		end
	end
	return nil
end

function is_ajax_or_teucer_among_the_list(character, characters_list)
	if character and not character:is_null_interface() and is_character_ajax_or_teucer(character) then
		return true
	end
	if is_characterlist(characters_list) then
		for i = 0, characters_list:num_items() - 1 do
			local list_character = characters_list:item_at(i)
			if not list_character:is_null_interface() and is_character_ajax_or_teucer(list_character) then
				return true
			end
		end
	end
	return nil
end

function is_ajax_and_teucer_among_the_list(character, characters_list)
	local num_characters_found = 0
	local char_object = nil
	if character and not character:is_null_interface() and is_character_ajax_or_teucer(character) then
		num_characters_found = num_characters_found + 1
		if is_character_teucer(character) then 
			char_object = character
		end
	end
	if is_characterlist(characters_list) then
		for i = 0, characters_list:num_items() - 1 do
			local list_character = characters_list:item_at(i)
			if not list_character:is_null_interface() and is_character_ajax_or_teucer(list_character) then
				num_characters_found = num_characters_found + 1
				if is_character_teucer(list_character) then 
					char_object = list_character
				end
			end
		end
	end
	if num_characters_found >= 2 then 
		return char_object
	end
	return nil 
end

-----------------------------------------------------------------------------------
-- Table for god-related traits.
-----------------------------------------------------------------------------------

god_traits = {
	["troy_god_attitude_aphrodite"] = {
		troy_trait_loyalty_peaceful = 1,
		troy_trait_loyalty_compassionate = 1,
		troy_trait_loyalty_competitive = -1,
		troy_trait_loyalty_trooper = -1
		},
	["troy_god_attitude_apollo"] = {
		troy_trait_loyalty_spiritual = 1
		},
	["troy_god_attitude_ares"] = {
		troy_trait_loyalty_warlike = 1,
		troy_trait_loyalty_competitive = 1,
		troy_trait_loyalty_peaceful = -1,
		},
	["troy_god_attitude_athena"] = {
		troy_trait_loyalty_valorous = 1,
		troy_trait_loyalty_prudent = 1,
		},
	["troy_god_attitude_hera"] = {
		troy_trait_loyalty_servile = 1,
		troy_trait_loyalty_immoral = -1
	},
	["troy_god_attitude_poseidon"] = {
		troy_trait_loyalty_seafearer = 1
	},
	["troy_god_attitude_zeus"] = {
		troy_trait_loyalty_devout = 1,
		troy_trait_loyalty_opulent = 1
	}
}