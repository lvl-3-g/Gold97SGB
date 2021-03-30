	object_const_def ; object_event constants
	const ROUTE112SANSKRITRUINSGATE_OFFICER
	const ROUTE112SANSKRITRUINSGATE_POKEFAN_M
	const ROUTE112SANSKRITRUINSGATE_YOUNGSTER

Route112SanskritRuinsGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route112SanskritRuinsGateOfficerScript:
	jumptextfaceplayer Route112SanskritRuinsGateOfficerText

Route112SanskritRuinsGatePokefanMScript:
	jumptextfaceplayer Route112SanskritRuinsGatePokefanMText

Route112SanskritRuinsGateYoungsterScript:
	jumptextfaceplayer Route112SanskritRuinsGateYoungsterText

Route112SanskritRuinsGateOfficerText:
	text "RUINS OF ALPH"

	para "A Look-and-Touch"
	line "Tourist Site"

	para "Try the sliding"
	line "stone panels!"
	done

Route112SanskritRuinsGatePokefanMText:
	text "You're studying"
	line "the RUINS?"

	para "I see a scientist"
	line "in the making."
	done

Route112SanskritRuinsGateYoungsterText:
	text "There are drawings"
	line "on stone panels."

	para "I tried moving"
	line "them. I wonder"
	cont "what they are."
	done

Route112SanskritRuinsGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, SANSKRIT_RUINS_OUTSIDE, 10
	warp_event  0,  5, SANSKRIT_RUINS_OUTSIDE, 11
	warp_event  9,  4, ROUTE_112, 2
	warp_event  9,  5, ROUTE_112, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route112SanskritRuinsGateOfficerScript, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route112SanskritRuinsGatePokefanMScript, -1
	object_event  1,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route112SanskritRuinsGateYoungsterScript, -1
