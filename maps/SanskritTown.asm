	object_const_def ; object_event constants
	const SANSKRIT_COOLTRAINER
	const SANSKRIT_MONSTER
	const SANSKRIT_YOUNGSTER
	const SANSKRIT_LASS

SanskritTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_SANSKRIT
	return


SanskritTownCooltrainermScript:
	faceplayer
	opentext
	writetext SanskritTownCooltrainermText
	waitbutton
	closetext
	turnobject SANSKRIT_COOLTRAINER, DOWN
	end

SanskritTownLassScript:
	jumptextfaceplayer SanskritTownLassText

SanskritTownMonsterScript:
	faceplayer
	opentext
	writetext SanskritTownMonsterText
	cry DONPHAN
	waitbutton
	closetext
	turnobject SANSKRIT_MONSTER, UP
	end

SanskritTownYoungsterScript:
	jumptextfaceplayer SanskritTownYoungsterText

SanskritTownSign:
	jumptext SanskritTownSignText

SanskritTownRagecandybarSign:
	jumpstd MartSignScript

SanskritResearchSign:
	jumptext SanskritResearchSignText

SanskritTownPokecenterSign:
	jumpstd PokecenterSignScript
	
SanskritTownLassText:
	text "I love the"
	line "atmosphere of this"
	cont "town."
	para "It almost makes me"
	line "feel as though"
	para "I've traveled back"
	line "in time."
	done
	
SanskritTownYoungsterText:
	text "This fountain is"
	line "so mysterious."
	para "No one knows who"
	line "built it."
	para "But it's clear"
	line "that it's from the"
	para "same era as the"
	line "RUINS just north"
	cont "of town."
	done

SanskritTownMonsterText:
	text "DONPHAN: PHYUUU!"
	done

SanskritTownCooltrainermText:
	text "My DONPHAN doesn't"
	line "listen to me."
	para "I got him in a"
	line "trade from a pal,"
	para "but I don't have"
	line "enough BADGES for"
	cont "him to obey me."
	done

SanskritTownSignText:
	text "SANSKRIT TOWN"

	para "A Link To NIHON's"
	line "Past"
	done

SanskritTownRagecandybarSignText:
	text "While visiting"
	line "SANSKRIT TOWN, try"
	cont "a RAGECANDYBAR!"
	done

SanskritResearchSignText:
	text "SANSKRIT TOWN"
	line "RUINS RESEARCH"
	cont "CENTER"
	done

SanskritTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 15,  4, SANSKRIT_MART, 1
	warp_event  3,  7, SANSKRIT_GAMBLER_MAN_HOUSE, 1
	warp_event 16, 11, SANSKRIT_RUINS_RESEARCH_CENTER, 1
	warp_event  3, 12, SANSKRIT_POKECENTER_1F, 1
	warp_event  4,  3, SANSKRIT_ROCKET_HOUSE, 1
	warp_event  8, 17, BOARDWALK_GATE, 1
	warp_event  9, 17, BOARDWALK_GATE, 2
	db 0 ; coord events

	db 4 ; bg events
	bg_event  6, 12, BGEVENT_READ, SanskritTownSign
	bg_event 16,  4, BGEVENT_READ, SanskritTownRagecandybarSign
	bg_event 14, 12, BGEVENT_READ, SanskritResearchSign
	bg_event  4, 12, BGEVENT_READ, SanskritTownPokecenterSign

	db 4 ; object events
	object_event  2,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritTownCooltrainermScript, -1
	object_event  2,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritTownMonsterScript, -1
	object_event 11, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SanskritTownYoungsterScript, -1
	object_event 14,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritTownLassScript, -1
