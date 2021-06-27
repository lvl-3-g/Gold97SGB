	object_const_def ; object_event constants
	const CROWN_CITY_LASS
	const CROWN_CITY_ROCKER
	const CROWN_CITY_JANINE

CrownCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CROWN
	return

CrownLassCoordScript:
	turnobject PLAYER, RIGHT
	turnobject CROWN_CITY_LASS, LEFT
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CROWNCITY_NOTHING
	end

CrownCityLassScript:
	faceplayer
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CROWNCITY_NOTHING
	end
	
CrownCityPokecenterSign:
	jumpstd PokecenterSignScript
	
CrownCityMartSign:
	jumpstd MartSignScript
	
CrownCitySign:
	jumptext CrownCitySignText
	
CrownCitySign2:
	jumptext CrownCitySign2Text
	
CrownCityRockerScript:
	jumptextfaceplayer CrownCityRockerText
	
CrownCityJanineScript:
	jumptextfaceplayer CrownCityJanineText
	
CrownCityJanineText:
	text "My older brother"
	line "challenged the"
	cont "LEAGUE once."
	para "He couldn't de-"
	line "feat them."
	done
	
CrownCityRockerText:
	text "As imposing as"
	line "MT.FUJI is, this"
	para "town at the base"
	line "of the mountain"
	cont "is really scenic."
	done
	
CrownCitySign2Text:
	text "CROWN CITY"
	line "TRAINER HOUSE"
	done
	
CrownCitySignText:
	text "CROWN CITY"
	para "The Base Camp For"
	line "LEAGUE Challengers"
	done
	
GoTrainerText:
	text "Trainer!"
	para "You are here"
	line "because you have"
	para "committed to"
	line "climbing MT.FUJI!"
	para "Gather your best"
	line "team of #MON"
	para "and all of your"
	line "strength!"
	para "Ascend the water-"
	line "fall and begin"
	cont "your climb!"
	para "The LEAGUE awaits!"
	done

CrownCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 10, 25, CROWN_PATH, 3
	warp_event 11, 25, CROWN_PATH, 3
	warp_event  5, 22, CROWN_POKECENTER_1F, 1
	warp_event 11, 22, CROWN_MART, 1
	warp_event  9,  1, MT_FUJI_INTERIOR_LOWER, 1
	warp_event  3, 17, CROWN_HOUSE_1, 1
	warp_event 15, 19, CROWN_HOUSE_2, 1
	warp_event 14, 15, CROWN_CITY_TRAINER_HOUSE, 1
	warp_event 15, 15, CROWN_CITY_TRAINER_HOUSE, 2

	db 1 ; coord events
	coord_event  8, 16, SCENE_CROWNCITY_MEET_RIVAL, CrownLassCoordScript

	db 4 ; bg events
	bg_event  6, 22, BGEVENT_READ, CrownCityPokecenterSign
	bg_event 12, 22, BGEVENT_READ, CrownCityMartSign
	bg_event 10, 16, BGEVENT_READ, CrownCitySign
	bg_event 16, 16, BGEVENT_READ, CrownCitySign2

	db 3 ; object events
	object_event  9, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CrownCityLassScript, -1
	object_event 12, 19, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, CrownCityRockerScript, -1
	object_event  4, 19, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownCityJanineScript, -1
