/*  
	fn_onBtnClickVG.sqf
*/

private ["_fnc","_idc","_data"];

_fnc = [_this,0,nil] call BIS_fnc_param;
_idc = [_this,1,nil] call BIS_fnc_param;

diag_log str _this;

if(isNil "ExAdCurFlagNetId" || isNil "_fnc" || isNil "_idc")exitWith{false};

_data = lbData [_idc, lbCurSel _idc];

diag_log str _data;

if(count _data == 0)then{
	['Whoops', ["You have to choose a vehicle in the proper list!!"]] call ExileClient_gui_notification_event_addNotification;
}else{
	[_fnc, [_data, ExAdCurFlagNetId, netId player]] call ExAd_fnc_serverDispatch;
	closeDialog 0;
};
disableUserInput false;

true