/*
*
*  ExileClient_MarXet_util_sortNumberString.sqf
*  Author: WolfkillArcadia
*  © 2016 Arcas Industries
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_array","_numbersToSort","_sortBy","_temp","_temp2","_numbers","_arr"];
//YES I HAD TO WRITE A FUNCTION TO SORT A NUMBER THAT IS A STRING. ARMA WHY U NO HAV DIS?
_array = _this select 0;
_numbersToSort = _this select 1;
_sortBy = _this select 2;
_temp = [];
_temp2 = [];
{
    _numbers = call _numbersToSort;
    _temp pushBack [parseNumber(_numbers),_forEachIndex];
} forEach _array;
_temp = [_temp, [], {_x select 0}, _sortBy] call BIS_fnc_sortBy;
for "_i" from 0 to (count(_temp)) - 1 do
{
    _arr = _array select ((_temp select _i) select 1);
    _temp2 pushback _arr;
};
_temp2
