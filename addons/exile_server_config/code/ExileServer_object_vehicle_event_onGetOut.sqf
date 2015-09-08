/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * Modified by Rod Serling. Redistributed with permission.
 */
 
private["_vehicleObject"];
_vehicleObject = _this select 0;
if (_vehicleObject getVariable ["ExileIsPersistent", false]) then
{
	// Forget that. Skip the Queue
	//_vehicleObject call ExileServer_system_vehicleSaveQueue_addVehicle;
	if (diag_tickTime - (_vehicleObject getVariable ["ExileVehicleLastSavedAt", 30]) > 60) then
	{
		if(_vehicleObject getVariable ["ExileIsContainer",false])then
		{
			_vehicleObject call ExileServer_object_container_database_update;
		}
		else
		{
			if(isNumber(configFile >> "CfgVehicles" >> typeOf _vehicleObject >> "ExileIsDoor"))then
			{
				_vehicleObject call ExileServer_object_construction_database_lockUpdate;
			}
			else
			{
				_vehicleObject call ExileServer_object_vehicle_database_update;
			};
		};
		_vehicleObject setVariable ["ExileVehicleLastSavedAt", diag_tickTime];
	};
};
true