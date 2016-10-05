/*

Coded and coverted by GR8
www.ghostzgamerz.com

*/

{
    _code = '';
    _function = _x select 0;
    _file = format["GG\ExAdClient\XM8\Apps\Crafting\Functions\%1", _x select 1];

    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach
[
	["GG_fnc_craftingApp_componentsLoad", 		"fn_craftingApp_componentsLoad.sqf"],
	["GG_fnc_craftingApp_recipeLoad", 			"fn_craftingApp_recipeLoad.sqf"]
];
