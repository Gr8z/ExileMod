ExileServerCustom_Traders = [];

call compile preprocessFileLineNumbers format["exile_server_custom\traders\world\%1.sqf";

ExileServerCustom_Traders = compileFinal (str ExileServerCustom_Traders);
publicVariable 'ExileServerCustom_Traders';
