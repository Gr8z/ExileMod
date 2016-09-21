/*  
	onLoad.sqf
*/
params["_display","_slide","_idc"];

_pW = 0.025;
_pH = 0.04;
_leftCol = 1;
_leftColW = 12.8;
_rightCol = _leftCol + _leftColW + 2;
_rightColW = _leftColW + 3;
_margin = 0.2;

[_display,_slide,(["GG_VG","backButton"] call ExAd_fnc_getNextIDC),[27.6 * _pW, 17.7 * _pH, 6 * _pW, 1 * _pH],'["extraApps", 1] call ExileClient_gui_xm8_slide;',STR_ExAd_VG_APP_BTN_BACK] call ExAd_fnc_createButton;

/*Stored Vehicle Details*/
[_display,_slide,(["GG_VG","InfoTitle"] call ExAd_fnc_getNextIDC),[_rightCol * _pW, 2.75 * _pH, _rightColW * _pW, 1 * _pH],STR_ExAd_VG_APP_TTL_DETAILS,"PuristaMedium",1.2,"#ffffff","left",1] call ExAd_fnc_createStructuredText;

[_display,_slide,(["GG_VG","InfoBgBox"] call ExAd_fnc_getNextIDC),[_rightCol * _pW, 4 * _pH, _rightColW * _pW, 13.5 * _pH]] call ExAd_fnc_createBackgroundGUI;

_idcInfoPic = ["GG_VG","InfoPic"] call ExAd_fnc_getNextIDC;
[_display,_slide,_idcInfoPic,[(_rightCol + 9) * _pW, 4 * _pH, 6.75 * _pW, 5.5 * _pH],"",[1,1,1,1],false,true,""] call ExAd_fnc_createPicture;

_idcInfoStr = ["GG_VG","InfoVehStr"] call ExAd_fnc_getNextIDC;
[_display,_slide,_idcInfoStr,[(_rightCol + _margin) * _pW, (4 + _margin) * _pH, (_rightColW - 2 * _margin) * _pW, (13.5 - 2 * _margin) * _pH],"","PuristaMedium",0.75,"#ffffff","left",1] call ExAd_fnc_createStructuredText;

/*Stored Vehicles*/
[_display,_slide,(["GG_VG","SubTitle1"] call ExAd_fnc_getNextIDC),[_leftCol * _pW, 2.75 * _pH, _leftColW * _pW, 1 * _pH],STR_ExAd_VG_APP_TTL_STORED,"PuristaMedium",1.2,"#ffffff","left",1] call ExAd_fnc_createStructuredText;

[_display,_slide,(["GG_VG","SubTitle1Cnt"] call ExAd_fnc_getNextIDC),[_leftCol * _pW, 3 * _pH, _leftColW * _pW, 1 * _pH],"","PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;

_idcStoredVehList = ["GG_VG","StoreVehList"] call ExAd_fnc_getNextIDC;
[_display,_slide,_idcStoredVehList,[_leftCol * _pW, 4 * _pH, _leftColW * _pW, 5 * _pH],format["[_this select 0,%1,%2] call XM8_VG_elChanged",_idcInfoPic,_idcInfoStr],""] call ExAd_fnc_createList;

[_display,_slide,(["GG_VG","fetchButton"] spawn ExAd_fnc_getNextIDC),[_leftCol*_pW, 9*_pH, _leftColW*_pW, 1*_pH],format["disableUserInput true;['VGLoad', %1] call ExAd_fnc_onBtnClickVG",_idcStoredVehList],STR_ExAd_VG_APP_BTN_FETCH,""] call ExAd_fnc_createButton;

/*Nearby vehicles*/
[_display,_slide,(["GG_VG","SubTitle2"] call ExAd_fnc_getNextIDC),[_leftCol * _pW, 10.25 * _pH, _leftColW * _pW, 1 * _pH],STR_ExAd_VG_APP_TTL_NEAR,"PuristaMedium",1.2,"#ffffff","left",1] call ExAd_fnc_createStructuredText;

_idcNearVehList = ["GG_VG","NearVehicleList"] call ExAd_fnc_getNextIDC;
[_display,_slide,_idcNearVehList,[_leftCol * _pW, 11.5 * _pH, _leftColW * _pW, 5 * _pH],"",""] call ExAd_fnc_createList;

[_display,_slide,(["GG_VG","storeButton"] call ExAd_fnc_getNextIDC),[_leftCol * _pW, 16.5 * _pH, _leftColW * _pW, 1 * _pH],format["if(call ExAd_fnc_allowVGStore)then{disableUserInput true;['VGStore', %1] call ExAd_fnc_onBtnClickVG}else{['ErrorTitleAndText', ['Virtual Garage', '%2']] call ExileClient_gui_toaster_addTemplateToast}",_idcNearVehList,STR_ExAd_VG_NOTI_FULL],STR_ExAd_VG_APP_BTN_STORE,""] call ExAd_fnc_createButton;

XM8_VG_elChanged = {
	params ["_listCtrl","_picCtrl","_strCtrl","_ref","_data","_pic"];
	
	_ref = _listCtrl lbData (lbCurSel _listCtrl);
	_data = {if(str (_x select 0) == _ref)exitWith{_x}}forEach ((objectFromNetId ExAdCurFlagNetId) getVariable["ExAdVGVeh",[]]);
	if(!isNil "_data")then{
		_pic = getText(configFile >> "CfgVehicles" >> (_data select 1) >> "picture");
		ctrlSetText [_picCtrl, _pic];
		["requestVGDetailInfo", [_ref, ExAdCurFlagNetId, (profileNamespace getVariable["ExAd_StreamFriendlyUI",0]), netId player, _strCtrl]] call ExAd_fnc_serverDispatch;
	}else{
		ctrlSetText [_picCtrl, ""];
		["",_strCtrl] call ExAd_fnc_loadVGDetailView;
	}
};

true