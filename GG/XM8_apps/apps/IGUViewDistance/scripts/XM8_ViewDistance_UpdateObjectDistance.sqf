/*
	File: XM8_ViewDistance_UpdateObjectDistance.sqf
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
_OVDSliderPos = _this select 1;
setObjectViewDistance _OVDSliderPos;

_objectDistanceText = "currentObjectDistance" call _getControl;
_objectDistanceText ctrlSetStructuredText parseText format["<t size='1' align='center' font='PuristaMedium' color='#FFFFFFFF'>Object Distance: %1", _OVDSliderPos];

_TerrainDistanceSlider = "TerrainDistanceSlider" call _getControl;
_TerrainDistanceSlider sliderSetPosition viewDistance;

_currentViewDistance = "currentViewDistance" call _getControl;
_currentViewDistance ctrlSetStructuredText parseText format["<t size='1' align='center' font='PuristaMedium' color='#FFFFFFFF'>View Distance: %1", viewDistance];

profileNamespace setVariable ["TerrainDistance",viewDistance];
saveProfileNamespace;
profileNamespace setVariable ["ObjectDistance",_OVDSliderPos];
saveProfileNamespace;