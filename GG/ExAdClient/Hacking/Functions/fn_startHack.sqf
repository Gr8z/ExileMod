/*  
	fn_startHack.sqf
	
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

if !("Exile_Item_Laptop" in (magazines player)) exitWith {
	["ErrorTitleAndText", ["Hack", "You need a laptop in your inventory to start hacking"]] call ExileClient_gui_toaster_addTemplateToast;
};

if (({alive _x}count playableUnits) <= ExAd_HACKING_MIN_PLAYERS_ONLINE) exitWith {
	["ErrorTitleAndText", ["Hack", "Not enough people online to initiate the hack"]] call ExileClient_gui_toaster_addTemplateToast;
};

player playActionNow "SitDown";

["startHack", [netId (_this select 0), netId player]] call ExAd_fnc_serverDispatch;