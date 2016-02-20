/**
 * ExileClient_object_player_event_onPlayerKilled
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private["_respawnDelay","_wallet","_pos","_pileOwner","_pile"];
if (!(isMultiplayer)) exitWith {};
"onPlayerKilled - Player was killed..." call ExileClient_util_log;
setPlayerRespawnTime 10e10;
if(ExilePlayerInSafezone)then
{
	call ExileClient_object_player_event_onLeaveSafezone;
};
_respawnDelay = _this select 3;
_respawnDelay call ExileClient_object_player_death_startBleedingOut;

// Advanced Banking
_wallet = ExileClientPlayerMoney;
if (_wallet > 0) then {
    _pos = getPosATL player;
	_pileOwner = name player;
    _pile = createVehicle ["Land_Money_F", [(_pos select 0)+0.2,(_pos select 1)+0.2,(_pos select 2)], [], 0, "NONE"];
    _pile setVariable ["DroppedAmount",_wallet,true];
	_pile setVariable ["PileOwner",_pileOwner,true];
	["buyRequest",[str(_wallet)]] call ExileClient_system_network_send;
};
// Advanced Banking

true
