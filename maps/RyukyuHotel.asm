	object_const_def ; object_event constants

RyukyuHotel_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuHotelHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_RYUKYU_HOTEL_HIDDEN_MAX_POTION

RyukyuHotel_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 14,  9, RYUKYU_CITY, 12
	warp_event 15,  9, RYUKYU_CITY, 13
	warp_event 13,  9, RYUKYU_CITY, 12
	warp_event 16,  9, RYUKYU_CITY, 13
	warp_event 12,  9, RYUKYU_CITY, 12
	warp_event 17,  9, RYUKYU_CITY, 13
	warp_event  0,  6, RYUKYU_RESTAURANT, 3
	warp_event  0,  7, RYUKYU_RESTAURANT, 4
	warp_event 26,  0, RYUKYU_ELEVATOR, 1
	warp_event 29,  0, RYUKYU_HOTEL_2F, 2

	
	db 0 ; coord events

	db 1 ; bg events
	bg_event 23,  4, BGEVENT_ITEM, RyukyuHotelHiddenMaxPotion

	db 0 ; object events
