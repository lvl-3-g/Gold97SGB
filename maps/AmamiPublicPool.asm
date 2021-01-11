	object_const_def ; object_event constants
	const AMAMI_PUBLIC_POOL_SQUIRTLE_GIRL
	const AMAMI_PUBLIC_POOL_SWIMMER_GUY
	const AMAMI_PUBLIC_POOL_SWIMMER_GIRL
	const AMAMI_PUBLIC_POOL_GRANNY
	const AMAMI_PUBLIC_POOL_BUG_CATCHER
	const AMAMI_PUBLIC_POOL_LASS

AmamiPublicPool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiPublicPoolSwimmerSquirtle:
	faceplayer
	opentext
	checkevent EVENT_GOT_SQUIRTLE_FROM_POOL
	iftrue .AlreadyGotSquirtle
	writetext ILoveSquirtleText
	yesorno
	iffalse .DontTakeSquirtle
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSquirtle
	writetext ReceiveSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	writetext GiveSquirtleText
	waitbutton
	closetext
	setevent EVENT_GOT_SQUIRTLE_FROM_POOL
	end
	
.AlreadyGotSquirtle
	writetext AlreadyGotSquirtleText
	waitbutton
	closetext
	end
	
.DontTakeSquirtle
	writetext NoSquirtleText
	waitbutton
	closetext
	end
	
.PartyFullSquirtle
	writetext PartyFullSquirtleText
	waitbutton
	closetext
	end
	
AmamiPublicPoolSwimmerGuyScript:
	jumptextfaceplayer AmamiPublicPoolSwimmerGuyText
	
AmamiPublicPoolSwimmerGirlScript:
	jumptextfaceplayer AmamiPublicPoolSwimmerGirlText
	
AmamiPublicPoolGrannyScript:
	jumptextfaceplayer AmamiPublicPoolGrannyText
	
AmamiPublicPoolBugCatcherScript:
	jumptextfaceplayer AmamiPublicPoolBugCatcherText

AmamiPublicPoolLassScript:
	jumptextfaceplayer AmamiPublicPoolLassText
	
AmamiPublicPoolLassText:
	text "A more controlled"
	line "environment like"
	para "an indoor pool can"
	line "be a better place"
	para "to train weaker"
	line "#MON than out"
	cont "on the open sea."
	done
	
AmamiPublicPoolBugCatcherText:
	text "I want to go"
	line "swimming!"
	done
	
AmamiPublicPoolGrannyText:
	text "I can't really"
	line "swim so well any-"
	cont "more."
	para "But my #MON"
	line "love the water,"
	para "so I bring them"
	line "here frequently."
	done
	
AmamiPublicPoolSwimmerGirlText:
	text "Water type #MON"
	line "love being in the"
	cont "water!"
	para "Makes sense,"
	line "right?"
	done
	
AmamiPublicPoolSwimmerGuyText:
	text "Swimming is good"
	line "exercise for both"
	para "people and #-"
	line "MON!"
	done
	
ReceiveSquirtleText:
	text "<PLAYER> received"
	line "SQUIRTLE."
	done
	
AlreadyGotSquirtleText:
	text "I come here to"
	line "swim with my"
	para "SQUIRTLE almost"
	line "every day!"
	done
	
PartyFullSquirtleText:
	text "You've already got"
	line "too many #MON"
	cont "with you!"
	done
	
NoSquirtleText:
	text "You sure?"
	para "They're such great"
	line "#MON!"
	done
	
	
ILoveSquirtleText:
	text "SQUIRTLE are great"
	line "swimmers!"
	para "Have you ever gone"
	line "swimming with a"
	cont "SQUIRTLE?"
	para "You have to try"
	line "it!"
	para "They're also great"
	line "#MON to raise!"
	para "I've got a young"
	line "one that needs"
	para "someone to train"
	line "it."
	para "Here, you should"
	line "raise a SQUIRTLE!"
	done
	
GiveSquirtleText:
	text "Help it grow up"
	line "big and strong!"
	done
	
AmamiPublicPool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, AMAMI_TOWN, 5
	warp_event  7, 17, AMAMI_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerSquirtle, -1
	object_event  9,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerGuyScript, -1
	object_event  11, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerGirlScript, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolGrannyScript, -1
	object_event  3, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolBugCatcherScript, -1
	object_event 18,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolLassScript, -1
