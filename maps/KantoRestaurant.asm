	object_const_def ; object_event constants
	const KANTOCAFE2_SUPER_NERD
	const KANTOCAFE2_FISHER1
	const KANTOCAFE2_FISHER2
	const KANTOCAFE2_FISHER3
	const KANTOCAFE2_TEACHER

KantoRestaurant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoCafe2Chef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

KantoCafe2Fisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER1, LEFT
	end

KantoCafe2Fisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER2, RIGHT
	end

KantoCafe2Fisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_WestportIsBest
	waitbutton
	closetext
	turnobject KANTOCAFE2_FISHER3, RIGHT
	end

KantoCafe2Teacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject KANTOCAFE2_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

KantoCafe2Trashcan:
	checkevent EVENT_FOUND_MYSTERYBERRY_IN_KANTO_CAFE
	iftrue .TrashEmpty
	giveitem MYSTERYBERRY
	iffalse .PackFull
	opentext
	itemtotext MYSTERYBERRY, MEM_BUFFER_0
	writetext FoundLeftoversText2
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_MYSTERYBERRY_IN_KANTO_CAFE
	end

.PackFull:
	opentext
	itemtotext MYSTERYBERRY, MEM_BUFFER_0
	writetext FoundLeftoversText2
	buttonsound
	writetext NoRoomForLeftoversText2
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd TrashCanScript

ChefText_Eatathon:
	text "Hi!"

	para "We're holding an"
	line "eatathon contest."

	para "We can't serve you"
	line "right now. Sorry."
	done

Fisher1Text_Snarfle:
	text "…Snarfle, chew…"
	done

Fisher1Text_Concentration:
	text "Don't talk to me!"

	para "You'll break my"
	line "concentration!"
	done

Fisher2Text_GulpChew:
	text "…Gulp… Chew…"
	done

Fisher2Text_Quantity:
	text "I take quantity"
	line "over quality!"

	para "I'm happy when I'm"
	line "full!"
	done

Fisher3Text_MunchMunch:
	text "Munch, munch…"
	done

Fisher3Text_WestportIsBest:
	text "The food is good"
	line "here, but ALLOY"
	para "CAFE has the best"
	line "food anywhere."
	done

TeacherText_CrunchCrunch:
	text "Crunch… Crunch…"
	done

TeacherText_NoCoinCase:
	text "Nobody here will"
	line "give you a COIN"

	para "CASE. You should"
	line "look elsewhere."
	done

TeacherText_KeepEating:
	text "Crunch… Crunch…"

	para "I can keep eating!"
	done

TeacherText_MoreChef:
	text "More, CHEF!"
	done

EatathonContestPosterText:
	text "Eatathon Contest!"
	line "No time limit!"

	para "A battle without"
	line "end! The biggest"

	para "muncher gets it"
	line "all for free!"
	done

FoundLeftoversText2:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

NoRoomForLeftoversText2:
	text "But <PLAYER> can't"
	line "hold another item…"
	done

KantoRestaurant_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, KANTO_REGION, 30
	warp_event  5,  9, KANTO_REGION, 31

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  9,  9, BGEVENT_READ, KantoCafe2Trashcan

	db 5 ; object events
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoCafe2Chef, -1
	object_event  2,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher1, -1
	object_event  7,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher2, -1
	object_event  7,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Fisher3, -1
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCafe2Teacher, -1
