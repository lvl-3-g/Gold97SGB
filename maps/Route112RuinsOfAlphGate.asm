	object_const_def ; object_event constants
	const ROUTE112RUINSOFALPHGATE_OFFICER
	const ROUTE112RUINSOFALPHGATE_POKEFAN_M
	const ROUTE112RUINSOFALPHGATE_YOUNGSTER

Route112RuinsOfAlphGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route112RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route112RuinsOfAlphGateOfficerText

Route112RuinsOfAlphGatePokefanMScript:
	jumptextfaceplayer Route112RuinsOfAlphGatePokefanMText

Route112RuinsOfAlphGateYoungsterScript:
	jumptextfaceplayer Route112RuinsOfAlphGateYoungsterText

Route112RuinsOfAlphGateOfficerText:
	text "RUINS OF ALPH"

	para "A Look-and-Touch"
	line "Tourist Site"

	para "Try the sliding"
	line "stone panels!"
	done

Route112RuinsOfAlphGatePokefanMText:
	text "You're studying"
	line "the RUINS?"

	para "I see a scientist"
	line "in the making."
	done

Route112RuinsOfAlphGateYoungsterText:
	text "There are drawings"
	line "on stone panels."

	para "I tried moving"
	line "them. I wonder"
	cont "what they are."
	done

Route112RuinsOfAlphGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, RUINS_OF_ALPH_OUTSIDE, 10
	warp_event  0,  5, RUINS_OF_ALPH_OUTSIDE, 11
	warp_event  9,  4, ROUTE_112, 2
	warp_event  9,  5, ROUTE_112, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route112RuinsOfAlphGateOfficerScript, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route112RuinsOfAlphGatePokefanMScript, -1
	object_event  1,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route112RuinsOfAlphGateYoungsterScript, -1
