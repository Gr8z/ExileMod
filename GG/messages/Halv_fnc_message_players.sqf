/*
	a3 epoch killfeed message fuction
	By Halv
	
	Copyright (C) 2015  Halvhjearne > README.md
*/
_type = _this select 0;
_message = _this select 1;
_sender = if(count _this > 2)then{_this select 2}else{player};
//diag_log format["%1 | %2 | %3",_sender,_type,_message];
switch (toLower _type)do{
	case "globalchat":{_sender globalChat _message;};
	case "sidechat":{_sender sideChat _message;};
	case "systemchat":{systemChat _message;};
	case "hint":{hint _message;};
	case "hintsilent":{hintSilent _message;};
	case "titletext":{titleText _message;};
	case "cuttext":{cutText _message;};
	case "dynamictext":{[_message,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH,0.3],30,0.5] spawn BIS_fnc_dynamicText;};
	case "typetext2":{[_message] spawn BIS_fnc_typeText2;};
	case "playsound":{playSound _message;};
};
