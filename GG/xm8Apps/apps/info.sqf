disableSerialization;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
createDialog "RscDisplayWelcome";
_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayCtrl 2400;
_textSpoiler = _display displayCtrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'></t><br/>";
_message = _message + "<t align='center' size='2' shadow='0'><a href= 'http://ghostzgamerz.com/' color='#ff9900'>[GG] Ghostz Gamerz</a></t><br/>";
_message = _message + "______________________________________________________________________________________<br/><br/>";

_message = _message + "<t align='center' size='1' shadow='0'>Click this link to get to our website: <a href= 'http://ghostzgamerz.com/' color='#ff9900'>www.GHOSTZGAMERZ.com</a><br/>";
_message = _message + "Click this link to read full rules: <a href= 'http://ghostzgamerz.com/categories/rules.181/' color='#ff9900'>Rules</a><br/>";
_message = _message + "Here is our Team Speak address: <a href= 'ts3server://ts.ghostzgamerz.com' color='#ff9900'>ts.ghostzgamerz.com</a><br/><br/>";
_message = _message + "______________________________________________________________________________________<br/><br/>";

_text1 ctrlSetStructuredText (parseText _message);
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlCommit 0;
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
