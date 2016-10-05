private["_code"];
if (!hasInterface || isServer) exitWith {};

{
    _file = format["GG\repairVehicle\functions\%1", _x select 1];
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ["GG_fnc_repairVehicle_getVehicleType", "fn_repairVehicle_getVehicleType.sqf"],
	["GG_fnc_repairVehicle_repairchopper", "fn_repairVehicle_repairchopper.sqf"],
	["GG_fnc_repairVehicle_repairWheels", "fn_repairVehicle_repairWheels.sqf"],
	["GG_fnc_repairVehicle_scavengeWheel", "fn_repairVehicle_scavengeWheel.sqf"],
	["GG_fnc_repairVehicle_vehicleRepairCar", "fn_repairVehicle_vehicleRepairCar.sqf"]
];