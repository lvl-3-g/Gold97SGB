	object_const_def ; object_event constants
	const WESTPORTDEPTSTOREB1F_POKE_BALL1
	const WESTPORTDEPTSTOREB1F_POKE_BALL2
	const WESTPORTDEPTSTOREB1F_POKE_BALL3
	const WESTPORTDEPTSTOREB1F_POKE_BALL4
	const WESTPORTDEPTSTOREB1F_BLACK_BELT1
	const WESTPORTDEPTSTOREB1F_BLACK_BELT2
	const WESTPORTDEPTSTOREB1F_BLACK_BELT3
	const WESTPORTDEPTSTOREB1F_MACHOP

WestportDeptStoreB1F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .ClearBoxes
	callback MAPCALLBACK_NEWMAP, .Unblock

.ClearBoxes:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	sjump .Continue

.GotCardKey:
	changeblock 16, 4, $0d ; floor
	sjump .Continue

.Continue:
	checkevent EVENT_ROCKER_FROM_KANTO_IN_GAME_HOUSE
	iftrue .Layout2
	checkevent EVENT_GAME_HOUSE_NPC_IN_KUME_SOCIAL_HOUSE
	iftrue .Layout3
	changeblock 10, 8, $0d ; floor
	return

.Layout2:
	changeblock 4, 10, $0d ; floor
	return

.Layout3:
	changeblock 10, 12, $0d ; floor
	return

.Unblock:
	clearevent EVENT_LASS_FROM_KUME_AND_FRIENDS
	return

WestportDeptStoreB1FBlackBelt1Script:
	jumptextfaceplayer WestportDeptStoreB1FBlackBelt1Text

WestportDeptStoreB1FBlackBelt2Script:
	jumptextfaceplayer WestportDeptStoreB1FBlackBelt2Text

WestportDeptStoreB1FBlackBelt3Script:
	jumptextfaceplayer WestportDeptStoreB1FBlackBelt3Text

WestportDeptStoreB1FMachopScript:
	opentext
	writetext WestportDeptStoreB1FMachokeText
	cry MACHOKE
	waitbutton
	closetext
	end

WestportDeptStoreB1FEther:
	end

WestportDeptStoreB1FAmuletCoin:
	end

WestportDeptStoreB1FBurnHeal:
	end

WestportDeptStoreB1FUltraBall:
	end

WestportDeptStoreB1FBlackBelt1Text:
	text "Hey, kid! You're"
	line "holding us up!"

	para "Our policy is to"
	line "work behind the"

	para "scenes where no-"
	line "one can see us!"
	done

WestportDeptStoreB1FBlackBelt2Text:
	text "I lose my passion"
	line "for work if some-"
	cont "one's watching."

	para "Come on, kid,"
	line "scoot!"
	done

WestportDeptStoreB1FBlackBelt3Text:
	text "Oohah! Oohah!"

	para "The stuff on the"
	line "ground's junk."

	para "Take it if you"
	line "want it!"
	done

WestportDeptStoreB1FMachokeText:
	text "MACHOKE: Maaacho!"
	done

WestportDeptStoreB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 17,  2, WESTPORT_UNDERGROUND_WAREHOUSE, 3
	warp_event  9,  4, WESTPORT_DEPT_STORE_ELEVATOR, 1
	warp_event 10,  4, WESTPORT_DEPT_STORE_ELEVATOR, 2

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WestportDeptStoreB1FEther, EVENT_WESTPORT_DEPT_STORE_B1F_ETHER
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WestportDeptStoreB1FAmuletCoin, EVENT_WESTPORT_DEPT_STORE_B1F_AMULET_COIN
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WestportDeptStoreB1FBurnHeal, EVENT_WESTPORT_DEPT_STORE_B1F_BURN_HEAL
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WestportDeptStoreB1FUltraBall, EVENT_WESTPORT_DEPT_STORE_B1F_ULTRA_BALL
	object_event  9, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreB1FBlackBelt1Script, -1
	object_event  4,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreB1FBlackBelt2Script, -1
	object_event  6, 13, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreB1FBlackBelt3Script, -1
	object_event  7,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreB1FMachopScript, -1
