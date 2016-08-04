/*  
	fn_sbPowerToggle.sqf
	
	Copyright 2016 Jan Babor

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/	

if(GG_SB_Active)then{
	call ExAd_fnc_sbStop
}else{
	call ExAd_fnc_loadSB
};

GG_SB_Active = !GG_SB_Active;

(_this select 0) ctrlSetText (if(!GG_SB_Active)then{STR_GG_SB_APP_BTN_SHOW}else{STR_GG_SB_APP_BTN_HIDE});
call GG_SB_fnc_thread;

true