	object_const_def ; object_event constants
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3

BoulderMineB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMineB3FIron:
	itemball IRON

BoulderMineB3FPPUp:
	itemball PP_UP

BoulderMineB3FRevive:
	itemball REVIVE

BoulderMineB3FHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_BOULDER_MINE_B3F_HIDDEN_SUPER_POTION

BoulderMineB3F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3,  3, BOULDER_MINE_B4F, 1
	warp_event 15,  5, BOULDER_MINE_B2F, 4
	warp_event 35,  5, BOULDER_MINE_B2F, 5
	warp_event  3, 15, BOULDER_MINE_B2F, 6
	warp_event 11, 13, BOULDER_MINE_B4F, 3
	warp_event 27, 13, BOULDER_MINE_B2F, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  2, BGEVENT_ITEM, BoulderMineB3FHiddenSuperPotion

	db 3 ; object events
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB3FIron, EVENT_BOULDER_MINE_B3F_IRON
	object_event 14,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB3FPPUp, EVENT_BOULDER_MINE_B3F_PP_UP
	object_event 34,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB3FRevive, EVENT_BOULDER_MINE_B3F_REVIVE
