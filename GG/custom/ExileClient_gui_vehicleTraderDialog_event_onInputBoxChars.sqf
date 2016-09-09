/**
 * ExileClient_gui_vehicleTraderDialog_event_onInputBoxChars
 */
 
private["_inputBox","_character","_dialog","_purchaseButton","_vehicleClass","_salesPrice","_quality","_requiredRespect","_ctrlText"];
disableSerialization;
_inputBox = _this select 0;
_character = _this select 1;
_dialog = uiNameSpace getVariable ["RscExileVehicleTraderDialog", displayNull];
_purchaseButton = _dialog displayCtrl 4002;
_vehicleClass = uiNamespace getVariable ["RscExileVehicleTraderDialogVehicleClass",""];
_salesPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _vehicleClass >> "price");
_quality = getNumber(missionConfigFile >> "CfgExileArsenal" >> _vehicleClass >> "quality");
_requiredRespect = getNumber(missionConfigFile >> "CfgTrading" >> "requiredRespect" >> format["Level%1",_quality]);
_ctrlText = (ctrlText _inputBox);
if((count _ctrlText) <= 4)then
{
	if!(_character in [48,49,50,51,52,53,54,55,56,57])then
	{
		_ctrlText = _ctrlText select [0,(count _ctrlText) - 1];	
	};
	if((count _ctrlText) isEqualTo 4)then
	{
		if(_requiredRespect <= ExileClientPlayerScore)then
		{
			_purchaseButton ctrlEnable (_salesPrice <= (player getVariable ["ExileMoney", 0]));
		};
	}
	else
	{
		_purchaseButton ctrlEnable false;
	};
}
else
{
	if!(_vehicleClass isEqualTo "")then
	{
		_purchaseButton ctrlEnable true;
	};
	_ctrlText = _ctrlText select [0,(count _ctrlText) - 1];
	_purchaseButton ctrlEnable false;
};
_inputBox ctrlSetText _ctrlText;
_inputBox ctrlCommit 0;
true