/**
 * ExileClient_gui_selectSpawnLocation_event_onListBoxSelectionChanged
 */
 
private["_listBoxControl","_listBoxControlIndex","_display","_spawnButton"];
disableSerialization;
_listBoxControl = _this select 0;
_listBoxControlIndex = _this select 1;
_display = findDisplay 24002;
ExileClientSelectedSpawnLocationMarkerName = [_listBoxControl lbData _listBoxControlIndex,GG_SpawnTypeSelected];
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlEnable true;
if !((_listBoxControl lbText _listBoxControlIndex) == "Random") then 
{
	[ExileClientSelectedSpawnLocationMarkerName select 0] call ExileClient_gui_selectSpawnLocation_zoomToMarker;
};
true