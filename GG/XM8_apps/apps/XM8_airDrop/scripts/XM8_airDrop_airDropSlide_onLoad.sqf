/*	XM8 airDrop app by
	
	-Script description-
*/

private ["_getNextIDC","_pW","_pH","_display","_slides","_unloadScript","_error","_thisSlide","_makeButton","_makeStructuredText","_ctrl","_ranNumArr"];

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
	_slideClassName = "airDropSlide";
	_map = XM8_airDrop_airDropSlideIDCmap;
	_baseIDC = getNumber (missionConfigFile >> "CfgXM8" >> _slideClassName >> "controlID");
	_result = _baseIDC + (_map pushBack _key);
	_result;
};
_makeStructuredText = {
	params ["_parent","_idc","_position","_text","_font","_size","_color","_align","_shadow","_backColor"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscStructuredText", _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetStructuredText (parseText format ["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", _text,_size,_color, _align,_font,_shadow]);
	_ctrl ctrlEnable false;
	_ctrl ctrlSetBackgroundColor _backColor;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_pW = 0.025;
_pH = 0.04;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {_error = "Error loading XM8 Empty app, display is null"; systemChat _error; diag_log _error;};
_slides = _display displayCtrl 4007;
if (isNull _slides) exitWith {_error = "Error loading XM8 Empty app, slides control is null"; systemChat _error; diag_log _error;};

_unloadScript = '';
_display displayAddEventHandler ["unload",_unloadScript];

XM8_airDrop_airDropSlideIDCmap = [];

//WE HAVE TO RANDOMIZE FOLLOWING VALUES EACH TIME XM8 LOADED
XM8_airDrop_box1RareCount = floor(random 1);
XM8_airDrop_box1MagCount = floor((random 5) + 1);
XM8_airDrop_box1ItemCount = floor((random 2) + 1);
XM8_airDrop_box2RareCount = floor((random 2) + 1);
XM8_airDrop_box2MagCount = floor((random 10) + 2);
XM8_airDrop_box2ItemCount = floor((random 4) + 4);
XM8_airDrop_box3RareCount = floor((random 2) + 2);
XM8_airDrop_box3MagCount = floor((random 10) + 4);
XM8_airDrop_box3ItemCount = floor((random 10) + 4);
XM8_airDrop_BoxWeapon = (selectRandom XM8_airDrop_BoxWeapons);
XM8_airDrop_mag = (getArray (configfile >> "cfgWeapons" >> XM8_airDrop_BoxWeapon >> "magazines")) select 0;

_thisSlide = _display ctrlCreate ["RscExileXM8Slide",("airDropSlide" call _getNextIDC),_slides];

_ctrl = [_thisSlide, ("" call _getNextIDC), [3.5*_pW,2*_pH,11.2*_pW,5*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0,[0.11,0.106,0.125,1]] call _makeStructuredText;
_ctrl ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Starter Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",XM8_airDrop_box1Cost]));
_ctrl = [_thisSlide, ("" call _getNextIDC), [3.5*_pW,7.5*_pH,11.2*_pW,5*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0,[0.11,0.106,0.125,1]] call _makeStructuredText;
_ctrl ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Medium Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",XM8_airDrop_box2Cost]));
_ctrl = [_thisSlide, ("" call _getNextIDC), [3.5*_pW,13*_pH,11.2*_pW,5*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0,[0.11,0.106,0.125,1]] call _makeStructuredText;
_ctrl ctrlSetStructuredText (parseText (format ["<br/><t align='center'size='1.4'>Pro Drop</t><br/><t align='center'size='0.8'>Price = <img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='0.8' shadow='0' />%1</t>",XM8_airDrop_box3Cost]));
_ctrl = [
	_thisSlide,("1dropBut" call _getNextIDC),[3.5*_pW,6*_pH,11.2*_pW,1*_pH],
	"XM8_airDrop_boxCost = XM8_airDrop_box1Cost;
	XM8_airDrop_boxDonorCost = XM8_airDrop_box1DonorCost;
	XM8_airDrop_boxWepCount = XM8_airDrop_box1WepCount;
	XM8_airDrop_boxMagCount = XM8_airDrop_box1MagCount;
	XM8_airDrop_boxItemCount = XM8_airDrop_box1ItemCount;
	XM8_airDrop_boxRareCount = XM8_airDrop_box1RareCount;
	[] spawn XM8_airDrop_buyselected;","",""
] call _makeButton;
_ctrl ctrlSetStructuredText (parseText (format ["<t align='center'>CALL STARTER DROP"]));
_ctrl = [
	_thisSlide,("2dropBut" call _getNextIDC),[3.5*_pW,11.5*_pH,11.2*_pW,1*_pH],
	"XM8_airDrop_boxCost = XM8_airDrop_box2Cost;
	XM8_airDrop_boxDonorCost = XM8_airDrop_box2DonorCost;
	XM8_airDrop_boxWepCount = XM8_airDrop_box2WepCount;
	XM8_airDrop_boxMagCount = XM8_airDrop_box2MagCount;
	XM8_airDrop_boxItemCount = XM8_airDrop_box2ItemCount;
	XM8_airDrop_boxRareCount = XM8_airDrop_box2RareCount;
	[] spawn XM8_airDrop_buyselected;","",""
] call _makeButton;
_ctrl ctrlSetStructuredText (parseText (format ["<t align='center'>CALL MEDIUM DROP"]));
_ctrl = [
	_thisSlide,("2dropBut" call _getNextIDC),[3.5*_pW,17*_pH,11.2*_pW,1*_pH],
	"XM8_airDrop_boxCost = XM8_airDrop_box3Cost;
	XM8_airDrop_boxDonorCost = XM8_airDrop_box3DonorCost;
	XM8_airDrop_boxWepCount = XM8_airDrop_box3WepCount;
	XM8_airDrop_boxMagCount = XM8_airDrop_box3MagCount;
	XM8_airDrop_boxItemCount = XM8_airDrop_box3ItemCount;
	XM8_airDrop_boxRareCount = XM8_airDrop_box3RareCount;
	[] spawn XM8_airDrop_buySelected;","",""
] call _makeButton;
_ctrl ctrlSetStructuredText (parseText (format ["<t align='center'>CALL PRO DROP"]));

_ranNumArr = ['1','2','3','4','5','6','7','8','9','0'];
XM8_airDrop_a1 = _ranNumArr call BIS_fnc_selectRandom;
XM8_airDrop_a2 = _ranNumArr call BIS_fnc_selectRandom;
XM8_airDrop_a3 = _ranNumArr call BIS_fnc_selectRandom;
XM8_airDrop_a1a2a3 = XM8_airDrop_a1+XM8_airDrop_a2+XM8_airDrop_a3;

_ctrl = [_thisSlide, ("" call _getNextIDC), [18*_pW,2*_pH,12.8*_pW,16*_pH], "","PuristaMedium",1,"#FFFFFFFF","left",0,[0.11,0.106,0.125,1]] call _makeStructuredText;
_ctrl ctrlSetStructuredText (parseText (format ["<t align='center'size='0.8'> Air Drop ID: %2-%3%4<br/>(%1)<br/><br/>Once you buy an Air Drop, The Drop Zone will be marked on the map and announced to every player. We will try our best to send you the random items worth your money.<br/><img image='GG\xm8Apps\images\drop.paa' size='8.0' shadow='0' />",name player, XM8_airDrop_orderIDcharacters, XM8_airDrop_a1, XM8_airDrop_a2]));

_ctrl = [_thisSlide,("backButton" call _getNextIDC),[18*_pW,17*_pH,12.8*_pW,1*_pH],'["sideApps", 1] call ExileClient_gui_xm8_slide;',"",""] call _makeButton;
_ctrl ctrlSetStructuredText (parseText (format ["<t align='center'>CLOSE AIRDROP APP"]));
