_boat = _this select 0;
_boat removeAllMPEventHandlers  "mphit";
_boatDamage = getDammage _boat;
_boatPosition = getPosASL _boat;
_boatHeight = getPosASL _boat select 2;
_crewEjected = _boat getVariable "SC_crewEjected";

_damageLimit 		= 0.2;
_engineDamage 		= false;
_fueltankDamage 	= false;

if(SC_extendedLogging) then 
{
	_logDetail = format ["[OCCUPATION:Sea]:: Sea unit %2 hit by %3 at %1 (damage: %4)",time,_this select 0,_this select 1,_boatDamage];
	[_logDetail] call SC_fnc_log;	
};
_ejectChance = round (random 100) + (_boatDamage * 100);


_essentials = [ "HitAvionics","HitEngine1","HitEngine2","HitEngine","HitHRotor","HitVRotor","HitTransmission",
                "HitHydraulics","HitGear","HitHStabilizerL1","HitHStabilizerR1","HitVStabilizer1","HitFuel"];

_damagedEssentials = 0;
{
	if ((_boat getHitPointDamage _x) > 0) then
	{	
		if(_x == "HitFuel") then
        {
            _boat setHitPointDamage ["HitFuel", 0]; 
            _boat setFuel 1;      
        };
        _damage = _boat getHitPointDamage _x;
        if(SC_extendedLogging) then 
        {
            _logDetail = format ["[OCCUPATION:Sea]:: Boat %1 checking part %2 (damage: %4) @ %3",_boat, _x, time,_damage]; 
            [_logDetail] call SC_fnc_log;
        };        
		if(_damage > 0) then { _damagedEssentials = _damagedEssentials + 1; };
	};
} forEach _essentials;


if(_boatDamage > 0.2 && _damagedEssentials > 0 && !_crewEjected && _ejectChance > 80) then
{
	
	[_boat ] spawn 
	{
		_veh = _this select 0;
        if(SC_extendedLogging) then 
        { 
            _boatPosition = getPosATL _veh;
            _logDetail = format ["[OCCUPATION:Sea]:: Sea unit %2 ejecting passengers at %3 (time: %1)",time,_veh,_boatPosition]; 
            [_logDetail] call SC_fnc_log;	
        };
		{	

			_unit = _x select 0;
            
			if (!(_unit == gunner _veh) && !(_unit == driver _veh)) then
			{
				_unit action ["EJECT", _veh];
			};
		} forEach (fullCrew _veh);

	};
	_boat setVariable ["SC_crewEjected", true,true];
	_target = _this select 1;
	_pilot = driver _boat;
	_group = group _boat;
	_group reveal [_target,1.5];

    _destination = getPos _target;
	_group allowFleeing 0;
	_wp = _group addWaypoint [_destination, 0] ;
	_wp setWaypointFormation "Column";
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointCompletionRadius 1;
	_wp setWaypointType "SAD";
    
	
	[_group, _destination, 250] call bis_fnc_taskPatrol;
	_group allowFleeing 0;
	_group setBehaviour "AWARE";  
	_group setCombatMode "RED";	
	_boat addMPEventHandler ["mphit", "_this call SC_fnc_airHit;"];	
};
	

if(_boatDamage > 0.7 && _damagedEssentials > 0) then
{
	if(SC_extendedLogging) then 
	{ 
		_logDetail = format ["[OCCUPATION:Sky]:: Air unit %2 damaged and force landing at %3 (time: %1)",time,_this select 0,_this select 1,_boatPosition];
		[_logDetail] call SC_fnc_log;
	};
    
    [_boat] call SC_fnc_vehicleDestroyed;
    _currentHeliPos = getPos _boat;
    _destination = [_currentHeliPos, 1, 150, 10, 0, 20, 0] call BIS_fnc_findSafePos;
	_boat setVehicleLock "UNLOCKED";
	_target = _this select 1;
	_group = group _boat;
	_group reveal [_target,2.5];
    _destination = position _target;

    _boat land "LAND";
    _group2 = createGroup east;
    {
        _x join _group2;
    } forEach (fullCrew _boat);

	_group2 allowFleeing 0;
	_wp = _group2 addWaypoint [_destination, 0] ;
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointCompletionRadius 10;
	_wp setWaypointType "GETOUT";    
    
	[_group2, _destination, 250] call bis_fnc_taskPatrol;
    _group2 setBehaviour "COMBAT";
    _group2 setCombatMode "RED";
};