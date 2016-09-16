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
_topTextCTRL1 ctrlSetText "[GG] Exile Mod";
_topTextCTRL2 = _display displayCtrl 1002;
_topTextCTRL2 ctrlSetText format["Welcome %1 (%2)",profileNameSteam,profileName];
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
_title ctrlSetText "LOADOUTS";
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
_listItemIndex = _listBox lbAdd "Respect Loadout";
_listItemIndex = _listBox lbSetColor [0, [0, 1, 0, 0.5]];
/*
_listItemIndex = _listBox lbSetTooltip [0, "Get a Free Loadout based on your respect"];
_listItemIndex = _listBox lbAdd "Scout Level 1";
_listItemIndex = _listBox lbSetTooltip [1, "$4.69 / month"];
_listItemIndex = _listBox lbAdd "Scout Level 2";
_listItemIndex = _listBox lbSetTooltip [2, "$7.98 / month"];
_listItemIndex = _listBox lbAdd "Scout Level 3";
_listItemIndex = _listBox lbSetTooltip [3, "$19.89 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 1";
_listItemIndex = _listBox lbSetTooltip [4, "$4.69 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 2";
_listItemIndex = _listBox lbSetTooltip [5, "$7.98 / month"];
_listItemIndex = _listBox lbAdd "Marksman Level 3";
_listItemIndex = _listBox lbSetTooltip [6, "$19.89 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 1";
_listItemIndex = _listBox lbSetTooltip [7, "$3.22 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 2";
_listItemIndex = _listBox lbSetTooltip [8, "$5.70 / month"];
_listItemIndex = _listBox lbAdd "Soldier Level 3";
_listItemIndex = _listBox lbSetTooltip [9, "$9.89 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 1";
_listItemIndex = _listBox lbSetTooltip [10, "$3.89 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 2";
_listItemIndex = _listBox lbSetTooltip [11, "$5.75 / month"];
_listItemIndex = _listBox lbAdd "Medic Level 3";
_listItemIndex = _listBox lbSetTooltip [12, "$8.00 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 1";
_listItemIndex = _listBox lbSetTooltip [13, "$5.90 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 2";
_listItemIndex = _listBox lbSetTooltip [14, "$8.90 / month"];
_listItemIndex = _listBox lbAdd "Engineer Level 3";
_listItemIndex = _listBox lbSetTooltip [15, "$15.00 / month"];
*/

//systemChat 'DONOR LOADOUTS CAN BE PURCHASED FROM GHOSTZGAMERZ.COM';
//waitUntil {!isNil "Soldier3"};
fnc_LBDblClick_LBSelChanged_LO = {
	CURSEL_PREMIUM_LOADOUT = _this select 1;
};
fnc_ButtonClick_24003 = {
	[] call ExileClient_gui_selectSpawnLocation_event_onSpawnButtonClick;
	if(isNil"CURSEL_PREMIUM_LOADOUT")then{CURSEL_PREMIUM_LOADOUT=0;};
	CURSEL_PREMIUM_LOADOUT spawn GET_LOADOUT;
};
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlRemoveAllEventHandlers "SliderPosChanged";
_spawnButton ctrlSetEventHandler["ButtonClick","call fnc_ButtonClick_24003"];
_spawnButton ctrlSetText "Let's go!";
true