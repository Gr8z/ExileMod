/*
	infiSTAR: use select instead of find - much faster (even tho it doesn't matter here)
*/
private["_display","_infoControl","_info","_hitpointInfo","_hitpointNameAsAnArraySoArmaCanToBasicStringOperationsMuchWow","_hitPointName","_hitpointDamage","_hitpointHealth","_hitpointColor","_hitpointName"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_infoControl = _display displayCtrl 4121;
_info = "";
_hitpointInfo = getAllHitPointsDamage (vehicle player);
{
	if !(_x isEqualTo "") then 
	{
		if(_x select [0,3] == "Hit")then
		{
			_hitPointName = _x select [4,(count _x)-4];
		}
		else
		{
			_hitPointName = _x;
		};
		_hitpointDamage = (_hitpointInfo select 2) select _forEachIndex;
		_hitpointHealth = round (100 - (_hitpointDamage * 100));
		_hitpointColor = "#fcfdff";
		if (_hitpointHealth <= 25) then 
		{
			_hitpointColor = "#c72650";
		};
		if !(_info isEqualTo "") then
		{
			_info = _info + "<br/>";
		};	
		_info = _info + (format ["<t size='1.25' align='left'>%1</t><t size='1.25' align='right' color='%2'>%3%4</t>", _hitpointName, _hitpointColor, _hitpointHealth, '%']);
	};
} forEach (_hitpointInfo select 0);
_infoControl ctrlSetStructuredText (parseText _info);
[_infoControl] call BIS_fnc_ctrlTextHeight;