TinTower9F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower9FUnusedHoOhText:
; unused
	text "HO-OH: Shaoooh!"
	done

TinTower9FUnusedBlisseyText:
; unused
	text "BLISSEY: Gyaaan!"
	done

TinTower9F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 12,  3, FORKED_STRAIT_EAST, 2
	warp_event  2,  5, FORKED_STRAIT_EAST, 3
	warp_event 12,  7, FORKED_STRAIT_EAST, 4
	warp_event  7,  9, FIVE_FLOOR_TOWER_ROOF, 1
	warp_event 16,  7, FORKED_STRAIT_WEST, 5
	warp_event  6, 13, FORKED_STRAIT_EAST, 5
	warp_event  8, 13, FORKED_STRAIT_EAST, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
