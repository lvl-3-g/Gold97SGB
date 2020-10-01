	object_const_def ; object_event constants

ForkedStraitEast_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks



ForkedStraitEast_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6, 11, FORKED_STRAIT_GATE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
