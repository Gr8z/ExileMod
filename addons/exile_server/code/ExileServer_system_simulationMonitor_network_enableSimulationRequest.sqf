/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_parameters","_netId","_object"];
_parameters = _this select 1;
_netId = _parameters select 0;
try 
{
	_object = objectFromNetId _netId;
	if (isNull _object) then
	{
		throw "Cannot enable simulation for unknown network ID!";
	};
	if !(simulationEnabled _object) then 
	{
		_object enableSimulationGlobal true;
	};
}
catch
{
	_exception call ExileServer_util_log;
};
true