/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * Modified by Rod Serling. Redistributed with permission.
 */
 
private["_previewObjectClassName"];
ExileClientConstructionObject = _this;
ExileClientConstructionCanPlaceObject = false;
ExileClientConstructionConfig = ("getText(_x >> 'staticObject') == ExileClientConstructionObject" configClasses(configFile >> "CfgConstruction")) select 0;
_previewObjectClassName = getText(ExileClientConstructionConfig >> "previewObject");
ExileClientConstructionSnapToObjectClassNames = (ExileClientConstructionConfig >> "SnapObjects") call Bis_fnc_getCfgSubClasses;
ExileClientConstructionProcess = 2;
ExileClientConstructionOffset = [0, 5, 0]; 
ExileClientConstructionPosition = [0, 0, 0];
ExileClientConstructionRotation = 0; 
ExileClientConstructionObjectDisplayName = getText(configFile >> "CfgVehicles" >> _previewObjectClassName >> "displayName");
ExileClientConstructionMode = 1;
ExileClientConstructionIsInSelectSnapObjectMode = true;
ExileClientConstructionSupportSnapMode = count(ExileClientConstructionSnapToObjectClassNames) > 0;
ExileClientConstructionCurrentSnapToObject = objNull;
ExileClientConstructionPosition = [getPosATL player, ExileClientConstructionOffset select 1, getDir player] call ExileClient_util_math_getPositionInDirection;
ExileClientConstructionPosition set[2, ExileClientConstructionOffset select 2];
{
	player reveal _x;
}
forEach ((getPosATL player) nearObjects  ["Exile_Construction_Abstract_Static", 20]); 
["buildConstructionRequest", [_previewObjectClassName,ExileClientConstructionPosition]] call ExileClient_system_network_send;
true