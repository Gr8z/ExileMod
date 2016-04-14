// Triggered if a player gets in a captured AI vehicle
// Marks the vehicle as claimed by a player and frees up a slot to spawn another AI controlled vehicle

_unit	= _this select 0;

if(isPlayer _unit) then
{
	_vehicle = vehicle _unit;
    [_vehicle]  call SC_fnc_vehicleDestroyed;

	if(SC_extendedLogging) then 
	{
		_logDetail = format ["[OCCUPATION:claimVehicle]:: Unit %3 has claimed vehicle %2 at %1",time,_vehicle,_unit]; 
		[_logDetail] call SC_fnc_log;
	};
};





