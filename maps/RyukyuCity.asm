	object_const_def ; object_event constants
	const RYUKYU_POKEFAN_M
	const RYUKYU_TEACHER
	const RYUKYU_TWIN
	const RYUKYU_BUG_CATCHER
	const RYUKYU_LASS
	const RYUKYU_COOLTRAINER_M
	const RYUKYU_SWIMMER_GUY
	const RYUKYU_SWIMMER_GIRL
	const RYUKYU_POKEFAN_M2

RyukyuCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_RYUKYU
	return

RyukyuCityPokecenterSign:
	jumpstd PokecenterSignScript

RyukyuCityMartSign:
	jumpstd MartSignScript
	
RyukyuCityHotelSign:
	jumptext RyukyuCityHotelSignText
	
RyukyuCitySign:
	jumptext RyukyuCitySignText
	
RyukyuPokefanMScript:
	jumptextfaceplayer RyukyuPokefanMText
	
RyukyuTeacherScript:
	jumptextfaceplayer RyukyuTeacherText
	
RyukyuTwinScript:
	jumptextfaceplayer RyukyuTwinText
	
RyukyuBugCatcherScript:
	jumptextfaceplayer RyukyuBugCatcherText
	
RyukyuLassScript:
	jumptextfaceplayer RyukyuLassText
	
RyukyuCooltrainerMScript:
	jumptextfaceplayer RyukyuCooltrainerMText
	
RyukyuSwimmerGuyScript:
	jumptextfaceplayer RyukyuSwimmerGuyText
	
RyukyuSwimmerGirlScript:
	jumptextfaceplayer RyukyuSwimmerGirlText

RyukyuPokefanM2Script:
	jumptextfaceplayer RyukyuPokefanM2Text
	
FireStarterTest:
	clearevent EVENT_GOT_PALSSIO_FROM_OAK
	clearevent EVENT_GOT_CHIKORITA_FROM_OAK
	setevent EVENT_GOT_CUBBURN_FROM_OAK
	jumptext FireStarterTestText
	
WaterStarterTest:
	setevent EVENT_GOT_PALSSIO_FROM_OAK
	clearevent EVENT_GOT_CHIKORITA_FROM_OAK
	clearevent EVENT_GOT_CUBBURN_FROM_OAK
	jumptext WaterStarterTestText
	
	
GrassStarterTest:
	clearevent EVENT_GOT_PALSSIO_FROM_OAK
	setevent EVENT_GOT_CHIKORITA_FROM_OAK
	clearevent EVENT_GOT_CUBBURN_FROM_OAK
	jumptext GrassStarterTestText
	
GrassStarterTestText:
	text "grass"
	done

WaterStarterTestText:
	text "water"
	done
	
FireStarterTestText:
	text "fire"
	done
	
RyukyuPokefanM2Text:
	text "I just enjoy"
	line "watching the waves"
	cont "on the sea."
	done
	
RyukyuCitySignText:
	text "RYUKYU CITY"
	para "The SOUTHWEST"
	line "ISLANDS' Shining"
	cont "Gem"
	done

RyukyuCityHotelSignText:
	text "RYUKYU HOTEL AND"
	line "RESTAURANT"
	para "The ultimate"
	line "SOUTHWEST ISLANDS"
	cont "travel experience!"
	done

RyukyuTeacherText:
	text "Now now, children."
	para "Don't just run off"
	line "into the ocean!"
	done
	
RyukyuPokefanMText:
	text "The weather is"
	line "perfect here, if a"
	cont "bit humid."
	done
	
RyukyuBugCatcherText:
	text "I wanna go"
	line "swimming!"
	done
	
RyukyuTwinText:
	text "Let's get some"
	line "ice cream!"
	done
	
RyukyuCooltrainerMText:
	text "I think I'll go"
	line "out on a boat"
	cont "today."
	done
	
RyukyuLassText:
	text "Many of the people"
	line "you see in this"
	para "city don't live"
	line "here."
	done
	
RyukyuSwimmerGuyText:
	text "I come here on"
	line "vacation whenever"
	cont "I get the chance!"
	done
	
RyukyuSwimmerGirlText:
	text "There's nowhere"
	line "better to relax"
	cont "than right here!"
	done

RyukyuCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 31, 26, RYUKYU_MART, 1
	warp_event 11,  4, RYUKYU_POKECENTER_1F, 1
	warp_event 33, 11, MERIDIAN_PATH_RYUKYU_GATE, 1
	warp_event 22, 30, RYUKYU_URASOE_PARK_GATE, 1
	warp_event 23, 30, RYUKYU_URASOE_PARK_GATE, 2
	warp_event 23,  5, RYUKYU_TRADE_HOUSE, 1
	warp_event 30, 18, RYUKYU_OLD_COUPLE_HOUSE, 1
	warp_event 27,  7, RYUKYU_ARBORETUM, 1
	warp_event 16, 27, RYUKYU_GYM, 1
	warp_event 17, 27, RYUKYU_GYM, 2
	warp_event 15, 15, RYUKYU_RESTAURANT, 1
	warp_event 20, 17, RYUKYU_HOTEL, 1
	warp_event 21, 17, RYUKYU_HOTEL, 2


	db 0 ; coord events

	db 7 ; bg events
	bg_event 12,  4, BGEVENT_READ, RyukyuCityPokecenterSign
	bg_event 16, 17, BGEVENT_READ, RyukyuCityHotelSign
	bg_event 32, 26, BGEVENT_READ, RyukyuCityMartSign
	bg_event 26, 12, BGEVENT_READ, RyukyuCitySign
	bg_event 19, 25, BGEVENT_READ, FireStarterTest
	bg_event 18, 26, BGEVENT_READ, WaterStarterTest
	bg_event 19, 26, BGEVENT_READ, GrassStarterTest

	db 9 ; object events
	object_event 29, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuPokefanMScript, -1
	object_event 11, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuTeacherScript, -1
	object_event 11, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuTwinScript, -1
	object_event 11, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuBugCatcherScript, -1
	object_event 17, 21, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuLassScript, -1
	object_event  9, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuCooltrainerMScript, -1
	object_event  5, 20, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuSwimmerGuyScript, -1
	object_event  6, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuSwimmerGirlScript, -1
	object_event  8, 29, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuPokefanM2Script, -1
