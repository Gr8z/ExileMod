private['_awardToGive','_playerMoney'];
_awardToGive = ZCP_MinPoptabReward;
if(ZCP_RewardRelativeToPlayersOnline) then {
		_awardToGive = _awardToGive + (ZCP_PoptabReward) * (count playableUnits);
};
_playerMoney = _ZCP_currentCapper getVariable ["ExilePurse", 0];
_playerMoney = _playerMoney + _awardToGive;

_ZCP_currentCapper setVariable ["ExilePurse", _playerMoney];
_ZCP_currentCapper setVariable['PLAYER_STATS_VAR', [_playerMoney, _ZCP_currentCapper getVariable ['ExileScore', 0]],true];

format["updateWallet:%1:%2", _playerMoney, (getPlayerUID _ZCP_currentCapper)] call ExileServer_system_database_query_fireAndForget;

['Money',[_ZCP_currentCapper, "moneyReceivedRequest", [str _playerMoney, format ["Battle Zone"]]]] call ZCP_fnc_showNotification;

['Notification', ["ZCP",[format["%1 Successfully captured the Zone and Recieved %2 Pop Tabs.", name _ZCP_currentCapper,_awardToGive]], 'ZCP_Capped']] call ZCP_fnc_showNotification;

if( ZCP_PopTabsRewardForGroup > 0 ) then {
	private['_capperGroup'];
	_capperGroup = group _ZCP_currentCapper;
	if( _capperGroup != grpNull ) then {
		{
			if (_x != _ZCP_currentCapper && _x distance2D _ZCP_currentCapper < 200 ) then {
				_newScore = (_x getVariable ["ExilePurse", 0]) + ZCP_PopTabsRewardForGroup;
				_x setVariable ["ExilePurse", _newScore ];
				_x setVariable['PLAYER_STATS_VAR', _newScore, [_x getVariable ['ExileScore', 0]],true];
				format["updateWallet:%1:%2", _newScore, getPlayerUID _x] call ExileServer_system_database_query_fireAndForget;
			}
		}count (units _capperGroup);
	};
};