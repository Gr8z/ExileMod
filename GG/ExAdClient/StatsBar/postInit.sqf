/*  
	postInit.sqf
	
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

_path = "GG\ExAdClient\StatsBar\customize.sqf";
call compile preprocessFileLineNumbers _path;

if(isNil "GG_SB_ICON_BANK")then{GG_SB_ICON_BANK = "ExAdClient\StatsBar\Icons\ExAd_Bank.paa";};
if(isNil "GG_SB_ICON_CLAN")then{GG_SB_ICON_CLAN = "ExAdClient\StatsBar\Icons\ExAd_Family.paa";};
if(isNil "GG_SB_ICON_COMPASS")then{GG_SB_ICON_COMPASS = "ExAdClient\StatsBar\Icons\ExAd_Compass.paa";};
if(isNil "GG_SB_ICON_GRID")then{GG_SB_ICON_GRID = "ExAdClient\StatsBar\Icons\ExAd_Grid.paa";};
if(isNil "GG_SB_ICON_HP")then{GG_SB_ICON_HP = "ExAdClient\StatsBar\Icons\ExAd_Health.paa";};
if(isNil "GG_SB_ICON_HUNGER")then{GG_SB_ICON_HUNGER = "ExAdClient\StatsBar\Icons\ExAd_Hunger.paa";};
if(isNil "GG_SB_ICON_KD")then{GG_SB_ICON_KD = "ExAdClient\StatsBar\Icons\ExAd_KD.paa";};
if(isNil "GG_SB_ICON_PLAYERS")then{GG_SB_ICON_PLAYERS = "ExAdClient\StatsBar\Icons\ExAd_Players.paa";};
if(isNil "GG_SB_ICON_RESPECT")then{GG_SB_ICON_RESPECT = "ExAdClient\StatsBar\Icons\ExAd_Respect.paa";};
if(isNil "GG_SB_ICON_TEMP")then{GG_SB_ICON_TEMP = "ExAdClient\StatsBar\Icons\ExAd_Temp.paa";};
if(isNil "GG_SB_ICON_THIRST")then{GG_SB_ICON_THIRST = "ExAdClient\StatsBar\Icons\ExAd_Thirst.paa";};
if(isNil "GG_SB_ICON_TIMER")then{GG_SB_ICON_TIMER = "ExAdClient\StatsBar\Icons\ExAd_Restart.paa";};
if(isNil "GG_SB_ICON_Wallet")then{GG_SB_ICON_Wallet = "ExAdClient\StatsBar\Icons\ExAd_Wallet.paa";};
if(isNil "GG_SB_ICON_LOGO")then{GG_SB_ICON_LOGO = "ExAdClient\Core\Img\ExAd_logo_128.paa";};

if(isNil "GG_SB_GUI_POS_Default")then{GG_SB_GUI_POS_Default = 	[safeZoneX, safeZoneY + safeZoneH - 32 * pixelH, safeZoneW, 30 * pixelH];};
if(isNil "GG_SB_GUI_TextColor_Default")then{GG_SB_GUI_TextColor_Default = [1,1,1,1];};
if(isNil "GG_SB_GUI_BgColor_Default")then{GG_SB_GUI_BgColor_Default = [0,0,0,0];};

if(isNil "GG_SB_Text_Margin_Default")then{GG_SB_Text_Margin_Default = " ";};
if(isNil "GG_SB_Text_InnerMargin_Default")then{GG_SB_Text_InnerMargin_Default = "";};
if(isNil "GG_SB_Text_Font_Default")then{GG_SB_Text_Font_Default = "OrbitronLight";};
if(isNil "GG_SB_Text_Align_Default")then{GG_SB_Text_Align_Default = "center";};
if(isNil "GG_SB_Text_Size_Default")then{GG_SB_Text_Size_Default = 1;};
if(isNil "GG_SB_Img_Size_Default")then{GG_SB_Img_Size_Default = 1;};

if(isNil "GG_SB_Timer")then{GG_SB_Timer = 3;};

if(isNil "GG_SB_Show_KD_Default")then{GG_SB_Show_KD_Default = false;};
if(isNil "GG_SB_Show_HP_Default")then{GG_SB_Show_HP_Default = true;};
if(isNil "GG_SB_Show_Thirst_Default")then{GG_SB_Show_Thirst_Default = false;};
if(isNil "GG_SB_Show_Hunger_Default")then{GG_SB_Show_Hunger_Default = false;};
if(isNil "GG_SB_Show_Wallet_Default")then{GG_SB_Show_Wallet_Default = true;};
if(isNil "GG_SB_Show_Bank_Default")then{GG_SB_Show_Bank_Default = false;};
if(isNil "GG_SB_Show_Respect_Default")then{GG_SB_Show_Respect_Default = false;};
if(isNil "GG_SB_Show_FPS_Default")then{GG_SB_Show_FPS_Default = true;};
if(isNil "GG_SB_Show_Time_Default")then{GG_SB_Show_Time_Default = true;};
if(isNil "GG_SB_Show_Temp_Default")then{GG_SB_Show_Temp_Default = true;};
if(isNil "GG_SB_Show_Grid_Default")then{GG_SB_Show_Grid_Default = true;};
if(isNil "GG_SB_Show_Compass_Default")then{GG_SB_Show_Compass_Default = true;};
if(isNil "GG_SB_Show_PlayerCount_Default")then{GG_SB_Show_PlayerCount_Default = true;};
if(isNil "GG_SB_Show_ClanCount_Default")then{GG_SB_Show_ClanCount_Default = false;};


if(isNil "GG_SB_COMPONENTS_COLORS")then{GG_SB_COMPONENTS_COLORS = ["#000000", "#440B00","#FE1106","#CA7400","#A9C700","#11BF03"];};
if(isNil "GG_SB_Dialog_Layer")then{GG_SB_Dialog_Layer = 102;};
if(isNil "GG_SB_Dialog_CtrlLogo_IDC")then{GG_SB_Dialog_CtrlLogo_IDC = 1000;};
if(isNil "GG_SB_Dialog_CtrlBar_IDC")then{GG_SB_Dialog_CtrlBar_IDC = 1100;};

{
	_x call ExAd_fnc_localize;
}forEach [
	["STR_GG_SB_APP_GO_BACK", "Go Back"],
	["STR_GG_SB_APP_CB_KD", "Kill/Death Ratio"],
	["STR_GG_SB_APP_CB_HP", "Health"],
	["STR_GG_SB_APP_CB_THIRST", "Thirst"],
	["STR_GG_SB_APP_CB_HUNGER", "Hunger"],
	["STR_GG_SB_APP_CB_WALLET", "POP TABS in wallet"],
	["STR_GG_SB_APP_CB_BANK", "POP TABS in bank"],
	["STR_GG_SB_APP_CB_RESPECT", "Respect"],
	["STR_GG_SB_APP_CB_COLORS", "Use color indications"],
	["STR_GG_SB_APP_CB_FPS", "FPS"],
	["STR_GG_SB_APP_CB_TIMER", "Restart time"],
	["STR_GG_SB_APP_CB_TEMP", "Body Temperature"],
	["STR_GG_SB_APP_CB_GRID", "Grid location"],
	["STR_GG_SB_APP_CB_COMPASS", "Compass"],
	["STR_GG_SB_APP_CB_PLAYERS", "Players online"],
	["STR_GG_SB_APP_CB_CLAN_MEMBERS", "Family members online"],
	["STR_GG_SB_APP_CB_HIDE_EXILE_SB", "Hide Exile Status bar"],
	["STR_GG_SB_APP_SLIDER_BG_COLOR", "Background Color"],
	["STR_GG_SB_APP_SLIDER_POS_SIZE", "Position/Size"],
	["STR_GG_SB_APP_COMBO_FONT", "Font"],
	["STR_GG_SB_APP_COMBO_TOOLTIP_FONT", "Font"],
	["STR_GG_SB_APP_COMBO_TOOLTIP_ALIGN", "Align"],
	["STR_GG_SB_APP_SLIDER_TEXT_COLOR", "Text Color"],
	["STR_GG_SB_APP_SLIDER_UPDATE_RATE", "Update Rate"],
	["STR_GG_SB_APP_SLIDER_TEXT_SIZE", "Text Size"],
	["STR_GG_SB_APP_SLIDER_TEXT_MARGIN", "Margin"],
	["STR_GG_SB_APP_SLIDER_TEXT_PADDING", "Padding"],
	["STR_GG_SB_APP_SLIDER_IMG_SIZE", "Image Size"],
	["STR_GG_SB_APP_BTN_SHOW", "Show"],
	["STR_GG_SB_APP_BTN_HIDE", "Hide"]
];
	


GG_SB_Update_Rate = profileNamespace getVariable ["GG_SB_Update_Rate", 1];
GG_SB_Active = profileNamespace getVariable ["GG_SB_Active", true];

GG_SB_GUI_POS = profileNamespace getVariable ["GG_SB_GUI_POS", GG_SB_GUI_POS_Default];
GG_SB_GUI_TextColor = profileNamespace getVariable ["GG_SB_GUI_TextColor", GG_SB_GUI_TextColor_Default];
GG_SB_GUI_BgColor = profileNamespace getVariable ["GG_SB_GUI_BgColor", GG_SB_GUI_BgColor_Default];

GG_SB_Text_Margin = profileNamespace getVariable ["GG_SB_Text_Margin", GG_SB_Text_Margin_Default];
GG_SB_Text_InnerMargin = profileNamespace getVariable ["GG_SB_Text_InnerMargin", GG_SB_Text_InnerMargin_Default];
GG_SB_Text_Font = profileNamespace getVariable ["GG_SB_Text_Font", GG_SB_Text_Font_Default];
GG_SB_Text_Align = profileNamespace getVariable ["GG_SB_Text_Align", GG_SB_Text_Align_Default];
GG_SB_Text_Size = profileNamespace getVariable ["GG_SB_Text_Size", GG_SB_Text_Size_Default];
GG_SB_Img_Size = profileNamespace getVariable ["GG_SB_Img_Size", GG_SB_Img_Size_Default];

GG_SB_Show_KD = profileNamespace getVariable ["GG_SB_Show_KD", GG_SB_Show_KD_Default];
GG_SB_Show_HP = profileNamespace getVariable ["GG_SB_Show_HP", GG_SB_Show_HP_Default];
GG_SB_Show_Thirst = profileNamespace getVariable ["GG_SB_Show_Thirst", GG_SB_Show_Thirst_Default];
GG_SB_Show_Hunger = profileNamespace getVariable ["GG_SB_Show_Hunger", GG_SB_Show_Hunger_Default];
GG_SB_Show_Wallet = profileNamespace getVariable ["GG_SB_Show_Wallet", GG_SB_Show_Wallet_Default];
GG_SB_Show_Bank = profileNamespace getVariable ["GG_SB_Show_Bank", GG_SB_Show_Bank_Default];
GG_SB_Show_Respect = profileNamespace getVariable ["GG_SB_Show_Respect", GG_SB_Show_Respect_Default];
GG_SB_Show_FPS = profileNamespace getVariable ["GG_SB_Show_FPS", GG_SB_Show_FPS_Default];
GG_SB_Show_Time = profileNamespace getVariable ["GG_SB_Show_Time", GG_SB_Show_Time_Default];
GG_SB_Show_Temp = profileNamespace getVariable ["GG_SB_Show_Temp", GG_SB_Show_Temp_Default];
GG_SB_Show_Grid = profileNamespace getVariable ["GG_SB_Show_Grid", GG_SB_Show_Grid_Default];
GG_SB_Show_Compass = profileNamespace getVariable ["GG_SB_Show_Compass", GG_SB_Show_Compass_Default];
GG_SB_Show_PlayerCount = profileNamespace getVariable ["GG_SB_Show_PlayerCount", GG_SB_Show_PlayerCount_Default];
GG_SB_Show_ClanCount = profileNamespace getVariable ["GG_SB_Show_ClanCount", GG_SB_Show_ClanCount_Default];

GG_SB_COMPONENTS_ACTIVE_COLORS = profileNamespace getVariable ["GG_SB_COMPONENTS_ACTIVE_COLORS", true];
GG_SB_EXILE_HUD_ACTIVE = profileNamespace getVariable ["GG_SB_EXILE_HUD_ACTIVE", true];

if(!GG_SB_Active)exitWith{false};

[] spawn {
	waituntil { !isnil "bis_fnc_init" && !isNull findDisplay 46 && alive player && !isNil "ExileClientLoadedIn" };
	waitUntil { ExileClientLoadedIn };

	call ExAd_fnc_loadSB;
	
	if(!GG_SB_EXILE_HUD_ACTIVE)then{
		call ExAd_fnc_toggleExileHUD;
	};

};