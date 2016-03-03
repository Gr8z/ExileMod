/*
	Zupa's Capture Points
	Reward giver of ZCP
	Capture points and earn money over time.

	╔════╗─────────╔═══╗────────╔╗─────────────╔╗
	╚══╗═║─────────╚╗╔╗║────────║║────────────╔╝╚╗
	──╔╝╔╬╗╔╦══╦══╗─║║║╠══╦╗╔╦══╣║╔══╦╗╔╦══╦═╗╚╗╔╬══╗
	─╔╝╔╝║║║║╔╗║╔╗║─║║║║║═╣╚╝║║═╣║║╔╗║╚╝║║═╣╔╗╗║║║══╣
	╔╝═╚═╣╚╝║╚╝║╔╗║╔╝╚╝║║═╬╗╔╣║═╣╚╣╚╝║║║║║═╣║║║║╚╬══║
	╚════╩══╣╔═╩╝╚╝╚═══╩══╝╚╝╚══╩═╩══╩╩╩╩══╩╝╚╝╚═╩══╝
	────────║║
	────────╚╝
*/

private["_ZCP_currentCapper","_ZCP_name","_capturePosition","_reward","_vars","_cIndex","_current_crypto"];
_ZCP_currentCapper = _this select 0;
_ZCP_name = _this select 1;
_capturePosition = _this select 2;
_reward = _this select 3;
switch (_reward) do {
	case "Reputation" : {
		_awardToGive = ZCP_MinReputationReward + (ZCP_ReputationReward) * (count playableUnits);
		_playerMoney = _ZCP_currentCapper getVariable ["ExileScore", 0];
		_playerMoney = _playerMoney + _awardToGive;

		_ZCP_currentCapper setVariable ["ExileScore",_playerMoney];
		format["setAccountScore:%1:%2", _playerMoney,getPlayerUID _ZCP_currentCapper] call ExileServer_system_database_query_fireAndForget;

		PV_ZCP_zupastic_client = ["ZCP",format["%1", _playerMoney], 'Reputation'];
		owner _ZCP_currentCapper publicVariableClient "PV_ZCP_zupastic_client";

		_ZCP_currentCapper call ExileServer_object_player_database_update;

		PV_ZCP_zupastic = ["BATTLE ZONE",format["%2 Captured %1. Received %3 Reputation.",_ZCP_name,name _ZCP_currentCapper,_awardToGive],'ZCP_Capped'];
		publicVariable "PV_ZCP_zupastic";
		diag_log text format ["[ZCP]: %1 won %2, received %3 Reputation",name _ZCP_currentCapper,_ZCP_name,_awardToGive];
	};
	case "Poptabs" : {
		_awardToGive = ZCP_MinPoptabReward + (ZCP_PoptabReward) * (count playableUnits);
		_playerMoney = _ZCP_currentCapper getVariable ["ExilePurse", 0];
		_playerMoney = _playerMoney + _awardToGive;
		_ZCP_currentCapper setVariable ["ExilePurse", _playerMoney];
		format['updateWallet:%1:%2', _playerMoney, (getPlayerUID _ZCP_currentCapper)] call ExileServer_system_database_query_fireAndForget;

		PV_ZCP_zupastic_client = ["ZCP",format["%1", _playerMoney], 'Poptabs'];
		owner _ZCP_currentCapper publicVariableClient "PV_ZCP_zupastic_client";

		_ZCP_currentCapper call ExileServer_object_player_database_update;

		PV_ZCP_zupastic = ["BATTLE ZONE",format["%2 Captured %1. received %3 Poptabs.",_ZCP_name,name _ZCP_currentCapper,_awardToGive], 'ZCP_Capped'];
		publicVariable "PV_ZCP_zupastic";
		diag_log text format ["[ZCP]: %1 won %2, received %3 Poptabs",name _ZCP_currentCapper,_ZCP_name,_awardToGive];
	};
	default {
		diag_log text format["[ZCP] %1 has no valid reward name. Falling back on Reputation reward.",_ZCP_name];
		//Crypto fallback.
		[_ZCP_currentCapper,_ZCP_name,_capturePosition,"Reputation"] call ZCP_fnc_giveReward;
	};
};