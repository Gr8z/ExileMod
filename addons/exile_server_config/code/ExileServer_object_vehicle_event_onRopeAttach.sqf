/**
 * © 2015 Daniel "Rod Serling" Phelps
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
 */

private ["_heli", "_rope", "_vehicle"];

_heli = _this select 0;
_rope = _this select 1;
_vehicle = _this select 2;

if !(simulationEnabled _vehicle) then
{
	diag_log "ExileServer - Enabling simulation for disabled vehicle on slingload rope attach.";
	_vehicle enableSimulationGlobal true;
};