	object_const_def ; object_event constants


EndonCaveRuinsConnection_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


EndonCaveRuinsConnection_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 51, ENDON_CAVE_2F, 3
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
