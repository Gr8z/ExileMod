/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach
[
  ['ExileClient_VirtualGarage_AccessGarage', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_AccessGarage.sqf'],
  ['ExileClient_VirtualGarage_GetNearbyVehicles', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_GetNearbyVehicles.sqf'],
  ['ExileClient_VirtualGarage_network_GetStoredVehiclesRequest', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_network_GetStoredVehiclesRequest.sqf'],
  ['ExileClient_VirtualGarage_network_GetStoredVehiclesResponse', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_network_GetStoredVehiclesResponse.sqf'],
  ['ExileClient_VirtualGarage_network_RetrieveVehicleRequest', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_network_RetrieveVehicleRequest.sqf'],
  ['ExileClient_VirtualGarage_network_RetrieveVehicleResponse', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_network_RetrieveVehicleResponse.sqf'],
  ['ExileClient_VirtualGarage_network_StoreVehicleRequest', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_network_StoreVehicleRequest.sqf'],
  ['ExileClient_VirtualGarage_network_StoreVehicleResponse', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_network_StoreVehicleResponse.sqf'],
  ['ExileClient_VirtualGarage_onNearByVehiclesListSelChanged', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_onNearByVehiclesListSelChanged.sqf'],
  ['ExileClient_VirtualGarage_onStoredVehiclesListSelChanged', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_onStoredVehiclesListSelChanged.sqf'],
  ['ExileClient_VirtualGarage_onVirtualGarageDialogLoad', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_onVirtualGarageDialogLoad.sqf'],
  ['ExileClient_VirtualGarage_VehicleDraw3DIcon', 'GG\VirtualGarage\Functions\ExileClient_VirtualGarage_VehicleDraw3DIcon.sqf']
];
