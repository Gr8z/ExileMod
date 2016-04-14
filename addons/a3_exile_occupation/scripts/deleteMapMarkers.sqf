// Delete the map marker on a loot crate when a player gets in range

for "_i" from 1 to SC_numberofLootCrates do
{
    _markerName = format ["loot_marker_%1", _i];
	_pos = getMarkerPos _markerName;
	
	if(!isNil "_pos") then
	{
		_nearPlayers = (count (_pos nearEntities [['Exile_Unit_Player'],15]));
		if(_nearPlayers > 0) then 
		{ 
			deleteMarker _markerName; 
			_logDetail =  format ["[OCCUPATION:LootCrates]:: marker %1 removed at %2",_markerName,time];
            [_logDetail] call SC_fnc_log;
		};
		
	};
};