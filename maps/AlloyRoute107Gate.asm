	const_def 1 ; object constants
	const ALLOYROUTE107GATE_OFFICER

AlloyRoute107Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyRoute107GateOfficerScript:
	jumptextfaceplayer AlloyRoute107GateOfficerText

AlloyRoute107GateOfficerText:
	text "Be careful if you"
	line "intend to cross"
	para "the ocean to get"
	line "to KOBAN ISLAND."
	para "The waters are"
	line "rough. You'll need"
	cont "a #MON's help."
	done


AlloyRoute107Gate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4,  0, ROUTE_107, 1
	warp_event  5,  0, ROUTE_107, 2
	warp_event  4,  7, ALLOY_CITY, 10
	warp_event  5,  7, ALLOY_CITY, 12
	warp_event  1,  0, ALLOY_ROUTE_107_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AlloyRoute107GateOfficerScript, -1
	
