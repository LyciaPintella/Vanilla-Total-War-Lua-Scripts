out("Loading troy_menelaus_reliable_friend.lua")

troy_menelaus_reliable_friend_fixed_unit_cards = 
{
	"troy_dendra_spearmen", 
	"troy_heavy_achaean_bowmen",
	"troy_dendra_swordsmen",
	"troy_myc_mycenaen_temple_guards",
	"troy_myc_mycenaen_temple_warriors",
	"troy_heavy_mycenaen_bowmen",
	"troy_heavy_shielded_spearmen",
	"troy_warriors_of_ithaca",
	"troy_ith_odysseus_night_runners",
	"troy_ith_stalker_skirmishers",
	"troy_veteran_islander_skirmishers",
	"troy_heavy_islander_skirmishers",
	"troy_heavy_swordsmen_skirmishers",
	"troy_ach_heavy_skirmish_chariots",
	"troy_pht_myrmidon_spearmen",
	"troy_pht_myrmidon_swordsmen",
	"troy_pht_veteran_thessaly_marines",
	"troy_heavy_achaean_bowmen",
	"troy_heavy_swordsmen",
	"troy_hec_par_champions_of_troy",
	"troy_hec_hectors_chosen",
	"troy_heavy_trojan_spearmen",
	"troy_trojan_defenders",
	"troy_heavy_shock_spears",
	"troy_tro_heavy_trojan_chariots",
	"troy_veteran_phrygian_axemen",
	"troy_par_elite_trojan_nobles",
	"troy_elite_trojan_slingers",
	"troy_par_trojan_noble_chariots",
	"troy_heavy_eastern_spearmen",
	"troy_khopesh_fighters",
	"troy_veteran_khopesh_fighters",
	"troy_sar_sapredons_guard",
	"troy_lycian_veterans",
	"troy_sar_lycian_champions",
	"troy_armoured_lycian_archers",
	"troy_tro_heavy_lycian_chariots",
	"troy_tro_archer_chariots",
	"troy_heavy_lycian_axemen",
	"troy_heavy_anatolian_skirmishers",
	"troy_heavy_anatolian_spearmen",
	"troy_heavy_anatolian_swords",
	"troy_aen_elite_dardanian_swordsmen",
	"troy_aen_elite_dardanian_defenders",
	"troy_dardanian_zealots",
	"troy_aen_elite_dardanian_chargers",
	"troy_heavy_thessaly_javelinmen",
	"troy_adi_ajax_companions",
	"troy_adi_ajax_wall",
	"troy_adi_dio_argive_night_runners",
	"troy_adi_dio_argive_raiders",
	"troy_adi_dio_diomedes_axe_runners",
	"troy_adi_dio_renowned_argive_axemen",
	"troy_adi_dio_warriors_argos",
	"troy_adi_teucer_bowmen",
	"troy_adi_veteran_locrian_slingers",
}

function add_menelaus_reliable_friend_listeners()
	out("Listeners for troy_menelaus_reliable_friend")

	core:add_listener(
		"troy_menelaus_reliable_friend_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == "reliable_friend" end,
		troy_menelaus_reliable_friend_panel_open,
		true
	);
end

function troy_menelaus_reliable_friend_panel_open(context)
	local ui_context = find_uicomponent(UIComponent(context.component), "panel", "panel_clip")

	ui_context:InterfaceFunction("add_available_units", troy_menelaus_reliable_friend_fixed_unit_cards)
end