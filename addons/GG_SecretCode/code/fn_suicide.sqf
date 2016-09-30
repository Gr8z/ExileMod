if (handgunWeapon player == "") exitWith {_display closeDisplay 2;hint "You need a handgun to suicide!"}; 

_animation = ["GestureExileSuicide02"] call BIS_fnc_selectRandom; 

player switchMove "STAND";
player selectWeapon handgunWeapon player;
player playActionNow _animation;

if (_animation == "GestureExileSuicide01") then { sleep 5; }; 
if (_animation == "GestureExileSuicide02") then { sleep 5.5; }; 

player setHitPointDamage ["hitHead", 1];
player allowDamage true;
player setDamage 1;