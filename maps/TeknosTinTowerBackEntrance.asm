TeknosTinTowerBackEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosTinTowerBackEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, TEKNOS_CITY, 4
	warp_event  7,  5, TEKNOS_CITY, 5
	warp_event  2,  4, TEKNOS_TIN_TOWER_ENTRANCE, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
