private["_vehicle","_availableHitpoints","_fixable","_equippedMagazines","_vehdamage"];

if (ExileClientActionDelayShown) exitWith { false };
ExileClientActionDelayShown = true;
ExileClientActionDelayAbort = false;

_vehicle = _this select 0;

if (vehicle player isEqualTo _vehicle) exitWith 
{
	[
		"ErrorTitleAndText", 
		["No..", "Are you serious?"]
	] call ExileClient_gui_toaster_addTemplateToast;
	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
};
_availableHitpoints = (getAllHitPointsDamage _vehicle) select 0;
{
	if((_vehicle getHitPointDamage _x) > 0)exitWith
	{
		_fixable = "potato";
	};
}
forEach _availableHitpoints;

_vehdamage = 0;
{
	_vehdamage = (_vehicle getHitPointDamage _x) + _vehdamage;
}
forEach _availableHitpoints;

if (isNil "_fixable") exitWith 
{
	[
		"InfoTitleAndText", 
		["Repair Info", "This vehicle is already fully repaired"]
	] call ExileClient_gui_toaster_addTemplateToast;

	ExileClientActionDelayShown = false;
	ExileClientActionDelayAbort = false;
}; 
if (!local _vehicle) then
{
	[
		"ErrorTitleAndText", 
		["Repair Info", "Get in the driver seat first"]
	] call ExileClient_gui_toaster_addTemplateToast;
}
else 
{
	_equippedMagazines = magazines player;
	if ("Exile_Item_Wrench" in _equippedMagazines) then
	{
		if ("Exile_Item_DuctTape" in _equippedMagazines) then
		{
			if ("Exile_Item_JunkMetal" in _equippedMagazines) then
			{
				if ("Exile_Item_MetalScrews" in _equippedMagazines) then
				{
					_animation = "Exile_Acts_RepairVehicle01_Animation01";
					disableSerialization;
					("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileActionProgress", "PLAIN", 1, false];

					_keyDownHandle = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call ExileClient_action_event_onKeyDown"];
					_mouseButtonDownHandle = (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call ExileClient_action_event_onMouseButtonDown"];

					player switchMove _animation;
					["switchMoveRequest", [netId player, _animation]] call ExileClient_system_network_send;

					_startTime = diag_tickTime;
					_duration = 35 + _vehdamage;
					_sleepDuration = _duration / 100;
					_progress = 0;

					_display = uiNamespace getVariable "RscExileActionProgress";   
					_label = _display displayCtrl 4002;
					_label ctrlSetText "0%";
					_progressBarBackground = _display displayCtrl 4001;  
					_progressBarMaxSize = ctrlPosition _progressBarBackground;
					_progressBar = _display displayCtrl 4000;  
					_progressBar ctrlSetPosition [_progressBarMaxSize select 0, _progressBarMaxSize select 1, 0, _progressBarMaxSize select 3];
					_progressBar ctrlSetBackgroundColor [0, 0.78, 0.93, 1];
					_progressBar ctrlCommit 0;
					_progressBar ctrlSetPosition _progressBarMaxSize; 
					_progressBar ctrlCommit _duration;
					try
					{
						while {_progress < 1} do
						{	
							if (ExileClientActionDelayAbort) then 
							{
								throw 1;
							};

							uiSleep _sleepDuration; 
							_progress = ((diag_tickTime - _startTime) / _duration) min 1;
							_label ctrlSetText format["%1%2", round (_progress * 100), "%"];
						};
						throw 0;
					}
					catch
					{
						_progressBarColor = [];
						switch (_exception) do 
						{
							case 0:
							{
								_progressBarColor = [0.7, 0.93, 0, 1];
								if (_vehicle isKindOf "car")  then
								{	
									{
										_vehicle setHitPointDamage [_x,0];
									}	forEach _repairable;
								}						
								else
								{
									_vehicle setDamage 0;
								};	
								player removeItem "Exile_Item_DuctTape";
								player removeItem "Exile_Item_JunkMetal";
								player removeItem "Exile_Item_MetalPole";
								player removeItem "Exile_Item_DuctTape";
								player removeItem "Exile_Item_MetalScrews";
								player removeItem "Exile_Item_MetalWire";
								[
									"InfoTitleAndText", 
									["Repair Info", "You have fully repaired the hull of this vehicle"]
								] call ExileClient_gui_toaster_addTemplateToast;
							};
							case 1: 	
							{ 
								[
									"ErrorTitleAndText", 
									["Repair Info", "Repair cancelled"]
								] call ExileClient_gui_toaster_addTemplateToast;
								_progressBarColor = [0.82, 0.82, 0.82, 1];
							};
						};	
						player switchMove "";
						["switchMoveRequest", [netId player, ""]] call ExileClient_system_network_send;
						_progressBar ctrlSetBackgroundColor _progressBarColor;
						_progressBar ctrlSetPosition _progressBarMaxSize;
						_progressBar ctrlCommit 0;
					};

					("ExileActionProgressLayer" call BIS_fnc_rscLayer) cutFadeOut 2; 
					(findDisplay 46) displayRemoveEventHandler ["KeyDown", _keyDownHandle];
					(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _mouseButtonDownHandle];
					ExileClientActionDelayShown = false;
					ExileClientActionDelayAbort = false;	
				}
				else
				{
					[
						"ErrorTitleAndText", 
						["Repair Info", "You need duct tape, Junk Metal and Screws."]
					] call ExileClient_gui_toaster_addTemplateToast;
				};		
			}
			else
			{
				[
					"ErrorTitleAndText", 
					["Repair Info", "You need duct tape, Junk Metal and Screws."]
				] call ExileClient_gui_toaster_addTemplateToast;
			};
		}
		else 
		{
			[
				"ErrorTitleAndText", 
				["Repair Info", "You need duct tape, Junk Metal and Screws."]
			] call ExileClient_gui_toaster_addTemplateToast;
		};
	}
	else
	{
		[
			"ErrorTitleAndText", 
			["Repair Info", "You need a wrench to repair vehicles"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};	
	
};
ExileClientActionDelayShown = false;
ExileClientActionDelayAbort = false;
true