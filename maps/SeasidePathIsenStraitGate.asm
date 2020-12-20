	object_const_def ; object_event constants
	const SEASIDEPATHISENSTRAITGATE_OFFICER
	const SEASIDEPATHISENSTRAITGATE_BUG_CATCHER

SeasidePathIsenStraitGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SeasidePathIsenStraitGateOfficerScript:
	jumptextfaceplayer SeasidePathIsenStraitGateOfficerText

SeasidePathIsenStraitGateBugCatcherScript:
	jumptextfaceplayer SeasidePathIsenStraitGateBugCatcherText
	
SeasidePathIsenStraitGateBugCatcherText:
	text "The wild #MON"
	line "on the ISLANDS are"
	cont "very strong."
	para "Much more tough"
	line "than the mainland,"
	cont "I think."
	done

SeasidePathIsenStraitGateOfficerText:
	text "I've heard that"
	line "ISEN STRAIT holds"
	para "hidden remnants of"
	line "secret experiments"
	para "into creating a"
	line "manmade #MON."
	para "What could that"
	line "mean?"
	done


SeasidePathIsenStraitGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ISEN_STRAIT, 1
	warp_event  1,  7, ISEN_STRAIT, 1
	warp_event  8,  7, SEASIDE_PATH, 1
	warp_event  9,  7, SEASIDE_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, SeasidePathIsenStraitGateOfficerScript, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeasidePathIsenStraitGateBugCatcherScript, -1
