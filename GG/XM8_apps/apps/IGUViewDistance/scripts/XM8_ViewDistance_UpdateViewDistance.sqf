/*
	File: XM8_ViewDistance_UpdateViewDistance.sqf
	GUI / Framework functions by: vitalymind (http://www.exilemod.com/profile/74379-vitalymind/)
	Modified by: Jamie C (http://www.exilemod.com/profile/4838-jamie/)
	Modified: 08/05/2016
*/

_getControl = {
	params ["_key"];
	private ["_idc","_index","_slideClassName"];
	_ctrl = controlNull;
	_map = XM8_ViewDistance_Slide1IDCmap; //Variable name of IDC map of slide
	_index = _map find _key;
	if (_index != -1) then {
	_baseIDC = getNumber (missionConfigFile >> "CfgXM8" >> "IGUViewDistance" >> "controlID");
	_idc = (_baseIDC + _index);
	_ctrl = _display displayCtrl _idc;
	};
	_ctrl;
};

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_VDSliderPos = _this select 1;
setViewDistance _VDSliderPos;

_viewDistanceText = "currentViewDistance" call _getControl;
_viewDistanceText ctrlSetStructuredText parseText format["<t size='1' align='center' font='PuristaMedium' color='#FFFFFFFF'>View Distance: %1", _VDSliderPos];

_ObjectDistanceSlider = "ObjectDistanceSlider" call _getControl;
_ObjectDistanceSlider sliderSetPosition (getObjectViewDistance select 0);

_currentObjectDistance = "currentObjectDistance" call _getControl;
_currentObjectDistance ctrlSetStructuredText parseText format["<t size='1' align='center' font='PuristaMedium' color='#FFFFFFFF'>Object Distance: %1", (getObjectViewDistance select 0)];

profileNamespace setVariable ["TerrainDistance",_VDSliderPos];
saveProfileNamespace;
profileNamespace setVariable ["ObjectDistance",(getObjectViewDistance select 0)];
saveProfileNamespace;
