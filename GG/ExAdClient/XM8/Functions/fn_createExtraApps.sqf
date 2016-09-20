/*  
	fn_createExtraApps.sqf
*/
private["_apps","_display"];

_apps = getArray(missionConfigFile >> "CfgXM8" >> "extraApps");
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

{
	call compile format["ExAd_XM8_MAP_%1 = [];",_x];
	
	if(isClass(missionConfigFile >> "CfgXM8" >> _x))then{
		_idc = getNumber(missionConfigFile >> "CfgXM8" >> _x >> "controlID");
		_slide = _display ctrlCreate ["RscExileXM8Slide",_idc, _display displayCtrl 4007];
		[_display, _slide, _idc]call compile preprocessFileLineNumbers getText(missionConfigFile >> "CfgXM8" >> _x >> "onLoad");
		_slide ctrlShow false;
	}	
}forEach _apps;

true