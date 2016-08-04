/*  
	customize.sqf
	
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

GG_SB_ICON_BANK = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Bank.paa";		//STRING - Path to bank icon
GG_SB_ICON_CLAN = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Family.paa";	//STRING - Path to family icon
GG_SB_ICON_COMPASS = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Compass.paa";	//STRING - Path to compass icon
GG_SB_ICON_GRID = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Grid.paa";		//STRING - Path to grid icon
GG_SB_ICON_HP = 		"GG\ExAdClient\StatsBar\Icons\ExAd_Health.paa";	//STRING - Path to health icon
GG_SB_ICON_HUNGER = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Hunger.paa";	//STRING - Path to hunger icon
GG_SB_ICON_KD = 		"GG\ExAdClient\StatsBar\Icons\ExAd_KD.paa";		//STRING - Path to kill death ratio icon
GG_SB_ICON_PLAYERS = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Players.paa";	//STRING - Path to players icon
GG_SB_ICON_RESPECT = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Respect.paa";	//STRING - Path to respect icon
GG_SB_ICON_TEMP = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Temp.paa";		//STRING - Path to temperature icon
GG_SB_ICON_THIRST = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Thirst.paa";	//STRING - Path to thirst icon
GG_SB_ICON_TIMER = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Restart.paa";	//STRING - Path to restart icon
GG_SB_ICON_Wallet = 	"GG\ExAdClient\StatsBar\Icons\ExAd_Wallet.paa";	//STRING - Path to POP TABS icon
GG_SB_ICON_LOGO = 	"GG\images\logo.paa";		//STRING - Path to logo

GG_SB_COMPONENTS_COLORS = ["#000000", "#440B00","#FE1106","#CA7400","#A9C700","#11BF03"]; //STRINGS - Array of color codes, from bad to good. 

GG_SB_Timer = 2; 										//SCALAR - Restart time measured in hours. 

GG_SB_GUI_POS_Default = 	[-0.000156274 * safezoneW + safezoneX,0.973 * safezoneH + safezoneY,1.00031 * safezoneW,0.022 * safezoneH]; //ARRAY - Position with this attributes [x,y,w,h];
GG_SB_GUI_TextColor_Default = [1,1,1,1];				//ARRAY - rgba array with values between 0-1, 0 => 0 | 255 => 1
GG_SB_GUI_BgColor_Default = [0.074, 0.082, 0.105, 0.85];				//ARRAY - rgba array with values between 0-1, 0 => 0 | 255 => 1

GG_SB_Text_Margin_Default = " ";						//STRING - Margin between components measured in blankspaces
GG_SB_Text_InnerMargin_Default = " ";					//STRING - Margin between icon and text within the component measured in blankspaces
GG_SB_Text_Font_Default = "PuristaLight";			//STRING - Font family
GG_SB_Text_Align_Default = "center";					//STRING - Alignment (left,center,right)
GG_SB_Text_Size_Default = 0.90;							//SCALAR - Text size ( 0-2 )
GG_SB_Img_Size_Default = 0.90;							//SCALAR - Icon size ( 0-2 )

GG_SB_Show_KD_Default = false;						//BOOLEAN - Template, show kill death ratio
GG_SB_Show_HP_Default = true;							//BOOLEAN - Template, show health
GG_SB_Show_Thirst_Default = false;					//BOOLEAN - Template, show thirst
GG_SB_Show_Hunger_Default = false;					//BOOLEAN - Template, show hunger
GG_SB_Show_Wallet_Default = true;						//BOOLEAN - Template, show pop tabs on player
GG_SB_Show_Bank_Default = false;						//BOOLEAN - Template, show pop tabs in locker
GG_SB_Show_Respect_Default = true;					//BOOLEAN - Template, show respect
GG_SB_Show_FPS_Default = true;						//BOOLEAN - Template, show fps
GG_SB_Show_Time_Default = true;						//BOOLEAN - Template, show restart timer
GG_SB_Show_Temp_Default = false;						//BOOLEAN - Template, show body temperature
GG_SB_Show_Grid_Default = false;						//BOOLEAN - Template, show grid location
GG_SB_Show_Compass_Default = false;					//BOOLEAN - Template, show compass
GG_SB_Show_PlayerCount_Default = true;				//BOOLEAN - Template, show online players count
GG_SB_Show_ClanCount_Default = false;					//BOOLEAN - Template, show online family members count 


GG_SB_Allow_KD = 			true;						//BOOLEAN - Allow showing kill death ratio
GG_SB_Allow_HP = 			true;						//BOOLEAN - Allow showing health
GG_SB_Allow_Thirst = 		true;						//BOOLEAN - Allow showing thirst
GG_SB_Allow_Hunger = 		true;						//BOOLEAN - Allow showing hunger
GG_SB_Allow_Wallet = 		true;						//BOOLEAN - Allow showing wallet
GG_SB_Allow_Bank = 		true;						//BOOLEAN - Allow showing bank saldo
GG_SB_Allow_Respect = 	true;						//BOOLEAN - Allow showing respect
GG_SB_Allow_FPS = 		true;						//BOOLEAN - Allow showing fps
GG_SB_Allow_Time = 		true;						//BOOLEAN - Allow showing restart timer
GG_SB_Allow_Temp = 		false;						//BOOLEAN - Allow showing body temperature
GG_SB_Allow_Grid = 		true;						//BOOLEAN - Allow showing grid location
GG_SB_Allow_Compass = 	true;						//BOOLEAN - Allow showing compass
GG_SB_Allow_PlayerCount = true;						//BOOLEAN - Allow showing players count 
GG_SB_Allow_ClanCount = 	false;						//BOOLEAN - Allow showing online family members count
