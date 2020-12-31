	object_const_def ; object_event constants
	const RYUKYU_HOTEL_2F_PLACEHOLDER_1
	const RYUKYU_HOTEL_2F_PLACEHOLDER_2
	const RYUKYU_HOTEL_2F_PLACEHOLDER_3

RyukyuHotel2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .FlipStairs2F

.FlipStairs2F:
	changeblock  19,  1, $1E ; flipped
	return
	
HotelDoorLockedScript:
	jumptextfaceplayer HotelDoorLockedText
	
HotelDoorLockedText:
	text "The door is"
	line "locked…"
	done
	
RyukyuHotel2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 16,  0, RYUKYU_ELEVATOR, 1
	warp_event 19,  0, RYUKYU_HOTEL, 10
	warp_event 18,  0, RYUKYU_HOTEL_3F, 2
	warp_event  7,  2, RYUKYU_HOTEL_ROOMS, 1
	warp_event  7, 14, RYUKYU_HOTEL_ROOMS, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,   2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript, -1
	object_event  13,  2, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript, -1
	object_event  13, 14, SPRITE_PLACEHOLDER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, HotelDoorLockedScript, -1
