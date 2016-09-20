/*  
	fn_loadVGContent.sqf
*/
private ["_display","_error","_slides","_flag","_allowedVeh","_storedVeh","_strTxtVehCntColor","_strTxtVehCnt"];

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {_error = "Error loading XM8 VG app, display is null"; systemChat _error; diag_log _error;};

_slides = _display displayCtrl 4007;
if (isNull _slides) exitWith {_error = "Error loading XM8 VG app, slides control is null"; systemChat _error; diag_log _error;};

_flag = if(typeName ExAdCurFlagNetId == "STRING")then{objectFromNetId ExAdCurFlagNetId}else{ExAdCurFlagNetId};

_allowedVeh = _flag call ExAd_fnc_allowedVGVeh;
_storedVeh = count (_flag getVariable ["ExAdVGVeh", []]);
_strTxtVehCntColor = if(_allowedVeh > _storedVeh)then{"#FFFFFF"}else{"#B22400"};

_strTxtVehCnt = [_display,"GG_VG","SubTitle1Cnt"] call ExAd_fnc_getAppCtrl;
_strTxtVehCnt ctrlSetStructuredText parseText format ["<t size='1' align='right' color='%1'>%2/%3</t>",_strTxtVehCntColor,_storedVeh,_allowedVeh];

[(objectFromNetId ExAdCurFlagNetId) getVariable ["ExAdVGVeh", []],ctrlIDC ([_display,"GG_VG","StoreVehList"] call ExAd_fnc_getAppCtrl)] call ExAd_fnc_fillVGList;
for "_i" from 0 to 3 do {
	_index = lbAdd[ctrlIDC ([_display,"GG_VG","StoreVehList"] call ExAd_fnc_getAppCtrl),""];
};

[[_flag, ExAd_VG_ALLOWED_VEH_TYPE,_flag getVariable ["ExileTerritorySize", 50]] call ExAd_fnc_getNearByLocalVeh,ctrlIDC ([_display,"GG_VG","NearVehicleList"] call ExAd_fnc_getAppCtrl)] call ExAd_fnc_fillVGList;

([_display,"GG_VG","InfoCB"] call ExAd_fnc_getAppCtrl) cbSetChecked ((profileNamespace getVariable["ExAd_StreamFriendlyUI",0]) == 1);

true