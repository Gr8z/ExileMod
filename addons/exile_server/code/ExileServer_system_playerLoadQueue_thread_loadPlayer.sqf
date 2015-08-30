/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_who","_key","_query","_response"];
if!(ExileSystemDatabaseASYNC isEqualTo [])then
{
	{
		_who = _x select 0;
		_key = _x select 1;
		if(_key isEqualTo "")then
		{
			_query = format["2:%1:loadPlayer:%2",ExileServerDatabaseSessionId,_who];
			_response = call compile("extDB2" callExtension _query);
			_x set [1,_response select 1];
		}
		else
		{
			_query = format["4:%1",_key];
			_response = call compile("extDB2" callExtension _query);
			if((_response select 0) isEqualTo 1)then
			{
				[((_response select 1) select 0),_x select 2] call ExileServer_object_player_database_load;
				ExileSystemDatabaseASYNC deleteAt _forEachIndex;
			};
		};
	}
	forEach ExileSystemDatabaseASYNC;
};