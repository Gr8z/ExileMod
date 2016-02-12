
///////////////////////////
//CONFIG
/////////////////////////
_cooldownTime = 60; //cool down time on script in seconds (15 * 60 = 900) AKA 15 MINS

_onlyScanforXM8Online = true; //only scan for people who have the 8G network online true =  yes false = no

_scanDistance = 1000; //area sround player to scan in meters
///////////////////////////
//CONFIG END
/////////////////////////
if(isNil "LastUsedCheck")then{
	LastUsedCheck = 0;
};

if !(player getVariable ["ExileXM8IsOnline", false]) exitWith {
	(findDisplay 24015) closeDisplay 0;
	["Whoops", ["San Failed, Your 8G Network Is Offline"]] call ExileClient_gui_notification_event_addNotification;
};

if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) exitWith {
  (findDisplay 24015) closeDisplay 0;
  ["Whoops", ["Scan Failed, You are near a base."]] call ExileClient_gui_notification_event_addNotification;
};

if (ExileClientPlayerIsInCombat) exitWith {
	(findDisplay 24015) closeDisplay 0;
 	["Whoops", ["Scan Failed, You are in combat."]] call ExileClient_gui_notification_event_addNotification;
};

if((LastUsedCheck == 0) || (diag_tickTime - LastUsedCheck > _cooldownTime))then{
  _display = (findDisplay 24015) closeDisplay 0;

  _playersNearby = 0;
  _playerPos = getPos player;
  {
      _playerSelected = _x;
      _playerSelectedPos = getPos _playerSelected;
    if(_onlyScanforXM8Online)then{
      if ((_playerSelected getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then{
        if(_playerPos distance _playerSelectedPos <= _scanDistance)then{
          _playersNearby = _playersNearby + 1;
        };
      };
    }
    else
    {
      if(_playerPos distance _playerSelectedPos <= _scanDistance)then{
        _playersNearby = _playersNearby + 1;
      };
    };
  } forEach allPlayers - [player];
  LastUsedCheck = diag_tickTime;
  if (_playersNearby < 1) then {
  	['Success',['There is nobody around...']] call ExileClient_gui_notification_event_addNotification;
  } else {
  	['Success',[format['There are %1 8G user(s) nearby ',_playersNearby]]] call ExileClient_gui_notification_event_addNotification;
	};
} else {
	["Whoops",["You must wait 60s before scaning again!"]] call ExileClient_gui_notification_event_addNotification;
};