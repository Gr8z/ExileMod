/*  
	fn_onBtnClickVG.sqf
*/

private ["_fnc","_idc","_data","_result"];

_fnc = [_this,0,nil] call BIS_fnc_param;
_idc = [_this,1,nil] call BIS_fnc_param;

if(isNil "ExAdCurFlagNetId" || isNil "_fnc" || isNil "_idc")exitWith{
	disableUserInput false;
	["extraApps", 1] call ExileClient_gui_xm8_slide;
	false
};

_data = lbData [_idc, lbCurSel _idc];

if(count _data == 0)then{
	["ErrorTitleAndText", ["Virtual Garage", "You have to choose a vehicle in the proper list!!"]] call ExileClient_gui_toaster_addTemplateToast;
}else{
	[] spawn
	{
		_result = ["Virtual Garage does not store the gear inside your vehicles.", "Continue?", "Yes", "No"] call BIS_fnc_guiMessage;
		if (_result) then
		{
			[_fnc, [_data, ExAdCurFlagNetId, netId player]] call ExAd_fnc_serverDispatch;
			closeDialog 0;
		};
	};
};
disableUserInput false;

true