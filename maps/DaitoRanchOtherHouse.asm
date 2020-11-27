	object_const_def ; object_event constants
	const DAITORANCHOTHERHOUSE_RANCHER

DaitoRanchOtherHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaitoRanchOtherHouseFarmhandScript:
	jumptextfaceplayer DaitoRanchOtherHouseFarmhandText
	
DaitoRanchOtherHouseFarmhandText:
	text "Hi there!"
	para "I'm in charge of"
	line "tending to those"
	cont "MILTANK!"
	para "Being a ranch hand"
	line "is such a pleasant"
	para "job when you work"
	line "in a scenic place"
	cont "like this!"
	done
	


DaitoRanchOtherHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 6
	warp_event  5,  7, DAITO_RANCH, 6

	db 0 ; coord events

	db 0 ; bg events


	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DaitoRanchOtherHouseFarmhandScript, -1
