/*  
	fn_sbThread.sqf
	
	Copyright 2016 Jan Babor

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/
private["_display","_statsBarCtrl","_text"];

disableSerialization;

_display = uiNameSpace getVariable ["ExAd_STATSBAR",displayNull];	
_statsBarCtrl = _display displayCtrl GG_SB_Dialog_CtrlBar_IDC;

_text = format[
	"<t align='%2' shadow='0' valign='middle' font='%1' size='%3'>%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%4</t>",
	GG_SB_Text_Font,
	GG_SB_Text_Align,
	GG_SB_Text_Size,
	GG_SB_Text_Margin,
	(if(GG_SB_Show_KD && GG_SB_Allow_KD)then{call ExAd_fnc_getKDStr}else{""}),
	(if(GG_SB_Show_HP && GG_SB_Allow_HP)then{call ExAd_fnc_getHPStr}else{""}),
	(if(GG_SB_Show_Thirst && GG_SB_Allow_Thirst)then{call ExAd_fnc_getThirstStr}else{""}),
	(if(GG_SB_Show_Hunger && GG_SB_Allow_Hunger)then{call ExAd_fnc_getHungerStr}else{""}),
	(if(GG_SB_Show_Wallet && GG_SB_Allow_Wallet)then{call ExAd_fnc_getWalletStr}else{""}),
	(if(GG_SB_Show_Bank && GG_SB_Allow_Bank)then{call ExAd_fnc_getBankStr}else{""}),
	(if(GG_SB_Show_Respect && GG_SB_Allow_Respect)then{call ExAd_fnc_getRespectStr}else{""}),
	(if(GG_SB_Show_FPS && GG_SB_Allow_FPS)then{call ExAd_fnc_getFPSStr}else{""}),
	(if(GG_SB_Show_Time && GG_SB_Allow_Time)then{call ExAd_fnc_getTimerStr}else{""}),
	(if(GG_SB_Show_Temp && GG_SB_Allow_Temp)then{call ExAd_fnc_getTempStr}else{""}),
	(if(GG_SB_Show_Grid && GG_SB_Allow_Grid)then{call ExAd_fnc_getGridStr}else{""}),
	(if(GG_SB_Show_Compass && GG_SB_Allow_Compass)then{call ExAd_fnc_getCompassStr}else{""}),
	(if(GG_SB_Show_PlayerCount && GG_SB_Allow_PlayerCount)then{call ExAd_fnc_getPlayersStr}else{""}),
	(if(GG_SB_Show_ClanCount && GG_SB_Allow_ClanCount)then{call ExAd_fnc_getClanStr}else{""})
];

_statsBarCtrl ctrlSetStructuredText parseText _text;

true