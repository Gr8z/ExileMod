/*
	infiSTAR: when you die your weapons dropped are not next to your body anymore, they will be on your body again!
*/
closeDialog 0;
ExileClientLastDiedPlayerObject = player;
ExileClientIsAutoRunning = false;
if !((vehicle player) isEqualTo player) then
{
	unassignVehicle player; 
	player action ['GetOut', vehicle player]; 
	player action ['Eject', vehicle player];
};
('ExileClientHUDLayer' call BIS_fnc_rscLayer) cutText ['', 'PLAIN'];

ExileClientLastDiedPlayerObject spawn {
	private['_unit','_nObject','_pos','_timer','_weaponCargo'];
	_unit = _this;
	if(isNil'_unit')exitWith{};
	if(isNull _unit)exitWith{};
	_pos = getPosATL _unit;
	_nObject = objNull;
	_timer = time + 15;
	waitUntil {_nObject = nearestObject [_pos, 'WeaponHolderSimulated'];((!isNull _nObject)||(time > _timer))};
	if(time > _timer)exitWith{};
	if(!isNull _nObject)then
	{
		_weaponCargo = weaponCargo _nObject;
		if!(_weaponCargo isEqualTo [])then
		{
			{
				if(isNull _unit)exitWith{};
				_unit addWeaponGlobal _x;
			} forEach _weaponCargo;
		};
	};
	if(isNull _unit)exitWith{};
	deleteVehicle _nObject;
};