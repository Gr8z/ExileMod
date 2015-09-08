/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 *
 * Modified by Rod Serling. Redistributed with permission.
 */
 
private["_boundingBox","_boundingBoxMinimum","_boundingBoxMaximum","_boundingBoxPointsTop","_boundingBoxPointsBottom","_objectColor","_materialColor","_simulatePhysics","_position","_rotation","_vectorDirection","_isFlagPole","_vectorUp","_potentionalSnapObject","_snapToClassName","_possibleSnapNamedSelections","_possibleSnapPosition","_contactThreshold","_isBelowTerrain","_worldPosition","_isInAir","_numberOfContactsBottom","_startPosition","_endPosition"];
scriptName 'Exile Construction Thread';
("ExileClientConstructionModeLayer" call BIS_fnc_rscLayer) cutRsc ["RscExileConstructionMode", "PLAIN", 1, false]; 
ExileClientIsInConstructionMode = true;
ExileClientConstructionResult = 0;
ExileClientConstructionStartPosition = getPosATL player;
_boundingBox = boundingBoxReal ExileClientConstructionObject;
_boundingBoxMinimum = _boundingBox select 0;
_boundingBoxMaximum = _boundingBox select 1;
_boundingBoxPointsTop = 
[
	[_boundingBoxMinimum select 0, _boundingBoxMinimum select 1, _boundingBoxMaximum select 2],
	[_boundingBoxMinimum select 0, _boundingBoxMaximum select 1, _boundingBoxMaximum select 2],
	[_boundingBoxMaximum select 0, _boundingBoxMinimum select 1, _boundingBoxMaximum select 2],
	[_boundingBoxMaximum select 0, _boundingBoxMaximum select 1, _boundingBoxMaximum select 2]
];
_boundingBoxPointsBottom = 
[
	[_boundingBoxMinimum select 0, _boundingBoxMinimum select 1, _boundingBoxMinimum select 2],
	[_boundingBoxMinimum select 0, _boundingBoxMaximum select 1, _boundingBoxMinimum select 2],
	[_boundingBoxMaximum select 0, _boundingBoxMinimum select 1, _boundingBoxMinimum select 2],
	[_boundingBoxMaximum select 0, _boundingBoxMaximum select 1, _boundingBoxMinimum select 2],
	[0, 0, _boundingBoxMinimum select 2] 
];
ExileClientConstructionBoundingRadius = 1 + 0.5 * ([_boundingBoxMaximum select 0, _boundingBoxMaximum select 1, 0] distance [_boundingBoxMinimum select 0, _boundingBoxMinimum select 1, 0]);
ExileClientConstructionOffset set [1, 5 max ExileClientConstructionBoundingRadius];
_objectColor = "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)";
_materialColor = _objectColor;
_simulatePhysics = false;
_position = [0, 0, 0];
_rotation = 0;
_vectorDirection = [0, 0, 0];
_isFlagPole = ((typeOf ExileClientConstructionObject) isEqualTo "Exile_Construction_Flag_Preview");
[] call ExileClient_gui_constructionMode_update;
while {ExileClientConstructionResult isEqualTo 0} do
{
	if !(ExileClientConstructionLock) then
	{
		_vectorUp = [0, 0, 1];
		ExileClientConstructionCanPlaceObject = false;
		switch (ExileClientConstructionMode) do
		{
			case 1:
			{
				_position = player modelToWorld ExileClientConstructionOffset;
				_rotation = (ExileClientConstructionRotation + (getDir player) + 360) % 360;
				_vectorDirection = [sin(_rotation), cos(_rotation), 0]; 
			};
			case 2:
			{
				_position = player modelToWorld ExileClientConstructionOffset;
				_position = 
				[
					(_position select 0) - ((_position select 0) % (ExileClientConstructionGrid select 0)),
					(_position select 1) - ((_position select 1) % (ExileClientConstructionGrid select 1)),
					(_position select 2) - ((_position select 2) % (ExileClientConstructionGrid select 2))
				];
				_rotation = (ExileClientConstructionRotation + 360) % 360;
				_vectorDirection = [sin(_rotation), cos(_rotation), 0]; 	
			};
			case 3:
			{
				ExileClientConstructionIsSnapped = false;
				if (ExileClientConstructionIsInSelectSnapObjectMode) then 
				{
					ExileClientConstructionPossibleSnapPositions = [];
					ExileClientConstructionCurrentSnapToObject = objNull;
					_position = getPosATL player;
					_position set [2, -500]; 
					_rotation = (ExileClientConstructionRotation + (getDir player) + 360) % 360;
					_vectorDirection = [sin(_rotation), cos(_rotation), 0]; 
					_potentionalSnapObject = cursorTarget;
					if !(isNull _potentionalSnapObject) then
					{
						if (_potentionalSnapObject distance player < 12) then 
						{
							_snapToClassName = typeOf _potentionalSnapObject;
							if (_snapToClassName in ExileClientConstructionSnapToObjectClassNames) then
							{
								_possibleSnapNamedSelections = getArray(ExileClientConstructionConfig >> "SnapObjects" >> _snapToClassName >> "selections");
								ExileClientConstructionCurrentSnapToObject = _potentionalSnapObject;
								{
									_possibleSnapPosition = _potentionalSnapObject modelToWorld (_potentionalSnapObject selectionPosition _x);
									ExileClientConstructionPossibleSnapPositions pushBack _possibleSnapPosition;
								}
								forEach _possibleSnapNamedSelections;
							};
						};
					};	
				}
				else 
				{
					_position = player modelToWorld ExileClientConstructionOffset;
					_rotation = (ExileClientConstructionRotation + (getDir player) + 360) % 360;
					_vectorDirection = [sin(_rotation), cos(_rotation), 0]; 
					{
						if (_x distance _position < 1) exitWith
						{
							_position = _x;
							_rotation = (ExileClientConstructionRotation + (getDir ExileClientConstructionCurrentSnapToObject) + 360) % 360;
							_vectorDirection = [sin(_rotation), cos(_rotation), 0]; 
							_vectorUp = vectorUp ExileClientConstructionCurrentSnapToObject;
							ExileClientConstructionIsSnapped = true;
						};
					}
					forEach ExileClientConstructionPossibleSnapPositions;		
				};
			};
		};
		ExileClientConstructionObject setVectorDirAndUp [_vectorDirection, _vectorUp];
		ExileClientConstructionObject setPosATL _position;
	};
	_contactThreshold = 0.1; 
	_isBelowTerrain = true;
	{
		_worldPosition = ExileClientConstructionObject modelToWorld _x;
		if ((_worldPosition select 2) > _contactThreshold) exitWith {_isBelowTerrain = false};
	}
	forEach _boundingBoxPointsTop;
	_isInAir = true;
	_numberOfContactsBottom = 0;
	{
		_worldPosition = ExileClientConstructionObject modelToWorld _x;
		if ((_worldPosition select 2) < _contactThreshold) then 
		{
			_isInAir = false
		};
		_startPosition = ATLtoASL[_worldPosition select 0, _worldPosition select 1, (_worldPosition select 2) + _contactThreshold];
		_endPosition = ATLtoASL [_worldPosition select 0, _worldPosition select 1, (_worldPosition select 2) - _contactThreshold];
		if (count lineIntersectsObjs[_startPosition, _endPosition, ExileClientConstructionObject, objNull, false, 2] > 0) then
		{
			_numberOfContactsBottom = _numberOfContactsBottom + 1;
		};
	}
	forEach _boundingBoxPointsBottom;
	if (_isBelowTerrain) then
	{
		ExileClientConstructionCanPlaceObject = false;
		_simulatePhysics = false;
		_objectColor = "#(argb,2,2,1)color(0.91,0,0,0.6,ca)";
	}
	else 
	{
		ExileClientConstructionCanPlaceObject = true;
		if !(ExileClientConstructionModePhysx) then
		{
			_objectColor = "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)";
			_simulatePhysics = false;
		}
		else 
		{
			if (_isInAir) then
			{	
				if (_numberOfContactsBottom >= 3) then
				{
					_objectColor = "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)";
					_simulatePhysics = false;
				}
				else 
				{
					_objectColor = "#(argb,2,2,1)color(1,0.79,0.07,0.6,ca)";
					_simulatePhysics = true;
				};
			}
			else 
			{
				_objectColor = "#(argb,2,2,1)color(0.7,0.93,0,0.6,ca)";
				_simulatePhysics = false;
			};
		};
	};
	if (ExileClientConstructionMode isEqualTo 3) then
	{
		if (!ExileClientConstructionIsSnapped) then
		{
			ExileClientConstructionCanPlaceObject = false;
			_simulatePhysics = false;
			_objectColor = "#(argb,2,2,1)color(0.91,0,0,0.6,ca)";
		};
	};
	if !(_isFlagPole) then
	{
		if !((getPosATL ExileClientConstructionObject) call ExileClient_util_world_canBuildHere) then
		{
			ExileClientConstructionCanPlaceObject = false;
			_simulatePhysics = false;
			_objectColor = "#(argb,2,2,1)color(0.91,0,0,0.6,ca)";
		};
	};
	if (_objectColor != _materialColor) then
	{
		ExileClientConstructionObject setObjectTextureGlobal[0, _objectColor];
		ExileClientConstructionObject setObjectTextureGlobal[1, _objectColor];
		ExileClientConstructionObject setObjectTextureGlobal[2, _objectColor];
		ExileClientConstructionObject setObjectTextureGlobal[3, _objectColor];
		_materialColor = _objectColor;
	};
	if (ExileClientConstructionStartPosition distance (getPosATL player) > 20) then
	{
		ExileClientConstructionResult = 3;
	};
	if (ExileClientPlayerIsInCombat) then
	{
		ExileClientConstructionModePhysx = true;
		ExileClientConstructionResult = 2;
	};
	uiSleep 0.001; 
};
if !(ExileClientConstructionModePhysx) then
{
	_simulatePhysics = false;
};
switch (ExileClientConstructionResult) do
{
	case 1: 
	{
		if( ExileClientConstructionProcess isEqualTo 1) then
		{
			player removeMagazine ExileClientConstructionKitClassName;
		};
		[ExileClientConstructionObject, getText (ExileClientConstructionConfig >> "staticObject"), _simulatePhysics] spawn ExileClient_construction_simulationCountDown;
		if (getText (ExileClientConstructionConfig >> "staticObject") isEqualTo "Exile_Container_Safe") then 
		{
			["SafePlacedInformation"] call ExileClient_gui_notification_event_addNotification;
		}
		else
		{
			["ConstructionPlacedInformation", [ExileClientConstructionObjectDisplayName]] call ExileClient_gui_notification_event_addNotification;
		};
	};
	case 3:
	{
		if( ExileClientConstructionProcess isEqualTo 2) then
		{
			[ExileClientConstructionObject, getText (ExileClientConstructionConfig >> "staticObject"), true] spawn ExileClient_construction_simulationCountDown;
		}
		else 
		{
			["deconstructConstructionRequest", [netId ExileClientConstructionObject]] call ExileClient_system_network_send;
		};
		["ConstructionMovedTooFarWarning", [ExileClientConstructionObjectDisplayName]] call ExileClient_gui_notification_event_addNotification;
	};
	case 2:
	{
		if( ExileClientConstructionProcess isEqualTo 2) then
		{
			[ExileClientConstructionObject, getText(ExileClientConstructionConfig >> "staticObject"), _simulatePhysics] spawn ExileClient_construction_simulationCountDown;
		}
		else 
		{
			["deconstructConstructionRequest", [netId ExileClientConstructionObject]] call ExileClient_system_network_send;
		};
		if(ExileClientPlayerIsInCombat)then
		{
			["ConstructionAbortedCombat"] call ExileClient_gui_notification_event_addNotification;
		}
		else
		{
			["ConstructionAbortedInformation", [ExileClientConstructionObjectDisplayName]] call ExileClient_gui_notification_event_addNotification;
		};		
	};
};
ExileClientConstructionObject = objNull;
ExileClientIsInConstructionMode = false;
ExileClientConstructionResult = 0;
ExileClientConstructionProcess = 0;
ExileClientConstructionLock = false;
("ExileClientConstructionModeLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"]; 
true