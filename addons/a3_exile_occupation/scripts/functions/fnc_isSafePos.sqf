_position       = _this select 0;
_validspot      = true; 

// Check if position is near a blacklisted area
{
    _blacklistPos       = _x select 0;
    _blacklistRadius    = _x select 1;
    _blacklistMap       = _x select 2;
    if(isNil "_blacklistPos" OR isNil "_blacklistRadius" OR isNil "_blacklistMap") exitWith 
    { 
        _logDetail = format["[OCCUPATION]:: Invalid blacklist position supplied check SC_blackListedAreas in your config.sqf"];
        [_logDetail] call SC_fnc_log;           
        
    };
    if (worldName == _blacklistMap) then
    {
        if(_position distance _blacklistPos < _blacklistRadius) exitWith
        {
            _validspot = false;                                        
        };
    };     
}forEach SC_blackListedAreas;

//Check if near player territory
_nearBase = (nearestObjects [_position,["Exile_Construction_Flag_Static"],SC_minDistanceToTerritory]) select 0;
if (!isNil "_nearBase") then { _validspot = false;  };	

// Don't spawn AI near traders and spawn zones
{
    switch (getMarkerType _x) do 
    {
        case "ExileSpawnZone":
        {
            if(_position distance (getMarkerPos _x) < SC_minDistanceToSpawnZones) exitWith
            {
                _validspot = false;                        
            };
        };
        case "ExileTraderZone": 
        {
            if(_position distance (getMarkerPos _x) < SC_minDistanceToTraders) exitWith
            {
                _validspot = false;                        
            };
        };
    };
}
forEach allMapMarkers; 

// Don't spawn additional AI if there are players in range
if([_position, SC_minDistanceToPlayer] call ExileClient_util_world_isAlivePlayerInRange) exitwith { _validspot = false; };         


_validspot	