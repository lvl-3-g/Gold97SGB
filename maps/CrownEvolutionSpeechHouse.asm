	object_const_def ; object_event constants
	const CROWNEVOLUTIONSPEECHHOUSE_LASS

CrownEvolutionSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownEvolutionSpeechHouseLassScript:
	jumptextfaceplayer CrownEvolutionSpeechHouseLassText

CrownEvolutionSpeechHouseLassText:
	text "Many years ago, my"
	line "mother told me of"
	para "a mythical #MON"
	line "that appeared as"
	para "fire across the"
	line "daytime sky,"
	para "leaving behind a"
	line "trail of ashes as"
	cont "it burnt the air."
	para "That #MON"
	line "created from its"
	para "ashes, three"
	line "beasts of legend"
	para "that were sent"
	line "across the land."
	para "To this day, no"
	line "one has seen these"
	cont "beasts in person."
	done

CrownEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BIRDON_TOWN, 10
	warp_event  5,  7, BIRDON_TOWN, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownEvolutionSpeechHouseLassScript, -1
