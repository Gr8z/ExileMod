if (!isDedicated) then {

	"Gr8s_kill_msg"		addPublicVariableEventHandler {
		_id = (_this select 1);
		_killerName = _id select 0;
		_pic		= _id select 1;
		_victimName = _id select 2;
		_distance 	= _id select 3;
		_weapon 	= _id select 4;
		_dyntxt = format["
		<t size='0.75'align='left'shadow='1'color='#5882FA'>%1</t>
		<t size='0.5'align='left'shadow='1'>  Killed  </t>
		<t size='0.75'align='left'shadow='1'color='#c70000'>%2</t><br/>
		<t size='0.45'align='left'shadow='1'> With: </t>
		<t size='0.5'align='left'shadow='1'color='#FFCC00'>%3</t>
		<t size='0.45'align='left'shadow='1'> - Distance: </t>
		<t size='0.5'align='left'shadow='1'color='#FFCC00'>%4m</t><br/>
		<img size='2.5'align='left'shadow='1'image='%5'/>
		",
		_killerName,
		_victimName,
		_weapon,
		_distance,
		_pic
		];
		[_dyntxt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH,0.3],30,0.5] spawn BIS_fnc_dynamicText;
	};
	
};