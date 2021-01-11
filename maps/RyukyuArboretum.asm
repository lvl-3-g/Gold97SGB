	object_const_def ; object_event constants
	const RYUKYU_ARBORETUM_BULBASAUR_LADY
	const RYUKYU_ARBORETUM_ODDISH
	const RYUKYU_ARBORETUM_BULBASAUR
	const RYUKYU_ARBORETUM_PARAS
	const RYUKYU_ARBORETUM_YOUNGSTER
RyukyuArboretum_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


RyukyuArboretumHouseCooltrainer:
	faceplayer
	opentext
	checkevent EVENT_GOT_BULBASAUR_FROM_ARBORETUM
	iftrue .AlreadyGotBulbasaur
	writetext ILoveBulbasaurText
	yesorno
	iffalse .DontTakeBulbasaur
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullBulbasaur
	writetext UnknownText_0x7e355ab
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 5
	writetext GiveBulbasaurText
	waitbutton
	closetext
	setevent EVENT_GOT_BULBASAUR_FROM_ARBORETUM
	end
	
.AlreadyGotBulbasaur
	writetext AlreadyGotBulbasaurText
	waitbutton
	closetext
	end
	
.DontTakeBulbasaur
	writetext NoBulbasaurText
	waitbutton
	closetext
	end
	
.PartyFullBulbasaur
	writetext PartyFullBulbasaurText
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainOddishScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainOddishText
	cry ODDISH
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainBulbasaurScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainBulbasaurText
	cry BULBASAUR
	waitbutton
	closetext
	end
	
RyukyuMagnetTrainParasScript:
	faceplayer
	opentext
	writetext RyukyuMagnetTrainParasText
	cry PARAS
	waitbutton
	closetext
	end
	
RyukyuArboretumHouseYoungsterScript:
	jumptextfaceplayer RyukyuArboretumHouseYoungsterText
	
RyukyuArboretumHouseYoungsterText:
	text "This place is"
	line "neat!"
	para "Grass #MON seem"
	line "to love it here!"
	done
	
RyukyuMagnetTrainParasText:
	text "PARAS:"
	line "Paraa…"
	done
	
RyukyuMagnetTrainBulbasaurText:
	text "BULBASAUR:"
	line "Bulba!"
	done
	
RyukyuMagnetTrainOddishText:
	text "ODDISH:"
	line "Oddd?"
	done
	
UnknownText_0x7e355ab:
	text "<PLAYER> received"
	line "BULBASAUR."
	done
	
AlreadyGotBulbasaurText:
	text "I have many tree"
	line "species from"
	cont "around NIHON!"
	done
	
PartyFullBulbasaurText:
	text "You've already got"
	line "too many #MON"
	cont "with you!"
	done
	
NoBulbasaurText:
	text "I understand."
	para "I'll be here if"
	line "you change your"
	cont "mind!"
	done
	

ILoveBulbasaurText:
	text "Hi there!"
	para "I'm running an"
	line "arboretum."
	para "That means I take"
	line "care of trees!"
	para "This building is"
	line "full of windows"
	para "that let light in"
	line "for the trees."
	para "It's also full of"
	line "grass #MON to"
	cont "take care of them!"
	para "I can only keep so"
	line "many #MON here,"
	cont "though."
	para "I've got a"
	line "BULBASAUR that I"
	para "need to find a"
	line "good home for."
	para "Would you be"
	line "willing to take"
	cont "it?"
	done
	
GiveBulbasaurText:
	text "I'm sure you'll"
	line "take great care"
	cont "of it!"
	done


RyukyuArboretum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 8
	warp_event  9, 17, RYUKYU_CITY, 8
	
	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  7,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuArboretumHouseCooltrainer, -1
	object_event  5, 13, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainOddishScript, -1
	object_event 14,  8, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainBulbasaurScript, -1
	object_event  6,  7, SPRITE_PARAS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuMagnetTrainParasScript, -1
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuArboretumHouseYoungsterScript, -1
