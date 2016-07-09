/*	XM8 territory app by
	
	-Script description-
*/

private ["_getNextIDC","_pW","_pH","_display","_slides","_unloadScript","_error","_thisSlide","_makeButton","_makeStructuredText"];

_makeButton = {
	params ["_parent","_idc","_position","_action","_text","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscButtonMenu",_idc,_parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetText _text;
	_ctrl ctrlSetEventHandler ["ButtonClick",_action];
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};
_getNextIDC = {
	params ["_key"];
	private ["_slideClassName","_baseIDC","_result","_map"];
	_slideClassName = "territorySlide";
	_map = XM8_territory_territorySlideIDCmap;
	_baseIDC = getNumber (missionConfigFile >> "CfgXM8" >> _slideClassName >> "controlID");
	_result = _baseIDC + (_map pushBack _key);
	_result;
};
_makeStructuredText = {
	params ["_parent","_idc","_position","_text","_font","_size","_color","_align","_shadow"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscStructuredText", _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetStructuredText (parseText format ["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", _text,_size,_color, _align,_font,_shadow]);
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_pW = 0.025;
_pH = 0.04;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {_error = "Error loading XM8 Empty app, display is null"; systemChat _error; diag_log _error;};
_slides = _display displayCtrl 4007;
if (isNull _slides) exitWith {_error = "Error loading XM8 Empty app, slides control is null"; systemChat _error; diag_log _error;};

_unloadScript = 'ExileClientXM8CurrentSlide = "sideApps"';
_display displayAddEventHandler ["unload",_unloadScript];

XM8_territory_territorySlideIDCmap = [];

_thisSlide = _display ctrlCreate ["RscExileXM8Slide",("territorySlide" call _getNextIDC),_slides];
[_thisSlide,("backButton" call _getNextIDC),[26*_pW,16*_pH,6*_pW,1*_pH],'["sideApps", 1] call ExileClient_gui_xm8_slide;',"GO BACK",""] call _makeButton;

[_thisSlide, ("nameDis" call _getNextIDC), [0*_pW,2*_pH,34*_pW,2*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0] call _makeStructuredText;
[_thisSlide, ("levelDis" call _getNextIDC), [3.9*_pW,5*_pH,13.2*_pW,1.4*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0] call _makeStructuredText;
[_thisSlide, ("sizeDis" call _getNextIDC), [3.9*_pW,7*_pH,13.2*_pW,1.4*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0] call _makeStructuredText;
[_thisSlide, ("partsDis" call _getNextIDC), [3.9*_pW,9*_pH,13.2*_pW,1.4*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0] call _makeStructuredText;
[_thisSlide, ("repartsDis" call _getNextIDC), [3.9*_pW,11*_pH,13.2*_pW,1.4*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0] call _makeStructuredText;
[_thisSlide, ("dueDateDis" call _getNextIDC), [3.9*_pW,13*_pH,13.2*_pW,1.5*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0] call _makeStructuredText;

