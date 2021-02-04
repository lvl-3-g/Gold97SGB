	object_const_def ; object_event constants
	const DAITO_APPLEFARMER


DaitoRanchOrchardHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AppleFarmerScript:
	jumptextfaceplayer AppleFarmerText
	
AppleFarmerText:
	text "Well, lookie here!"
	
	para "A trainer who came"
	line "all the way here"
	cont "to my ORCHARD!"
	
	para "I could use your"
	line "help, kid."
	para "My APPLES sell for"
	line "a pretty penny"
	para "on the mainland"
	line "for their crisp"
	cont "and fresh taste!"
	
	para "It's awfully hard"
	line "to sell them that"
	cont "far out, though."
	
	para "So if you wanna"
	line "help, you can take"
	para "them and sell them"
	line "for me!"
	
	para "You can keep some"
	line "of the profits!"
	para "Don't worry, I'll"
	line "get my cut back"
	cont "from the MART!"
	done


DaitoRanchOrchardHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 4
	warp_event  5,  7, DAITO_RANCH, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 7, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AppleFarmerScript, -1
