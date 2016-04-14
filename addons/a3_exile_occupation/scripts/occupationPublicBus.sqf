if (!isServer) exitWith {};

_logDetail = format ["[OCCUPATION:publicBus]:: Starting @ %1",time];
[_logDetail] call SC_fnc_log;

_position = [ 0, 50, 1, 500, 500, 200, 200, 200, true, false ] call DMS_fnc_findSafePos;

// Get position of nearest roads
_nearRoads = _position nearRoads 2000;
_nearestRoad = _nearRoads select 0;
_nearestRoadPos = position (_nearRoads select 0);
_spawnLocation = [_nearestRoadPos select 0, _nearestRoadPos select 1, 0];

// Create the busDriver and ensure he doest react to gunfire or being shot at.

_group = createGroup resistance;
_group setCombatMode "BLUE";

"Exile_Trader_CommunityCustoms" createUnit [_spawnLocation, _group, "busDriver = this; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this disableAI 'SUPPRESSION'; "];

busDriver allowDamage false; 
removeGoggles busDriver;
busDriver forceAddUniform "U_IG_Guerilla3_1";
busDriver addVest "V_TacVest_blk_POLICE";
busDriver addBackpack "B_FieldPack_oli";
busDriver addHeadgear "H_Cap_blk";
busDriver setCaptive true;

// Spawn busDrivers Vehicle
_publicBus = createVehicle [SC_occupyPublicBusClass, _spawnLocation, [], 0, "CAN_COLLIDE"];
SC_publicBusArray = SC_publicBusArray + [_publicBus];
_publicBus setVariable ["SC_assignedDriver", busDriver,true];
_publicBus setVariable ["SC_vehicleSpawnLocation", _spawnLocation,true];
_publicBus addEventHandler ["getin", "_this call SC_fnc_getInBus;"];

_group addVehicle _publicBus;	
clearBackpackCargoGlobal _publicBus;
clearItemCargoGlobal _publicBus;
clearMagazineCargoGlobal _publicBus;
clearWeaponCargoGlobal _publicBus;
_publicBus setVariable ["ExileIsPersistent", false];
_publicBus setVariable["vehPos",_spawnLocation,true];
_publicBus setFuel 1;

diag_log format['[OCCUPATION:publicBus] Vehicle spawned @ %1',_spawnLocation];

_publicBus addEventHandler ["HandleDamage", { _amountOfDamage = 0; _amountOfDamage }];

busDriver assignasdriver _publicBus;
[busDriver] orderGetin true;
	
{
	_markerName = _x;
	_markerPos = getMarkerPos _markerName;
	if (markerType _markerName == "ExileTraderZone" OR markerType _markerName == "o_unknown") then 
	{
		_wp = _group addWaypoint [_markerPos, 100];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointspeed "LIMITED"; 
	};
  
} forEach allMapMarkers;

// Add a final CYCLE
_wp = _group addWaypoint [_spawnLocation, 100];
_wp setWaypointType "CYCLE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointspeed "LIMITED"; 

 
_busPos = position _publicBus;
_mk = createMarker ["busLocation",_busPos];
"busLocation" setMarkerType "mil_warning";
"busLocation" setMarkerText "Public Bus";

diag_log format['[OCCUPATION:publicBus] Running'];
busDriver = _publicBus getVariable "SC_assignedDriver";

// Make busDriver stop when players near him.
while {true} do
{
    
    _pos = position _publicBus;
    _mk setMarkerPos _pos;
    _nearPlayers = (count (_pos nearEntities [['Exile_Unit_Player'],25]));

    if (_nearPlayers >= 1) then
    {
        uiSleep 0.5;
        _publicBus setFuel 0;
        busDriver action ["salute", busDriver];		
        busDriver disableAI "MOVE";
        uiSleep 3;
    }
    else
    {	
        _currentDriver = driver _publicBus;
        if(_currentDriver != busDriver) then 
        {   
            _publicBus setFuel 0;
            [_currentDriver] orderGetin false; 
            _currentDriver action ["eject", _publicBus];
        };
        
        if(isnull _currentDriver) then
        {
            sleep 0.1;
            busDriver assignAsDriver _publicBus;
            busDriver moveInDriver _publicBus;      
            [busDriver] orderGetin true;
            _publicBus lockDriver true;
        };
        _publicBus setFuel 1;
        uiSleep 3;
        busDriver enableAI "MOVE";
        if(!Alive busDriver) exitWith {};
    };
};		
