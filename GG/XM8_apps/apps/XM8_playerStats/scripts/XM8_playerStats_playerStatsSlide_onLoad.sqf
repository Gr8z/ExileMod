/*	XM8 playerStats app by
	
	-Script description-
*/

private ["_getNextIDC","_pW","_pH","_display","_slides","_unloadScript","_error","_thisSlide","_makeButton","_makeStructuredText","_makePicture",
"_playerMoney","_playerRespect","_playerKills","_playerDeaths","_playerClassName","_playerKD","_playerPrimary","_playerPrimaryDispName","_playerPrimaryPic"];

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
	_slideClassName = "playerStatsSlide";
	_map = XM8_playerStats_playerStatsSlideIDCmap;
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
_makePicture = {
	params ["_parent","_idc","_position","_picture","_color","_enable","_keepAspect","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate [(if (_keepAspect) then {"RscPictureKeepAspect"} else {"RscPicture"}), _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetText _picture;
	_ctrl ctrlSetTextColor _color;
	_ctrl ctrlEnable _enable;
	_ctrl ctrlSetTooltip _tooltip;
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

XM8_playerStats_playerStatsSlideIDCmap = [];

_thisSlide = _display ctrlCreate ["RscExileXM8Slide",("playerStatsSlide" call _getNextIDC),_slides];
[_thisSlide,("backButton" call _getNextIDC),[26*_pW,16*_pH,6*_pW,1*_pH],'["sideApps", 1] call ExileClient_gui_xm8_slide;',"GO BACK",""] call _makeButton;

_playerMoney = ExileClientPlayerMoney;
_playerRespect = ExileClientPlayerScore;
_playerKills = ExileClientPlayerKills;
_playerDeaths = ExileClientPlayerDeaths;
_playerClassName = ExileClientClanName;
_playerKD = (str(_playerKills/_playerDeaths)) select [0,4];;
_playerPrimary = primaryWeapon player;
_playerPrimaryDispName = getText (configfile >> "CfgWeapons" >> _playerPrimary >> "DisplayName");
_playerPrimaryPic = getText (configfile >> "CfgWeapons" >> _playerPrimary >> "Picture");

[_thisSlide, ("" call _getNextIDC), [3.9*_pW,2.5*_pH,13*_pW,5*_pH], (format["Name: %1", name player]),"PuristaSemiBold",1.25,"#FFFFFFFF","left",1] call _makeStructuredText;
[_thisSlide, ("" call _getNextIDC), [3.9*_pW,4.5*_pH,13*_pW,5*_pH], (format["Money: %1",_playerMoney]),"PuristaSemiBold",1.25,"#FFFFFFFF","left",1] call _makeStructuredText;
[_thisSlide, ("" call _getNextIDC), [3.9*_pW,6.5*_pH,13*_pW,5*_pH], (format["Respect: %1",_playerRespect]),"PuristaSemiBold",1.25,"#FFFFFFFF","left",1] call _makeStructuredText;
[_thisSlide, ("" call _getNextIDC), [3.9*_pW,8.5*_pH,13*_pW,5*_pH], (Format["Kills: %1",_playerKills]),"PuristaSemiBold",1.25,"#FFFFFFFF","left",1] call _makeStructuredText;
[_thisSlide, ("" call _getNextIDC), [3.9*_pW,10.5*_pH,13*_pW,5*_pH], (Format["Deaths: %1",_playerDeaths]),"PuristaSemiBold",1.25,"#FFFFFFFF","left",1] call _makeStructuredText;
[_thisSlide, ("" call _getNextIDC), [22*_pW,2*_pH,6*_pW,15*_pH], "K/D","PuristaSemiBold",2,"#FFFFFFFF","center",1] call _makeStructuredText;

_ctrl = [_thisSlide, ("" call _getNextIDC), [22*_pW,4*_pH,6*_pW,4*_pH], "","PuristaSemiBold",2,"#FFFFFFFF","center",1] call _makeStructuredText;
_ctrl ctrlSetStructuredText parseText (format["<t size='1.8' align='center'>%1</t>",_playerKD]);

if (_playerPrimary != "") then {
	[_thisSlide, ("" call _getNextIDC), [18*_pW,8.2*_pH,14*_pW,2*_pH], _playerPrimaryDispName,"PuristaBold",1.2,"#FFFFFFFF","center",1] call _makeStructuredText;
	[_thisSlide, ("" call _getNextIDC), [18*_pW,8.2*_pH,12*_pW,6*_pH],_playerPrimaryPic,[1,1,1,1], false, true, ""] call _makePicture;
};

_ctrl = [_thisSlide, ("" call _getNextIDC), [0*_pW,14*_pH,34*_pW,2*_pH], "","PuristaSemiBold",2,"#FFFFFFFF","center",1] call _makeStructuredText;
_ctrl ctrlSetStructuredText parseText "<t size='1.2' align='center'><a href='http://ghostzgamerz.com/pages/ExileCherno'>CLICK HERE TO SEE LEADERBOARDS</a></t>";
_ctrl ctrlEnable true;
