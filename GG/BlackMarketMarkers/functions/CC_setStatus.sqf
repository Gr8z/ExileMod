/*
*  Ported From Wasteland
*  Author: ContractCoders.net
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/

_setStatus =
{
    if(_status select (_this select 0) == (_this select 1)) exitWith {};
 
    _markerNameZone = format ["BlackMarketZone_%1", _gunStores select (_this select 0)];
    _markerNameDescription = format ["BlackMarketDesc_%1", _gunStores select (_this select 0)];
    switch(_this select 1) do {
        case "EMPTY": {
            _markerNameZone setmarkerColorLocal CC_col_empty;
            _markerNameDescription setmarkerColorLocal CC_col_empty;
            _markerNameDescription setMarkerTextLocal CC_name_empty;
        };
        case "ENEMY": {
            _markerNameZone setmarkerColorLocal CC_col_enemy;
            _markerNameDescription setmarkerColorLocal CC_col_enemy;
            _markerNameDescription setMarkerTextLocal CC_name_enemy;
        };
        case "FRIENDLY": {
            _markerNameZone setmarkerColorLocal CC_col_friendly;
            _markerNameDescription setmarkerColorLocal CC_col_friendly;
            _markerNameDescription setMarkerTextLocal CC_name_friendly;
        };
        case "MIXED": {
            _markerNameZone setmarkerColorLocal CC_col_mixed;
            _markerNameDescription setmarkerColorLocal CC_col_mixed;
            _markerNameDescription setMarkerTextLocal CC_name_mixed;
        };
    };
 
    if((_this select 2) && ((_this select 1) in ["ENEMY", "MIXED"])) then {
        if (CC_blackMarketIntruderWarning) then {
            ["InfoTitleAndText", ["WARNING", "Enemy player just entered the area"]] call ExileClient_gui_toaster_addTemplateToast;
        };
    };
 
    _status set [_this select 0, _this select 1];
};