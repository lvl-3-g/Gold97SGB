	object_const_def ; object_event constants
	const ROUTE118SUNPOINTGATE_OFFICER

Route118SunpointGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route118SunpointGuardScript:
	jumptextfaceplayer Route118SunpointGuardSeriousText

Route118SunpointGuardSeriousText:
	text "SUNPOINT CITY is a"
	line "major trade hub"
	para "for goods coming"
	line "into NIHON."
	para "The DOCKS north of"
	line "town are always"
	cont "busy."	
	done

Route118SunpointGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, SUNPOINT_CITY, 6
	warp_event  1,  7, SUNPOINT_CITY, 6
	warp_event  8,  7, ROUTE_118, 1
	warp_event  9,  7, ROUTE_118, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route118SunpointGuardScript, -1
