	object_const_def ; object_event constants
	const KKHOUSE1_BLACKBELT
	const KKHOUSE1_GRANNY

KikaiHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KKHouse1BBScript:
	jumptextfaceplayer KKHouse1BBText
	
KKHouse1GrannyScript:
	jumptextfaceplayer KKHouse1GrannyText
	
KKHouse1BBText:
	text "I traveled all"
	line "the way from the"
	para "FIGHTING DOJO in"
	line "ALLOY CITY to"
	para "train inside the"
	line "KIKAI CALDERA!"
	done

KKHouse1GrannyText:
	text "Traveling martial"
	line "artists seek"
	para "lodging here in"
	line "my humble home."
	
	para "I may not look it,"
	line "but many years ago"
	para "I too was one of"
	line "the fighters who"
	para "came to train at"
	line "the CALDERA."
	done
	

KikaiHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KIKAI_VILLAGE, 3
	warp_event  5,  7, KIKAI_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KKHouse1BBScript, -1
	object_event  7,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KKHouse1GrannyScript, -1
