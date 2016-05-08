/*
player radar script made by Shix http://www.exilemod.com/profile/4566-shix/
This script allows to scan their are for any near by players
Made for XM8 Apps http://www.exilemod.com/topic/9040-updated-xm8-apps/
*/
 
///////////////////////////
//CONFIG
/////////////////////////
_cooldownTime = 120; //cool down time on script in seconds (15 * 60 = 900) AKA 15 MINS
_onlyScanforXM8Online = true; //only scan for people who have the 8G network online true =  yes false = no
_scanDistance = 1000; //area sround player to scan in meters
 
///////////////////////////
//CONFIG END
/////////////////////////
if(isNil "LastUsedCheck")then
{
  LastUsedCheck = 0;
};

if !(player getVariable ["ExileXM8IsOnline", false]) exitWith {
  ["RepairFailedWarning", ["San Failed, Your 8G Network Is Offline"]] call ExileClient_gui_notification_event_addNotification;
};

if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) exitWith {
  ["RepairFailedWarning", ["Scan Failed, You are near a base."]] call ExileClient_gui_notification_event_addNotification;
};

if (ExileClientPlayerIsInCombat) exitWith {
  ["RepairFailedWarning", ["Scan Failed, You are in combat."]] call ExileClient_gui_notification_event_addNotification;
};

(findDisplay 24015) closeDisplay 0; 

if((LastUsedCheck == 0) || (diag_tickTime - LastUsedCheck > _cooldownTime)) then
{
  if ("ItemGPS" in (assigneditems player)) then
  { 
   
    for "_x" from 1 to 10 do {
      if (_x >= 2) then {cutText [format ["PLEASE WAIT - SCANING 8G USERS 1000M NEAR YOU...", 11-_x], "PLAIN DOWN"];};
      uiSleep 1;
    };
 
    _display = (findDisplay 24015) closeDisplay 0;
 
    _playersNearby = 0;
    _playerPos = getPos player;
    {
      _playerSelected = _x;
      _playerSelectedPos = getPos _playerSelected;
      if ((_playerSelected getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then
      {
          if(_playerPos distance _playerSelectedPos <= _scanDistance) then
          {
              if (!(_playerSelected in units group player) || (!alive _playerSelected)) then
              {  
                  _playersNearby = _playersNearby + 1;
              };
          };
      };
    } forEach allPlayers - [player];
 
    LastUsedCheck = diag_tickTime;
    ['Success',[format['There are %1 enemy player(s) nearby ',_playersNearby]]] call ExileClient_gui_notification_event_addNotification;
 
  }
  else
  {
    ["RepairFailedWarning", ["Scan Failed, You require a GPS"]] call ExileClient_gui_notification_event_addNotification;
  };
 
}
else
{
  ["RepairFailedWarning", ["Scan Failed, The 8G Scan is cooling down"]] call ExileClient_gui_notification_event_addNotification;
};