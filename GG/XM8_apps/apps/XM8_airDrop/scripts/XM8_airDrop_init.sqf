/*	XM8 airDrop app by
	
	-Script description-
*/

private ["_code"];
params ["_pathToAppFolder"];
if (isNil "_pathToAppFolder") then {_pathToAppFolder = ""};
XM8_airDrop_airDropSlideIDCmap = [];

XM8_airDrop_lastDrop = -1000; //Negative minimum drop cooldown time
XM8_airDrop_DropInProgress = false;
{
	if (isNil _x) then {
		_code = compileFinal (preprocessFileLineNumbers (format (["%1scripts\%2.sqf",_pathToAppFolder,_x])));
		if (isNil "_code") then {_code = compileFinal ""};
		missionNamespace setVariable [_x, _code];
	};
} forEach [
	"XM8_airDrop_airDropSlide_onLoad",
	"XM8_airDrop_okDrop",
	"XM8_airDrop_buySelected"
];

call compile preProcessFileLineNumbers format ["%1%2",_pathToAppFolder, "XM8_airDrop_Config.sqf"];