
///////////////////////////////////////////////////////////////////////////
// Northeast Airfield Traders
///////////////////////////////////////////////////////////////////////////
[[12145.6,12746.9,0.00144958],"TRADER"] call CustomServer_system_loot_disable;

ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["HubStandingUC_idle2"],
    [12145.6,12746.9,0.00144958],
    200.296
];
[[12170.7,12736.1,0.00143433],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle3"],
    [12170.7,12736.1,0.00143433],
    201.636
];
[[12192.6, 12732.9, 0.00141907],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUC_idle1"],
    [12192.6, 12732.9, 0.00141907],
    234.239
];

///////////////////////////////////////////////////////////////////////////
// Klen Traders
///////////////////////////////////////////////////////////////////////////
[[11490.1,11324,0.54892],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [11490.1,11324,0.54892],57
];
[[11473.2,11340.2,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3", "HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [11473.2,11340.2,0],7
];

[[11495.1,11335.5,0.180817],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [11495.1,11335.5,0.180817],233
];
[[11460.9,11342.9,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [11460.9,11342.9,0],10
];
[[11468.9,11341.2,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3", "HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [11468.9,11341.2,0],9
];
[[11496,11319.1,0.565857],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [11496,11319.1,0.565857],329
];
[[11452,11323.8,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3", "HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [11452,11323.8,0],15
];
[[11450.1,11317.8,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [11450.1,11317.8,0],189
];
[[11456.6,11344.2,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [11456.6,11344.2,0],13
];

///////////////////////////////////////////////////////////////////////////
////////////////////////// BASH TRADER
///////////////////////////////////////////////////////////////////////////

_workBench = "Land_Workbench_01_F" createVehicle [0,0,0];
_workBench setDir 260;
_workBench setPosATL [4054.45,11669.7,0];
[getPos(_workBench),"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    (netID _workBench)
];
_cashDesk = "Land_CashDesk_F" createVehicle [0,0,0];
_cashDesk setDir 0;
_cashDesk setPosATL [4077.93,11697.8,0];
_microwave = "Land_Microwave_01_F" createVehicle [0,0,0];
_cashDesk disableCollisionWith _microwave;
_microwave disableCollisionWith _cashDesk;
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];
_ketchup = "Land_Ketchup_01_F" createVehicle [0,0,0];
_cashDesk disableCollisionWith _ketchup;
_ketchup disableCollisionWith _cashDesk;
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];
_mustard = "Land_Mustard_01_F" createVehicle [0,0,0];
_cashDesk disableCollisionWith _mustard;
_mustard disableCollisionWith _cashDesk;
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];
[getPos(_cashDesk),"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    170,
    (netID _cashDesk)
];

_chair = "Land_CampingChair_V2_F" createVehicle [0,0,0];
_chair setDir 280;
_chair setPosATL [4053.93,11680.1,0];
[getPos(_chair),"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["InBaseMoves_SittingRifle1"],
    [0, -0.15, -0.45],
    180,
    (netID _chair)
];
[[4053.62,11672.8,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [4053.62,11672.8,0],79.0909
];
[[4057.29,11664,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [4057.29,11664,0],44.0909
];
[[4066.45,11697.9,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [4066.45,11697.9,0],172.727
];
[[4092.82,11677.2,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [4092.82,11677.2,0],243.676
];
[[12062.33,12638.48,0.05],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [12062.33,12638.48,0.05],
    0
];
[[4046.69,11662.8,0.00140381],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [4046.69,11662.8,0.00140381],
    0
];
[[4076.35,11653.7,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [4076.35,11653.7,0],0
];
[[4070.2,11659.8,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [4070.2,11659.8,0],48.6363
];

///////////////////////////////////////////////////////////////////////////
////////////////////////// STARY TRADER
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
// Hardware Trader
///////////////////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicle [0,0,0];
_workBench setDir 240;
_workBench setPosATL [6321.57,7785.46,0];
[getPos(_workBench),"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    (netID _workBench)
];

///////////////////////////////////////////////////////////////////////////
// Fast Food Trader

_cashDesk = "Land_CashDesk_F" createVehicle [0,0,0];
_cashDesk setDir 20;
_cashDesk setPosATL [6337.6,7812.15,0];

_microwave = "Land_Microwave_01_F" createVehicle [0,0,0];
_cashDesk disableCollisionWith _microwave;         
_microwave disableCollisionWith _cashDesk; 
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

_ketchup = "Land_Ketchup_01_F" createVehicle [0,0,0];
_cashDesk disableCollisionWith _ketchup;         
_ketchup disableCollisionWith _cashDesk; 
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

_mustard = "Land_Mustard_01_F" createVehicle [0,0,0];
_cashDesk disableCollisionWith _mustard;         
_mustard disableCollisionWith _cashDesk; 
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];
[getPos(_cashDesk),"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    170,
    (netID _cashDesk)
];

///////////////////////////////////////////////////////////////////////////
// Armory Trader
///////////////////////////////////////////////////////////////////////////
_chair = "Land_CampingChair_V2_F" createVehicle [0,0,0];
_chair setDir 180;    
_chair setPosATL [6328.43,7782.45,0];
[getPos(_chair),"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["InBaseMoves_SittingRifle1"],
    [0, -0.15, -0.45],
    180,
    (netID _chair)
];

///////////////////////////////////////////////////////////////////////////
// Equipment Trader
///////////////////////////////////////////////////////////////////////////
[[6324.27,7783.47,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [6324.27,7783.47,0],16.8182
];

///////////////////////////////////////////////////////////////////////////
// Specops Trader
///////////////////////////////////////////////////////////////////////////
[[6314.74,7790.51,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [6314.74,7790.51,0],65.9091
];

///////////////////////////////////////////////////////////////////////////
// Office Trader
///////////////////////////////////////////////////////////////////////////
[[6326.91,7816.17,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [6326.91,7816.17,0],193.182
];

///////////////////////////////////////////////////////////////////////////
// Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
[[6337.81,7786.15,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
   [6337.81,7786.15,0],351.364
];

///////////////////////////////////////////////////////////////////////////
// Vehicle Trader
///////////////////////////////////////////////////////////////////////////

[[6313.3,7800.93,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["InBaseMoves_repairVehicleKnl", "InBaseMoves_repairVehiclePne"],
    [6313.3,7800.93,0],270
];

_carWreck = "Land_Wreck_CarDismantled_F" createVehicle [0,0,0];
_carWreck setDir 181.364;
_carWreck setPosATL [6311.59,7801.33,0];

///////////////////////////////////////////////////////////////////////////
// Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
[[6316.24,7810.23,0],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [6316.24,7810.23,0],129.545
];


///////////////////////////////////////////////////////////////////////////
// Boat Trader
///////////////////////////////////////////////////////////////////////////
[[13434.2,5440.97,0.0113521],"TRADER"] call CustomServer_system_loot_disable;
ExileServerCustom_Traders pushBack
[
    "Exile_Trader_Boat",
    "WhiteHead_17",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [13434.2,5440.97,0.0113521],269.545
];