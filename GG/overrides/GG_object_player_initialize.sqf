/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_newPlayerObject","_oldPlayerObject"];
_newPlayerObject = _this;
_oldPlayerObject = player;
player reveal [_newPlayerObject, 4];
selectPlayer _newPlayerObject;
if (_oldPlayerObject isKindOf "Exile_Unit_GhostPlayer") then 
{
	clearBackpackCargoGlobal _oldPlayerObject;
	clearItemCargoGlobal _oldPlayerObject;
	clearMagazineCargoGlobal _oldPlayerObject;
	clearWeaponCargoGlobal _oldPlayerObject;
	deleteVehicle _oldPlayerObject;
};
player setVariable ["ExileXM8IsOnline", (profileNamespace getVariable ["ExileEnable8GNetwork", false]), true];
enableSentences false;
enableRadio false;
player setVariable ["BIS_noCoreConversations", true];
[] call ExileClient_object_player_event_hook;
[] call ExileClient_object_player_stats_reset;
[] call ExileClient_gui_postProcessing_reset;
true