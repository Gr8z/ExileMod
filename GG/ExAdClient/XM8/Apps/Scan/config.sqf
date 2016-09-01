ExAd_XM8_Scan_fnc_ScanPlayer = {
	params["_slideClass","_cooldownTime","_scanDistance"];
	try
	{
		_cooldownTime = getArray(missionConfigFile >> "CfgXM8" >> _slideClass >> "cooldownTime");

		if(isNil "LastUsedCheck")then{LastUsedCheck = 0;};

		if !(player getVariable ["ExileXM8IsOnline", false]) exitWith {
		  throw "Scan failed, your 8G network is offline.";
		};

		if  ((nearestObject [player,'Exile_Construction_Abstract_Static']) distance player < 75) exitWith {
		  throw "Scan failed, you're near a base.";
		};

		if (ExileClientPlayerIsInCombat) exitWith {
		  throw "Scan failed, you're in combat."l
		};

		if !("ItemGPS" in (assigneditems player)) exitWith
		{ 
			throw = "Scan failed, you don't have a GPS.";
		};

		if !((LastUsedCheck == 0) || (diag_tickTime - LastUsedCheck > _cooldownTime)) exitWith
		{
			throw "Scan failed, the 8G scan is on cooldown.";
		};

		[] spawn {
			_scanDistance = getArray(missionConfigFile >> "CfgXM8" >> _slideClass >> "scanDistance");
			for "_x" from 1 to 10 do {
			  if (_x >= 2) then {cutText [format ["PLEASE WAIT - SCANNING FOR 8G USERS WITHIN 1000M...", 11-_x], "PLAIN DOWN"];};
			  uiSleep 1;
			};

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

			_msg = format['There are %1 enemy player(s) nearby ',_playersNearby];
			["InfoTitleAndText", ["Plan Scan",_msg]] call ExileClient_gui_toaster_addTemplateToast;
		};

		["extraApps", 1] call ExileClient_gui_xm8_slide;
		closeDialog 0;
	}
	catch
	{
		[_exception] spawn {
			UISleep 0.5; 
			["ErrorTitleAndText", ["Player Scan", _this select 0]] call ExileClient_gui_toaster_addTemplateToast;
			["extraApps", 1] call ExileClient_gui_xm8_slide;
		};
	}

};