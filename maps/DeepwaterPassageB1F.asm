	object_const_def ; object_event constants
	const DEEPWATERPASSAGEB1F_POKE_BALL

DeepwaterPassageB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DeepwaterPassageB1FNevermeltice:
	itemball NEVERMELTICE

DeepwaterPassageB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3, 15, DEEPWATER_PASSAGE_ENTRANCE, 4
	warp_event  5,  3, DEEPWATER_PASSAGE_B2F, 1
	warp_event 15, 15, DEEPWATER_PASSAGE_B2F, 2
	warp_event 15,  3, DEEPWATER_PASSAGE_ENTRANCE, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB1FNevermeltice, EVENT_DEEPWATER_PASSAGE_B1F_NEVERMELTICE
