private["_code"];
if (!hasInterface || isServer) exitWith {};

{
	_file = format["GG\DailyReward\functions\%1", _x select 1];
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ["GG_fnc_dailyRewards_animation", "fn_dailyRewards_animation.sqf"],
	["GG_fnc_dailyRewards_showReward", "fn_dailyRewards_showReward.sqf"],
	["GG_fnc_dailyRewards_RespectReward", "fn_dailyRewards_RespectReward.sqf"],
	["GG_fnc_dailyRewards_TabsReward", "fn_dailyRewards_TabsReward.sqf"],
	["GG_fnc_dailyRewards_CrateReward", "fn_dailyRewards_CrateReward.sqf"],
	["GG_fnc_dailyRewards_onButtonClick", "fn_dailyRewards_onButtonClick.sqf"]
];