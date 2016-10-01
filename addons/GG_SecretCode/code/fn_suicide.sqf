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