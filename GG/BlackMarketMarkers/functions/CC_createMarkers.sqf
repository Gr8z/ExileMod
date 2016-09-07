/*
*  Ported From Wasteland
*  Author: ContractCoders.net
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/

_status = [];
_gunStores = [];
 
{
    _x params ["_markerName","_markerPos"];
    _markerName = format["BlackMarketZone_%1",_markerName];
    deleteMarkerLocal _markerName;
    _marker = createMarkerLocal [_markerName, _markerPos];
    _markerName setMarkerShapeLocal "ELLIPSE";
    _markerName setMarkerColorLocal CC_col_empty;
    _markerName setMarkerSizeLocal [CC_blackMarketRadius, CC_blackMarketRadius];
    _markerName setMarkerBrushLocal "Grid";
    _markerName setMarkerAlphaLocal CC_blackMarketMarkerTransparency;
 
 
    _markerName = format["BlackMarketDesc_%1",_markerName];
    deleteMarkerLocal _markerName;
    _marker = createMarkerLocal [_markerName, _markerPos];
    _markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerTypeLocal "mil_dot";
    _markerName setMarkerColorLocal CC_col_empty;
    _markerName setMarkerSizeLocal [1,1];
    _markerName setMarkerTextLocal CC_name_empty;
 
    _status pushBack "EMPTY";
    _gunStores pushBack _x;
 
} forEach CC_blackMarketPos;