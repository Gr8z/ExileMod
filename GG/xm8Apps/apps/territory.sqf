disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_xm8Controlls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
	_fade = _display displayCtrl _x;
	_fade ctrlSetFade 1;
	_fade ctrlCommit 0.5;
}forEach _xm8Controlls;
{
ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controlls;

(_display displayCtrl 4004) ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>Territory</t>"]));
_extraCtrls = [];

_nameDis = _display ctrlCreate ["RscStructuredText", 860];
_nameDis ctrlSetPosition [(5.8 - 3) * (0.025), (6 - 2) * (0.04), 7.2 * (0.12), 3.75 * (0.02)];
_nameDis ctrlCommit 0;
_nameDis ctrlSetStructuredText parseText "<t size='2' align='center'>You must be inside your territory!</t>";

_GoBackBtn = _display ctrlCreate ["RscButtonMenu", 1116];
_GoBackBtn ctrlSetPosition [(32 - 3) * (0.025),(20 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_GoBackBtn ctrlCommit 0;
_GoBackBtn ctrlSetText "Go Back";
_GoBackBtn ctrlSetEventHandler ["ButtonClick", "[0] call fnc_goBack"];

_playerUID = getPlayerUID player;
{
	_flag = _x;
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
		if (_playerUID in _buildRights) then
		{
			
			_ctrl = (_display displayCtrl 860);
			_ctrl ctrlSetFade 1;
			_ctrl ctrlCommit 0.25;
			ctrlEnable [860, false];
			ctrlDelete ((findDisplay 24015) displayCtrl 860);
			Sleep 0.2;
			_ctrl = (_display displayCtrl 1116);
			_ctrl ctrlSetFade 1;
			_ctrl ctrlCommit 0.25;
			ctrlEnable [1116, false];
			ctrlDelete ((findDisplay 24015) displayCtrl 1116);
			
			_name = _flag getVariable ["ExileTerritoryName", ""];
			_size = _flag getVariable ["ExileTerritorySize", 0];
			_level = _flag getVariable ["ExileTerritoryLevel", 0];
			_parts = count (_flag nearObjects ["Exile_Construction_Abstract_Static", _size]);
			_nextProtectionMoneyDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];

			_nameDis = _display ctrlCreate ["RscStructuredText", 860];
			_nameDis ctrlSetPosition [(5.8 - 3) * (0.025), (6 - 2) * (0.04), 7.2 * (0.12), 3.75 * (0.02)];
			_nameDis ctrlCommit 0;
			_nameDis ctrlSetStructuredText parseText Format["<t size='2' align='center'>%1</t>",_name];
			
			_levelDis = _display ctrlCreate ["RscText", 861];
			_levelDis ctrlSetPosition [(9.9 - 3) * (0.025), (9 - 2) * (0.04), 2.75 * (0.12), 2.75 * (0.02)];
			_levelDis ctrlCommit 0;
			_levelDis ctrlSetFontHeight 0.05;
			_levelDis ctrlSetText Format["Territory Level: %1",_level];
			
			_sizeDis = _display ctrlCreate ["RscText", 862];
			_sizeDis ctrlSetPosition [(9.9 - 3) * (0.025), (11 - 2) * (0.04), 2.75 * (0.12), 2.75 * (0.02)];
			_sizeDis ctrlCommit 0;
			_sizeDis ctrlSetFontHeight 0.05;
			_sizeDis ctrlSetText Format["Territory Radius: %1",_size];

			_partsDis = _display ctrlCreate ["RscText", 863];
			_partsDis ctrlSetPosition [(9.9 - 3) * (0.025), (13 - 2) * (0.04), 2.75 * (0.12), 2.75 * (0.02)];
			_partsDis ctrlCommit 0;
			_partsDis ctrlSetFontHeight 0.05;
			_partsDis ctrlSetText Format["Number of parts: %1",_parts];
			
			_allowedParts = 0;
			switch(_level)do{
				case 1:{_allowedParts = 	30;};
				case 2:{_allowedParts = 	60;};
				case 3:{_allowedParts = 	90;};
				case 4:{_allowedParts = 	120;};
				case 5:{_allowedParts = 	150;};
				case 6:{_allowedParts = 	180;};
				case 7:{_allowedParts = 	210;};
				case 8:{_allowedParts = 	240;};
				case 9:{_allowedParts = 	270;};
				case 10:{_allowedParts = 	300;};
			};
			_remainingParts = _allowedParts - _parts;
			_rePartsDis = _display ctrlCreate ["RscText", 864];
			_rePartsDis ctrlSetPosition [(9.9 - 3) * (0.025), (15 - 2) * (0.04), 2.75 * (0.12), 2.75 * (0.02)];
			_rePartsDis ctrlCommit 0;
			_rePartsDis ctrlSetFontHeight 0.05;
			_rePartsDis ctrlSetText Format["Parts Remaining: %1",_remainingParts];
			

			_dueDate = format 
			[
				"%3/%2/%1 %4:%5",
				_nextProtectionMoneyDueDate select 0,
				_nextProtectionMoneyDueDate select 1,
				_nextProtectionMoneyDueDate select 2,
				_nextProtectionMoneyDueDate select 3,
				_nextProtectionMoneyDueDate select 4
			];
			
			_dueDateDis = _display ctrlCreate ["RscText", 865];
			_dueDateDis ctrlSetPosition [(9.9 - 3) * (0.025), (17 - 2) * (0.04), 2.75 * (0.12), 3 * (0.02)];
			_dueDateDis ctrlCommit 0;
			_dueDateDis ctrlSetFontHeight 0.05;
			_dueDateDis ctrlSetText Format["Due Date: %1",_dueDate];
			
			_GoBackBtn = _display ctrlCreate ["RscButtonMenu", 1116];
			_GoBackBtn ctrlSetPosition [(32 - 3) * (0.025),(20 - 2) * (0.04),6 * (0.025),1 * (0.04)];
			_GoBackBtn ctrlCommit 0;
			_GoBackBtn ctrlSetText "Go Back";
			_GoBackBtn ctrlSetEventHandler ["ButtonClick", "[1] call fnc_goBack"];
			
		};
}forEach (nearestObjects [player,["Exile_Construction_Flag_Static"],150]);




fnc_goBack = {
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	switch(_this select 0)do{
		case 0:{
		  _Ctrls = [1116,860];
		  {
			  _ctrl = (_display displayCtrl _x);
			  _ctrl ctrlSetFade 1;
			  _ctrl ctrlCommit 0.25;
			  ctrlEnable [_x, false];
		  } forEach _Ctrls;			
		  execVM "GG\xm8Apps\XM8Apps_Init.sqf";
		  sleep 1;
		  {
			ctrlDelete ((findDisplay 24015) displayCtrl _x);
		  } forEach _Ctrls;
		};
		
		case 1:{
			 _Ctrls = [1116,860,861,862,863,864,865];
			{
				_ctrl = (_display displayCtrl _x);
				_ctrl ctrlSetFade 1;
				_ctrl ctrlCommit 0.25;
				ctrlEnable [_x, false];
			} forEach _Ctrls;			
			execVM "GG\xm8Apps\XM8Apps_Init.sqf";
			sleep 1;
			{
				ctrlDelete ((findDisplay 24015) displayCtrl _x);
			} forEach _Ctrls;
		};
	};
};
