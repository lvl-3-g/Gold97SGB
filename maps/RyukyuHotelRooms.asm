	object_const_def ; object_event constants

RyukyuHotelRooms_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuHotelRooms_MapEvents:
	db 0, 0 ; filler

	db 16 ; warp events
	warp_event  1,  5, RYUKYU_HOTEL_2F, 4
	warp_event  2,  5, RYUKYU_HOTEL_2F, 4
	warp_event  1, 17, RYUKYU_HOTEL_2F, 5
	warp_event  2, 17, RYUKYU_HOTEL_2F, 5
	
	warp_event 12,  5, RYUKYU_HOTEL_3F, 4
	warp_event 13,  5, RYUKYU_HOTEL_3F, 4
	warp_event 12, 17, RYUKYU_HOTEL_3F, 5
	warp_event 13, 17, RYUKYU_HOTEL_3F, 5
	
	warp_event 24,  7, RYUKYU_HOTEL_4F, 4
	warp_event 25,  7, RYUKYU_HOTEL_4F, 4
	warp_event 24, 17, RYUKYU_HOTEL_4F, 5
	warp_event 25, 17, RYUKYU_HOTEL_4F, 5
	
	warp_event 36,  5, RYUKYU_HOTEL_5F, 3
	warp_event 37,  5, RYUKYU_HOTEL_5F, 3
	warp_event 36, 17, RYUKYU_HOTEL_5F, 4
	warp_event 37, 17, RYUKYU_HOTEL_5F, 4	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
