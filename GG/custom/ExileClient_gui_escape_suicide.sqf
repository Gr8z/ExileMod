/**
 * ExileClient_gui_escape_suicide
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_result","_display"];
disableSerialization;
_result = ["Do you really want to end your life?", "Confirm", "Yes", "Nah"] call BIS_fnc_guiMessage;
waitUntil { !isNil "_result" };
if (_result) then
{
	_display = findDisplay 49;
	if !(isNull _display) then
	{
		_display closeDisplay 2; 
	};
	
	if (handgunWeapon player == "") exitWith {["ErrorTitleAndText", ["Suicide", "You need a handgun to suicide!"]] call ExileClient_gui_toaster_addTemplateToast;};

	_animation = ["GestureExileSuicide01","GestureExileSuicide02"] call BIS_fnc_selectRandom; 

	player switchMove "STAND";
	player selectWeapon handgunWeapon player;
	sleep 2;
	player playActionNow _animation;

	if (_animation == "GestureExileSuicide01") then { sleep 5; }; 
	if (_animation == "GestureExileSuicide02") then { sleep 5.5; }; 

	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	_soundToPlay = _soundPath + "GG\sounds\gunshot.ogg";
	playSound3D [_soundToPlay, player, false, getPosASL player, 10, 1, 100]; 

	player setHitPointDamage ["hitHead", 1];
	player allowDamage true;
	player setDamage 1;
};
true