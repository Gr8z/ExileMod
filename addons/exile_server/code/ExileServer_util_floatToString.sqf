private "_arr";
if (abs (_this - _this % 1) == 0) exitWith { str _this };
_arr = toArray str abs (_this % 1);
_arr set [0, 32];
toString (toArray str (
	abs (_this - _this % 1) * _this / abs _this
) + _arr - [32])