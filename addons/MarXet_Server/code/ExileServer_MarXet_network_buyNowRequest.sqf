/*
*
*  ExileServer_MarXet_network_buyNowRequest.sqf
*  Author: WolfkillArcadia
*  © 2016 Arcas Industries
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_sessionID","_package","_listingID","_thatOneThingThatISentToTheServer","_vehicleObject","_buyerIsSeller","_playerObject","_stock","_sellersUID","_buyerUID","_price","_playerMoney","_listingArray","_vehicleClass","_vehicleCost","_rekeyCost","_forbiddenCharacter","_pinCode","_staticVehicleSpawning","_helipad","_position","_hitpoints","_newMoney","_sellerPlayerObject","_sellersMoney","_newSellerMoney","_sellerSessionID","_count","_stats"];
_sessionID = _this select 0;
_package = _this select 1;
_listingID = _package select 0;
_thatOneThingThatISentToTheServer = _package select 1;
_vehicleObject = "";
_buyerIsSeller = false;
try {
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
	{
		throw "Who are you again?";
	};
    if (_listingID isEqualTo "") then
    {
        throw "Listing ID doesn't exist!";
    };
    _stock = _listingID call ExileServer_MarXet_inventory_confirmStock;
    if (_stock isEqualTo false) then
    {
        throw "Oh noes! The item is no longer available!";
    };
    _sellersUID = _stock select 4;
    _buyerUID = getPlayerUID _playerObject;
    _price = parseNumber(_stock select 3);
    if (_buyerUID isEqualTo _sellersUID) then
    {
        _price = 0;
        _buyerIsSeller = true;
    };
    _playerMoney = _playerObject getVariable ["ExileMoney",0];
    if (count(_stock select 2) > 1) then
    {
        _listingArray = _stock select 2;
        _vehicleClass = _listingArray select 0;
        _vehicleCost = getNumber (missionConfigFile >> "CfgExileArsenal" >> _vehicleClass >> "price");
        _rekeyCost = _vehicleCost * (getNumber (missionConfigFile >> "CfgTrading" >> "rekeyPriceFactor"));
        if (_buyerIsSeller) then
        {
            _price = _rekeyCost;
        }
        else
        {
            _price = _price + _rekeyCost;
        };
        if (_playerMoney < _price) then
        {
            throw "You don't have enough money to purchase";
        };
    	_forbiddenCharacter = [_thatOneThingThatISentToTheServer, "1234567890"] call ExileClient_util_string_containsForbiddenCharacter;
    	if !(_forbiddenCharacter isEqualTo -1) then
    	{
    		throw format ["Forbidden character in PIN! I have no idea how it got there. [%1]", _forbiddenCharacter];
    	};
        _pinCode = _thatOneThingThatISentToTheServer;
        _staticVehicleSpawning = (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "staticVehicleSpawning") isEqualTo 1);
        if (_staticVehicleSpawning) then
        {
            if (_vehicleClass isKindOf "Ship") then
            {
                _helipad = nearestObject [(getPosATL _playerObject), "Land_HelipadEmpty_F"];
                if (isNull _helipad) then
                {
                    throw "Couldn't find a suitable position for the ship";
                };
                _position = (getPosASL _helipad);
                _position set [2,0];
                _vehicleObject = [_vehicleClass, _position, (random 360), false, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
            }
            else
            {
                if (_vehicleClass isKindOf "Air") then
                {
                    _helipad = nearestObject [(getPosATL _playerObject), "Land_HelipadSquare_F"];
                    if (isNull _helipad) then
                    {
                        throw "Couldn't find a suitable position for the air vehicle";
                    };
                    _position = (getPosATL _helipad);
                    _position set [2,0];
                }
                else
                {
                    _helipad = nearestObject [(getPosATL _playerObject), "Land_HelipadEmpty_F"];
                    if (isNull _helipad) then
                    {
                        throw "Couldn't find a suitable position for the vehicle";
                    };
                    _position = (getPosATL _helipad);
                    _position set [2,0];
                };
                _vehicleObject = [_vehicleClass, _position, (random 360), true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
            };
        }
        else
        {
            if (_vehicleClass isKindOf "Ship") then
            {
                _position = [(getPosATL _playerObject), 80, 10] call ExileClient_util_world_findWaterPosition;
                _vehicleObject = [_vehicleClass, _position, (random 360), false, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
            }
            else
            {
                _position = (getPos _playerObject) findEmptyPosition [10, 175, _vehicleClass];
                if (_position isEqualTo []) then
                {
                    throw "Couldn't find a suitable position for vehicle";
                };
                _vehicleObject = [_vehicleClass, _position, (random 360), true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
            };
        };
        _vehicleObject setVariable ["ExileOwnerUID", _buyerUID];
        _vehicleObject setVariable ["ExileIsLocked",0];
        _vehicleObject lock 0;
        _vehicleObject call ExileServer_object_vehicle_database_insert;
        _vehicleObject setFuel (_listingArray select 1);
        _vehicleObject setDamage (_listingArray select 2);
        _hitpoints = _listingArray select 3;
        if ((typeName _hitpoints) isEqualTo "ARRAY") then
        {
        	{
        		_vehicleObject setHitPointDamage [_x select 0, _x select 1];
        	}
        	forEach _hitpoints;
        };
        _vehicleObject call ExileServer_object_vehicle_database_update;
        _vehicleObject = netID _vehicleObject;
    }
    else
    {
        if (_playerMoney < _price) then
        {
            throw "You don't have enough money to purchase the item";
        };
    };
    _listingID call ExileServer_MarXet_inventory_updateStock;
    if (_buyerIsSeller) then
    {
        if (_price > 0) then
        {
            _playerMoney = _playerMoney - _price;
            _playerObject setVariable ["ExileMoney",_playerMoney,true];
            format["setPlayerMoney:%1:%2",_playerMoney,_playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
        };
        [_sessionID,"buyerBuyNowResponse",[_stock,_thatOneThingThatISentToTheServer,_vehicleObject,str(_price)]] call ExileServer_system_network_send_to;
        [format["Player: %1 bought their %2 back. Vehicle: %3. Rekey Cost if vehicle: %4",_buyerUID, (_stock select 2) select 0, (_price > 0), _price],"BuyNowRequest"] call ExileServer_MarXet_util_log;
    }
    else
    {
        _newMoney = _playerMoney - _price;
        _playerObject setVariable ["ExileMoney",_newMoney,true];
        format["setPlayerMoney:%1:%2",_newMoney,_playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
        [_sessionID,"buyerBuyNowResponse",[_stock,_thatOneThingThatISentToTheServer,_vehicleObject,str(_price)]] call ExileServer_system_network_send_to;
        _sellerPlayerObject = _sellersUID call ExileServer_MarXet_system_getPlayerObject;
        if (_sellerPlayerObject isEqualTo "") then
        {
            _stats = format["getAccountStats:%1", _sellersUID] call ExileServer_system_database_query_selectSingle;
            _sellersMoney = _stats select 4;
            _newSellerMoney = _sellersMoney + _price;
            format["updateLocker:%1:%2",_newSellerMoney, _sellersUID] call ExileServer_system_database_query_fireAndForget;
        }
        else
        {
            _sellersMoney = _sellerPlayerObject getVariable ["ExileLocker", 0];
            _newSellerMoney = _sellersMoney + _price;
            _sellerSessionID = _sellerPlayerObject getVariable ["ExileSessionID",-1];
            _sellerPlayerObject setVariable ["ExileLocker",_newSellerMoney,true];
            format["updateLocker:%1:%2",_newSellerMoney, _sellersUID] call ExileServer_system_database_query_fireAndForget;
            if !(_sellerSessionID isEqualTo -1) then
            {
                [_sellerSessionID,"sellerBuyNowResponse",[_stock]] call ExileServer_system_network_send_to;
            };
        };
        [format["Player: %1 bought player: %2's %3 for %4",_buyerUID,_sellersUID, (_stock select 2) select 0, _price],"BuyNowRequest"] call ExileServer_MarXet_util_log;
    };
}
catch
{
    [_sessionID, "toastRequest", ["ErrorTitleAndText", ["FAILED!", _exception]]] call ExileServer_system_network_send_to;
    [_exception,"BuyNowRequest"] call ExileServer_MarXet_util_log;
    if (!isNil "_stock" && !(_stock isEqualTo false)) then
    {
        _count = -1;
        {
            if ((_x find _listingID) != -1) then
            {
                _count = _forEachIndex;
            };
        } forEach MarXetInventory;
        (MarXetInventory select _count) set [1,1];
    };
};
