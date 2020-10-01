specialcall: MACRO
; condition, contact, script
	dw \1
	db \2
	dba \3
ENDM

SpecialPhoneCallList:
; entries correspond to SPECIALCALL_* constants
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_OAK2,      Oak2PhoneCallerScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_OAK2,      Oak2PhoneCallerScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_OAK2,      Oak2PhoneCallerScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_OAK2,      Oak2PhoneCallerScript
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_OAK2,      Oak2PhoneCallerScript
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_BIKESHOP, BikeShopPhoneCallerScript
	specialcall SpecialCallWhereverYouAre,  PHONECONTACT_MOM,      MomPhoneLectureScript
	specialcall SpecialCallOnlyWhenOutside, PHONECONTACT_OAK2,      Oak2PhoneCallerScript
