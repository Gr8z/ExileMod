// Exile Ranks here ! by CRE4MPIE
uiSleep 2;
_respect = ExileClientPlayerScore;

switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
	_rank = "Enforcer";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

	};
	
    case (_respect > 5000 && _respect < 9999):
   {
	 _rank = "Slayer";     
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,10000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
	case (_respect > 9999 && _respect < 19999):
   {
	_rank = "Hit Man";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,20000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 19999 && _respect < 29999):
   {
	_rank = "Executioner";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,30000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 29999 && _respect < 39999):
   {

	_rank = "Tyrant";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,40000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 39999 && _respect < 49999):
   {
	_rank = "Triggerman";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,50000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 49999 && _respect < 69999):
   {
	_rank = "Trooper";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,70000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 69999 && _respect < 89999):
   {
	_rank = "High Executioner";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,90000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
     case (_respect > 89999 && _respect < 149999):
   {

	_rank = "Reaper";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,150000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
   };

     case (_respect > 149999):
   {
	_rank = "Supreme Overlord";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/>",_rank],0,0,10,0] spawn bis_fnc_dynamictext;
   };
    default
    {	
	_rank = "Scrub";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	};
};