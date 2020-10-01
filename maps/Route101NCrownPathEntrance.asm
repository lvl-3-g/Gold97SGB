Route101NCrownPathEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route101NCrownPathEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ROUTE_101N, 1
	warp_event  4,  7, ROUTE_101N, 1
	warp_event  4,  3, CROWN_PATH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
