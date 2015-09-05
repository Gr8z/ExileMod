//Init Variables
pVeh_rV = [];

//Add server response handler
"pVeh_rV_r" addPublicVariableEventHandler { (_this select 1) call pVeh_servResponse; };

//byPlayer2