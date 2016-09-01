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
	["Crafting_fnc_componentsLoad", 	"fn_componentsLoad.sqf"],
	["Crafting_fnc_recipeLoad", 	"fn_recipeLoad.sqf"]
];