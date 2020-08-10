phone: MACRO
; trainer class, trainer id, map, time 1, script 1, time 2, script 2
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,   PLAYERS_HOUSE_1F, ANYTIME, MomPhoneScript,      0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, N_A,      0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,  N_A,              ANYTIME, BillPhoneScript1,    0,       BillPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_OAK,   OAKS_KANTO_LAB,         ANYTIME, OakPhoneScript1,     0,       OakPhoneScript2
	phone SCHOOLBOY,    JACK1,              NATIONAL_PARK,    ANYTIME, JackPhoneScript1,    ANYTIME, JackPhoneScript2
	phone POKEFANF,     BEVERLY1,           NATIONAL_PARK,    ANYTIME, BeverlyPhoneScript1, ANYTIME, BeverlyPhoneScript2
	phone SAILOR,       HUEY1,              TEKNOS_AQUARIUM_2F, ANYTIME, HueyPhoneScript1, ANYTIME, HueyPhoneScript2
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone BIRD_KEEPER,  JOSE2,              ROUTE_115,         ANYTIME, JosePhoneScript1,    ANYTIME, JosePhoneScript2
	phone COOLTRAINERF, REENA1,             ROUTE_115,         ANYTIME, ReenaPhoneScript1,   ANYTIME, ReenaPhoneScript2
	phone YOUNGSTER,    JOEY1,              ROUTE_120,        ANYTIME, JoeyPhoneScript1,    ANYTIME, JoeyPhoneScript2
	phone BUG_CATCHER,  WADE1,              ROUTE_106,        ANYTIME, WadePhoneScript1,    ANYTIME, WadePhoneScript2
	phone PICNICKER,    LIZ1,               ROUTE_112,        ANYTIME, LizPhoneScript1,     ANYTIME, LizPhoneScript2
	phone HIKER,        ANTHONY2,           ROUTE_106,        ANYTIME, AnthonyPhoneScript1, ANYTIME, AnthonyPhoneScript2
	phone CAMPER,       TODD1,              ROUTE_113,        ANYTIME, ToddPhoneScript1,    ANYTIME, ToddPhoneScript2
	phone PICNICKER,    GINA1,              ROUTE_113,        ANYTIME, GinaPhoneScript1,    ANYTIME, GinaPhoneScript2
	phone JUGGLER,      IRWIN1,             ROUTE_103,        ANYTIME, IrwinPhoneScript1,   ANYTIME, IrwinPhoneScript2
	phone BUG_CATCHER,  ARNIE1,             ROUTE_103,        ANYTIME, ArniePhoneScript1,   ANYTIME, ArniePhoneScript2
	phone SCHOOLBOY,    ALAN1,              ROUTE_102,        ANYTIME, AlanPhoneScript1,    ANYTIME, AlanPhoneScript2
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone LASS,         DANA1,              ROUTE_108,        ANYTIME, DanaPhoneScript1,    ANYTIME, DanaPhoneScript2
	phone POKEFANM,     DEREK1,             ROUTE_109,        ANYTIME, DerekPhoneScript1,   ANYTIME, DerekPhoneScript2
	phone POKEMANIAC,   BRENT1,             BOARDWALK,        ANYTIME, BrentPhoneScript1,   ANYTIME, BrentPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_BUENA, WESTPORT_DEPT_STORE_ROOF, ANYTIME, BuenaPhoneScript1, ANYTIME, BuenaPhoneScript2
