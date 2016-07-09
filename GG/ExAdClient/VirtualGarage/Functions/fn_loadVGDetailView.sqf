/*  
	fn_loadVGDetailView.sqf
*/
params ["_text","_idc"];
disableSerialization;

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

if(isNull _display)exitWith{false};

(_display displayCtrl _idc) ctrlSetStructuredText parseText _text;

true