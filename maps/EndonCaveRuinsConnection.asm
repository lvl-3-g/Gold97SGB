	object_const_def ; object_event constants
	const ENDONCAVERUINSCONNECTION_NUGGET


EndonCaveRuinsConnection_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EndonCaveRuinsConnectionNugget:
	itemball NUGGET

EndonCaveRuinsConnection_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 51, ENDON_CAVE_2F, 3
	warp_event  3,  9, SANSKRIT_RUINS_OUTSIDE, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCaveRuinsConnectionNugget, EVENT_ENDON_CAVE_RUINS_CONNECTION_NUGGET
