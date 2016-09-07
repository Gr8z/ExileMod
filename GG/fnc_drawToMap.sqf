GG_fnc_drawToMap = {
	private ["_alpha", "_center", "_color", "_direction", "_length", "_marker", "_markerArray", "_posArray", "_width"];
	_posArray = _this select 0;
	_width = _this select 1;
	_color = _this select 2 select 0;
	_alpha = _this select 2 select 1;
	_markerArray = [];
	for "_x" from 0 to count _posArray - 2 do {
		_center = [((_posArray select _x select 0) + (_posArray select _x + 1 select 0)) / 2, ((_posArray select _x select 1) + (_posArray select _x + 1 select 1)) / 2];
		_direction = ((_posArray select _x + 1 select 0) - (_posArray select _x select 0)) atan2 ((_posArray select _x + 1 select 1) - (_posArray select _x select 1));
		_length = sqrt (((_posArray select _x select 0) - (_posArray select _x + 1 select 0)) ^ 2 + ((_posArray select _x select 1) - (_posArray select _x + 1 select 1)) ^ 2);
		for "_y" from 1 to 9001 do {
			_marker = "GG_drawToMap_" + str(_y);
			if (markerShape _marker == "") exitWith {};
		};
		createMarker [_marker, _center];
		_marker setMarkerShape "RECTANGLE";
		_marker setMarkerBrush "SolidFull";
		_marker setMarkerSize [_width / 2, _length / 2];
		_marker setMarkerDir _direction;
		_marker setMarkerAlpha _alpha;
		_marker setMarkerColor _color;
		_markerArray set [count _markerArray, _marker];
	};
	{
		for "_y" from 1 to 9001 do {
			_marker = "GG_drawToMap_" + str(_y);
			if (markerShape _marker == "") exitWith {};
		};
		createMarker [_marker, _x];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerBrush "SolidFull";
		_marker setMarkerSize [_width / 2, _width / 2];
		_marker setMarkerAlpha _alpha;
		_marker setMarkerColor _color;
		_markerArray set [count _markerArray, _marker];
	} forEach _posArray;
	_markerArray
};

[  
	[[4984.26,11356.9],[4963.4,11330.5]],  
	5,
	["ColorWhite", 1]
] call GG_fnc_drawToMap;

[  
	[[4963.4,11330.5],[4931.14,11311.7]],
	5,
	["ColorWhite", 1]
] call GG_fnc_drawToMap;

[  
	[[4931.14,11311.7],[4827.93,11310]],
	5,
	["ColorWhite", 1]
] call GG_fnc_drawToMap;

[  
	[[4827.93,11310],[4351.68,11633.9]],
	5,
	["ColorWhite", 1]
] call GG_fnc_drawToMap;

[  
	[[4351.68,11633.9],[4297.85,11646.8]],
	5,
	["ColorWhite", 1]
] call GG_fnc_drawToMap;

[  
	[[4297.85,11646.8],[4216.14,11635.1]],
	5,
	["ColorWhite", 1]
] call GG_fnc_drawToMap;

[  
	[[4216.14,11635.1],[4180.75,11682.7]],
	5,
	["ColorWhite", 1]
] call GG_fnc_drawToMap;