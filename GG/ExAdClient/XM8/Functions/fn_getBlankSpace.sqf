/*  
	fn_getBlankSpace.sqf
*/
params["_size"];
_response = "";
for "_i" from 0 to _size do {
	_response = format["%1 ",_response]
};
_response