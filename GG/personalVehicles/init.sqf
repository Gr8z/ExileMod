//Set folder path
pVeh_folderPath = "GG\personalVehicles";

/*---------------------------------------------------------------------------
	Client-Side & Server-Side
---------------------------------------------------------------------------*/
pVeh_config = compileFinal (preprocessFileLineNumbers format["%1\pVeh_config.sqf",pVeh_folderPath]);

/*---------------------------------------------------------------------------
	Client-Side
---------------------------------------------------------------------------*/
if (hasInterface && !isServer) then {

	//Compile functions
	pVeh_initClient            = compile (preprocessFileLineNumbers format["%1\client\pVeh_initClient.sqf",pVeh_folderPath]);
	pVeh_openMenu              = compile (preprocessFileLineNumbers format["%1\client\pVeh_openMenu.sqf",pVeh_folderPath]);
	pVeh_requestVehicle_client = compile (preprocessFileLineNumbers format["%1\client\pVeh_requestVehicle_client.sqf",pVeh_folderPath]);
	pVeh_servResponse          = compile (preprocessFileLineNumbers format["%1\client\pVeh_servResponse.sqf",pVeh_folderPath]);
};

/*---------------------------------------------------------------------------
	Server-Side
---------------------------------------------------------------------------*/
if (!hasInterface || isServer) then {

	//Compile Functions
	pVeh_initServer            = compile (preprocessFileLineNumbers format["%1\server\pVeh_initServer.sqf",pVeh_folderPath]);
	pVeh_cacheCheck            = compile (preprocessFileLineNumbers format["%1\server\pVeh_cacheCheck.sqf",pVeh_folderPath]);
	pVeh_requestVehicle_server = compile (preprocessFileLineNumbers format["%1\server\pVeh_requestVehicle_server.sqf",pVeh_folderPath]);
};

/*---------------------------------------------------------------------------
	Functions Compiled - Starting Script
---------------------------------------------------------------------------*/

//Load Config on Client & Server
[] call pVeh_config;

//Init Server-Side
if (!hasInterface && isServer) exitWith {
	[] call pVeh_initServer;
};

//Init Client-Side
[] call pVeh_initClient;

//byPlayer2