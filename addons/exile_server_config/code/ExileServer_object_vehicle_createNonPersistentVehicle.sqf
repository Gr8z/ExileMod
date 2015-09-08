/**
 * Exile Mod
 * www.exilemod.com
 * � 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * Modified by Rod Serling. Redistributed with permission.
 */
 
private["_className","_position","_direction","_usePositionATL","_vehicleObject"];
_className = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_usePositionATL = _this select 3;
_vehicleObject = createVehicle [_className, _position, [], 0, "CAN_COLLIDE"];
clearBackpackCargoGlobal _vehicleObject;
clearItemCargoGlobal _vehicleObject;
clearMagazineCargoGlobal _vehicleObject;
clearWeaponCargoGlobal _vehicleObject;
_position set[2, (_position select 2) + 0.25]; 
_vehicleObject setDir _direction;		
if (_usePositionATL) then
{
	_vehicleObject setPosATL _position;
}
else 
{
	_vehicleObject setPosASL _position;	
};
_vehicleObject addEventHandler ["GetIn", { _this call ExileServer_object_vehicle_event_onGetIn}];
if (_vehicleObject isKindOf "Helicopter") then
{
	_vehicleObject addEventHandler ["RopeAttach", { _this call ExileServer_object_vehicle_event_onRopeAttach}];
};
_vehicleObject setVariable ["ExileIsPersistent", false];
_vehicleObject setFuel (random 1);
_vehicleObject call ExileServer_system_simulationMonitor_addVehicle;
_vehicleObject