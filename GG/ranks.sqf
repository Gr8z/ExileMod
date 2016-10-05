
uiSleep 2;
_respect = ExileClientPlayerScore;
switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
    _rank = "Scavenger";  
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    
   //  "Your rank is Scavenger";
    };
     
    case (_respect > 4999 && _respect < 49999):
   {
   call ExileClient_object_player_bambiStateEnd;
    _rank = "Pickpocket";     
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,50000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

   //    "Your rank is Pickpocket";
   };
   
    case (_respect > 49999 && _respect < 99999):
   {
    _rank = "Thief";
    call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,100000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

   //   "Your rank is Thief";
   };
   
    case (_respect > 99999 && _respect < 149999):
   {
    _rank = "Gangster";  
    call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,150000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //  "Your rank is Gangster";
   };
   
    case (_respect > 149999 && _respect < 249999):
   {
   _rank = "Hitman";
   call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //   "Your rank is Hitman";
   };
   
    case (_respect > 249999 && _respect < 349999):
   {
    _rank = "Bounty Hunter";  
  call ExileClient_object_player_bambiStateEnd;
    [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,350000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //  "Your rank is Bounty Hunter";
   };
   
    case (_respect > 349999 && _respect < 449999):
   {
    _rank = "Mercenary";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,450000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //   "Your rank is Mercenary";
   };
   
    case (_respect > 449999 && _respect < 599999):
   {
    _rank = "Assassin";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,600000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //  "Your rank is Assassin"
   };
   
     case (_respect > 599999 && _respect < 799999):
   {
    _rank = "Terrorist";  
	call ExileClient_object_player_bambiStateEnd;
		[parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,800000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //   "Your rank is Terrorist";
   };
   
       case (_respect > 800000):
   {
    _rank = "Warlord";
    call ExileClient_object_player_bambiStateEnd;  
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t>",_rank],0,0,10,0] spawn bis_fnc_dynamictext;

   //    "Your rank is Warlord";
   };
   
    default
    {   
    //  "Your rank is Inmate";
    _rank = "Inmate";  
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	 player linkItem "ItemMap";
    };
};
