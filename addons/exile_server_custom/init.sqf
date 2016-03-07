[] spawn {
  waitUntil {sleep 1; (!(isNil "PublicServerIsLoaded"))};
  waitUntil {sleep 1; (PublicServerIsLoaded)};
  diag_log "TornZ";
};
