[] spawn {
  waitUntil {sleep 1; (!(isNil "PublicServerIsLoaded"))};
  waitUntil {sleep 1; (PublicServerIsLoaded)};
  execVM "exile_server_custom\traders\init.sqf";
};
