	object_const_def ; object_event constants
	const WHIRLISLANDB2F_POKE_BALL1
	const WHIRLISLANDB2F_POKE_BALL2
	const WHIRLISLANDB2F_POKE_BALL3
	const WHIRLISLANDB2F_POKE_BALL4

WhirlIslandB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WhirlIslandB2FPoisonStone:
	itemball POISON_STONE

WhirlIslandB2FMaxRevive:
	itemball MAX_REVIVE

WhirlIslandB2FMaxElixer:
	itemball MAX_ELIXER
	
WhirlIslandB2FTMSludgeBomb:
	itemball TM_SLUDGE_BOMB
	
WhirlIslandB2FCovenantOrb:
	itemball COVENANT_ORB

WhirlIslandB2F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 15,  3, WHIRL_ISLAND_B1F, 3
	warp_event 37, 11, WHIRL_ISLAND_B1F, 4
	warp_event 11, 21, WHIRL_ISLAND_SUICUNE_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 33, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FPoisonStone, EVENT_WHIRL_ISLAND_B2F_POISON_STONE
	object_event  5, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxRevive, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxElixer, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
	object_event 35, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FTMSludgeBomb, EVENT_GOT_TM36_SLUDGE_BOMB
	object_event 28, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FCovenantOrb, EVENT_WHIRL_ISLAND_B2F_COVENANT_ORB
