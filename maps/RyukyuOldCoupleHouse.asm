	object_const_def ; object_event constants
	const RYUKYUOLDCOUPLEHOUSE_GRANNY
	const RYUKYUOLDCOUPLEHOUSE_GRAMPS
	const RYUKYUOLDCOUPLEHOUSE_RHYDON
	const RYUKYUOLDCOUPLEHOUSE_ZUBAT

RyukyuOldCoupleHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuOldCoupleHouseGrannyScript:
	jumptextfaceplayer RyukyuOldCoupleHouseGrannyText

RyukyuOldCoupleHouseGrampsScript:
	jumptextfaceplayer RyukyuOldCoupleHouseGrampsText

RyukyuOldCoupleHouseRhydonScript:
	opentext
	writetext RyukyuOldCoupleHouseRhydonText
	cry KANGASKHAN
	waitbutton
	closetext
	end

RyukyuOldCoupleHouseZubatScript:
	opentext
	writetext RyukyuOldCoupleHouseZubatText
	cry ZUBAT
	waitbutton
	;verbosegiveitem TRI_WING;
	;waitbutton;
	closetext
	end

RyukyuOldCoupleHouseGrannyText:
	text "My husband lives"
	line "happily with #-"
	cont "MON he got through"
	cont "trades."
	done

RyukyuOldCoupleHouseGrampsText:
	text "Ah… I'm so happy…"
	done

RyukyuOldCoupleHouseRhydonText:
	text "KANGASKHAN: Garu"
	line "garuu."
	done

RyukyuOldCoupleHouseZubatText:
	text "ZUBAT: Zuba zubaa."
	done

RyukyuOldCoupleHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, RYUKYU_CITY, 7
	warp_event  5,  7, RYUKYU_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuOldCoupleHouseGrannyScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuOldCoupleHouseGrampsScript, -1
	object_event  5,  2, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuOldCoupleHouseRhydonScript, -1
	object_event  8,  6, SPRITE_ZUBAT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuOldCoupleHouseZubatScript, -1
