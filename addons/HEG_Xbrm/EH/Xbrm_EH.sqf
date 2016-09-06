/*
Xbrm_EH.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/

"Xbrm_network_send"		addPublicVariableEventHandler{(_this select 1)call Xbrm_server_network_send};

diag_log format['Xbrm: networkSendEH called at %1',time];