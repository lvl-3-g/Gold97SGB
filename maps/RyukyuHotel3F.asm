	object_const_def ; object_event constants
	const RYUKYU_HOTEL_3F_PLACEHOLDER_1
	const RYUKYU_HOTEL_3F_PLACEHOLDER_2
	const RYUKYU_HOTEL_3F_PLACEHOLDER_3

RyukyuHotel3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
HotelDoorLockedScript3F:
	jumptextfaceplayer HotelDoorLockedText3F
	
HotelDoorLockedText3F:
	text "The door is"
	line "locked…"
	done

RyukyuHotel3F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16,  0, RYUKYU_ELEVATOR, 1
	warp_event 18,  0, RYUKYU_HOTEL_2F, 3
	warp_event 19,  0, RYUKYU_HOTEL_4F, 2
	warp_event  1,  2, RYUKYU_HOTEL_ROOMS, 5
	warp_event 13, 14, RYUKYU_HOTEL_ROOMS, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event   7,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript3F, -1
	object_event  13,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript3F, -1
	object_event   7, 14, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript3F, -1
