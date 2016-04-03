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

(findDisplay 24015) closeDisplay 0; 

if((LastUsedCheck == 0) || (diag_tickTime - LastUsedCheck > _cooldownTime)) then
{
  if ("ItemGPS" in (assigneditems player)) then
  { 
   
    titleText ["Commencing scan....","PLAIN"];
 
    uiSleep 5;
 
    titleText ["Triangulating active XM8 8G positions....","PLAIN"];
   
    uiSleep 5;
 
    titleText ["Calculating data and processing...","PLAIN"];
   
    uiSleep 5;
 
    _display = (findDisplay 24015) closeDisplay 0;
 
    _playersNearby = 0;
    _playerPos = getPos player;
    {
        _playerSelected = _x;
        _playerSelectedPos = getPos _playerSelected;
        if(_onlyScanforXM8Online) then
        {
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
        }
        else
        {
            if (_playerPos distance _playerSelectedPos <= _scanDistance) then
            {
              if (!(_playerSelected in units group player) || (!alive _playerSelected)) then
              {  
                _playersNearby = _playersNearby + 1;
              };  
            };
        };
    } forEach allPlayers - [player];
 
    LastUsedCheck = diag_tickTime;
    ['Success',[format['There are %1 player(s) nearby ',_playersNearby]]] call ExileClient_gui_notification_event_addNotification;
    uiSleep 3;
    titleText [format ["Found %1 active 8G signals in your area", _playersNearby], "PLAIN",2];
 
  }
  else
  {
    ["RepairFailedWarning", ["You require a GPS"]] call ExileClient_gui_notification_event_addNotification;
    titleText ["You require a GPS","PLAIN"];
  };
 
}
else
{
  ["RepairFailedWarning", ["The XM8 Scan is cooling down"]] call ExileClient_gui_notification_event_addNotification;
  titleText ["Your XM8 Scan function is cooling down","PLAIN"];
};