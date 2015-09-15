/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object"];
try 
{
	if (!alive player) then { throw false; };
	if (vehicle player != player) then { throw false; };
	{
		player reveal _x;
	}
	forEach (nearestObjects [getPosATL player, ['LandVehicle', 'Ship', 'Exile_Construction_Abstract_Static', 'Air'], 13]);
	_object = cursorTarget;
	if (isNull _object) then { throw false; };
	if !(_object isEqualTo ExileClientInteractionObject) then 
	{
		if (_object distance player > 10) then { throw false; };
		call ExileClient_gui_interactionMenu_unhook;
		_object call ExileClient_gui_interactionMenu_hook;
	};
}
catch
{
	call ExileClient_gui_interactionMenu_unhook;
};