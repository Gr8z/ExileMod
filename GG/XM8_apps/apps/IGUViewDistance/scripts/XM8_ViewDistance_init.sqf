/*
	File: XM8_ViewDistance_init.sqf
	GUI / Framework functions by: vitalymind (http://www.exilemod.com/profile/74379-vitalymind/)
	Modified by: Jamie C (http://www.exilemod.com/profile/4838-jamie/)
	Modified: 08/05/2016
*/

private ["_code","_unloadScript"];

params ["_pathToAppFolder"];

XM8_ViewDistance_Slide1IDCmap = [];

{
	if (isNil _x) then {
		_code = compileFinal (preprocessFileLineNumbers (format (["%1scripts\%2.sqf",_pathToAppFolder,_x])));
		if (isNil "_code") then {_code = compileFinal ""};
		missionNamespace setVariable [_x, _code];
	};
} forEach [
	"XM8_ViewDistance_UpdateObjectDistance",
	"XM8_ViewDistance_UpdateViewDistance",
	"XM8_ViewDistance_UpdateterrainQuality",
	"XM8_ViewDistance_Slide1_onLoad",
	"ExileClient_gui_xm8_slide_IGUViewDistance_onOpen"
];


call compile preProcessFileLineNumbers format ["%1XM8_ViewDistance_config.sqf",_pathToAppFolder];

_ViewDistance = profileNamespace getVariable "TerrainDistance";

if(!isnil "_ViewDistance") then { 
	XM8_ViewDistance = _ViewDistance;
	setViewDistance XM8_ViewDistance;
} else {
	XM8_ViewDistance = viewDistance;
	profileNamespace setVariable ["TerrainDistance",XM8_ViewDistance];
	saveProfileNamespace;
	setViewDistance XM8_ViewDistance;
};
sleep 1;
_ObjectDistance = profileNamespace getVariable "ObjectDistance";

if(!isnil "_ObjectDistance") then {
	XM8_ObjectDistance = _ObjectDistance;
	setObjectViewDistance XM8_ObjectDistance;
} else {
	XM8_ObjectDistance = (getObjectViewDistance select 0);
	profileNamespace setVariable ["ObjectDistance",XM8_ObjectDistance];
	saveProfileNamespace;
	setObjectViewDistance XM8_ObjectDistance;
};
sleep 1;
_terrainQuality = profileNamespace getVariable "terrainQuality";

if(!isnil "_terrainQuality") then {
	XM8_terrainQuality = _terrainQuality;
	setTerrainGrid XM8_terrainQuality;
} else {
	XM8_terrainQuality = 25;
	profileNamespace setVariable ["terrainQuality",XM8_terrainQuality];
	saveProfileNamespace;
	setTerrainGrid XM8_terrainQuality;
};
