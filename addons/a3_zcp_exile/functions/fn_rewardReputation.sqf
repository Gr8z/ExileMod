private['_awardToGive','_playerScore'];
_awardToGive = ZCP_MinReputationReward + (ZCP_ReputationReward) * (count playableUnits);
_playerScore = _ZCP_currentCapper getVariable ["ExileScore", 0];
_playerScore = _playerScore + _awardToGive;

_ZCP_currentCapper setVariable ["ExileScore",_playerScore];
_ZCP_currentCapper setVariable['PLAYER_STATS_VAR', [_ZCP_currentCapper getVariable ['ExilePurse', 0], _playerScore],true];

format["setAccountScore:%1:%2", _playerScore,getPlayerUID _ZCP_currentCapper] call ExileServer_system_database_query_fireAndForget;

['Reputation',[_ZCP_currentCapper, "showFragRequest", [[[format ["Battle Zone %1", [9] call ZCP_fnc_translate],_awardToGive]]]]] call ZCP_fnc_showNotification;

ExileClientPlayerScore = _playerScore;
(owner _ZCP_currentCapper) publicVariableClient "ExileClientPlayerScore";
ExileClientPlayerScore = nil;

['Notification', ["ZCP",[format["%1 Successfully captured the Zone and Recieved %2 Respect.", name _ZCP_currentCapper,_awardToGive]], 'ZCP_Capped']] call ZCP_fnc_showNotification;

_ZCP_currentCapper call ExileServer_object_player_database_update;

if( ZCP_ReputationRewardForGroup > 0 ) then {
  private['_capperGroup'];
  _capperGroup = group _ZCP_currentCapper;
  if( _capperGroup != grpNull ) then {
    {
      if (_x != _ZCP_currentCapper && _x distance2D _ZCP_currentCapper < 200 ) then {
        _newScore = (_x getVariable ["ExileScore", 0]) + ZCP_ReputationRewardForGroup;
        _x setVariable ["ExileScore", _newScore ];
        _x setVariable['PLAYER_STATS_VAR', [_x getVariable ['ExilePurse', 0], _newScore],true];
        format["setAccountScore:%1:%2", _newScore, getPlayerUID _x] call ExileServer_system_database_query_fireAndForget;
        _x call ExileServer_object_player_database_update;

        ExileClientPlayerScore = _newScore;
        (owner _x) publicVariableClient "ExileClientPlayerScore";
        ExileClientPlayerScore = nil;

        ['Reputation', [_x, "showFragRequest", [[[format ["Battle Zone %1", [10] call ZCP_fnc_translate],ZCP_ReputationRewardForGroup]]]]] call ZCP_fnc_showNotification;
      }
    }count (units _capperGroup);
  };
};