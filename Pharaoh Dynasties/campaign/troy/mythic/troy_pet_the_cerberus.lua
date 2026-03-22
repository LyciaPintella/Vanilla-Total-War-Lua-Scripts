out("Loading troy_pet_the_cerberus.lua")

local DEBUG = true
local debug_preff = "PET THE CERBERUS: "

local function output(str, force_out)
	if DEBUG or force_out then
		out(debug_preff..(str or "nil"))
	end
end

-- composite scenes location: working_data\composite_scene\troy\campaign_cinematic

pet_the_cerberus_setup = {
	preff = "PetTheCerberus",

	cerberus_subtype = "troy_mth_agent_cerberus",

	petbtn_id = "button_pet_the_cerberus",
	petbtn_location = { "units_panel", "main_units_panel", "button_group_unit" },
	petbtn_tooltip_disabled = "ui_text_replacements_localised_text_petbtn_disabled_tooltip_id",
	petbtn_tooltip_enabled = "ui_text_replacements_localised_text_petbtn_enabled_tooltip_id",
	
	scene = {
		id = "PetTheCerberus_petting_scene",
		
		-- heroes, unit_key
		troy_hero_achilles = { dbkey = "achilles_pets_cerberus", length = 17.5 },
		troy_hero_aeneas = { dbkey = "aeneas_pets_cerberus", length = 17.5 },
		troy_hero_agamemnon = { dbkey = "agamemnon_pets_cerberus", length = 17.5 },
		troy_hero_hector = { dbkey = "hector_pets_cerberus", length = 17.5 },
		troy_hero_menelaus = { dbkey = "menelaus_pets_cerberus", length = 17.5 },
		troy_hero_odysseus = { dbkey = "odysseus_pets_cerberus", length = 17.5 },
		troy_hero_penthesilea = { dbkey = "penthesilea_pets_cerberus", length = 17.5 },		
		troy_dlc1_hero_hippolyta = { dbkey = "hippolyta_pets_cerberus", length = 17.5 },
		troy_hero_paris = { dbkey = "paris_pets_cerberus", length = 17.5 },
		troy_adi_hero_ajax = { dbkey = "ajax_pets_cerberus", length = 17.5 },
		troy_adi_hero_diomedes = { dbkey = "diomedes_pets_cerberus", length = 17.5 },
		troy_hero_sarpedon = { dbkey = "sarpedon_pets_cerberus", length = 17.5 },
		troy_hero_achilles_epic = { dbkey = "troy_achilles_epic_armor_gods_petting_cerberus", length = 17.5 },
		troy_rem_hero_memnon  = { dbkey = "memnon_pets_cerberus", length = 17.5 },
		troy_rem_hero_rhesus  = { dbkey = "rhesus_pets_cerberus", length = 17.5 },
		
		-- uniform names
		troy_archer_aegisthus = { dbkey = "arch_aegisthus_pets_cerberus", length = 17.5 },
		troy_archer_aeolian_hero_2 = { dbkey = "arch_aeolian_hero_2_pets_cerberus", length = 17.5 },
		troy_archer_aeolian_hero_3 = { dbkey = "arch_aeolian_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_aeolian_hero_4 = { dbkey = "arch_aeolian_hero_4_pets_cerberus", length = 17.5 },
		troy_archer_aeolian_hero = { dbkey = "arch_aeolian_hero_pets_cerberus", length = 17.5 },
		troy_dlc1_archer_1 = { dbkey = "arch_ama_gen_hero_1_pets_cerberus", length = 17.5 },
		troy_dlc1_archer_2 = { dbkey = "arch_ama_gen_hero_2_pets_cerberus", length = 17.5 },
		troy_dlc1_archer_3 = { dbkey = "arch_ama_gen_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_dorian_hero_2 = { dbkey = "arch_dorian_hero_2_pets_cerberus", length = 17.5 },
		troy_archer_dorian_hero_3 = { dbkey = "arch_dorian_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_dorian_hero_4 = { dbkey = "arch_dorian_hero_4_pets_cerberus", length = 17.5 },
		troy_archer_dorian_hero = { dbkey = "arch_dorian_hero_pets_cerberus", length = 17.5 },
		troy_archer_hero_2 = { dbkey = "arch_hero_2_pets_cerberus", length = 17.5 },
		troy_archer_hero_3 = { dbkey = "arch_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_hero_4 = { dbkey = "arch_hero_4_pets_cerberus", length = 17.5 },
		troy_archer_hero = { dbkey = "arch_hero_pets_cerberus", length = 17.5 },
		troy_archer_ionian_hero_2 = { dbkey = "arch_ionian_hero_2_pets_cerberus", length = 17.5 },
		troy_archer_ionian_hero_3 = { dbkey = "arch_ionian_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_ionian_hero_4 = { dbkey = "arch_ionian_hero_4_pets_cerberus", length = 17.5 },
		troy_archer_ionian_hero = { dbkey = "arch_ionian_hero_pets_cerberus", length = 17.5 },
		troy_archer_lelegan_hero_2 = { dbkey = "arch_lelegan_hero_2_pets_cerberus", length = 17.5 },
		troy_archer_lelegan_hero_3 = { dbkey = "arch_lelegan_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_lelegan_hero_4 = { dbkey = "arch_lelegan_hero_4_pets_cerberus", length = 17.5 },
		troy_archer_lelegan_hero = { dbkey = "arch_lelegan_hero_pets_cerberus", length = 17.5 },
		troy_archer_lycomedes = { dbkey = "arch_lycomedes_pets_cerberus", length = 17.5 },
		troy_archer_maeonian_hero_2 = { dbkey = "arch_maeonian_hero_2_pets_cerberus", length = 17.5 },
		troy_archer_maeonian_hero_3 = { dbkey = "arch_maeonian_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_maeonian_hero_4 = { dbkey = "arch_maeonian_hero_4_pets_cerberus", length = 17.5 },
		troy_archer_maeonian_hero = { dbkey = "arch_maeonian_hero_pets_cerberus", length = 17.5 },
		troy_archer_pelasgian_hero_2 = { dbkey = "arch_pelasgian_hero_2_pets_cerberus", length = 17.5 },
		troy_archer_pelasgian_hero_3 = { dbkey = "arch_pelasgian_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_pelasgian_hero_4 = { dbkey = "arch_pelasgian_hero_4_pets_cerberus", length = 17.5 },
		troy_archer_pelasgian_hero = { dbkey = "arch_pelasgian_hero_pets_cerberus", length = 17.5 },
		troy_adi_archer_teucer = { dbkey = "arch_teucer_pets_cerberus", length = 17.5 },
		troy_archer_thracian_hero_2 = { dbkey = "arch_thracian_hero_2_pets_cerberus", length = 17.5 },
		troy_archer_thracian_hero_3 = { dbkey = "arch_thracian_hero_3_pets_cerberus", length = 17.5 },
		troy_archer_thracian_hero_4 = { dbkey = "arch_thracian_hero_4_pets_cerberus", length = 17.5 },
		troy_archer_thracian_hero = { dbkey = "arch_thracian_hero_pets_cerberus", length = 17.5 },
		troy_defender_aeolian_hero_2 = { dbkey = "def_aeolian_hero_2_pets_cerberus", length = 17.5 },
		troy_defender_aeolian_hero_3 = { dbkey = "def_aeolian_hero_3_pets_cerberus", length = 17.5 },
		troy_defender_aeolian_hero_4 = { dbkey = "def_aeolian_hero_4_pets_cerberus", length = 17.5 },
		troy_defender_aeolian_hero = { dbkey = "def_aeolian_hero_pets_cerberus", length = 17.5 },
		troy_defender_dorian_hero_2 = { dbkey = "def_dorian_hero_2_pets_cerberus", length = 17.5 },
		troy_defender_dorian_hero_3 = { dbkey = "def_dorian_hero_3_pets_cerberus", length = 17.5 },
		troy_defender_dorian_hero_4 = { dbkey = "def_dorian_hero_4_pets_cerberus", length = 17.5 },
		troy_defender_dorian_hero = { dbkey = "def_dorian_hero_pets_cerberus", length = 17.5 },
		troy_defender_glaucos = { dbkey = "def_glaucos_pets_cerberus", length = 17.5 },
		troy_defender_hero_2 = { dbkey = "def_hero_2_pets_cerberus", length = 17.5 },
		troy_defender_hero_3 = { dbkey = "def_hero_3_pets_cerberus", length = 17.5 },
		troy_defender_hero_4 = { dbkey = "def_hero_4_pets_cerberus", length = 17.5 },
		troy_defender_hero = { dbkey = "def_hero_pets_cerberus", length = 17.5 },
		troy_defender_idomeneus = { dbkey = "def_idomeneus_pets_cerberus", length = 17.5 },
		troy_defender_ionian_hero_2 = { dbkey = "def_ionian_hero_2_pets_cerberus", length = 17.5 },
		troy_defender_ionian_hero_3 = { dbkey = "def_ionian_hero_3_pets_cerberus", length = 17.5 },
		troy_defender_ionian_hero_4 = { dbkey = "def_ionian_hero_4_pets_cerberus", length = 17.5 },
		troy_defender_ionian_hero = { dbkey = "def_ionian_hero_pets_cerberus", length = 17.5 },
		troy_defender_lelegan_hero_2 = { dbkey = "def_lelegan_hero_2_pets_cerberus", length = 17.5 },
		troy_defender_lelegan_hero_3 = { dbkey = "def_lelegan_hero_3_pets_cerberus", length = 17.5 },
		troy_defender_lelegan_hero_4 = { dbkey = "def_lelegan_hero_4_pets_cerberus", length = 17.5 },
		troy_defender_lelegan_hero = { dbkey = "def_lelegan_hero_pets_cerberus", length = 17.5 },
		troy_defender_maeonian_hero_2 = { dbkey = "def_maeonian_hero_2_pets_cerberus", length = 17.5 },
		troy_defender_maeonian_hero_3 = { dbkey = "def_maeonian_hero_3_pets_cerberus", length = 17.5 },
		troy_defender_maeonian_hero_4 = { dbkey = "def_maeonian_hero_4_pets_cerberus", length = 17.5 },
		troy_defender_maeonian_hero = { dbkey = "def_maeonian_hero_pets_cerberus", length = 17.5 },
		troy_defender_nestor_old = { dbkey = "def_nestor_old_pets_cerberus", length = 17.5 },
		troy_defender_nestor_young = { dbkey = "def_nestor_young_pets_cerberus", length = 17.5 },
		troy_defender_orestes = { dbkey = "def_orestes_pets_cerberus", length = 17.5 },
		troy_defender_pelasgian_hero_2 = { dbkey = "def_pelasgian_hero_2_pets_cerberus", length = 17.5 },
		troy_defender_pelasgian_hero_3 = { dbkey = "def_pelasgian_hero_3_pets_cerberus", length = 17.5 },
		troy_defender_pelasgian_hero_4 = { dbkey = "def_pelasgian_hero_4_pets_cerberus", length = 17.5 },
		troy_defender_pelasgian_hero = { dbkey = "def_pelasgian_hero_pets_cerberus", length = 17.5 },
		troy_defender_thracian_hero_2 = { dbkey = "def_thracian_hero_2_pets_cerberus", length = 17.5 },
		troy_defender_thracian_hero_3 = { dbkey = "def_thracian_hero_3_pets_cerberus", length = 17.5 },
		troy_defender_thracian_hero_4 = { dbkey = "def_thracian_hero_4_pets_cerberus", length = 17.5 },
		troy_defender_thracian_hero = { dbkey = "def_thracian_hero_pets_cerberus", length = 17.5 },
		troy_fighter_aeolian_hero_2 = { dbkey = "fight_aeolian_hero_2_pets_cerberus", length = 17.5 },
		troy_fighter_aeolian_hero_3 = { dbkey = "fight_aeolian_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_aeolian_hero_4 = { dbkey = "fight_aeolian_hero_4_pets_cerberus", length = 17.5 },
		troy_fighter_aeolian_hero = { dbkey = "fight_aeolian_hero_pets_cerberus", length = 17.5 },
		troy_fighter_ajax_lesser = { dbkey = "fight_ajax_lesser_pets_cerberus", length = 17.5 },
		troy_dlc1_fighter_1 = { dbkey = "fight_ama_gen_hero_1_pets_cerberus", length = 17.5 },
		troy_dlc1_fighter_2 = { dbkey = "fight_ama_gen_hero_2_pets_cerberus", length = 17.5 },
		troy_dlc1_fighter_3 = { dbkey = "fight_ama_gen_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_deiphobos = { dbkey = "fight_deiphobos_pets_cerberus", length = 17.5 },
		troy_fighter_dorian_hero_2 = { dbkey = "fight_dorian_hero_2_pets_cerberus", length = 17.5 },
		troy_fighter_dorian_hero_3 = { dbkey = "fight_dorian_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_dorian_hero_4 = { dbkey = "fight_dorian_hero_4_pets_cerberus", length = 17.5 },
		troy_fighter_dorian_hero = { dbkey = "fight_dorian_hero_pets_cerberus", length = 17.5 },
		troy_fighter_helenos = { dbkey = "fight_helenos_pets_cerberus", length = 17.5 },
		troy_fighter_hero_2 = { dbkey = "fight_hero_2_pets_cerberus", length = 17.5 },
		troy_fighter_hero_3 = { dbkey = "fight_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_hero_4 = { dbkey = "fight_hero_4_pets_cerberus", length = 17.5 },
		troy_fighter_hero = { dbkey = "fight_hero_pets_cerberus", length = 17.5 },
		troy_fighter_ionian_hero_2 = { dbkey = "fight_ionian_hero_2_pets_cerberus", length = 17.5 },
		troy_fighter_ionian_hero_3 = { dbkey = "fight_ionian_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_ionian_hero_4 = { dbkey = "fight_ionian_hero_4_pets_cerberus", length = 17.5 },
		troy_fighter_ionian_hero = { dbkey = "fight_ionian_hero_pets_cerberus", length = 17.5 },
		troy_fighter_lelegan_hero_2 = { dbkey = "fight_lelegan_hero_2_pets_cerberus", length = 17.5 },
		troy_fighter_lelegan_hero_3 = { dbkey = "fight_lelegan_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_lelegan_hero_4 = { dbkey = "fight_lelegan_hero_4_pets_cerberus", length = 17.5 },
		troy_fighter_lelegan_hero = { dbkey = "fight_lelegan_hero_pets_cerberus", length = 17.5 },
		troy_fighter_maeonian_hero_2 = { dbkey = "fight_maeonian_hero_2_pets_cerberus", length = 17.5 },
		troy_fighter_maeonian_hero_3 = { dbkey = "fight_maeonian_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_maeonian_hero_4 = { dbkey = "fight_maeonian_hero_4_pets_cerberus", length = 17.5 },
		troy_fighter_maeonian_hero = { dbkey = "fight_maeonian_hero_pets_cerberus", length = 17.5 },
		troy_fighter_meriones = { dbkey = "fight_meriones_pets_cerberus", length = 17.5 },
		troy_fighter_patroclus = { dbkey = "fight_patroclus_pets_cerberus", length = 17.5 },
		troy_fighter_pelasgian_hero_2 = { dbkey = "fight_pelasgian_hero_2_pets_cerberus", length = 17.5 },
		troy_fighter_pelasgian_hero_3 = { dbkey = "fight_pelasgian_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_pelasgian_hero_4 = { dbkey = "fight_pelasgian_hero_4_pets_cerberus", length = 17.5 },
		troy_fighter_pelasgian_hero = { dbkey = "fight_pelasgian_hero_pets_cerberus", length = 17.5 },
		troy_fighter_thracian_hero_2 = { dbkey = "fight_thracian_hero_2_pets_cerberus", length = 17.5 },
		troy_fighter_thracian_hero_3 = { dbkey = "fight_thracian_hero_3_pets_cerberus", length = 17.5 },
		troy_fighter_thracian_hero_4 = { dbkey = "fight_thracian_hero_4_pets_cerberus", length = 17.5 },
		troy_fighter_thracian_hero = { dbkey = "fight_thracian_hero_pets_cerberus", length = 17.5 },
		troy_fighter_troilos = { dbkey = "fight_troilos_pets_cerberus", length = 17.5 },
		troy_warlord_aeolian_hero_2 = { dbkey = "war_aeolian_hero_2_pets_cerberus", length = 17.5 },
		troy_warlord_aeolian_hero_3 = { dbkey = "war_aeolian_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_aeolian_hero_4 = { dbkey = "war_aeolian_hero_4_pets_cerberus", length = 17.5 },
		troy_warlord_aeolian_hero = { dbkey = "war_aeolian_hero_pets_cerberus", length = 17.5 },
		troy_warlord_agapenor = { dbkey = "war_agapenor_pets_cerberus", length = 17.5 },
		troy_warlord_alcinous = { dbkey = "war_alcinous_pets_cerberus", length = 17.5 },
		troy_dlc1_warlord_1 = { dbkey = "war_ama_gen_hero_1_pets_cerberus", length = 17.5 },
		troy_dlc1_warlord_2 = { dbkey = "war_ama_gen_hero_2_pets_cerberus", length = 17.5 },
		troy_dlc1_warlord_3 = { dbkey = "war_ama_gen_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_dorian_hero_2 = { dbkey = "war_dorian_hero_2_pets_cerberus", length = 17.5 },
		troy_warlord_dorian_hero_3 = { dbkey = "war_dorian_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_dorian_hero_4 = { dbkey = "war_dorian_hero_4_pets_cerberus", length = 17.5 },
		troy_warlord_dorian_hero = { dbkey = "war_dorian_hero_pets_cerberus", length = 17.5 },
		troy_warlord_hero_2 = { dbkey = "war_hero_2_pets_cerberus", length = 17.5 },
		troy_warlord_hero_3 = { dbkey = "war_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_hero_4 = { dbkey = "war_hero_4_pets_cerberus", length = 17.5 },
		troy_warlord_hero = { dbkey = "war_hero_pets_cerberus", length = 17.5 },
		troy_warlord_ionian_hero_2 = { dbkey = "war_ionian_hero_2_pets_cerberus", length = 17.5 },
		troy_warlord_ionian_hero_3 = { dbkey = "war_ionian_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_ionian_hero_4 = { dbkey = "war_ionian_hero_4_pets_cerberus", length = 17.5 },
		troy_warlord_ionian_hero = { dbkey = "war_ionian_hero_pets_cerberus", length = 17.5 },
		troy_warlord_lelegan_hero_2 = { dbkey = "war_lelegan_hero_2_pets_cerberus", length = 17.5 },
		troy_warlord_lelegan_hero_3 = { dbkey = "war_lelegan_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_lelegan_hero_4 = { dbkey = "war_lelegan_hero_4_pets_cerberus", length = 17.5 },
		troy_warlord_lelegan_hero = { dbkey = "war_lelegan_hero_pets_cerberus", length = 17.5 },
		troy_warlord_maeonian_hero_2 = { dbkey = "war_maeonian_hero_2_pets_cerberus", length = 17.5 },
		troy_warlord_maeonian_hero_3 = { dbkey = "war_maeonian_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_maeonian_hero_4 = { dbkey = "war_maeonian_hero_4_pets_cerberus", length = 17.5 },
		troy_warlord_maeonian_hero = { dbkey = "war_maeonian_hero_pets_cerberus", length = 17.5 },
		troy_warlord_menestheus = { dbkey = "war_menestheus_pets_cerberus", length = 17.5 },
		troy_warlord_mynes = { dbkey = "war_mynes_pets_cerberus", length = 17.5 },
		troy_warlord_oileus = { dbkey = "war_oileus_pets_cerberus", length = 17.5 },
		troy_warlord_pelasgian_hero_2 = { dbkey = "war_pelasgian_hero_2_pets_cerberus", length = 17.5 },
		troy_warlord_pelasgian_hero_3 = { dbkey = "war_pelasgian_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_pelasgian_hero_4 = { dbkey = "war_pelasgian_hero_4_pets_cerberus", length = 17.5 },
		troy_warlord_pelasgian_hero = { dbkey = "war_pelasgian_hero_pets_cerberus", length = 17.5 },
		troy_warlord_phaenops = { dbkey = "war_phaenops_pets_cerberus", length = 17.5 },
		troy_warlord_telephos = { dbkey = "war_telephos_pets_cerberus", length = 17.5 },
		troy_warlord_thracian_hero_2 = { dbkey = "war_thracian_hero_2_pets_cerberus", length = 17.5 },
		troy_warlord_thracian_hero_3 = { dbkey = "war_thracian_hero_3_pets_cerberus", length = 17.5 },
		troy_warlord_thracian_hero_4 = { dbkey = "war_thracian_hero_4_pets_cerberus", length = 17.5 },
		troy_warlord_thracian_hero = { dbkey = "war_thracian_hero_pets_cerberus", length = 17.5 },

		troy_rem_archer_aethiopian_hero_1  = { dbkey = "arch_aethiopian_hero_1_pets_cerberus", length = 17.5 },
		troy_rem_archer_aethiopian_hero_2  = { dbkey = "arch_aethiopian_hero_2_pets_cerberus", length = 17.5 },
		troy_rem_archer_aethiopian_hero_3  = { dbkey = "arch_aethiopian_hero_3_pets_cerberus", length = 17.5 },
		troy_rem_archer_aethiopian_hero_4  = { dbkey = "arch_aethiopian_hero_4_pets_cerberus", length = 17.5 },
		troy_rem_fighter_acamas  = { dbkey = "fight_acamas_pets_cerberus", length = 17.5 },
		troy_rem_fighter_aethiopian_hero_1  = { dbkey = "fight_aethiopian_hero_1_pets_cerberus", length = 17.5 },
		troy_rem_fighter_aethiopian_hero_2  = { dbkey = "fight_aethiopian_hero_2_pets_cerberus", length = 17.5 },
		troy_rem_fighter_aethiopian_hero_3  = { dbkey = "fight_aethiopian_hero_3_pets_cerberus", length = 17.5 },
		troy_rem_fighter_aethiopian_hero_4  = { dbkey = "fight_aethiopian_hero_4_pets_cerberus", length = 17.5 },
		troy_rem_fighter_telephos  = { dbkey = "fight_telephos_pets_cerberus", length = 17.5 },
		troy_rem_warlord_aethiopian_hero_1  = { dbkey = "war_aethiopian_hero_1_pets_cerberus", length = 17.5 },
		troy_rem_warlord_aethiopian_hero_2  = { dbkey = "war_aethiopian_hero_2_pets_cerberus", length = 17.5 },
		troy_rem_warlord_aethiopian_hero_3  = { dbkey = "war_aethiopian_hero_3_pets_cerberus", length = 17.5 },
		troy_rem_warlord_aethiopian_hero_4  = { dbkey = "war_aethiopian_hero_4_pets_cerberus", length = 17.5 },
	}
}

function PetTheCerberus_PetButton_show(disabled, visible, hero_cqi, dbkey, length)
	local pet_button = core:get_ui_root():SequentialFind(unpack(pet_the_cerberus_setup.petbtn_location), pet_the_cerberus_setup.petbtn_id)
	if pet_button then
		local tooltip_text = (disabled and pet_the_cerberus_setup.petbtn_tooltip_disabled or pet_the_cerberus_setup.petbtn_tooltip_enabled)
		pet_button:SetTooltipText(common.get_localised_string(tooltip_text), tooltip_text, true)

		if disabled then
			pet_button:SetState("inactive")
		elseif pet_button:CurrentState() == "inactive" then
			pet_button:SetState("active")
		end

		pet_button:SetProperty("hero_cqi", hero_cqi or "")
		pet_button:SetProperty("dbkey", dbkey or "")
		pet_button:SetProperty("length", length or "")

		pet_button:SetVisible(visible)
		return true
	else
		return false
	end
end

function PetTheCerberus_PetButton_clicked(hero_cqi, dbkey, length)
	if not is_number(hero_cqi) or not dbkey or not is_string(dbkey) or dbkey == "" or not is_number(length) then 
		output("error button property data")
		return 
	end

	local hero = cm:get_character_by_cqi(hero_cqi)
	
	if not hero or hero:is_null_interface() then 
		output("failed to find hero from provided CQI: "..tostring(hero_cqi))
		return 
	end

	local scene_id = pet_the_cerberus_setup.scene.id
	local scene_dbkey = dbkey
	local scene_length = length

	-- character 
	local hero_x = hero:logical_position_x()
	local hero_y = hero:logical_position_y()
	local hero_bearing = hero:bearing()
	local hero_lookup_string = "character_cqi:"..tostring(hero_cqi)

	output("start petting scene at logical".." x: "..hero_x..", y: "..hero_y.." bearing: "..hero_bearing)

	-- remove old scene if present
	if cm:has_scripted_composite_scene(scene_id) then
		cm:remove_scripted_composite_scene(scene_id)
	end

	-- place the scene and start playing
	if cm:add_scripted_composite_scene_to_logical_position(
		scene_id,
		scene_dbkey,
		hero_x,
		hero_y,
		hero_x,
		hero_y,
		false,
		true,
		true,
		hero_bearing) then

		-- ESC key disabled - callbacks are not functional during visible ESC menu
		cm:steal_escape_key_with_callback(scene_id, function() end)

		-- deselect the hero
		CampaignUI.ClearSelection()

		-- hide the hero, we will see him in scene
		cm:character_forced_invisible(hero_lookup_string, true)

		-- move camera to hero
		cm:scroll_camera_to_character(hero_cqi, 1, true)

		-- prevent character selection and giving him orders during the scene
		local uim = cm:get_campaign_ui_manager()
		uim:clear_character_selection_whitelist()
		uim:enable_character_selection_whitelist()

		-- callback to restore the state after the scene ended
		cm:callback(
			function()

				-- ESC key restored
				cm:release_escape_key_with_callback(scene_id)
				-- enable character selection
				uim:disable_character_selection_whitelist()
				-- show the hero again
				cm:character_forced_invisible(hero_lookup_string, false)
				-- remove the scene
				cm:remove_scripted_composite_scene(scene_id)
				-- select the hero again without zooming to his location
				CampaignUI.SelectObject(hero_cqi, "character", false)
				-- achievement
				CampaignUI.TriggerCampaignScriptEvent(hero_cqi, "AchievementPetCerberus:" .. hero:faction():name())

			end,
			scene_length
		)
	end
end

-- listeners
core:add_listener(
	pet_the_cerberus_setup.preff.."_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		output("add listeners")

		cm:remove_scripted_composite_scene(pet_the_cerberus_setup.scene.id)

		-- context menu for unit
		core:add_listener(
			pet_the_cerberus_setup.preff.."_AgentContextMenuDisplayed",
			"AgentContextMenuDisplayed",
			true,
			function(context)
				PetTheCerberus_PetButton_show(true, false)

				-- The timer shouldn't exist here, but just in case
				cm:remove_callback("ButtonPetTheCerberusUpdatePulse")

				if context.num_selected_agents == 1 then
					local selected_agent = cm:model():character_for_command_queue_index(context.selected_agents_cqi[1])

					local update_button = function()
						local was_updated = false

						if selected_agent and not selected_agent:is_null_interface() and selected_agent:is_embedded_in_military_force() and selected_agent:character_subtype(pet_the_cerberus_setup.cerberus_subtype) then
							local hero = selected_agent:embedded_in_military_force():general_character()
							if hero and not hero:is_null_interface() then
								local hero_unit = hero:commanded_unit()
								if not hero_unit or hero_unit:is_null_interface() then 
									return
								end

								local hero_unit_key = hero_unit:unit_key()
								local hero_uniform_name = hero:uniform_name()

								output("unit key: "..hero_unit_key..", scene key: "..(pet_the_cerberus_setup.scene[hero_unit_key] and pet_the_cerberus_setup.scene[hero_unit_key].dbkey or "missing"))
								output("uniform key: "..hero_uniform_name..", scene key: "..(pet_the_cerberus_setup.scene[hero_uniform_name] and pet_the_cerberus_setup.scene[hero_uniform_name].dbkey or "missing"))

								if (is_table(pet_the_cerberus_setup.scene[hero_unit_key]) or is_table(pet_the_cerberus_setup.scene[hero_uniform_name])) then
									local disabled = hero:has_garrison_residence() or hero:is_at_sea()
									local dbkey = (is_table(pet_the_cerberus_setup.scene[hero_unit_key]) and pet_the_cerberus_setup.scene[hero_unit_key].dbkey) or pet_the_cerberus_setup.scene[hero_uniform_name].dbkey
									local length = (is_table(pet_the_cerberus_setup.scene[hero_unit_key]) and pet_the_cerberus_setup.scene[hero_unit_key].length) or pet_the_cerberus_setup.scene[hero_uniform_name].length 

									output((disabled and "petting disabled" or "petting enabled")..", dbkey: "..dbkey..", lenght: "..length)

									was_updated = PetTheCerberus_PetButton_show(disabled, true, hero:command_queue_index(), dbkey, length)
								end
							end
						end

						if not was_updated then
							cm:remove_callback("ButtonPetTheCerberusUpdatePulse")
						end
					end

					update_button()
					cm:repeat_callback(update_button, 0.3, "ButtonPetTheCerberusUpdatePulse")
				end
			end,
			true
		)

		-- click the pet button
		core:add_listener(
			pet_the_cerberus_setup.preff.."_ComponentLClickUp",
			"ComponentLClickUp",
			function(context) return context.string == pet_the_cerberus_setup.petbtn_id end,
			function(context)
				local pet_button = UIComponent(context.component)

				local hero_cqi = pet_button:GetProperty("hero_cqi")
				local dbkey = pet_button:GetProperty("dbkey")
				local length = pet_button:GetProperty("length")

				PetTheCerberus_PetButton_clicked(tonumber(hero_cqi), dbkey, tonumber(length))
			end,
			true
		)

	end,
	true
)
