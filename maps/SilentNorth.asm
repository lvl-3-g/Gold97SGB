	object_const_def ; object_event constants


SilentNorth_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilentNorth_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  7, CROWN_PATH_GATE, 1
	warp_event 11,  7, HYDRO_PLANT, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
