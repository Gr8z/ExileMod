_logDetail = format['[OCCUPATION:Traders] starting @ %1',time]; 
[_logDetail] call SC_fnc_log;
{ 
    _traderName = _x select 0;
    _traderPos = _x select 1;
    _createSafezone = _x select 2;
    
    _traderBaseFile = call compile preprocessFileLineNumbers "x\addons\a3_exile_occupation\trader\trader.sqf";

    _traderObjects = _traderBaseFile apply
    {
        private ["_obj","_pos"];
        _obj = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
        _pos = _x select 1;
        _pos set [2,(_pos select 2)+5000];
        if (_x select 4) then
        {
            _obj setDir (_x select 2);
            _obj setPosATL _pos;
        }
        else
        {
            _obj setPosATL _pos;
            _obj setVectorDirAndUp (_x select 3);
        };
        _obj;
    };

    [_traderObjects,_traderPos] call DMS_fnc_setRelPositions;
    
    {
        _obj = _x;
        _pos = getPos _obj;
        _obj setPos _pos;
        _obj enableSimulation false;   
    }forEach _traderObjects;

    _traderName setmarkeralpha 0; 
    _marker = createMarker [ format [" %1 ", _traderName], _traderPos];
    _marker setMarkerText format ["%1", _traderName];
    _marker setMarkerSize  [3,3];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "loc_Tree";
    _marker setMarkerColor "ColorBlack";
    _marker setMarkerBrush "Vertical";	
       
    if(_createSafezone) then
    {
        ExileTraderZoneMarkerPositions pushBack _traderPos;  
        ExileTraderZoneMarkerPositionsAndSize pushBack [_traderPos, 175];   
        publicVariable "ExileTraderZoneMarkerPositions";
        publicVariable "ExileTraderZoneMarkerPositionsAndSize";     
    };
    _logDetail = format['[OCCUPATION:Traders] Created trader base %1 @ %2',_traderName,_traderPos];
    [_logDetail] call SC_fnc_log;
    
    _group = createGroup resistance;
    _group setCombatMode "BLUE";

    {
        
    }forEach tradersToAdd;
    
    _traderPosition = _traderPos findEmptyPosition [0,25];
    "Exile_Trader_CommunityCustoms" createUnit [_traderPosition, _group, "trader = this;"];
    trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms",true];

    trader allowDamage false; 
    trader disableAI 'AUTOTARGET'; 
    trader disableAI 'TARGET'; 
    trader disableAI 'SUPPRESSION';
    trader disableAI "MOVE";
    removeGoggles trader;
    trader forceAddUniform "U_IG_Guerilla3_1";
    trader addWeapon "srifle_DMR_06_olive_F";
    trader addVest "V_TacVest_blk_POLICE";
    trader addBackpack "B_FieldPack_oli";
    trader addHeadgear "H_Cap_blk";
    trader addGoggles "TRYK_TAC_SET_OD";
    trader setCaptive true;  
    _traderDir = trader getDir _traderPos;
    trader setDir _traderDir;
    [trader,"HubStandingUA_idle2"] call BIS_fnc_ambientAnim;
    
    
    _traderPosition = _traderPos findEmptyPosition [0,25];
    "Exile_Trader_CommunityCustoms" createUnit [_traderPosition, _group, "trader = this;"];
    trader setVariable ["ExileTraderType", "Exile_Trader_CommunityCustoms",true];

    trader allowDamage false; 
    trader disableAI 'AUTOTARGET'; 
    trader disableAI 'TARGET'; 
    trader disableAI 'SUPPRESSION';
    trader disableAI "MOVE";
    removeGoggles trader;
    trader forceAddUniform "U_IG_Guerilla3_1";
    trader addWeapon "srifle_DMR_06_olive_F";
    trader addVest "V_TacVest_blk_POLICE";
    trader addBackpack "B_FieldPack_oli";
    trader addHeadgear "H_Cap_blk";
    trader addGoggles "TRYK_TAC_SET_OD";
    trader setCaptive true;  
    _traderDir = trader getDir _traderPos;
    trader setDir _traderDir;
    [trader,"HubStanding_idle1"] call BIS_fnc_ambientAnim;
    
        
    
    
} foreach SC_occupyTraderDetails;