/*  
	fn_startHack.sqf
*/


if !("Exile_Item_Laptop" in (magazines player)) exitWith {
	["ErrorTitleAndText", ["Hack", "You need a laptop in your inventory to start hacking"]] call ExileClient_gui_toaster_addTemplateToast;
};

if (({alive _x}count playableUnits) <= ExAd_HACKING_MIN_PLAYERS_ONLINE) exitWith {
	["ErrorTitleAndText", ["Hack", "Not enough people online to initiate the hack"]] call ExileClient_gui_toaster_addTemplateToast;
};

player playActionNow "SitDown";

["startHack", [netId (_this select 0), netId player]] call ExAd_fnc_serverDispatch;