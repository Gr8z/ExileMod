/*	XM8 airDrop app by
	
	-Script description-
*/

private ["_ok","_Time","_LastUsedTime","_OnlineLimit","_traderZoneNearLimit","_msg"];
_ok = true;
_Time = time - XM8_airDrop_lastDrop;
_LastUsedTime = 300;
_OnlineLimit = 15;
_traderZoneNearLimit = 200;

if (XM8_airDrop_DropInProgress) then {
(findDisplay 24015) closeDisplay 0;
_msg = "Please Wait.. An Air Drop is already in progress.";
["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
_ok = false;XM8_airDrop_DropInProgress = false;
};
if (_Time < _LastUsedTime) then {
(findDisplay 24015) closeDisplay 0;
_msg = format["please wait %1s before calling in another Air Drop!",(round(_Time - _LastUsedTime))];
["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
_ok = false;XM8_airDrop_DropInProgress = false;
};

if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) then {
(findDisplay 24015) closeDisplay 0;
_msg = "You are near a Base and cannot perform that action!";
["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
_ok = false;XM8_airDrop_DropInProgress = false;
};

if (vehicle player != player) then {
(findDisplay 24015) closeDisplay 0;
_msg = "You are in a vehicle and cannot perform that action!";
["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
_ok = false;XM8_airDrop_DropInProgress = false;
};

{
if ((_traderZoneNearLimit>0) && {((markertype _x) == "ExileTraderZone") && {((getMarkerPos _x) distance2D getPos player)<=_traderZoneNearLimit}}) then
{
  (findDisplay 24015) closeDisplay 0;
	_msg = "You need to be far away from a Trader to call an Airdrop.";
	["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
	_ok = false;XM8_airDrop_DropInProgress = false;
};
} forEach allMapMarkers;

if ((count playableUnits) < _OnlineLimit) then  {
(findDisplay 24015) closeDisplay 0;
 _msg = format["Air Drop Failed. Less Than %1 Players online.",_OnlineLimit];
["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
_ok = false;XM8_airDrop_DropInProgress = false;
};

if (ExileClientPlayerMoney < XM8_airDrop_boxCost) then {
(findDisplay 24015) closeDisplay 0;
_msg = format["%1, Your order has been declined due to insufficient funds",name player];
["Whoops",_msg] call ExileClient_gui_notification_event_addNotification;
_ok = false;XM8_airDrop_DropInProgress = false;
};
_ok






