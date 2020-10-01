MomPhoneCalleeScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iftrue .script_10401f
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	iftrue MomPhoneNoGymQuestScript
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue MomPhoneNoPokedexScript
	sjump MomPhoneNoPokemonScript

.script_10401f
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue MomPhoneHangUpScript
	writetext MomPhoneGreetingText
	promptbutton
	getcurlandmarkname STRING_BUFFER_3
	readvar VAR_ROOFPALETTE
	ifequal 1, MomPhonePalette1
	ifequal 2, MomPhonePalette2
	sjump MomPhoneOther

MomPhoneLandmark:
	writetext MomPhoneLandmarkText
	promptbutton
	sjump MomSavingMoney

MomPhonePalette1:
	readvar VAR_MAPGROUP
	ifequal GROUP_SILENT_TOWN, .silent
	ifequal GROUP_CROWN_CITY, .crown
	ifequal GROUP_PAGOTA_CITY, .pagota
	ifequal GROUP_BIRDON_TOWN, .birdon
	ifequal GROUP_WESTPORT_CITY, .westport
	ifequal GROUP_TEKNOS_CITY, .teknos
	ifequal GROUP_SUNPOINT_CITY, .sunpoint
	ifequal GROUP_STAND_CITY, .stand
	writetext MomPhoneGenericAreaText
	promptbutton
	sjump MomSavingMoney

.silent
	writetext MomPhoneSilentText
	promptbutton
	sjump MomSavingMoney

.crown
	writetext MomPhoneCrownText
	promptbutton
	sjump MomSavingMoney

.pagota
	getstring STRING_BUFFER_4, .text_sprout_tower
	sjump MomPhoneLandmark
.text_sprout_tower
	db "5 FLOOR TOWER@"

.birdon
	getstring STRING_BUFFER_4, .text_slowpoke_well
	sjump MomPhoneLandmark
.text_slowpoke_well
	db "SLOWPOKE WELL@"

.westport
	getstring STRING_BUFFER_4, .text_radio_tower
	sjump MomPhoneLandmark
.text_radio_tower
	db "RADIO TOWER@"
	
.teknos
	getstring STRING_BUFFER_4, .text_aquarium
	sjump MomPhoneLandmark
.text_aquarium
	db "the AQUARIUM@"
	
.sunpoint
	getstring STRING_BUFFER_4, .text_magma_shaft
	sjump MomPhoneLandmark
.text_magma_shaft
	db "the MAGMA SHAFT@"
	
.stand
	getstring STRING_BUFFER_4, .text_stand_zoo
	sjump MomPhoneLandmark
.text_stand_zoo
	db "the #MON ZOO@"

MomPhonePalette2:
	writetext MomOtherAreaText
	promptbutton
	sjump MomSavingMoney

MomPhoneOther:
	writetext MomDeterminedText
	promptbutton
	sjump MomSavingMoney

MomSavingMoney:
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse .NotSaving
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .SavingHasMoney
	sjump .SavingNoMoney

.NotSaving:
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .HasMoney
	sjump .NoMoney

.SavingHasMoney:
	getmoney STRING_BUFFER_3, MOMS_MONEY
	writetext MomCheckBalanceText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.SavingNoMoney:
	writetext MomImportantToSaveText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.NoMoney:
	writetext MomYoureNotSavingText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.HasMoney:
	getmoney STRING_BUFFER_3, MOMS_MONEY
	writetext MomYouveSavedText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

MomPhoneSaveMoneyScript:
	setflag ENGINE_MOM_SAVING_MONEY
	writetext MomOKIllSaveText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneStopSavingMoneyScript:
	clearflag ENGINE_MOM_SAVING_MONEY
	writetext MomPhoneStopSavingMoneyText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneHangUpScript:
	writetext MomPhoneHangUpText
	end

MomPhoneNoPokemonScript:
	writetext MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript:
	writetext MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript:
	writetext MomPhoneNoGymQuestText
	end

MomPhoneLectureScript:
	setevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	setflag ENGINE_MOM_ACTIVE
	specialphonecall SPECIALCALL_NONE
	writetext MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript
