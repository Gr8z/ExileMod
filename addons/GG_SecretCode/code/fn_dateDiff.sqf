_dateStart = _this select 0;
_dateEnd = _this select 1;

_yearStart = _dateStart select 0;
_monthStart = _dateStart select 1;
_dayStart = _dateStart select 2;
_hourStart = _dateStart select 3;
_minStart = _dateStart select 4;

_yearEnd = _dateEnd select 0;
_monthEnd = _dateEnd select 1;
_dayEnd = _dateEnd select 2;
_hourEnd = _dateEnd select 3;
_minEnd = _dateEnd select 4;

_daysTotal = 0;

for "_i" from _yearStart to (_yearEnd - 1) do
{
	_isLeapYear = if(_i mod 4 == 0 && {_i mod 100 != 0 || _i mod 400 == 0}) then {true} else {false};
	if (_isLeapYear) then
	{
		_daysTotal = _daysTotal + 366;
	}
	else
	{
		_daysTotal = _daysTotal + 365;
	};
};

_isLeapYear = if (_yearStart mod 4 == 0 && {_yearStart mod 100 != 0 || _yearStart mod 400 == 0}) then {true} else {false};
_daysSum = 0;

_daysOfMonths = [31, if(_isLeapYear) then {29} else {28}, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
{
	if(_monthStart isEqualTo (_forEachIndex + 1)) exitWith {};
	_daysSum = _daysSum - _x;
} forEach _daysOfMonths;

_isLeapYear = if(_yearEnd mod 4 == 0 && {_yearEnd mod 100 != 0 || _yearEnd mod 400 == 0}) then {true} else {false};
_daysOfMonths = [31, if(_isLeapYear) then {29} else {28}, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
{
	if(_monthEnd isEqualTo (_forEachIndex + 1)) exitWith {};
	_daysSum = _daysSum + _x;
} forEach _daysOfMonths;

_daysTotal = (_daysTotal - _dayStart + _dayEnd + _daysSum) - 1;

_daysTotal