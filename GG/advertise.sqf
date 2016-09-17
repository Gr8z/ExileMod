waitUntil{player == player};
GGAdsMessages =
{
        _messageArray = [
                ["Want to Team up with other people?","We have a teamspeak where we can play all together","Join us at TS.GhostzGamerz.com","","",""],
                ["Visit our website at www.GhostzGamerz.com","","",""],
                ["Join Our Teamspeak to get 10,000 Free Pop Tabs","TS.GhostzGamerz.com","","",""],
                ["Get a pro building box By Posting 30 Posts on the Forums.","","",""],
                ["You can learn alot about our comunity just by Joining our Teamspeak and Forums","Visit www.GhostzGamerz.com","","",""],
                ["You can easily send your feeback on our forums."],
                ["We are waiting for you on our TS Server","TS.ghostzgamerz.com","","",""]
        ];
        _msg = _messageArray select (random (count _messageArray - 1));
        [_msg, -.5, .85] call BIS_fnc_typeText;
}; 
sleep 180;
GGAdsMessagesLoop = [600, GGAdsMessages, [], true] call ExileClient_system_thread_addtask;

// Fix Map disappearing from inventory
Map_FIX_CODE = {
        if !('ItemMap' in (items player + assignedItems player)) then
        {
                player removeItem 'itemMap';
                player unlinkItem 'itemMap';
                player linkItem 'itemMap';
        };
};

mapRefresh = [30, Map_FIX_CODE, [], true] call ExileClient_system_thread_addtask;