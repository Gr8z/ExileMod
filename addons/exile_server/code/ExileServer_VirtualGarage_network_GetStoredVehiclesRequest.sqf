/*

 	  Name: ExileServer_VirtualGarage_network_GetStoredVehicles.sqf
 	  Author(s): Shix
      Copyright (c) 2016 Shix
      This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
      To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private ["_payload","_sessionID","_uid","_StoredVehicles"];
_payload = _this;
_sessionID = (_payload select 0);
_uid = (_payload select 1) select 0;
_StoredVehicles = format ["getStoredVehicles:%1", _uid] call ExileServer_system_database_query_selectFull;
[_sessionID,"GetStoredVehiclesResponse",[_StoredVehicles]] call ExileServer_system_network_send_to;
