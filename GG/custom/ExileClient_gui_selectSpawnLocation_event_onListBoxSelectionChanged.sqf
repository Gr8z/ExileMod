/**
 * ExileClient_gui_selectSpawnLocation_event_onListBoxSelectionChanged
 */
 
private["_listBoxControl","_listBoxControlIndex","_display","_spawnButton","_listBoxData"];
disableSerialization;
_listBoxControl = _this select 0;
_listBoxControlIndex = _this select 1;
_listBoxData = _listBoxControl lbData _listBoxControlIndex;
_display = findDisplay 24002;
ExileClientSelectedSpawnLocationMarkerName = [_listBoxData,_listBoxData];
ExileClientSelectedSpawnLocationMarkerNameForZoom = ExileClientSelectedSpawnLocationMarkerName select 0;
_spawnButton = _display displayCtrl 24003;
_spawnButton ctrlEnable true;
if !((_listBoxControl lbText _listBoxControlIndex) == "Random") then 
{
	ExileClientSelectedSpawnLocationMarkerNameForZoom call ExileClient_gui_selectSpawnLocation_zoomToMarker;
};
true