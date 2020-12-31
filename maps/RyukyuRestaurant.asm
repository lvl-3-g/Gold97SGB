	object_const_def ; object_event constants

RyukyuRestaurant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuRestaurant_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10, 17, RYUKYU_CITY, 11
	warp_event 11, 17, RYUKYU_CITY, 11
	warp_event 19,  4, RYUKYU_HOTEL, 7
	warp_event 19,  5, RYUKYU_HOTEL, 8
	warp_event 14,  1, RYUKYU_THEATRE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
