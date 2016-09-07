/*
*  Ported From Wasteland
*  Author: ContractCoders.net
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/

showmarkers = true;
while {showmarkers} do
{
    {
        _x params ["_markerName","_markerPos"];
        
        _friendlyCount = 0;
        _enemyCount = 0;

        {
            if (isPlayer _x && alive _x && {_x distance _markerPos < CC_blackMarketRadius}) then
            {
                if (group _x == group player) then
                {
                    _friendlyCount = _friendlyCount + 1;
                }
                else
                {
                    _enemyCount = _enemyCount + 1;
                };
            };
        } forEach playableUnits;

        if (player distance _markerPos < CC_blackMarketRadius) then
        {
            if(_enemyCount > 0) then
            {
                if (_friendlyCount > 0) then
                {
                    [_forEachIndex, "MIXED", true, _markerName] call _setStatus;
                }
                else
                {
                    [_forEachIndex, "ENEMY", true, _markerName] call _setStatus;
                };
            }
            else
            {
                [_forEachIndex, "FRIENDLY", true, _markerName] call _setStatus;
            };
        }
        else
        {
            if (_enemyCount > 0) then
            {
                if (_friendlyCount > 0) then
                {
                    [_forEachIndex, "MIXED", false, _markerName] call _setStatus;
                }
                else
                {
                    [_forEachIndex, "ENEMY", false, _markerName] call _setStatus;
                };
            }
            else
            {
                if (_friendlyCount > 0) then
                {
                    [_forEachIndex, "FRIENDLY", false, _markerName] call _setStatus;
                }
                else
                {
                    [_forEachIndex, "EMPTY", false, _markerName] call _setStatus;
                };
            };
        };
    } forEach CC_blackMarketPos;
    
    sleep 1;
};