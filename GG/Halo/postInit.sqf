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

execVM "GG\Halo\customize.sqf";

[] spawn {
	while {true} do {
		waitUntil{!isNil "ExileClientLoadedIn"};
		UISleep 0.1;
		waitUntil{ExileClientLoadedIn};
		UISleep 0.1;
		waitUntil{alive player};
		
		ExHP_ACTION_PARACHUTE = player addaction ["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' /> Open Parachute!</t>", "call ExHP_fnc_pullParachute", [], 6, true, true, "", "vehicle player == player && (getPos player) select 2 > ExHP_ACTION_PARACHUTE_HEIGHT"];
		ExHP_ACTION_EJECT = player addaction ["<t color='#E48A36'><img image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa' /> Halo Jump</t>", "call ExHP_fnc_ejectPlayer", [], 6, false, true, "", "(vehicle player) != player && (getPos player) select 2 > ExHP_ACTION_EJECT_HEIGHT"];
		
		waitUntil{!alive player};
		player removeAction ExHP_ACTION_PARACHUTE;
		player removeAction ExHP_ACTION_EJECT;
	}
};