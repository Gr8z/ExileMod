/*	XM8 territory app by
	
	-Script description-
*/

private ["_code"];
params ["_pathToAppFolder"];
if (isNil "_pathToAppFolder") then {_pathToAppFolder = ""};
XM8_territory_territorySlideIDCmap = [];

XM8_territory_flag = objNull;
{
	if (isNil _x) then {
		_code = compileFinal (preprocessFileLineNumbers (format (["%1GG\XM8_apps\apps\XM8_territory\scripts\%2.sqf",_pathToAppFolder,_x])));
		if (isNil "_code") then {_code = compileFinal ""};
		missionNamespace setVariable [_x, _code];
	};
} forEach [
	"XM8_territory_territorySlide_onLoad",
	"ExileClient_gui_xm8_slide_territorySlide_onOpen",
	"XM8_territory_isInside"
];










