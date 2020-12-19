	object_const_def ; object_event constants
	const BLUEFORESTROUTE111GATE_OFFICER
	const BLUEFORESTROUTE111GATE_YOUNGSTER

BlueForestRoute111Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestRoute111GateOfficerScript:
	jumptextfaceplayer BlueForestRoute111GateOfficerText

BlueForestRoute111GateYoungsterScript:
	jumptextfaceplayer BlueForestRoute111GateYoungsterText

BlueForestRoute111GateOfficerText:
	text "NIHON's known for"
	line "having rough north"
	cont "waters."
	para "The area around"
	line "the aptly named"
	para "WHIRL ISLAND is"
	line "probably the best"
	cont "example."
	para "Don't go north"
	line "unprepared!"
	done

BlueForestRoute111GateYoungsterText:
	text "I hear rare"
	line "#MON appear in"
	cont "WHIRL ISLAND."
	done

BlueForestRoute111Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_111, 3
	warp_event  5,  0, ROUTE_111, 4
	warp_event  4,  7, BLUE_FOREST, 9
	warp_event  5,  7, BLUE_FOREST, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BlueForestRoute111GateOfficerScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestRoute111GateYoungsterScript, -1
