	object_const_def ; object_event constants

ForkedStraitWest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


ForkedStraitWest_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 33, 11, FORKED_STRAIT_GATE, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
