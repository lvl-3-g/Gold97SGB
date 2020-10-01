	object_const_def ; object_event constants
	const SUNPOINTDOCKSCROWNPATHENTRANCE_TEACHER

SunpointDocksCrownPathEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SunpointDocksCrownPathEntranceTeacherScript:
	jumptextfaceplayer SunpointDocksCrownPathEntranceTeacherText

SunpointDocksCrownPathEntranceTeacherText:
	text "Many cities in"
	line "NIHON have long"

	para "histories. I'd"
	line "love to visit!"
	done

SunpointDocksCrownPathEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SUNPOINT_DOCKS, 1
	warp_event  4,  7, SUNPOINT_DOCKS, 1
	warp_event  4,  3, CROWN_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointDocksCrownPathEntranceTeacherScript, -1
