//V1.1 - By: Ghost - List of different units for spawning scripts
//[side_type] execvm "unit_list.sqf";
private ["_PARAM_SU35","_PARAM_Enemy"];

_PARAM_SU35 = "PARAM_SU35" call BIS_fnc_getParamValue;
_PARAM_Enemy = "PARAM_Enemy" call BIS_fnc_getParamValue;
if (_PARAM_Enemy == 2) then {_PARAM_Enemy = floor(random 2);};
switch _PARAM_Enemy do {

case 0: {

	///////////
	//Iranian UNITS
	/////////// "O_sniper_F","O_recon_M_F","O_recon_exp_F","O_recon_medic_F","O_recon_LAT_F","O_recon_TL_F","O_soldierU_AA_F","O_soldierU_AT_F","O_soldierU_LAT_F","O_soldierU_AR_F"
	
	ghst_side = west;

	ghst_menlist = ["B_Soldier_SL_F","B_sniper_F","B_recon_M_F","B_recon_exp_F","B_recon_LAT_F","B_recon_TL_F","B_soldier_AA_F","B_soldier_AT_F","B_soldier_LAT_F","B_soldier_AR_F","B_sniper_F","B_recon_M_F","B_recon_exp_F","B_recon_LAT_F","B_recon_TL_F","B_soldier_AA_F","B_Soldier_TL_F","B_soldier_LAT_F","B_recon_M_F"];

	ghst_diverlist = ["B_diver_f","B_diver_exp_f","B_diver_TL_f","B_diver_f","B_diver_exp_f","B_diver_f"];
	
	ghst_specopslist = ["B_Soldier_SL_F","B_sniper_F","B_recon_M_F","B_recon_LAT_F","B_recon_TL_F","B_soldier_AT_F","B_soldier_LAT_F","B_soldier_AR_F","I_Soldier_AA_F","I_officer_F","I_Soldier_AR_F","I_Spotter_F","I_Sniper_F"];

	ghst_crewmenlist = ["B_crew_F"];
	
	ghst_patrolvehlist = ["I_MRAP_03_gmg_F","B_APC_Wheeled_01_rcws_F","B_APC_Tracked_01_AA_F","B_MBT_01_cannon_F","B_APC_Wheeled_01_rcws_F","B_APC_Tracked_01_cannon_F","I_APC_Wheeled_03_cannon_F","I_MBT_03_cannon_F"];

	ghst_convoyvehlist = ["I_APC_Wheeled_03_cannon_F","B_Truck_01_transport_F","B_MRAP_01_gmg_F","B_Truck_01_covered_F","B_APC_Wheeled_01_rcws_F","I_APC_Wheeled_03_cannon_F","I_APC_Wheeled_03_cannon_F","B_MRAP_01_gmg_F","B_APC_Wheeled_01_rcws_F","I_MBT_03_cannon_F"];

	ghst_staticlist = ["B_HMG_01_high_F","B_Mortar_01_F"];
	
	ghst_patrolboatlist = ["B_Boat_Armed_01_minigun_F"];
	
	ghst_transport_heli_list = "B_Heli_Transport_01_camo_F";
	
	ghst_attack_heli_list = "B_Heli_Attack_01_F";
	
	if (_PARAM_SU35 == 0) then {
	ghst_patrol_air_list = ["B_Plane_CAS_01_F","I_Plane_Fighter_03_AA_F"];
	} else {
	ghst_patrol_air_list = ["B_Plane_CAS_01_F"];
	};
	
	ghst_commanderlist = ["B_Story_Colonel_F","B_Story_Protagonist_F","B_Story_SF_Captain_F"];
	
	ghst_ammobox_list = "Box_NATO_Ammo_F";
	
	};

case 1: {

	///////////
	//Greek UNITS
	///////////
	
	ghst_side = independent;

	ghst_menlist = ["I_soldier_F","I_Soldier_lite_F","I_soldier_AT_F","I_soldier_GL_F","I_soldier_LAT_F","I_soldier_exp_F","I_soldier_F","I_soldier_AR_F","I_soldier_repair_F","I_soldier_LAT_F","I_soldier_AR_F","I_soldier_M_F","I_soldier_AT_F","I_soldier_AA_F","I_soldier_F","I_soldier_TL_F","I_medic_F","I_soldier_GL_F","I_soldier_F"];

	ghst_diverlist = ["I_diver_f","I_diver_exp_f","I_diver_TL_f","I_diver_f","I_diver_exp_f","I_diver_f"];
	
	ghst_specopslist = ["I_soldier_F","I_Soldier_lite_F","I_soldier_GL_F","I_soldier_LAT_F","I_soldier_TL_F","I_medic_F","I_soldier_AR_F"];

	ghst_crewmenlist = ["I_crew_F"];
	
	ghst_patrolvehlist = ["I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F","I_APC_Wheeled_03_cannon_F"];

	ghst_convoyvehlist = ["I_Truck_02_transport_F","I_MRAP_03_gmg_F","I_Truck_02_covered_F","I_APC_Wheeled_03_cannon_F","I_Ifrit_F","I_Truck_02_covered_F","I_MRAP_03_hmg_F","I_MRAP_03_F","I_Truck_02_transport_F"];

	ghst_staticlist = ["I_HMG_01_high_F","I_GMG_01_high_F","I_static_AT_F","I_static_AA_F"];
	
	ghst_patrolboatlist = ["I_Boat_Armed_01_minigun_F"];
	
	ghst_transport_heli_list = "I_Heli_Transport_02_F";
	
	ghst_attack_heli_list = "I_Heli_light_03_F";
	
	if (_PARAM_SU35 == 0) then {
	ghst_patrol_air_list = ["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"];
	} else {
	ghst_patrol_air_list = ["JS_JC_SU35","I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"];
	};
	
	ghst_commanderlist = ["I_officer_F","I_Story_Colonel_F"];
	
	ghst_ammobox_list = "Box_IND_Ammo_F";
	
	};
	
};