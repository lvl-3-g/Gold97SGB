	object_const_def ; object_event constants
	const SUNPOINTCITY_STANDING_YOUNGSTER
	const SUNPOINTCITY_POKEFAN_M
	const SUNPOINTCITY_LASS
	const SUNPOINTCITY_ROCK1
	const SUNPOINTCITY_ROCK3
	const SUNPOINTCITY_POKEFAN_F


SunpointCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SUNPOINTCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_SUNPOINTCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint


.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_SUNPOINT
	setevent EVENT_BOARDWALK_PATH_IS_OPEN
	return


SunpointCityLass:
	jumptextfaceplayer SunpointCityLassText

SunpointCityFishingGuru:
	jumptextfaceplayer SunpointCityFishingGuruText

SunpointCityTwin:
	jumptextfaceplayer SunpointCityTwinText

SunpointCityRocker:
	jumptextfaceplayer SunpointCityRockerText

SunpointCitySign:
	jumptext SunpointCitySignText

SunpointCityMartSign:
	jumpstd MartSignScript

SunpointTrainerTipsSign:
	jumptext SunpointTrainerTipsSignText

SunpointMagmaShaftWarningSign:
	jumptext SunpointMagmaShaftWarningSignText

SunpointPokecenterSign:
	jumpstd PokecenterSignScript

SunpointCityRock:
	jumpstd SmashRockScript

SunpointCityHiddenRevive:
	hiddenitem REVIVE, EVENT_SUNPOINT_CITY_HIDDEN_REVIVE

SunpointCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_SUNPOINT_CITY_HIDDEN_MAX_ETHER



SunpointCityLassText:
	text "The climate on"
	line "this side of NIHON"
	para "is considerably"
	line "warmer than the"
	cont "rest of it."
	done

ChucksWifeChubbyText:
	text "My husband lost to"
	line "you, so he needs"
	cont "to train harder."

	para "That's good, since"
	line "he was getting a"
	cont "little chubby."
	done

SunpointCityFishingGuruText:
	text "Have you ever been"
	line "to BLUE FOREST?"
	para "It's cold and"
	line "snowy over there."
	para "I couldn't live"
	line "there!"
	para "The cold is not"
	line "for me."
	done

SunpointCityTwinText:
	text "Rare #MON are"
	line "said to live in"
	cont "the MAGMA SHAFT."
	para "It's hard to get"
	line "into the cave"
	para "because rocks from"
	line "it often fall down"
	para "and block the"
	line "entrance."
	done

SunpointCityRockerText:
	text "This city doesn't"
	line "have a GYM."
	para "I don't think it"
	line "needs one, though."
	done


SunpointCitySignText:
	text "SUNPOINT CITY"
	para "NIHON's Hub For"
	line "International"
	cont "Trade"
	done

SunpointTrainerTipsSignText:
	text "TRAINER TIPS"
	para "Certain HM moves"
	line "require BADGES to"
	para "use outside of"
	line "battle!"
	para "The moves can"
	line "still be used in"
	cont "battle, though."
	done

SunpointMagmaShaftWarningSignText:
	text "NOTICE:"
	para "Dangerous rocks"
	line "frequently fall"
	para "from the MAGMA"
	line "SHAFT."
	para "Use proper caution"
	line "if approaching."
	done

SunpointCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 20, 26, MANIAS_HOUSE, 1
	warp_event 16, 11, MAGMA_SHAFT_1F, 1
	warp_event 31, 16, SUNPOINT_POKECENTER_1F, 1
	warp_event 17, 22, SUNPOINT_MART, 1
	warp_event 33, 23, SUNPOINT_MAGMA_SHAFT_SPEECH_HOUSE, 1
	warp_event 33, 11, ROUTE_118_SUNPOINT_GATE, 1
	warp_event 22, 10, SKATEBOARDER_HOUSE, 1
	warp_event 26,  5, SUNPOINT_DOCKS_GATE, 3
	warp_event 27,  5, SUNPOINT_DOCKS_GATE, 4
	warp_event 28, 30, ROUTE_119_SUNPOINT_GATE, 1
	warp_event 29, 30, ROUTE_119_SUNPOINT_GATE, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event 26, 21, BGEVENT_READ, SunpointCitySign
	bg_event 32, 16, BGEVENT_READ, SunpointPokecenterSign
	bg_event 18, 22, BGEVENT_READ, SunpointCityMartSign
	bg_event 14, 22, BGEVENT_READ, SunpointTrainerTipsSign
	bg_event 28, 16, BGEVENT_READ, SunpointMagmaShaftWarningSign
	bg_event 34, 24, BGEVENT_ITEM, SunpointCityHiddenRevive
	bg_event 13, 21, BGEVENT_ITEM, SunpointCityHiddenMaxEther

	db 6 ; object events
	object_event 28, 13, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointCityFishingGuru, -1
	object_event 23, 22, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, SunpointCityTwin, -1
	object_event 24, 17, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointCityRocker, -1
	object_event 19, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 18, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 22, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SunpointCityLass, -1
