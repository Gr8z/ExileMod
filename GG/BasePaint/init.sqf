private["_code"];
//if (!hasInterface || isServer) exitWith {};

{
	_file = format["GG\BasePaint\functions\%1", _x select 1];
    _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
	["GG_fnc_BasePaint_onButtonClick", "fn_BasePaint_onButtonClick.sqf"]
];