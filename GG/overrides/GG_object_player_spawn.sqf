/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_newPlayerObject","_parachuteObject","_spawnType"];
diag_log "Spawning as a bambi...";
_newPlayerObject = _this select 0;
_parachuteObject = _this select 1;
_spawnType = _this select 2;
if !(isNull _parachuteObject) then 
{
	_newPlayerObject disableCollisionWith _parachuteObject;
};
_newPlayerObject call ExileClient_object_player_initialize;
ExileClientPlayerIsSpawned = true;
ExileClientPlayerAttributesASecondAgo set [0, ExileClientPlayerAttributes select 0];
ExileClientPlayerAttributesASecondAgo set [1, ExileClientPlayerAttributes select 1];
ExileClientPlayerAttributesASecondAgo set [2, ExileClientPlayerAttributes select 2];
ExileClientPlayerAttributesASecondAgo set [3, ExileClientPlayerAttributes select 3];
ExileClientPlayerAttributesASecondAgo set [4, ExileClientPlayerAttributes select 4];
switch (_spawnType) do 
{
	case 0: 
	{
	};
	case 1:
	{
		player action ["GetinDriver", _parachuteObject];
		[["Exile", "ParachuteLandingSpeed"], 15, "", 35, "", true, false, true, true] call BIS_fnc_advHint;
		ExileJobParachuteFix = [0.25, ExileClient_object_player_parachuteFix, [], true] call ExileClient_system_thread_addtask;
	};
	case 2:
	{
		player switchmove "";
		player switchmove "HaloFreeFall_non"; 
		player setVelocity [(sin (getDir player)) * 50, (cos (getDir player)) * 50, -5];
		ExileJobParachuteFix = [0.25, ExileClient_object_player_parachuteFix, [], true] call ExileClient_system_thread_addtask;
	};
};
player enableFatigue false;
player enableStamina false;
player allowSprint true;
player setCustomAimCoef 0.1;

true call ExileClient_gui_showSurvivalInfo;
call ExileClient_system_rating_balance;
true