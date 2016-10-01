/**
 * ExileClient_gui_wasteDumpDialog_event_onSellButtonClick
 */

private["_display","_dropdown","_index","_vehicleNetID","_mode"];
disableSerialization;

if !(ExileClientIsWaitingForServerTradeResponse) then
{

	_display = uiNameSpace getVariable ["RscExileWasteDumpDialog", displayNull];
	_dropdown = _display displayCtrl 4002;
	_index = lbCurSel _dropdown;
	_vehicleNetID = _dropdown lbData _index;
	_mode = _dropdown lbValue _index;
	["wasteDumpRequest", [_vehicleNetID, _mode]] call ExileClient_system_network_send;
	closeDialog 0;
};