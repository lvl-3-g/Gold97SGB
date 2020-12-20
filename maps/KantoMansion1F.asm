	object_const_def ; object_event constants
	const KANTOMANSION1F_GRANNY
	const KANTOMANSION1F_GROWLITHE1
	const KANTOMANSION1F_CLEFAIRY
	const KANTOMANSION1F_GROWLITHE2

KantoMansion1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoMansionManager:
	jumptextfaceplayer KantoMansionManagerText

KantoMansion1FMeowth:
	faceplayer
	opentext
	writetext KantoMansion1FMeowthText
	cry PIDGEY
	waitbutton
	closetext
	end

KantoMansion1FClefairy:
	faceplayer
	opentext
	writetext KantoMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

KantoMansion1FNidoranF:
	faceplayer
	opentext
	writetext KantoMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end

KantoMansionManagersSuiteSign:
	jumptext KantoMansionManagersSuiteSignText

KantoMansion1FBookshelf:
	jumpstd PictureBookshelfScript

KantoMansionManagerText:
	text "My dear #MON"
	line "keep me company,"

	para "so I don't ever"
	line "feel lonely."
	done

KantoMansion1FMeowthText:
	text "PIDGEY: Pii!"
	done

KantoMansion1FClefairyText:
	text "CLEFAIRY: Clef"
	line "cleff!"
	done

KantoMansion1FNidoranFText:
	text "NIDORAN: Kya"
	line "kyaoo!"
	done

KantoMansionManagersSuiteSignText:
	text "KANTO MANSION"
	line "MANAGER'S SUITE"
	done

KantoMansion1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 11, KANTO_REGION, 2
	warp_event  5, 11, KANTO_REGION, 14
	warp_event  4,  0, KANTO_REGION, 3
	warp_event  2,  0, KANTO_MANSION_2F, 1
	warp_event  7,  0, KANTO_MANSION_2F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  9, BGEVENT_UP, KantoMansionManagersSuiteSign
	bg_event  3,  3, BGEVENT_READ, KantoMansion1FBookshelf
	bg_event  2,  3, BGEVENT_READ, KantoMansion1FBookshelf

	db 4 ; object events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoMansionManager, -1
	object_event  2,  7, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, KantoMansion1FMeowth, -1
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoMansion1FNidoranF, -1
	object_event  0,  8, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, KantoMansion1FClefairy, -1
