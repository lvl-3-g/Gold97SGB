phone: MACRO
; trainer class, trainer id, map, callee time, callee script, caller time, caller script
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      PLAYERS_HOUSE_1F,          ANYTIME, MomPhoneCalleeScript,     0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, OAKS_LAB,                  0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,     N_A,                       ANYTIME, BillPhoneCalleeScript,    0,       BillPhoneCallerScript
	phone TRAINER_NONE, PHONECONTACT_OAK2,      OAK_LAB_BACK_ROOM,                  ANYTIME, Oak2PhoneCalleeScript,     0,       Oak2PhoneCallerScript
	phone SCHOOLBOY,    JACK1,                 NATIONAL_PARK,             ANYTIME, JackPhoneCalleeScript,    ANYTIME, JackPhoneCallerScript
	phone POKEFANF,     BEVERLY1,              NATIONAL_PARK,             ANYTIME, BeverlyPhoneCalleeScript, ANYTIME, BeverlyPhoneCallerScript
	phone SAILOR,       HUEY1,                 TEKNOS_AQUARIUM_2F,     ANYTIME, HueyPhoneCalleeScript,    ANYTIME, HueyPhoneCallerScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone COOLTRAINERM, GAVEN3,                ROUTE_115,                  ANYTIME, GavenPhoneCalleeScript,   ANYTIME, GavenPhoneCallerScript
	phone COOLTRAINERF, BETH1,                 ROUTE_115,                  ANYTIME, BethPhoneCalleeScript,    ANYTIME, BethPhoneCallerScript
	phone BIRD_KEEPER,  JOSE2,                 ROUTE_115,                  ANYTIME, JosePhoneCalleeScript,    ANYTIME, JosePhoneCallerScript; used, route 115
	phone COOLTRAINERF, REENA1,                ROUTE_115,                  ANYTIME, ReenaPhoneCalleeScript,   ANYTIME, ReenaPhoneCallerScript; used, route 115
	phone YOUNGSTER,    JOEY1,                 ROUTE_120,                  ANYTIME, JoeyPhoneCalleeScript,    ANYTIME, JoeyPhoneCallerScript; used, route 120
	phone BUG_CATCHER,  WADE1,                 ROUTE_106,                  ANYTIME, WadePhoneCalleeScript,    ANYTIME, WadePhoneCallerScript
	phone FISHER,       RALPH1,                ROUTE_112,                  ANYTIME, RalphPhoneCalleeScript,   ANYTIME, RalphPhoneCallerScript
	phone PICNICKER,    LIZ1,                  ROUTE_112,                  ANYTIME, LizPhoneCalleeScript,     ANYTIME, LizPhoneCallerScript; used, route 112
	phone HIKER,        ANTHONY2,              ROUTE_104,                  ANYTIME, AnthonyPhoneCalleeScript, ANYTIME, AnthonyPhoneCallerScript
	phone CAMPER,       TODD1,                 ROUTE_113,                  ANYTIME, ToddPhoneCalleeScript,    ANYTIME, ToddPhoneCallerScript
	phone PICNICKER,    GINA1,                 ROUTE_112,                  ANYTIME, GinaPhoneCalleeScript,    ANYTIME, GinaPhoneCallerScript; used, route 112
	phone JUGGLER,      IRWIN1,                ROUTE_103,                  ANYTIME, IrwinPhoneCalleeScript,   ANYTIME, IrwinPhoneCallerScript
	phone BUG_CATCHER,  ARNIE1,                ROUTE_103,                  ANYTIME, ArniePhoneCalleeScript,   ANYTIME, ArniePhoneCallerScript
	phone SCHOOLBOY,    ALAN1,                 ROUTE_102,                  ANYTIME, AlanPhoneCalleeScript,    ANYTIME, AlanPhoneCallerScript; used, route 102
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone LASS,         DANA1,                 ROUTE_108,                  ANYTIME, DanaPhoneCalleeScript,    ANYTIME, DanaPhoneCallerScript
	phone SCHOOLBOY,    CHAD1,                 ROUTE_106,                  ANYTIME, ChadPhoneCalleeScript,    ANYTIME, ChadPhoneCallerScript; used, route 106
	phone POKEFANM,     DEREK1,                ROUTE_109,                  ANYTIME, DerekPhoneCalleeScript,   ANYTIME, DerekPhoneCallerScript
	phone FISHER,       CHRIS1,                ROUTE_119,                  ANYTIME, ChrisPhoneCalleeScript,   ANYTIME, ChrisPhoneCallerScript; used, route 119
	phone POKEMANIAC,   BRENT1,                BOARDWALK,                  ANYTIME, BrentPhoneCalleeScript,   ANYTIME, BrentPhoneCallerScript; used, boardwalk
	phone PICNICKER,    TIFFANY3,              BOARDWALK,                  ANYTIME, TiffanyPhoneCalleeScript, ANYTIME, TiffanyPhoneCallerScript
	phone BIRD_KEEPER,  VANCE1,                KIKAI_STRAIT,                  ANYTIME, VancePhoneCalleeScript,   ANYTIME, VancePhoneCallerScript
	phone FISHER,       WILTON1,               KIKAI_STRAIT,                  ANYTIME, WiltonPhoneCalleeScript,  ANYTIME, WiltonPhoneCallerScript
	phone BLACKBELT_T,  KENJI3,                TATSUGO_PATH,                  ANYTIME, KenjiPhoneCalleeScript,   ANYTIME, KenjiPhoneCallerScript
	phone HIKER,        PARRY1,                TATSUGO_PATH,                  ANYTIME, ParryPhoneCalleeScript,   ANYTIME, ParryPhoneCallerScript
	phone PICNICKER,    ERIN1,                 GREAT_EAST_STRAIT,                  ANYTIME, ErinPhoneCalleeScript,    ANYTIME, ErinPhoneCallerScript
