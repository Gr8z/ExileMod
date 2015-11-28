[] execVM "GG\HC\init.sqf";
[] execVM "GG\safezones\init.sqf";
[] execVM "GG\StatusBar\statusBar.sqf";
[] execVM "GG\inspectLoop.sqf";
[] execVM "GG\player_markers.sqf";
[] execVM "GG\KillMessages.sqf";
[] execVM "GG\IgiLoad\IgiLoadInit.sqf";
[] execVM "GG\ModCheck.sqf";
[] execVM "GG\money\takegive_poptab_init.sqf";
[] execVM "GG\service\service_point.sqf";

#include "initServer.sqf"

if (!hasInterface || isServer) exitWith {};


///////////////////////////////////////////////////////////////////////////
// Northeast Airfield Traders
///////////////////////////////////////////////////////////////////////////

[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["HubStandingUC_idle2"],
    [12145.6,12746.9,0.00144958],
    200.296
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle3"],
    [12170.7,12736.1,0.00143433],
    201.636
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUC_idle1"],
    [12192.6, 12732.9, 0.00141907],
    234.239
]
call ExileClient_object_trader_create;


///////////////////////////////////////////////////////////////////////////
// Klen Traders
///////////////////////////////////////////////////////////////////////////

[
    "Exile_Trader_Hardware",
     "WhiteHead_17",
    ["HubStanding_idle1"],
    [11458.5, 11326, 0.00140381],
    47.1875
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["HubStanding_idle2"],
    [11495.8, 11345.7, 0.00143433],
    256.01
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["HubStanding_idle1"],
    [11483.8, 11320.3, 0.00143433],
    336.023
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStanding_idle3"],
    [11473.6, 11362, 0.00146484],
    178.881
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStandingUC_idle3"],
    [11470.9, 11319.3, 0.00143433],
    10.6717
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3"],
    [11453.5, 11338.7, 0.00143433],
    84.3003
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUC_idle1"],
    [11441, 11333, 0.00140381],
    308.349
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubStandingUC_idle1"],
    [11444.6, 11345.8, 0.00137329],
    263.448
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["HubStandingUC_idle2"],
    [11437.4, 11353.6, 0.00146484],
    236.574
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Kamenka Traders
///////////////////////////////////////////////////////////////////////////

[
    "Exile_Trader_Hardware",
     "WhiteHead_17",
    ["HubStanding_idle1"],
    [1260.81, 2471.3, 0],
    150.751
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["HubStanding_idle2"],
    [1288.32, 2465.76, 0],
    240.124
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["HubStanding_idle1"],
    [1256.03, 2436.66, 0],
    44.1479
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStanding_idle3"],
    [1251.91, 2461.75, 0],
    114.14
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStandingUC_idle3"],
    [1249.68, 2449.12, 0],
    85.0663
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3"],
    [1286.59, 2436.25, 0],
    318.73
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUC_idle1"],
    [1228.37, 2430.93, -0.0185184],
    157.212
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubStandingUC_idle1"],
    [1240.21, 2435.38, 0],
    152.904
]
call ExileClient_object_trader_create;

[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["HubStandingUC_idle2"],
    [1253.29, 2431.61, 0],
    222.896
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
////////////////////////// STARY TRADER
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
// Hardware Trader
///////////////////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 240;
_workBench setPosATL [6321.57,7785.46,0];

[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    _workBench
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Fast Food Trader
///////////////////////////////////////////////////////////////////////////
/*[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [6337.6,7812.15,0],200
]
call ExileClient_object_trader_create;
*/
_cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
_cashDesk setDir 20;
_cashDesk setPosATL [6337.6,7812.15,0];

_microwave = "Land_Microwave_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _microwave;         
_microwave disableCollisionWith _cashDesk; 
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

_ketchup = "Land_Ketchup_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _ketchup;         
_ketchup disableCollisionWith _cashDesk; 
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

_mustard = "Land_Mustard_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _mustard;         
_mustard disableCollisionWith _cashDesk; 
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];

[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    170,
    _cashDesk
]
call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Armory Trader
///////////////////////////////////////////////////////////////////////////
_chair = "Land_CampingChair_V2_F" createVehicleLocal [0,0,0];
_chair setDir 180;    
_chair setPosATL [6328.43,7782.45,0];

[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["InBaseMoves_SittingRifle1"],
    [0, -0.15, -0.45],
    180,
    _chair
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Equipment Trader
///////////////////////////////////////////////////////////////////////////
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [6324.27,7783.47,0],16.8182
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Specops Trader
///////////////////////////////////////////////////////////////////////////
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [6314.74,7790.51,0],65.9091
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Office Trader
///////////////////////////////////////////////////////////////////////////
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [6326.91,7816.17,0],193.182
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
   [6337.81,7786.15,0],351.364
]
call ExileClient_object_trader_create;
/*
///////////////////////////////////////////////////////////////////////////
// Aircraft Trader
///////////////////////////////////////////////////////////////////////////
[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [14596.5, 16752.9, 0.12644],
    133
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Aircraft Customs Trader
///////////////////////////////////////////////////////////////////////////
[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [14635, 16790.3, 0],
    156.294
]
call ExileClient_object_trader_create;
*/
///////////////////////////////////////////////////////////////////////////
// Vehicle Trader
///////////////////////////////////////////////////////////////////////////

_trader = 
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["InBaseMoves_repairVehicleKnl", "InBaseMoves_repairVehiclePne"],
    [6313.3,7800.93,0],270
]
call ExileClient_object_trader_create;

_carWreck = "Land_Wreck_CarDismantled_F" createVehicleLocal [0,0,0];
_carWreck setDir 181.364;
_carWreck setPosATL [6311.59,7801.33,0];

///////////////////////////////////////////////////////////////////////////
// Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [6316.24,7810.23,0],129.545
]
call ExileClient_object_trader_create;
