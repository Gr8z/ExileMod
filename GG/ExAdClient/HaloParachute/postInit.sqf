/*  
	postInit.sqf
*/

_path = "GG\ExAdClient\HaloParachute\customize.sqf";
call compile preprocessFileLineNumbers _path;


if(isNil "ExAd_HALOPARACHUTE_SAFE_MODE")then{ExAd_HALOPARACHUTE_SAFE_MODE = false;};
if(isNil "ExAd_HALOPARACHUTE_USE_ACTIONS")then{ExAd_HALOPARACHUTE_USE_ACTIONS = true;};
if(isNil "ExAd_HALOPARACHUTE_USE_KEY_ACTIONS")then{ExAd_HALOPARACHUTE_USE_KEY_ACTIONS = true;};
if(isNil "ExAd_ACTION_PARACHUTE_HEIGHT")then{ExAd_ACTION_PARACHUTE_HEIGHT = 10;};
if(isNil "ExAd_ACTION_EJECT_HEIGHT")then{ExAd_ACTION_EJECT_HEIGHT = 0;};
if(isNil "ExAd_ParaActionAdded")then{ExAd_ParaActionAdded = false;};
if(isNil "ExAd_EjectActionAdded")then{ExAd_EjectActionAdded = false;};

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

if(ExAd_HALOPARACHUTE_USE_KEY_ACTIONS)then{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", ExAd_ACTION_HALOPARACHUTE_USE_KEY_ACTIONS];
};

ExAdParachuteLoop = 
{
	// PARACHUTE
	_states = [
		"ladderriflestatic",
		"ladderrifledownloop",
		"ladderrifleuploop",
		"laddercivilstatic",
		"laddercivildownloop",
		"ladderciviluploop"
	];
	_ladder = !((animationState player) in _states);
	if ((vehicle player == player) && (backpack player != "B_Parachute") && ((getPos player) select 2 > ExAd_ACTION_PARACHUTE_HEIGHT) && _ladder) then 
	{
		if (!ExAd_ParaActionAdded) then 
		{
			ExAd_ParaTitle = format["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' />%1</t>", "Open Parachute"];
			ExAd_ACTION_PARACHUTE = player addAction [ExAd_ParaTitle, ExAd_fnc_pullParachute, [player]];
			ExAd_ParaActionAdded = true;
		};
	}
	else
	{
		if (ExAd_ParaActionAdded) then
		{
			player removeAction ExAd_ACTION_PARACHUTE;
			ExAd_ParaActionAdded = false;
		};
	};
	
	// EJECT
	_role = if(count assignedVehicleRole player > 0)then{if(assignedVehicleRole player select 0 == "cargo")then{false}else{true}}else{true};
	if ((vehicle player != player) && ((getPos player) select 2 > ExAd_ACTION_EJECT_HEIGHT) && _role) then 
	{
		if (!ExAd_EjectActionAdded) then 
		{
			ExAd_EjectTitle = format["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' />%1</t>", "Halo Jump"];
			ExAd_ACTION_EJECT = player addAction [ExAd_EjectTitle, ExAd_fnc_ejectPlayer, [player]];
			ExAd_EjectActionAdded = true;
		};
	}
	else
	{
	if (ExAd_EjectActionAdded) then
	{
				player removeAction ExAd_ACTION_EJECT;
			ExAd_EjectActionAdded = false;
		};
	};
};
ExAdParachuteVar = [1, ExAdParachuteLoop, [], true] call ExileClient_system_thread_addtask;