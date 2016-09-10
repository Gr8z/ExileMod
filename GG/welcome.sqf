[] spawn {    
	waitUntil {player == player};
    playSound "intro";
    _worldName = switch (toLower worldName) do {
        case "tanoa" :{"Tanoa"};
        default{worldName};
    };
    [[format["Welcome %2, to [GG] Ghostz Gamerz %1 Alpha", _worldName, profileNameSteam],"","","Join our teamspeak for 10k free pop tabs","",""], -.5, .85] call BIS_fnc_typeText;
    sleep 2;
    [["Visit Us At:","www.GHOSTZGAMERZ.com","For Rules","Forums","and Donor Perks","",""], .5, .85] call BIS_fnc_typeText;
    _playerUID = getPlayerUID player;
    _announcepay = [];
    {
        _flag = _x;
        _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
        if (_playerUID in _buildRights) then
        {
            _nextDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
            _name = _flag getVariable ["ExileTerritoryName", ""];
            _flagPos = getPos _x;
            _mrkrName = format["FlagMapMarker_%1",_name];
            _mrkrName = createMarker [_mrkrName,[_flagPos select 0,_flagPos select 1]];
            _mrkrName setMarkerShape "ICON";
            _mrkrName setMarkerType "hd_flag";
            _mrkrName setMarkerTextLocal _name;
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
    _announcepay pushBack ["",""];
    if !(count _announcepay == 0) then{
            [_announcepay, -.5, .85] call BIS_fnc_typeText;
    };
};