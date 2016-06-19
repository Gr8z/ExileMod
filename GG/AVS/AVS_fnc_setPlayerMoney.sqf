/*
© 2015 Zenix Gaming Ops
Developed by Rod-Serling
Co-Developed by Vishpala

All rights reserved.

Function:
	AVS_fnc_setPlayerMoney - Syncs the client's money to the server's value.

Usage (from the server):
	[_money] remoteExec ["AVS_fnc_setPlayerMoney", _player];

Return Value:
	None
*/

_OK = params
[
	["_money", 0, [0]]
];

if (!_OK) exitWith
{
	diag_log format ["AVS Error: Calling AVS_fnc_setPlayerMoney with invalid parameters: %1",_this];
};

ExileClientPlayerMoney = _money;