/*  
	postInit.sqf
*/

ExAd_HALOPARACHUTE_VERSION = "v0.7.4";

execVM "GG\ExAdClient\HaloParachute\customize.sqf";

if(isNil "ExAd_HALOPARACHUTE_SAFE_MODE")then{ExAd_HALOPARACHUTE_SAFE_MODE = false;};
if(isNil "ExAd_HALOPARACHUTE_USE_ACTIONS")then{ExAd_HALOPARACHUTE_USE_ACTIONS = true;};
if(isNil "ExAd_HALOPARACHUTE_USE_KEY_ACTIONS")then{ExAd_HALOPARACHUTE_USE_KEY_ACTIONS = true;};
if(isNil "ExAd_ACTION_PARACHUTE_HEIGHT")then{ExAd_ACTION_PARACHUTE_HEIGHT = 10;};
if(isNil "ExAd_ACTION_EJECT_HEIGHT")then{ExAd_ACTION_EJECT_HEIGHT = 0;};

[] spawn {
	while {true} do {
		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
		waitUntil{alive player};
		
		if(ExAd_HALOPARACHUTE_USE_ACTIONS)then{
			ExAd_ACTION_PARACHUTE = player addaction [format["<t color='#36A9E0'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' />%1</t>", "Open Parachute"], {[] spawn ExAd_fnc_pullParachute}, [], 6, true, true, "", "call ExAd_fnc_showParachute"];
			ExAd_ACTION_EJECT = player addaction [format["<t color='#36A9E0'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' />%1</t>", "Halo Jump"], {call ExAd_fnc_ejectPlayer}, [], 6, false, true, "", "call ExAd_fnc_showEject;"];
		};
		
		if(ExAd_HALOPARACHUTE_USE_KEY_ACTIONS)then{
			ExAd_ACTION_HALOPARACHUTE_USE_KEY_ACTIONS = (findDisplay 46) displayAddEventHandler ["KeyDown",{
				if(_this select 1 == 45 && _this select 2 && _this select 4)then{
					if((getPos player) select 2 > ExAd_ACTION_EJECT_HEIGHT && vehicle player != player)then{
						call ExAd_fnc_ejectPlayer
					}else{
						if(call ExAd_fnc_showParachute)then{
							[] spawn ExAd_fnc_pullParachute
						}
					}
				}
			}];
		};
		
		waitUntil{!alive player};
		if(ExAd_HALOPARACHUTE_USE_ACTIONS)then{
			player removeAction ExAd_ACTION_PARACHUTE;
			player removeAction ExAd_ACTION_EJECT;
		};
		
		if(ExAd_HALOPARACHUTE_USE_KEY_ACTIONS)then{
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", ExAd_ACTION_HALOPARACHUTE_USE_KEY_ACTIONS];
		};
	};
};