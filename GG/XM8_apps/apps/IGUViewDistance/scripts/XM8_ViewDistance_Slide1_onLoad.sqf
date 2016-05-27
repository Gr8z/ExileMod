/*
	File: XM8_ViewDistance_Slide1_onLoad.sqf
	GUI / Framework functions by: vitalymind (http://www.exilemod.com/profile/74379-vitalymind/)
	Modified by: Jamie C (http://www.exilemod.com/profile/4838-jamie/)
	Modified: 08/05/2016
*/

private ["_makeProgressBar","_makePicture","_makeStructuredText","_makeBackground","_makeFrame","_makeButton","_pW","_pH","_display","_slides",
"_error","_IGUViewDistance","_getNextIDC"];

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
_makeSlider = {
	params ["_parent","_idc","_position", "_sliderPosition", "_MinSlider", "_MaxSlider", "_function"];
	private ["_ctrl", "_MinSlider", "_MaxSlider"];
	_ctrl = _display ctrlCreate ["RscXSliderH", _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler ["SliderPosChanged",_function];
	_ctrl sliderSetRange [_MinSlider, _MaxSlider];
	_ctrl sliderSetSpeed [100, 2];
	_ctrl sliderSetPosition _sliderPosition;
};
_getNextIDC = {
	params ["_key"];
	private ["_slideClassName","_baseIDC","_result","_map"];
	_map = XM8_ViewDistance_Slide1IDCmap; //Variable name of IDC map of slide. Change it accordinly.
	_baseIDC = getNumber (missionConfigFile >> "CfgXM8" >> "IGUViewDistance" >> "controlID");
	_result = _baseIDC + (_map pushBack _key);
	_result;
};

_pW = 0.025;
_pH = 0.04;

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {_error = "Error loading XM8 ViewDistance app, display is null"; systemChat _error; diag_log _error;};

_slides = _display displayCtrl 4007;
if (isNull _slides) exitWith {_error = "Error loading XM8 ViewDistance app, slides control is null"; systemChat _error; diag_log _error;};


_unloadScript = '
	if (ExileClientXM8CurrentSlide == "IGUViewDistance") then {
		ExileClientXM8CurrentSlide = "IGUViewDistance";
	};
';
_display displayAddEventHandler ["unload",_unloadScript];


XM8_ViewDistance_Slide1IDCmap = [];


_IGUViewDistance = _display ctrlCreate [
	"RscExileXM8Slide",
	("IGUViewDistance" call _getNextIDC),
	_slides
];


[
	_IGUViewDistance,
	("backButton" call _getNextIDC),
	[
		27.6*_pW,
		17.7*_pH,
		6*_pW,
		1*_pH
	],
	'["sideApps", 1] call ExileClient_gui_xm8_slide;',
	"GO BACK",
	"Back to Applications"
] call _makeButton;


[
	_IGUViewDistance,
	("currentObjectDistance" call _getNextIDC),
	[
		11*_pW, //pos horizontal
		15*_pH, //pos vertical
		12*_pW, //Width
		1*_pH	//Height
	],
	parseText format["Object Distance: %1", XM8_ObjectDistance],
	"PuristaMedium",
	1.0,
	"#FFFFFFFF",
	"center",
	0,
	"#FFFFFFFF"
] call _makeStructuredText;


[
	_IGUViewDistance,
	("currentViewDistance" call _getNextIDC),
	[
		11*_pW, //pos horizontal
		6*_pH, //pos vertical
		12*_pW, //Width
		1*_pH	//Height
	],
	parseText format["View Distance: %1", XM8_ViewDistance],
	"PuristaMedium",
	1.0,
	"#FFFFFFFF",
	"center",
	0,
	"#FFFFFFFF"
] call _makeStructuredText;

[
	_IGUViewDistance,
	("currentterrainQuality" call _getNextIDC),
	[
		11*_pW, //pos horizontal
		10.5*_pH, //pos vertical
		12*_pW, //Width
		1*_pH	//Height
	],
	parseText format["Terrain quality: %1", XM8_terrainQuality],
	"PuristaMedium",
	1.0,
	"#FFFFFFFF",
	"center",
	0,
	"#FFFFFFFF"
] call _makeStructuredText;

[
	_IGUViewDistance,
	("TerrainDistanceSlider" call _getNextIDC),
	[
		5*_pW, //pos horizontal
		4*_pH, //pos vertical
		24*_pW, //Width
	  1*_pH	//Height
	],
	XM8_ViewDistance, //Slider Position
	XM8_ViewDistance_minTerrainDistance, //Min Slider Ammount
	XM8_ViewDistance_MaxTerrainDistance, //Max Slider Ammount
	"_this call XM8_ViewDistance_UpdateViewDistance"
] call _makeSlider;


[
	_IGUViewDistance,
	("ObjectDistanceSlider" call _getNextIDC),
	[
		5*_pW, //pos horizontal
		13*_pH, //pos vertical
		24*_pW, //Width
	  1*_pH	//Height
	],
	XM8_ObjectDistance,	 //Slider Position
	XM8_ViewDistance_minObjectDistance, //Min Slider Ammount
	XM8_ViewDistance_maxObjectDistance, //Max Slider Ammount
	"_this call XM8_ViewDistance_UpdateObjectDistance"

] call _makeSlider;

_ctrl = [
	_IGUViewDistance,
	("terrainQualitySlider" call _getNextIDC),
	[
		5*_pW, //pos horizontal
		8.5*_pH, //pos vertical
		24*_pW, //Width
	  1*_pH	//Height
	],
	XM8_terrainQuality,	 //Slider Position
	XM8_terrainQuality_minterrainQuality, //Min Slider Ammount
	XM8_terrainQuality_maxterrainQuality, //Max Slider Ammount
	"_this call XM8_ViewDistance_UpdateterrainQuality"

] call _makeSlider;
_ctrl ctrlSetTooltip "Lower value -> better quality";