/*
	fn_parachuteSafeMode.sqf
*/

if((getPosATL player) select 2 <= ExAd_ACTION_PARACHUTE_HEIGHT)then{
	call ExAd_fnc_pullParachute;
};