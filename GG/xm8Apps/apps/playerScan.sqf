
///////////////////////////
//CONFIG
/////////////////////////
_cooldownTime = 900; //cool down time on script in seconds (15 * 60 = 900) AKA 15 MINS

_onlyScanforXM8Online = true; //only scan for people who have the 8G network online true =  yes false = no

_scanDistance = 1000; //area sround player to scan in meters
///////////////////////////
//CONFIG END
/////////////////////////
if(isNil "LastUsedCheck")then{
LastUsedCheck = 0;
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
  	['Success',[format['There are %1 player(s) nearby ',_playersNearby]]] call ExileClient_gui_notification_event_addNotification;
	};
};