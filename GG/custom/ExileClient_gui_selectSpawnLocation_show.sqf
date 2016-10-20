
/**
 * ExileClient_gui_selectSpawnLocation_show
 */
 
private["_display","_spawnButton","_listBox","_listItemIndex","_numberOfSpawnPoints","_randNum","_randData","_randomSpawnIndex","_numberOfSpawnCities","_spawns_arr"];
disableSerialization;
ExileClientSpawnLocationSelectionDone = false;
ExileClientSelectedSpawnLocationMarkerName = "";
createDialog "RscExileSelectSpawnLocationDialog";
waitUntil
{
	_display = findDisplay 24002;
	!isNull _display
};
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlEnable false;
_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
_listBox = _display displayCtrl 24002;
lbClear _listBox;

ExileClientSelectedSpawnLocationMarkerName = "";

if(isNil "CC_LastSpawnLocation") then
{
	CC_LastSpawnLocation = [];
};
if(isNil "CC_TownMarkers") then
{
	CC_TownMarkers = [];
};

if!(CC_TownMarkers isEqualTo []) then
{
	{
		deleteMarker _x;
	} forEach CC_TownMarkers;
	CC_TownMarkers = [];
};

if (isNil "_spawns_arr") then {_spawns_arr = []};
{
	if (getMarkerType _x == "ExileSpawnZone") then
	{
		_spawns_arr = _spawns_arr + [[_x]];
	};
}
forEach allMapMarkers;

_squad = group player;
CC_livingmates = [];
{
  if (alive _x && _x != player) then {CC_livingmates = CC_livingmates + [_x];};
} foreach units _squad;

CC_townsList = [];
{
	_mate = units group player select _forEachIndex;
	_matePos = position _mate;
	_townsNear = nearestLocations [_matePos, ["NameVillage","NameCity","NameCityCapital"], 500];
	if !((count _townsNear) isEqualTo 0) then
	{
		CC_townsList pushBack _townsNear;
	};
} forEach CC_livingmates;

{	
	_locations = _x select 0;
	_townName = name _locations;
	_townPos = position _locations;
	if (_townName isEqualTo "") then
	{
		_townName = text _locations;
	};
	_markerName = format["groupTowns_%1",_townName];
	if !(_markerName in CC_TownMarkers) then {
		_marker = createMarkerLocal [_markerName,_townPos];
		_markerName setMarkerPos (_townPos);
		_markerName setMarkerAlpha 0;
		_markerName setMarkerTextLocal _townName;
		_markerName	setMarkerTypelocal "hd_end";
		CC_TownMarkers pushBack _markerName;
	};
} forEach CC_townsList;

_numberOfSpawnCities = 0;
{
	if (getMarkerType _x == "hd_end") then
	{
		if!(_x in CC_LastSpawnLocation) then
		{
			_listItemIndex = _listBox lbAdd (markerText _x);
			_listBox lbSetData [_listItemIndex, _x];
			_numberOfSpawnCities = _numberOfSpawnCities + 1;
		};
	}
} forEach allMapMarkers;

_numberOfSpawnPoints = {getMarkerType _x == "ExileSpawnZone"} count allMapMarkers;
if (_numberOfSpawnPoints > 0) then
{
	_randNum = floor(random _numberOfSpawnPoints);
	_randData = _spawns_arr select _randNum;
	_randomSpawnIndex = _listBox lbAdd "Random";
	_listBox lbSetData [_randomSpawnIndex, _randData select 0];
};
true