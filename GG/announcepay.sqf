_playerUID = getPlayerUID player;
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
			 ["DueDate",[format["<t color='#878787'>%2</t> territory payment due: <t color='#878787'>%1</t>",_dueDate,_name]]] call BIS_fnc_showNotification;
            };
        }
        forEach (allMissionObjects "Exile_Construction_Flag_Static");