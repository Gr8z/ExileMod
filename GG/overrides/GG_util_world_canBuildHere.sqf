/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object","_position","_canBuildHere","_ourUID","_radius","_buildRights","_no_need_for_Terriotry"];
_object = _this;
_position = getPosAtl _object;
_canBuildHere = false;
_ourUID = getPlayerUID player;

_no_need_for_Terriotry = getArray(missionConfigFile >> "CfgTerritories" >> "noNeedForTerritory");

if((typeof _object) in _no_need_for_Terriotry) then
{
	_canBuildHere = true;
};

{
	_radius = _x getVariable ["ExileTerritorySize", -1];
	if ((_position distance2D _x) < _radius) then
	{
		_canBuildHere = false;
		_buildRights = _x getVariable ["ExileTerritoryBuildRights", []];
		if (_ourUID in _buildRights) exitWith
		{
			_canBuildHere = true;
		};
	};
}
forEach (_position nearObjects ["Exile_Construction_Flag_Static", 300]); 
_canBuildHere