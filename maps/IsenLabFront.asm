	object_const_def ; object_event constants
	const ISEN_LAB_FRONT_ITEMBALL_1
	const ISEN_LAB_FRONT_ITEMBALL_2
	const ISEN_LAB_FRONT_ITEMBALL_3
	const ISEN_LAB_FRONT_ITEMBALL_4
	const ISEN_LAB_FRONT_ITEMBALL_5

IsenLabFront_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IsenLabFrontMysteryberry:
	itemball MYSTERYBERRY

IsenLabFrontNugget:
	itemball NUGGET

IsenLabFrontBerserkGene:
	itemball BERSERK_GENE
	
IsenLabFrontLongTongue:
	itemball LONG_TONGUE

IsenLabCovenantOrb:
	itemball COVENANT_ORB

IsenLabFront_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 16, 16, ISEN_STRAIT, 2
	warp_event 17, 16, ISEN_STRAIT, 2
	warp_event  3,  0, ISEN_LAB_BACK, 1
	warp_event  4,  0, ISEN_LAB_BACK, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IsenLabFrontMysteryberry, EVENT_PICKED_UP_MYSTERYBERRY_FROM_ISEN_LAB
	object_event 20,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IsenLabFrontNugget, EVENT_PICKED_UP_NUGGET_FROM_ISEN_LAB
	object_event 33, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IsenLabFrontBerserkGene, EVENT_PICKED_UP_BERSERK_GENE_FROM_ISEN_LAB
	object_event 38,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IsenLabFrontLongTongue, EVENT_ISEN_LAB_LONG_TONGUE
	object_event 28,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IsenLabCovenantOrb, EVENT_ISEN_LAB_COVENANT_ORB
