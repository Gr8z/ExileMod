/**
 * ExileClient_gui_selectSpawnLocation_show
 */
 
private["_display","_topTextCTRL1","_topTextCTRL2","_spawnButton","_listBox","_listItemIndex","_numberOfSpawnPoints","_randNum","_randData","_randomSpawnIndex","_puid","_title"];
disableSerialization;
diag_log "Selecting spawn location...";
ExileClientSpawnLocationSelectionDone = false;
ExileClientSelectedSpawnLocationMarkerName = "";
createDialog "RscExileSelectSpawnLocationDialog";
waitUntil
{
	_display = findDisplay 24002;
	!isNull _display
};
_topTextCTRL1 = _display displayCtrl 1001;
_topTextCTRL1 ctrlSetText "[GG] Ghostz Gamerz";
_topTextCTRL2 = _display displayCtrl 1002;
_topTextCTRL2 ctrlSetText format["Welcome %1",profileNameSteam];
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlEnable false;
_display displayAddEventHandler ["KeyDown", "_this call ExileClient_gui_loadingScreen_event_onKeyDown"];
_listBox = _display displayCtrl 24002;
lbClear _listBox;
{
	if (getMarkerType _x == "ExileSpawnZone") then
	{
		_listItemIndex = _listBox lbAdd (markerText _x);
		_listBox lbSetData [_listItemIndex, _x];
	};
}
forEach allMapMarkers;
_numberOfSpawnPoints = {getMarkerType _x == "ExileSpawnZone"} count allMapMarkers;
if (_numberOfSpawnPoints > 0) then 
{
	_randNum = floor(random _numberOfSpawnPoints);
	_randData = lbData [24002,_randNum];
	_randomSpawnIndex = _listBox lbAdd "Random";
	_listBox lbSetData [_randomSpawnIndex, _randData];
};
_title	 = _display ctrlCreate["RscText",24005];
_title ctrlSetPosition [1.1625,0.781684,0.481313,0.0583164];
_title ctrlSetBackgroundColor [0,0,0,1];
_title ctrlCommit 0;
_title ctrlEnable true;
_title ctrlSetText "SPAWN TYPE";
_title ctrlSetFont "PuristaBold";

_listBox = _display ctrlCreate["RscListbox", 24004];
_listBox ctrlSetPosition [1.1625,0.86505,0.481313,0.27495];
_listBox ctrlSetBackgroundColor [0.07,0.07,0.08,1];
_listBox ctrlCommit 0;
_listBox ctrlEnable true;
_listBox ctrlRemoveAllEventHandlers "LBDblClick";
_listBox ctrlRemoveAllEventHandlers "LBSelChanged";
_listBox ctrlAddEventHandler ["LBDblClick", "call fnc_LBDblClick_LBSelChanged_LO;"];
_listBox ctrlAddEventHandler ["LBSelChanged", "call fnc_LBDblClick_LBSelChanged_LO;"];
_listItemIndex = _listBox lbAdd "Parachute Spawn";
_listItemIndex = _listBox lbSetTooltip [0, "Spawn in the air with a parachute."];
_listItemIndex = _listBox lbAdd "Ground Spawn";
_listItemIndex = _listBox lbSetTooltip [1, "Spawn on the ground."];

FNC_GET_ACTUAL_SPAWN = {
	waitUntil {typeOf player isEqualTo 'Exile_Unit_Player'};
	uiSleep 3;
	switch (_this) do {
		case 0:{
			GG_SpawnTypeSelected = 0;
		};
		case 1:{
			GG_SpawnTypeSelected = 1;
		};
	};
};
fnc_LBDblClick_LBSelChanged_LO = {
	GG_SELECTEDSPAWN = _this select 1;
};
fnc_ButtonClick_24003 = {
	[] call ExileClient_gui_selectSpawnLocation_event_onSpawnButtonClick;
	if(isNil"GG_SELECTEDSPAWN")then{GG_SELECTEDSPAWN=0;};
	GG_SELECTEDSPAWN spawn FNC_GET_ACTUAL_SPAWN;
};
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlRemoveAllEventHandlers "SliderPosChanged";
_spawnButton ctrlSetEventHandler["ButtonClick","call fnc_ButtonClick_24003"];
_spawnButton ctrlSetText "Let's go!";
true