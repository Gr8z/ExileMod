if (!isServer) exitWith {};

private["_wp","_wp2","_wp3"];

_logDetail = format ["[OCCUPATION:RandomSpawn]:: Starting Occupation Monitor @ %1",time];
[_logDetail] call SC_fnc_log;

_middle 		    = worldSize/2;			
_spawnCenter 	    = [_middle,_middle,0];		// Centre point for the map
_maxDistance 	    = _middle;			        // Max radius for the map

_maxAIcount 		= SC_maxAIcount;
_minFPS 			= SC_minFPS;
_useLaunchers 	    = DMS_ai_use_launchers;
_scaleAI			= SC_scaleAI;
_side               = "bandit"; 


// more than _scaleAI players on the server and the max AI count drops per additional player
_currentPlayerCount = count playableUnits;
if(_currentPlayerCount < SC_randomSPawnMinPlayers) exitWith 
{ 
    if(SC_extendedLogging) then 
    { 
        _logDetail = format ["[OCCUPATION:RandomSpawn]:: Held off spawning random AI, not enough players online"]; 
        [_logDetail] call SC_fnc_log; 
    };
};
if(_currentPlayerCount > _scaleAI) then 
{
	_maxAIcount = _maxAIcount - (_currentPlayerCount - _scaleAI) ;
};

// Don't spawn additional AI if the server fps is below _minFPS
if(diag_fps < _minFPS) exitWith 
{ 
    if(SC_extendedLogging) then 
    { 
        _logDetail = format ["[OCCUPATION:RandomSpawn]:: Held off spawning more AI as the server FPS is only %1",diag_fps]; 
        [_logDetail] call SC_fnc_log; 
    };
};

_aiActive = { !isPlayer _x } count allunits;

if(_aiActive > _maxAIcount) exitWith 
{ 
    if(SC_extendedLogging) then 
    { 
        _logDetail = format ["[OCCUPATION:RandomSpawn]:: %1 active AI, so not spawning AI this time",_aiActive]; 
        [_logDetail] call SC_fnc_log;
    };
};

SC_suitablePlayers = [];
// Find a player to spawn AI near
{
    _suitablePlayer = true;
    
    
}forEach playableUnits;
