/*

 	Name: ExileClient_banking_player_examineMoney.sqf
 	
*/
private["_playerName","_worth"];

_playerName = _this select 0;
_worth = _this select 1;
if (ADVBANKING_CLIENT_DEBUG) then {[format["Examining Money. Package: %1",_this],"ExamineMoney"] call ExileClient_banking_utils_diagLog;};
[_playerName,_worth] call ExileClient_banking_player_creditCardShow;
