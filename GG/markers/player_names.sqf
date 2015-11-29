nameDistance = _this select 0;
showDistance = _this select 1;

while {true} do
{
	waitUntil {
		count units (group player) > 1;
	};
	
	ShowGroupMemberNames = addMissionEventHandler ["Draw3D",
	{
		_members = units (group player);
		{
			if (!(isNull _x) && (isPlayer _x) && (_x != player)) then
			{
				_distance = cameraOn distance _x;
				_alpha = (1-(_distance/nameDistance));
				_clr = [1, 1, 1, _alpha];
				_crew = crew (vehicle _x);
				_name = '';
				{
					if (_x != player) then
					{
						_name = format ['%3%1%2', ['', format ['%1, ', _name]] select (_name != ''), name _x, ['', format ['[%1] ', round(player distance _x)]] select (showDistance)];
					};
				} forEach _crew;
				_veh = vehicle _x;
				_bbr = boundingBoxReal _veh;
				_p1 = _bbr select 0;
				_p2 = _bbr select 1;
				_maxHeight = (abs ((_p2 select 2) - (_p1 select 2))) * 1.25; 
				_pos = visiblePosition _veh;
				_pos set[2,(_pos select 2) + _maxHeight];
				
				drawIcon3D['', _clr, _pos, 0, 0, 0, _name, 1, 0.03];
			};
		} forEach _members;
	}];

	_memberCount = count units (group player);
	waitUntil {
		count (units (group player)) != _memberCount;
	};
	
	removeMissionEventHandler ["Draw3D",ShowGroupMemberNames];
	
	sleep 1;
};