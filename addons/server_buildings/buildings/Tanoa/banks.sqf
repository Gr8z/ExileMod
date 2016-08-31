if (isServer) then {
	private ["_atms"];
	_atms = [
		["Land_Atm_01_F", [5457.49, 4047.2, 5.02821], [-0.696254, -0.717796, 0], [0, 0, 1]],
		["Land_Atm_01_F", [3429.36, 6760.93, 3.61379], [-0.468526, -0.883449, 0], [0, 0, 1]],
		["Land_Atm_01_F", [5088.08, 8696.57, 4.086], [-0.998726, -0.0504661, 0], [0, 0, 1]],
		["Land_Atm_01_F", [9325.38, 4006.55, 6.4982], [0.083802, -0.996482, 0], [0, 0, 1]],
		["Land_Atm_01_F", [11043.3, 9822.49, 115.979], [-0.964062, 0.265677, 0], [0, 0, 1]],
		["Land_Atm_01_F", [9692.19, 13503.1, 5.65275], [-0.31274, -0.949839, 0], [0, 0, 1]],
		["Land_Atm_01_F", [12785, 7448.52, 10.7078], [-0.992736, 0.120315, 0], [0, 0, 1]]
	];
	{
    private _atms = (_x select 0) createVehicle (_x select 1);
    _atms allowDamage false;
    _atms setPosWorld (_x select 1);
    _atms setVectorDirAndUp [_x select 2, _x select 3];
    _atms enableSimulationGlobal (_x select 4);
    _atms setVariable ["ExileIsLocked", -1, true];
	_marker = createMarker ["ATM" + str(_forEachIndex), _x select 1];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "loc_Tourism";
	_marker setMarkerColor "ColorWhite";
	_marker setMarkerSize [1.4,1.4];
}
forEach _vehicles;