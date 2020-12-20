	object_const_def ; object_event constants
	const MERIDIANPATHRYUKYUGATE_OFFICER

MeridianPathRyukyuGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MeridianPathRyukyuGateOfficerScript:
	jumptextfaceplayer MeridianPathRyukyuGateOfficerText


MeridianPathRyukyuGateOfficerText:
	text "RYUKYU CITY is"
	line "probably the most"
	para "popular tourist"
	line "attraction on the"
	cont "ISLANDS."
	done

MeridianPathRyukyuGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, RYUKYU_CITY, 3
	warp_event  1,  7, RYUKYU_CITY, 3
	warp_event  8,  7, MERIDIAN_PATH, 1
	warp_event  9,  7, MERIDIAN_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, MeridianPathRyukyuGateOfficerScript, -1
