/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_lootTableName","_itemClassName","_lootTableConfig","_top","_count","_half","_halfIndex","_lootTableEntries","_chance","_startIndex","_endIndex","_i","_entry"];
_lootTableName = _this;
_itemClassName = "";
_lootTableConfig = configFile >> "CfgLootTables" >> _lootTableName;
_top = getNumber(_lootTableConfig >> "top");
_count = getNumber(_lootTableConfig >> "count");
_half = getNumber(_lootTableConfig >> "half");
_halfIndex = getNumber(_lootTableConfig >> "halfIndex");
_lootTableEntries = getArray(_lootTableConfig >> "items");
_chance = random(_top); 
if (_chance >= _half) then
{
	_startIndex = _halfIndex;
	_endIndex = _count - 1;
}
else 
{
	_startIndex = 0;
	_endIndex = _halfIndex + 1;
};
for "_i" from _startIndex to _endIndex do 
{
	_entry = _lootTableEntries select _i;
	if (_chance <= (_entry select 0)) exitWith
	{
		_itemClassName = _entry select 1;
	};
};
_itemClassName