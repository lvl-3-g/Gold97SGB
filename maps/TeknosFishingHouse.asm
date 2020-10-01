	object_const_def ; object_event constants
	const TEKNOSFISHINGHOUSE_FISHER

TeknosFishingHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


BlisseySpeechHouseRadio:
	jumpstd Radio2Script
	

TeknosFishingHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext TeknosFishingHouseFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext TeknosFishingHouseFishingGuruText_Yes
	buttonsound
	verbosegiveitem OLD_ROD
	writetext TeknosFishingHouseFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext TeknosFishingHouseFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext TeknosFishingHouseFishingGuruText_After
	waitbutton
	closetext
	end


TeknosFishingHouseFishingGuruText_Question:
	text "The river on"
	line "ROUTE 119 is a"
	para "popular fishing"
	line "spot."
	
	para "You want to fish?"

	para "Would you like one"
	line "of my RODS?"
	done

TeknosFishingHouseFishingGuruText_Yes:
	text "Heh, that's good"
	line "to hear."

	para "Now you're an"
	line "angler too!"
	done

TeknosFishingHouseFishingGuruText_GiveOldRod:
	text "Fishing is great!"

	para "If there's water,"
	line "be it the sea or a"

	para "stream, try out"
	line "your ROD."
	done

TeknosFishingHouseFishingGuruText_No:
	text "Oh. That's rather"
	line "disappointing…"
	done

TeknosFishingHouseFishingGuruText_After:
	text "Yo, kid. How are"
	line "they biting?"
	done

TeknosFishingHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 4
	warp_event  5,  7, TEKNOS_CITY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BlisseySpeechHouseRadio

	db 1 ; object events
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosFishingHouseFishingGuruScript, -1
