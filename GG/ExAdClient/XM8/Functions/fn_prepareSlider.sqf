/*  
	fn_prepareSlider.sqf
*/
params["_ctrl","_range","_pos"];

_ctrl sliderSetRange _range;
_ctrl sliderSetSpeed [500, 500];
_ctrl sliderSetPosition _pos;

true