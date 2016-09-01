waitUntil{player == player};
GGAdsMessages =
{
        _messageArray = [
                ["Want to Team up with other people? We have a teamspeak where we can play all together. Join us at TS.GhostzGamerz.com"],
                ["Visit our website at www.GhostzGamerz.com"],
                ["Report all trader Rammers to Teamspeak. Do not Ram or kamakaze in trader cities."],
                ["We are looking for staff. Please Apply on our Forums."],
                ["Join Our Teamspeak to get 10,000 Free Pop Tabs - TS.GhostzGamerz.com"],
                ["Get a pro building box By Posting 30 Posts on the Forums."],
                ["You can learn alot about our comunity just by Joining our Teamspeak and Forums. Visit www.GhostzGamerz.com"],
                ["You can easily send your feeback on our forums."]
        ];
        _msg = _messageArray select (random (count _messageArray - 1));
        [[_msg], -.5, .85] call BIS_fnc_typeText;
}; 
sleep 180;
GGAdsMessagesLoop = [300, GGAdsMessages, [], true] call ExileClient_system_thread_addtask;
