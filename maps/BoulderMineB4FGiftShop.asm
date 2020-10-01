	object_const_def ; object_event constants
	const MOUNTMOONGIFTSHOP_GRAMPS1 ; morning only
	const MOUNTMOONGIFTSHOP_GRAMPS2 ; day only
	const MOUNTMOONGIFTSHOP_LASS1 ; morning only
	const MOUNTMOONGIFTSHOP_LASS2 ; day only

BoulderMineB4FGiftShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMineB4FGiftShopClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MT_MOON
	closetext
	end

BoulderMineB4FGiftShopLassScript:
	jumptextfaceplayer BoulderMineB4FGiftShopLassText

BoulderMineB4FGiftShopLassText:
	text "When the sun goes"
	line "down, CLEFAIRY"
	cont "come out to play."
	done

BoulderMineB4FGiftShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, MOUNT_FUJI_OUTSIDE, 3
	warp_event  4,  7, MOUNT_FUJI_OUTSIDE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, BoulderMineB4FGiftShopClerkScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, BoulderMineB4FGiftShopClerkScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, BoulderMineB4FGiftShopLassScript, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, BoulderMineB4FGiftShopLassScript, -1
