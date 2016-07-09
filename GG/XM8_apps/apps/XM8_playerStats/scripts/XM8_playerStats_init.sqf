/*	XM8 playerStats app by
	
	-Script description-
*/

private ["_code"];
params ["_pathToAppFolder"];
if (isNil "_pathToAppFolder") then {_pathToAppFolder = ""};
XM8_playerStats_playerStatsSlideIDCmap = [];

{
	if (isNil _x) then {
		_code = compileFinal (preprocessFileLineNumbers (format (["%1scripts\%2.sqf",_pathToAppFolder,_x])));
		if (isNil "_code") then {_code = compileFinal ""};
		missionNamespace setVariable [_x, _code];
	};
} forEach [
	"XM8_playerStats_playerStatsSlide_onLoad"
];
