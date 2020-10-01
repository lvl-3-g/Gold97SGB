	object_const_def ; object_event constants
	const SANSKRITGAMBLERMANHOUSE_GAMBLER_MAN

SanskritGamblerManHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SanskritGamblerManHouseGamblerManScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COIN_CASE_FROM_GAMBLER
	iftrue .GotCoinCase
	writetext SanskritGamblerManHouseGamblerManText_Question
	yesorno
	iffalse .Refused
	writetext SanskritGamblerManHouseGamblerManText_Yes
	buttonsound
	verbosegiveitem COIN_CASE
	writetext SanskritGamblerManHouseGamblerManText_GiveCoinCase
	waitbutton
	closetext
	setevent EVENT_GOT_COIN_CASE_FROM_GAMBLER
	end

.Refused:
	writetext SanskritGamblerManHouseGamblerManText_No
	waitbutton
	closetext
	end

.GotCoinCase:
	writetext SanskritGamblerManHouseGamblerManText_After
	waitbutton
	closetext
	end


SanskritGamblerManHouseGamblerManText_Question:
	text "SANSKRIT TOWN has"
	line "never had a high-"
	cont "profile venue for"
	cont "entertainment."
	para "That is, until the"
	line "GAME CORNER opened"
	cont "near here."
	para "I've spent way too"
	line "much time there."
	para "It actually might"
	line "be becoming a bit"
	cont "of an issue."
	para "Here! You should"
	line "take this from me!"
	done

SanskritGamblerManHouseGamblerManText_Yes:
	text "Great! Maybe you"
	line "will be more"
	para "responsible than"
	line "me!"
	done

SanskritGamblerManHouseGamblerManText_GiveCoinCase:
	text "The GAME CORNER"
	line "is tons of fun!"
	para "But be careful,"
	line "and don't let it"
	para "become too much"
	line "fun."
	done

SanskritGamblerManHouseGamblerManText_No:
	text "Oh. I guess I"
	line "should work on my"
	para "own self-restraint"
	line "instead…"
	done

SanskritGamblerManHouseGamblerManText_After:
	text "Ah, a burden has"
	line "been lifted from"
	cont "me."
	done


SanskritGamblerManHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 2
	warp_event  5,  7, SANSKRIT_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritGamblerManHouseGamblerManScript, -1
