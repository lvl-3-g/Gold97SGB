	object_const_def ; object_event constants
	const WHIRLISLANDNE_POKE_BALL

WhirlIsland1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIsland1FUltraBall:
	itemball MYSTIC_WATER

WhirlIsland1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 13, ROUTE_111, 2
	warp_event  5,  3, WHIRL_ISLAND_B1F, 1
	warp_event 17,  3, WHIRL_ISLAND_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIsland1FUltraBall, EVENT_WHIRL_ISLAND_1F_ULTRA_BALL
