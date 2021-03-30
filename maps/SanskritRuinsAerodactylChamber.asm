SanskritRuinsAerodactylChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.HiddenDoors:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

SanskritRuinsAerodactylChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_AERODACTYL
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_SANSKRIT_RUINS_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_AERODACTYL_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_S_TO_W
	setmapscene SANSKRIT_RUINS_INNER_CHAMBER, SCENE_SANSKRITRUINSINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	warpcheck
	end

SanskritRuinsAerodactylChamberAncientReplica:
	jumptext SanskritRuinsAerodactylChamberAncientReplicaText

SanskritRuinsAerodactylChamberDescriptionSign:
	jumptext SanskritRuinsAerodactylChamberDescriptionText

SanskritRuinsAerodactylChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

SanskritRuinsAerodactylChamberDescriptionText:
	text "This flying #-"
	line "MON attacked its"

	para "prey with saw-like"
	line "fangs."
	done

SanskritRuinsAerodactylChamber_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  9, SANSKRIT_RUINS_OUTSIDE, 4
	warp_event  4,  9, SANSKRIT_RUINS_OUTSIDE, 4
	warp_event  3,  3, SANSKRIT_RUINS_INNER_CHAMBER, 8
	warp_event  4,  3, SANSKRIT_RUINS_INNER_CHAMBER, 9

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  3, BGEVENT_READ, SanskritRuinsAerodactylChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, SanskritRuinsAerodactylChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, SanskritRuinsAerodactylChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, SanskritRuinsAerodactylChamberDescriptionSign

	db 0 ; object events
