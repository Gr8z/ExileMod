/*	XM8 crafting app by
	
	-Script description-
*/

private ["_code"];
params ["_pathToAppFolder"];
if (isNil "_pathToAppFolder") then {_pathToAppFolder = ""};
XM8_crafting_craftSlideIDCmap = [];

{
	if (isNil _x) then {
		_code = compileFinal (preprocessFileLineNumbers (format (["%1GG\XM8_apps\apps\XM8_crafting\scripts\%2.sqf",_pathToAppFolder,_x])));
		if (isNil "_code") then {_code = compileFinal ""};
		missionNamespace setVariable [_x, _code];
	};
} forEach [
	"XM8_crafting_craftSlide_onLoad",
	"XM8_crafting_recipeLoad",
	"XM8_crafting_componentsLoad"
];










