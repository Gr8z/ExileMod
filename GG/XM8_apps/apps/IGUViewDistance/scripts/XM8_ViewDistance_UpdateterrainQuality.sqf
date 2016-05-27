/*
	File: XM8_ViewDistance_UpdateterrainQuality.sqf
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
_TDLSliderPos = _this select 1;
setTerrainGrid _TDLSliderPos;

_terrainQualityText = "currentterrainQuality" call _getControl;
_terrainQualityText ctrlSetStructuredText parseText format["<t size='1' align='center' font='PuristaMedium' color='#FFFFFFFF'>Terrain quality: %1", _TDLSliderPos];

profileNamespace setVariable ["terrainQuality",_TDLSliderPos];
saveProfileNamespace;