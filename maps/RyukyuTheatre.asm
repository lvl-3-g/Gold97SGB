	object_const_def ; object_event constants
	const SILVERCAVEROOM1_POKE_BALL1

RyukyuTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuTheatreMaxElixer:
	itemball MAX_ELIXER


RyukyuTheatre_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19,  7, RYUKYU_RESTAURANT, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 17,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RyukyuTheatreMaxElixer, EVENT_RYUKYU_THEATRE_MAX_ELIXER
