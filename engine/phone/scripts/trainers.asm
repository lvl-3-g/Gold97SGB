JackPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

JackPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneNationalParkText
	setevent EVENT_JACK_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

BeverlyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

BeverlyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneNationalParkText
	setevent EVENT_BEVERLY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

HueyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male_SkipMon

HueyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	sjump Phone_GenericCall_Male_SkipMon

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneLighthouseText
	setevent EVENT_HUEY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

GavenPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

GavenPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRouteU6UText
	setevent EVENT_GAVEN_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

BethPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

BethPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRouteU6UText
	setevent EVENT_BETH_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

JosePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

JosePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	scall PhoneScript_Random4
	ifequal 0, Phone_WrongNumber_JoseBrent
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute115Text
	setevent EVENT_JOSE_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ReenaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

ReenaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute115Text
	setevent EVENT_REENA_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

JoeyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

JoeyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_WESTPORT
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute120Text
	setevent EVENT_JOEY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

WadePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	scall PhoneScript_AnswerPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .Generic
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .Generic
	readvar VAR_WEEKDAY
	ifequal TUESDAY, PhoneScript_BugCatchingContest
	ifequal THURSDAY, PhoneScript_BugCatchingContest
	ifequal SATURDAY, PhoneScript_BugCatchingContest

.Generic:
	sjump Phone_GenericCall_Male

WadePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, PhoneScript_BugCatchingContest
	ifequal THURSDAY, PhoneScript_BugCatchingContest
	ifequal SATURDAY, PhoneScript_BugCatchingContest

.NoContest:
	checkflag ENGINE_FLYPOINT_WESTPORT
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute106Text
	setevent EVENT_WADE_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

RalphPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

RalphPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_WESTPORT
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, .PluckrossSwarm
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute112Text
	setevent EVENT_RALPH_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

.PluckrossSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, PLUCKROSS
	getstring STRING_BUFFER_5, PhoneRoute112Text
	setval FISHSWARM_PLUCKROSS
	special ActivateFishingSwarm
	sjump PhoneScript_SwarmFish

LizPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

LizPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall PhoneScript_GreetPhone_Female
	checkflag ENGINE_FLYPOINT_WESTPORT
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute112Text
	setevent EVENT_LIZ_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

AnthonyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY2
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

AnthonyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY2
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_WESTPORT
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, .ParetteSwarm
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute104Text
	setevent EVENT_ANTHONY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

.ParetteSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, PARETTE
	getstring STRING_BUFFER_5, PhoneDarkCaveText
	swarm AMPARE_CAVERN_B1F
	sjump PhoneScript_SwarmCave

ToddPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ToddPhoneCallerScript:
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_WESTPORT
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute113Text
	setevent EVENT_TODD_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

GinaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	scall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRocketRumorScript
	sjump Phone_GenericCall_Female

GinaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	scall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRocketRumorScript
	checkflag ENGINE_FLYPOINT_WESTPORT
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute112Text
	setevent EVENT_GINA_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

IrwinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue IrwinRocketRumorScript
	sjump Phone_GenericCall_Male

IrwinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue IrwinRocketRumorScript
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute103Text
	setevent EVENT_IRWIN_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ArniePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ArniePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, .OsunfishSwarm
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute103Text
	setevent EVENT_ARNIE_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

.OsunfishSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, OSUNFISH
	getstring STRING_BUFFER_5, PhoneRoute103Text
	swarm ROUTE_103
	sjump PhoneScript_SwarmGrass

AlanPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

AlanPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute102Text
	setevent EVENT_ALAN_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

DanaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, LASS, DANA1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

DanaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, LASS, DANA1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute106Text
	setevent EVENT_DANA_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

ChadPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ChadPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .SnubbullSwarm
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.SnubbullSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, EEVEE
	getstring STRING_BUFFER_5, PhoneRoute106Text
	swarm ROUTE_106
	sjump PhoneScript_SwarmGrass

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute106Text
	setevent EVENT_CHAD_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

DerekPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall PhoneScript_AnswerPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .Generic
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .Generic
	readvar VAR_WEEKDAY
	ifequal TUESDAY, PhoneScript_BugCatchingContest
	ifequal THURSDAY, PhoneScript_BugCatchingContest
	ifequal SATURDAY, PhoneScript_BugCatchingContest

.Generic:
	sjump Phone_GenericCall_Male

DerekPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, PhoneScript_BugCatchingContest
	ifequal THURSDAY, PhoneScript_BugCatchingContest
	ifequal SATURDAY, PhoneScript_BugCatchingContest

.NoContest:
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute109Text
	setevent EVENT_DEREK_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ChrisPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, CHRIS1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ChrisPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, CHRIS1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute119Text
	setevent EVENT_CHRIS_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

BrentPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

BrentPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall PhoneScript_Random4
	ifequal 0, Phone_WrongNumber_JoseBrent
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneBoardwalkText
	setevent EVENT_BRENT_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

TiffanyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

TiffanyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	scall PhoneScript_Random4
	ifequal 0, Phone_WrongNumber_Tiffany
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneBoardwalkText
	setevent EVENT_TIFFANY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

VancePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

VancePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneKikaiStraitText
	setevent EVENT_VANCE_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

WiltonPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

WiltonPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .RemoraidSwarm
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.RemoraidSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, REMORAID
	getstring STRING_BUFFER_5, PhoneKikaiStraitText
	setval FISHSWARM_REMORAID
	special ActivateFishingSwarm
	sjump PhoneScript_SwarmFish

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneKikaiStraitText
	setevent EVENT_WILTON_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

KenjiPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

KenjiPhoneCallerScript:
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneTatsugoPathText
	setevent EVENT_KENJI_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ParryPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ParryPhoneCallerScript:
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .MarillSwarm
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.MarillSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, MARILL
	getstring STRING_BUFFER_5, PhoneMtMortarText
	swarm CHARRED_SUMMIT_CAVE
	sjump PhoneScript_SwarmCave

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneTatsugoPathText
	setevent EVENT_PARRY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ErinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

ErinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneGreatEastStraitText
	setevent EVENT_ERIN_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

INCLUDE "engine/phone/scripts/generic.asm"

INCLUDE "data/phone/text/landmarks.asm"
