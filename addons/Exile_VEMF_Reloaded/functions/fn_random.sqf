/*
    Author: IT07

    Description:
    selects random element from given ARRAY

    Params:
    _this: ARRAY - can contain anything

    Returns:
    ARRAY - result of random selection(s)
*/

private ["_return"];
if (typeName _this isEqualTo "ARRAY") then
{
    if (count _this > 0) then
    {
        _return = _this select floor random count _this;
    };
};
_return
