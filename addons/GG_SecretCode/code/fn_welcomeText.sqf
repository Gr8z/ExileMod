WELCOME_TEXT__CODE = {
    // Welcome messages
    private ["_worldName","_playerUID","_announcepay","_buildRights","_flag","_dueDate","_nextDueDate","_msg","_name","_missingModList"];
    playSound "intro";
    _worldName = switch (toLower worldName) do {
        case "tanoa" :{"Tanoa"};
        default{worldName};
    };
    [[format["Welcome %2, to [GG] Ghostz Gamerz %1 Alpha", _worldName, profileNameSteam],"","","Join our teamspeak for 10k free pop tabs","",""], -.5, .85] call BIS_fnc_typeText;
    sleep 2;
    [["Visit Us At:","www.GHOSTZGAMERZ.com","For Rules","Forums","",""], .5, .85] call BIS_fnc_typeText;

    // Territory Information
    _playerUID = getPlayerUID player;
    _announcepay = [];
    {
        _flag = _x;
        _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
        if (_playerUID in _buildRights) then
        {
            _nextDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
            _name = _flag getVariable ["ExileTerritoryName", ""];
            _dueDate = format 
            [
                    "%2/%3/%1",
                    _nextDueDate select 0,
                    _nextDueDate select 1,
                    _nextDueDate select 2
            ];
            _msg = format["Your territory payment for '%2' due: %1",_dueDate,_name];
            _announcepay pushBack _msg;
            
        };
    }
    forEach (allMissionObjects "Exile_Construction_Flag_Static");
    sleep 2;
    _announcepay append ["","",""];
    if !(count _announcepay == 0) then{
            [_announcepay, -.5, .85] call BIS_fnc_typeText;
    };

    // Missing Mod Information
    _missingModList = [];
    _missingMods = false;

    if !(isClass (configFile >> "CfgPatches" >> "asdg_jointrails")) then {
        _msg = "We detected that your game is not running ASDG Joint Rails Mod.";
        _missingMods = true;
        _missingModList pushBack _msg;
    };
    if !(isClass (configFile >> "CfgPatches" >> "hlcweapons_core")) then {
        _msg = "We detected that your game is not running NiArms Pack Mod.";
        _missingMods = true;
        _missingModList pushBack _msg;
    };
    if !(isClass (configFile >> "CfgPatches" >> "TRYK_Uniform")) then {
        _msg = "We detected that your game is not running TRYK Multiplay Uniforms Mod.";
        _missingMods = true;
        _missingModList pushBack _msg;
    };

    if (_missingMods) then {
        _missingModList append ["","",""];

        sleep 2;

        if !(count _missingModList == 0) then{
                [_missingModList, .5, .85] call BIS_fnc_typeText;
        };
    };
};
publicVariable 'WELCOME_TEXT__CODE';

[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'WELCOME_TEXT_JIP_T')then{terminate WELCOME_TEXT_JIP_T;WELCOME_TEXT_JIP_T=nil;};
		WELCOME_TEXT_JIP_T = [] spawn {
			waitUntil {!isNil 'WELCOME_TEXT__CODE'};
			waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
			[] spawn WELCOME_TEXT__CODE;
		};
	},-2,'WELCOME_TEXT_JIP'] call FN_infiSTAR_S;
};
true