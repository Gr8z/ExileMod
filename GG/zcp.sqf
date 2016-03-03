"PV_ZCP_zupastic_client" addPublicVariableEventHandler {
	private["_type","_newPlayerMoneyString","_itemClassName","_quantity","_containerType","_containerNetID","_newPlayerMoney","_rewardPrice","_containersBefore","_containersAfter","_vehicle","_dialog"];
	_messageArray = _this select 1;
	_newPlayerMoneyString = _messageArray select 1;
	_type = _messageArray select 2;
	_rewardPrice = 0;
	if (_type == 'Poptabs') then {
		_newPlayerMoney = parseNumber _newPlayerMoneyString;
		_rewardPrice = _newPlayerMoney - ExileClientPlayerMoney;
		ExileClientPlayerMoney = _newPlayerMoney;
	} else {
		_newPlayerMoney = parseNumber _newPlayerMoneyString;
		_rewardPrice = _newPlayerMoney - ExileClientPlayerScore;
		ExileClientPlayerScore = _newPlayerMoney;
	};
	["Success",format ["Gratz, You received %1 %2.",_rewardPrice, _type]] call BIS_fnc_showNotification;
};

"PV_ZCP_zupastic" addPublicVariableEventHandler {
	_messageArray = _this select 1;
	hint parseText (format [	   
		"<t color='#ff0000' size='2' align='center'>%1</t><br /><t align='center'>%2</t><br/>",
		_messageArray  select 0,_messageArray  select 1
	]);
};