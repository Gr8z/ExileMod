/*	XM8 territory app by
	
	-Script description-
*/

private ["_pW","_pH","_display","_getControl","_setPictureControl","_setSTextControl","_setBackgroundControl","_remainingParts","_dueDate",
"_setButtonControl","_flag","_name","_size","_level","_parts","_nextProtectionMoneyDueDate","_allowedParts"];
_pW = 0.025;
_pH = 0.04;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {diag_log "Error loading XM8 RepairMate, display is null"};
_getControl = {
	params ["_key"]; 
	private ["_ctrl","_idc","_index","_slideClassName"]; 
	_ctrl = controlNull;
	_slideClassName = "territorySlide";
	_map = XM8_territory_territorySlideIDCmap;
	_index = _map find _key;
	if (_index != -1) then {
		_idc = ((getNumber (missionConfigFile >> "CfgXM8" >> _slideClassName >> "controlID")) + _index);
		_ctrl = _display displayCtrl _idc;
	};
	_ctrl;
};
_setSTextControl = {
	params ["_ctrl","_pos","_text","_font","_size","_color","_align"];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetStructuredText (parseText format ["<t shadow='0' font='%5' align='%4' size='%2' color='%3'>%1</t>", _text,_size,_color, _align,_font]);
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
};
_setButtonControl = {
	params ["_ctrl","_pos","_action","_text","_enable"];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _text;
	_ctrl ctrlSetEventHandler ["ButtonClick",_action];
	_ctrl ctrlEnable _enable;
	_ctrl ctrlCommit 0;
};

_flag = XM8_territory_flag;
_name = _flag getVariable ["ExileTerritoryName", ""];
_size = _flag getVariable ["ExileTerritorySize", 0];
_level = _flag getVariable ["ExileTerritoryLevel", 0];
_parts = count (_flag nearObjects ["Exile_Construction_Abstract_Static", _size]);
_nextProtectionMoneyDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
_allowedParts = switch (_level) do {
	case 1:{30};
	case 2:{60};
	case 3:{90};
	case 4:{120};
	case 5:{150};
	case 6:{180};
	case 7:{210};
	case 8:{240};
	case 9:{270};
	case 10:{300};
	default {0};
};
_remainingParts = _allowedParts - _parts;
_dueDate = format [
	"%3/%2/%1 %4:%5",
	_nextProtectionMoneyDueDate select 0,
	_nextProtectionMoneyDueDate select 1,
	_nextProtectionMoneyDueDate select 2,
	_nextProtectionMoneyDueDate select 3,
	_nextProtectionMoneyDueDate select 4
];

("nameDis" call _getControl) ctrlSetStructuredText parseText Format["<t size='2' align='center'>%1</t>",_name];

("levelDis" call _getControl) ctrlSetFontHeight 0.05;
("levelDis" call _getControl) ctrlSetText Format["Territory Level: %1",_level];

("sizeDis" call _getControl) ctrlSetFontHeight 0.05;
("sizeDis" call _getControl) ctrlSetText Format["Territory Radius: %1",_size];

("partsDis" call _getControl) ctrlSetFontHeight 0.05;
("partsDis" call _getControl) ctrlSetText Format["Number of parts: %1",_parts];

("repartsDis" call _getControl) ctrlSetFontHeight 0.05;
("repartsDis" call _getControl) ctrlSetText Format["Parts Remaining: %1",_remainingParts];

("dueDateDis" call _getControl) ctrlSetFontHeight 0.05;
("dueDateDis" call _getControl) ctrlSetText Format["Due Date: %1",_dueDate];