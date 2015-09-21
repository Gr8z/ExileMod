/*
	a3 epoch killfeed init
	By Halv
	
	Copyright (C) 2015  Halvhjearne > README.md
*/

#include "settings.sqf"

if(isServer)then{
	[] execVM (_folder + "halv_killed_loop.sqf");
	diag_log "[KillFeed]: Server loading killfeed function";
	Halv_fnc_playerdied = compileFinal preprocessFileLineNumbers (_folder + "halv_fnc_playerdied.sqf");
};

if (hasInterface && !isDedicated) then {
	diag_log "[KillFeed]: Client loading message function";
	Halv_fnc_message_players = compileFinal preprocessFileLineNumbers (_folder + "Halv_fnc_message_players.sqf");
	diag_log "[KillFeed]: Client loading PublicVariableEventHandler";
	"HalvPV_player_message" addPublicVariableEventHandler {(_this select 1) call Halv_fnc_message_players;};
	waitUntil {!isNull (findDisplay 46)};
	waitUntil {!dialog};
	sleep 5;
	enableRadio true;
	enableSentences false;
	if(_enablestudybody || _enableburybody)then{
		[] execVM (_folder + "HALV_studybodyloop.sqf");
	}
};

