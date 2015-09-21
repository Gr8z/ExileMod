/*
	a3 epoch killfeed studybody script
	By Halv
	
	Copyright (C) 2015  Halvhjearne > README.md
*/

_body = _this select 3;

_info = _body getVariable ["HALV_STUDY",[]];

if(_info isEqualTo [])exitWith{
	titleText ["This body is unrecognizable ...","PLAIN DOWN"];
};

_killerName = _info select 0;
_victimName = _info select 1;
_TOD = _info select 2;
_pic = _info select 3;
_txt = _info select 4;
//_hint = _info select 5;



_timeofdeath = serverTime - _TOD;
_timetxt = switch (true)do{
	case (_timeofdeath < 60):{"This player died only seconds ago, blood is still flowing from the wounds!"};
	case (_timeofdeath > 60 && _timeofdeath < 900):{"This player died only minutes ago, the body is warm and the blood is fresh!"};
	case (_timeofdeath > 900 && _timeofdeath < 3600):{"This player died less than half an hour ago, the body is warm, but the blood is stiff."};
	case (_timeofdeath > 1800 && _timeofdeath < 3600):{"This player died less than half an hour ago, the body is almost cold and the blood is dry."};
	case (_timeofdeath > 3600):{"This player has been dead for a while now, the body is cold and stiff."};
};

_WTD = _body getVariable ["HALVWTD",""];
_COD = switch(true)do{
	case (_WTD isEqualTo ""):{"Overall Damage From a "};
	case ((toLower _WTD) isEqualTo "head_hit"):{"Head Shot From a "};
	case (toLower _WTD in ["body","hands","legs"]):{"Body Hits From a "};
	default{"Unknown hits From a "};
};

//hintSilent _hint;

if (_killerName isEqualTo _victimName)then{
	titleText [format["The Name was %1\nCause of death: Suicide",_victimName],"PLAIN DOWN"];
}else{
	titleText [format["The Name was %1\nCause of death: %2 %3\n%4",_victimName,_COD,_txt,_timetxt],"PLAIN DOWN"];
};
