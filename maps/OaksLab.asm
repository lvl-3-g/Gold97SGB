	object_const_def ; object_event constants

OaksLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text
	
OaksLabPC:
	jumptext OaksLabPCText

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabPCText:
	text "It isn't turned"
	line "on…"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_REGION, 17
	warp_event  4,  7, KANTO_REGION, 18

	db 0 ; coord events

	db 7 ; bg events
	bg_event  0,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  5, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 0 ; object events
