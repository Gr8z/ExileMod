/*

 	Name: ExileClient_banking_utils_diagLog.sqf

*/
private["_msg"];

_msg = format["ADVANCED BANKING: [%1] : %2",(_this select 1),(_this select 0)];
diag_log _msg;
