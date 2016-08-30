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

_path = "GG\ExAdClient\Hacking\customize.sqf";
call compile preprocessFileLineNumbers _path;

if(isNil "ExAd_HACKING_MIN_PLAYERS_ONLINE")then{ExAd_HACKING_MIN_PLAYERS_ONLINE = 30;};
if(isNil "ExAd_HACKING_ALLOWED_HACKS")then{ExAd_HACKING_ALLOWED_HACKS = 1;};
if(isNil "ExAd_HACKING_MAX_TIME")then{ExAd_HACKING_MAX_TIME = 1200;};
if(isNil "ExAd_HACKING_MAX_DISTANCE")then{ExAd_HACKING_MAX_DISTANCE = 50;};
if(isNil "ExAd_HACKING_TERRITORY_MAX")then{ExAd_HACKING_TERRITORY_MAX = 3;};
if(isNil "ExAd_HACKING_MARKER_COLOR")then{ExAd_HACKING_MARKER_COLOR = "ColorOrange";};
if(isNil "ExAd_HACKING_MARKER_TITLE")then{ExAd_HACKING_MARKER_TITLE = "Hacker activity";};
if(isNil "ExAd_HACKING_FAILED_HACK")then{ExAd_HACKING_FAILED_HACK = 0.15;};

if(isNil "ExAd_VG_ACCESS_LEVEL")then{ExAd_VG_ACCESS_LEVEL = 1;};

if(isNil "ExAd_HACKING_FAILED_HACK")then{ExAd_VG_ACCESS_LEVEL = 1;}; /*Needs to be here if peolpe don't use the VirtualGarage*/

["Connection failed! Territory Wi-Fi is down!", "Connection failed! Territory Wi-Fi is down!"] call ExAd_fnc_localize;
["Wi-Fi occupied!!", "Wi-Fi occupied!!"] call ExAd_fnc_localize;
["The laptop overloaded and got destroyed! Another hacker is already using the grid.", "The laptop overloaded and got destroyed! Another hacker is already using the grid."] call ExAd_fnc_localize;
["No Wi-Fi available!", "No Wi-Fi available!"] call ExAd_fnc_localize;
["Hack Activity", "Hack Activity"] call ExAd_fnc_localize;
["A brute force hack is detected on the grid!", "A brute force hack is detected on the grid!"] call ExAd_fnc_localize;
["Hack successful! The Virtual Garage unloaded a %1", "Hack successful! The Virtual Garage unloaded a %1"] call ExAd_fnc_localize;
["Hack successful! No vehicles were stored in the Virtual Garage.", "Hack successful! No vehicles were stored in the Virtual Garage."] call ExAd_fnc_localize;
["Hack successful! The safe is now unlocked.", "Hack successful! The safe is now unlocked."] call ExAd_fnc_localize;
["Hack has been interupted", "Hack has been interupted"] call ExAd_fnc_localize;
["Hack failed! Circuits overloaded!", "Hack failed! Circuits overloaded!"] call ExAd_fnc_localize;
