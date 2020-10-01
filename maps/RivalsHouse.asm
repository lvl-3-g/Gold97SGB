	object_const_def ; object constants
	const RIVALSHOUSE_RIVALS_MOM
	const RIVALSHOUSE_RIVALS_BROTHER

RivalsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalsMom:
	jumptextfaceplayer RivalsMomText

RivalsBrother:
	jumptextfaceplayer RivalsBrotherText


RivalsHouseBookshelf:
	jumpstd DifficultBookshelfScript

RivalsMomText:
	text "Hi, <PLAYER>! My"
	line "son's always so"
	cont "energetic."
	para "When he gets his"
	line "mind set on"
	para "something, he'll"
	line "just go at it,"
	cont "full speed ahead."
	done

RivalsBrotherText:
	text "When I grow up,"
	line "I'm going to be"
	cont "a #MON breeder!"

	para "I'll raise all"
	line "the #MON!"
	done




RivalsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SILENT_TOWN, 4
	warp_event  5,  7, SILENT_TOWN, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  5,  0, BGEVENT_READ, RivalsHouseBookshelf

	db 2 ; object events
	object_event  5,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RivalsMom, -1
	object_event  2,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalsBrother, -1
