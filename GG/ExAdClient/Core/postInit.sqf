/*  
	postInit.sqf

*/

execVM "GG\ExAdClient\Core\customize.sqf";

if(isNil "ExAd_Debug")then{ExAd_Debug = true;};

if(isNil "ExAd_Hint_Title_Color")then{ExAd_Hint_Title_Color = "#E48A36";};
if(isNil "ExAd_Hint_Title_Size")then{ExAd_Hint_Title_Size = 1.5;};
if(isNil "ExAd_Hint_Title_Font")then{ExAd_Hint_Title_Font = "TahomaB";};

if(isNil "ExAd_Hint_Msg_Color")then{ExAd_Hint_Msg_Color = "#ffffff";};
if(isNil "ExAd_Hint_Msg_Size")then{ExAd_Hint_Msg_Size = 1;};
if(isNil "ExAd_Hint_Msg_Font")then{ExAd_Hint_Msg_Font = "TahomaB";};