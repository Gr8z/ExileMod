/*
	infiSTAR: Logging kills to A3_EXILE_KILLED.txt AND server rpt file
*/
private["_victim","_killer","_addDeathStat","_addKillStat","_killerRespectPoints","_fragAttributes","_lastKillAt","_killStack","_distance","_distanceBonus","_overallRespectChange","_newKillerScore","_killMessage","_newKillerFrags","_newVictimDeaths","_weapon","_txt","_pic"];
if (!isServer || hasInterface) exitWith {};
_victim = _this select 0;
_killer = _this select 1;
if( isNull _victim ) exitWith {};
_victim setVariable ["ExileDiedAt", time];
if !(isPlayer _victim) exitWith {};
format["killPlayer:%1", _victim getVariable ["ExileDatabaseId", -1]] call ExileServer_system_database_query_fireAndForget;
_victim setVariable ["ExileIsDead", true];
_addDeathStat = true;
_addKillStat = true;
_killerRespectPoints = [];
_fragAttributes = [];
ExileServer_object_player_event_killFeed_LOGTORPT = {
	_this call ExileServer_object_player_event_killFeed;
	diag_log str _this;
};
if (_victim isEqualTo _killer) then
{
	_log = format["%1 commited suicide!", (name _victim)];
	'ARMA_LOG' callExtension format['A3_EXILE_KILLED:%1',_log];
	["systemChatRequest", [_log]] call ExileServer_object_player_event_killFeed_LOGTORPT;
}
else 
{
	if (vehicle _victim isEqualTo _killer) then
	{
		_log = format["%1 crashed to death!", (name _victim)];
		'ARMA_LOG' callExtension format['A3_EXILE_KILLED:%1',_log];
		["systemChatRequest", [_log]] call ExileServer_object_player_event_killFeed_LOGTORPT;
	}
	else 
	{
		if (isNull _killer) then
		{
			_log = format["%1 died for an unknown reason!", (name _victim)];
			'ARMA_LOG' callExtension format['A3_EXILE_KILLED:%1',_log];
			["systemChatRequest", [_log]] call ExileServer_object_player_event_killFeed_LOGTORPT;
		}
		else 
		{
			if (isPlayer _killer) then
			{
				if (_victim getVariable["ExileIsBambi", false]) then
				{
					_addKillStat = false;
					_addDeathStat = false;
					_fragAttributes pushBack "Bambi Slayer";
					_killerRespectPoints pushBack ["BAMBI SLAYER", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "bambi"))];
				}
				else 
				{
					if (vehicle _killer isEqualTo _killer) then
					{
						if (currentWeapon _killer isEqualTo "Exile_Melee_Axe") then
						{
							_fragAttributes pushBack "Humiliation";
							_killerRespectPoints pushBack ["HUMILIATION", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "humiliation"))];
						}
						else 
						{
							_killerRespectPoints pushBack ["ENEMY FRAGGED", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "standard"))];
						};
						
						// Fix for killing players from a Mounted Vehicle Gun
						if !(_killer isKindOf "Exile_Unit_Player") then
						{
							{
								if ((name _x) isEqualTo (name _killer)) exitWith
								{
									_killer = _x;
								};
							} forEach (crew _killer);

							_fragAttributes pushBack "Mounted Vehicle Gun";
							_killerRespectPoints pushBack ["VEHICLE GUNNER", 5];
						};
					}
					else 
					{
						if ((driver (vehicle _killer)) isEqualTo _killer) then
						{
							_fragAttributes pushBack "Road Kill";
							_killerRespectPoints pushBack ["ROAD KILL", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "roadKill"))];
						}
						else 
						{	
							_fragAttributes pushBack "Passenger";
							_killerRespectPoints pushBack ["MAD PASSENGER", (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Frags" >> "passenger"))];
						};
					};
				};
				if (_addKillStat) then
				{
					_lastKillAt = _killer getVariable["ExileLastKillAt", 0];
					_killStack = _killer getVariable["ExileKillStack", 0];
					_killStack = _killStack + 1;
					if (isNil "ExileServerHadFirstBlood") then
					{
						ExileServerHadFirstBlood = true;
						_fragAttributes pushBack "First Blood";
						_killerRespectPoints pushBack ["FIRST BLOOD", getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "firstBlood")];
					}
					else 
					{
						if (time - _lastKillAt < (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "killStreakTimeout"))) then
						{
							_fragAttributes pushBack (format ["%1x Kill Streak", _killStack]);
							_killerRespectPoints pushBack [(format ["%1x KILL STREAK", _killStack]), _killStack * (getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "killStreak"))];
						}
						else 
						{
							_killStack = 1; 
						};
					};
					_killer setVariable["ExileKillStack", _killStack];
					_killer setVariable ["ExileLastKillAt", time];
					_distance = floor(_victim distance _killer);
					_fragAttributes pushBack (format ["%1m Distance", _distance]);
					_distanceBonus = (floor (_distance / 100)) * getNumber (configFile >> "CfgSettings" >> "Respect" >> "Bonus" >> "per100mDistance");
					if (_distanceBonus > 0) then
					{
						_killerRespectPoints pushBack [(format ["%1m RANGE BONUS", _distance]), _distanceBonus];
					};
				};
				_overallRespectChange = 0;
				{
					_overallRespectChange = _overallRespectChange + (_x select 1);
				}
				forEach _killerRespectPoints;
				_newKillerScore = _killer getVariable ["ExileScore", 0];
				_newKillerScore = _newKillerScore + _overallRespectChange;
				_killer setVariable ["ExileScore", _newKillerScore];
				_weapon = currentWeapon _killer;
				_txt = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'displayName'));
				_pic = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'picture'));
				format["setAccountScore:%1:%2", _newKillerScore,getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
				_killMessage = format ["%1 was killed by %2", (name _victim), (name _killer)];
				
				//if (ShowPlayerKills) then {
					Gr8s_kill_msg = [(name _killer), _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
					publicVariable "Gr8s_kill_msg";
				//};
				
				if !(count _fragAttributes isEqualTo 0) then
				{
					_killMessage = _killMessage + " (";
					{
						if (_forEachIndex > 0) then
						{
							_killMessage = _killMessage + ", ";
						};
						_killMessage = _killMessage + _x;
					}
					forEach _fragAttributes;
					_killMessage = _killMessage + ")";
				};
				_log = _killMessage;
				'ARMA_LOG' callExtension format['A3_EXILE_KILLED:%1',_log];
				["systemChatRequest", [_log]] call ExileServer_object_player_event_killFeed_LOGTORPT;
				if (_addKillStat isEqualTo true) then
				{
					_newKillerFrags = _killer getVariable ["ExileKills", 0];
					_newKillerFrags = _newKillerFrags + 1;
					_killer setVariable ["ExileKills", _newKillerFrags];
					format["addAccountKill:%1", getPlayerUID _killer] call ExileServer_system_database_query_fireAndForget;
				};
				[_killer, "showFragRequest", [_killerRespectPoints]] call ExileServer_system_network_send_to;
				_killer call ExileServer_object_player_sendStatsUpdate;
			}
			else 
			{
				_log = format["%1 was killed by an AI! (%2m Distance)", (name _victim), floor(_victim distance _killer)];
				//if (ShowAIKills) then {
					Gr8s_kill_msg = ["AI", _pic, (name _victim), floor(_victim distance _killer), _txt, nil, nil];
					publicVariable "Gr8s_kill_msg";
				//};
				'ARMA_LOG' callExtension format['A3_EXILE_KILLED:%1',_log];
				["systemChatRequest", [_log]] call ExileServer_object_player_event_killFeed_LOGTORPT;
			};
		};
	};
};
if (_addDeathStat isEqualTo true) then
{
	_newVictimDeaths = _victim getVariable ["ExileDeaths", 0];
	_newVictimDeaths = _newVictimDeaths + 1;
	_victim setVariable ["ExileDeaths", _newVictimDeaths];
	format["addAccountDeath:%1", getPlayerUID _victim] call ExileServer_system_database_query_fireAndForget;
	_victim call ExileServer_object_player_sendStatsUpdate;
};
[_victim] joinSilent ExileGraveyardGroup;
true