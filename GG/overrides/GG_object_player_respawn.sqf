/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_newPlayerObject","_hunger","_thirst","_alcohol"];
diag_log "Respawning...";
_newPlayerObject = _this select 0;
_hunger = _this select 1;
_thirst = _this select 2;
_alcohol = _this select 3;
_newPlayerObject call ExileClient_object_player_initialize;
ExileClientPlayerAttributes = 
[
	(1 - damage player) * 100, 
	(1 - getFatigue player) * 100, 
	_hunger, 
	_thirst, 
	_alcohol 
];
ExileClientPlayerAttributesASecondAgo set [0, ExileClientPlayerAttributes select 0];
ExileClientPlayerAttributesASecondAgo set [1, ExileClientPlayerAttributes select 1];
ExileClientPlayerAttributesASecondAgo set [2, ExileClientPlayerAttributes select 2];
ExileClientPlayerAttributesASecondAgo set [3, ExileClientPlayerAttributes select 3];
ExileClientPlayerAttributesASecondAgo set [4, ExileClientPlayerAttributes select 4];
ExileClientPlayerIsSpawned = true;
player enableStamina false;
player allowSprint true;

true call ExileClient_gui_showSurvivalInfo;
call ExileClient_system_rating_balance;
true