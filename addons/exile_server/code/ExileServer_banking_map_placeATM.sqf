/*

 	Name: ExileServer_banking_network_buyRequest.sqf

 	Description:
    Places ATMs on map.

*/
private ["_objects"];

_objects =
[
	["Land_Atm_01_F",[4562.852051,21455.285156,0],165.48,0,0,false],
	["Land_Atm_01_F",[9401.413086,20283.503906,0],252.538,0,0,false],
	["Land_Atm_01_F",[8664.698242,18287.570313,0],154.495,0,0,false],
	["Land_Atm_01_F",[10286.851563,19096.570313,0],131.452,0,0,false],
	["Land_Atm_01_F",[14040.40332,18710.117188,0],242.752,0,0,false],
	["Land_Atm_01_F",[14068.916016,18889.572266,0],125.139,0,0,false],
	["Land_Atm_01_F",[7081.587402,16402.707031,0],177.676,0,0,false],
	["Land_Atm_01_F",[4944.543945,16144.305664,0],12.6764,0,0,false],
	["Land_Atm_01_F",[3656.991211,12819.339844,0],72.6764,0,0,false],
	["Land_Atm_01_F",[5050.383789,11299.0185547,0],152.676,0,0,false],
	["Land_Atm_01_F",[9088.436523,11940.0800781,0],187.676,0,0,false],
	["Land_Atm_01_F",[10693.483398,12237.665039,0],130.012,0,0,false],
	["Land_Atm_01_F",[10922.754883,13457.234375,0],215.012,0,0,false],
	["Land_Atm_01_F",[12589.396484,14374.325195,0],337.096,0,0,false],
	["Land_Atm_01_F",[16344.171875,17265.583984,0],297.096,0,0,false],
	["Land_Atm_01_F",[20780.267578,6728.133789,0],284.621,0,0,false],
	["Land_Atm_01_F",[21709.769531,7594.243164,0],164.621,0,0,false],
	["Land_Atm_01_F",[20257.667969,11674.0615234,0],119.621,0,0,false],
	["Land_Atm_01_F",[21393.380859,16402.541016,0],246.705,0,0,false],
	["Land_Atm_01_F",[25626.648438,21252.558594,0],226.705,0,0,false],
	["Land_Atm_01_F",[27002.974609,23234.226563,0],46.7045,0,0,false]
];

{
    private ["_object"];

    _object = (_x select 0) createVehicle [0,0,0];
    _object setDir (_x select 2);
    _object setPosATL (_x select 1);
    _object enableSimulation false;
	_marker = createMarker ["cashpoint_" + str(_forEachIndex), _x select 1];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "loc_Tourism";
	_marker setMarkerColor "ColorGreen";
	_marker setMarkerSize [1,1];
	_marker setMarkerText "ATM";
}
forEach _objects;
