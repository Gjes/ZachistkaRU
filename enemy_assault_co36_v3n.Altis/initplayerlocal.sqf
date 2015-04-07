﻿waituntil {! isnull player};

_vehlist = execvm "scripts\vehiclelist.sqf";
_airlist = execvm "scripts\aircraftlist.sqf";
_boatlist = execvm "scripts\boatlist.sqf";

#include "addnotes.sqf"

if (player iskindof "rhs_msv_aa") then {
[player,"AH99"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_helosup", false];
[player,"A164"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_cassup", false];
};

if (player iskindof "rhs_msv_marksman") then {
[player,"UAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_uavsup", false];
[player,"UGV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_ugvsup", 0];
[player,"PUAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_puavsup", false];
//[player,"Artillery"] call BIS_fnc_addCommMenuItem;
};

if (player iskindof "rhs_msv_officer_armored") then {
[player,"AMMO"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_ammodrop", false];
[player,"PUAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_puavsup", false];
};

[player,"CARGO"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_cargodrop", false];
//[player,"Transport"] call BIS_fnc_addCommMenuItem;

player setVariable ["dix_halojump", false];

//addactions for halo and vehspawn. Should ensure them showing even with jip
vehspawn addAction ["<t size='1.5' shadow='2' color='#FFA000'>Техника</t> <img size='3' color='#FFA000' shadow='2' image='\A3\armor_f_gamma\MBT_01\Data\UI\Slammer_M2A1_Base_ca.paa'/>", "call ghst_fnc_spawnveh", ["veh_spawn",45], 6, true, true, "","alive _target"];
vehspawn setObjectTexture [0, "\A3\armor_f_gamma\MBT_01\Data\UI\Slammer_M2A1_Base_ca.paa"];

airspawn addAction ["<t size='1.5' shadow='2' color='#FFA000'>Авиация</t> <img size='3' color='#FFA000' shadow='2' image='\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Plane_CAS_01_CA.paa'/>", "call ghst_fnc_spawnair", ["air_spawn",135], 6, true, true, "","alive _target"];
airspawn setObjectTexture [0, "\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Plane_CAS_01_CA.paa"];

boatspawn addAction ["<t size='1.5' shadow='2' color='#FFA000'>Катера</t> <img size='3' color='#FFA000' shadow='2' image='\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa'/>", "call ghst_fnc_spawnboat", ["boat_spawn",166], 6, true, true, "","alive _target"];
boatspawn setObjectTexture [0, "\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa"];

halo addAction ["<t size='1.5' shadow='2' color='#00ffff'>Десантирование</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [false,1000,60,false], 5, true, true, "","alive _target"];

port_teleport addAction ["<t size='1.5' shadow='2' color='#8904B1'>Телепорт на базу ВМС</t> <img size='3' color='#8904B1' shadow='2' image='\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa'/>", {player setposasl [getmarkerpos "spawn_board_3" select 0,getmarkerpos "spawn_board_3" select 1,1.5];}, [], 5, true, true, "","alive _target"];
port_teleport setObjectTexture [0, "\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa"];

boatspawn addAction ["<t size='1.5' shadow='2' color='#8904B1'>Вернуться на базу</t> <img size='3' color='#8904B1' shadow='2' image='\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa'/>", {player setposatl [getmarkerpos "Respawn_West" select 0,getmarkerpos "Respawn_West" select 1,0.2];}, [], 5, false, true, "","alive _target"];

ghst_local_vehicles = [];
ghst_players = [];//["p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12"];
ghst_vehicles = ["uh80_1","ch67_1","vas1","vas2","vas3","bobcat_1","c130c_1","c130t_2"];

[] spawn ghst_fnc_ptracker;

player addEventHandler ["Respawn", {call ghst_fnc_playeraddactions}];  
call ghst_fnc_playeraddactions;

//set weather
_delay = 86400;
waituntil {! isNil {missionNamespace getvariable "ghst_weather"}};

skipTime -24;
[_delay] call fnc_ghst_UpdateWeather;
skipTime 24;

sleep 1;

simulWeatherSync;

[] spawn ghst_fnc_vehicle_actioninit;

sleep 30;

// Info text
[str("Зачистка v4") , str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("для Арматоп")] spawn BIS_fnc_infoText;