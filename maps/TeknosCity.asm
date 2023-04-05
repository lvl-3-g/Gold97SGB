	object_const_def ; object_event constants
	const TEKNOSCITY_GRAMPS1
	const TEKNOSCITY_GRAMPS2
	const TEKNOSCITY_LASS1
	const TEKNOSCITY_LASS2
	const TEKNOSCITY_FISHER
	const TEKNOSCITY_YOUNGSTER
	const TEKNOSCITY_GRAMPS3
	const TEKNOSCITY_ROCKET1
	const TEKNOSCITY_ROCKET2
	const TEKNOSCITY_ROCKET3
	const TEKNOSCITY_ROCKET4
	const TEKNOSCITY_ROCKET5

TeknosCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearOpenBoardwalkPath

.ClearOpenBoardwalkPath:
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .Done
	changeblock 21,  7, $41 ; fence
	changeblock 23,  7, $41 ; fence
	changeblock 25,  7, $41 ; fence
	changeblock 21,  5, $21 ; water
	changeblock 23,  5, $21 ; water
	changeblock 25,  5, $21 ; water
.Done:
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_TEKNOS
	return

TeknosCityGramps1Script:
	jumptextfaceplayer TeknosCityGramps1Text

TeknosCityGramps2Script:
	faceplayer
	opentext
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .Gramps2Script2
	writetext TeknosCityGramps2Text
	waitbutton
	closetext
	end
	
.Gramps2Script2:
	writetext TeknosCityGramps2Text2
	waitbutton
	closetext
	end

TeknosCityGramps3Script:
	jumptextfaceplayer TeknosCityGramps3Text

TeknosCityLass1Script:
	jumptextfaceplayer TeknosCityLass1Text

TeknosCityLass2Script:
	jumptextfaceplayer TeknosCityLass2Text

	
TeknosCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .NoRockets
	writetext TeknosCityFisherText_TheresRockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext TeknosCityFisherText
	waitbutton
	closetext
	end


TeknosCityRocket1Script:
	jumptextfaceplayer TeknosCityRocket1Text
	
TeknosCityRocket2Script:
	jumptextfaceplayer TeknosCityRocket2Text
	
TeknosCityRocket3Script:
	jumptextfaceplayer TeknosCityRocket3Text
	
TeknosCityRocket4Script:
	jumptextfaceplayer TeknosCityRocket4Text
	
TeknosCityRocket5Script:
	jumptextfaceplayer TeknosCityRocket5Text

TeknosCityYoungsterScript:
	jumptextfaceplayer TeknosCityYoungsterText

TeknosCitySign:
	jumptext TeknosCitySignText

TinTowerSign:
	checkevent EVENT_BOARDWALK_PATH_IS_OPEN
	iftrue .TinTowerSign2
	jumptext TinTowerSignText
	
.TinTowerSign2
	jumptext TinTowerSignText2

BirdonGymSign:
	jumptext BirdonGymSignText
	
TeknosCityDocksSign:
	jumptext TeknosCityDocksText

TeknosDanceTheaterSign:
	jumptext TeknosDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

TeknosCityPokecenterSign:
	jumpstd PokecenterSignScript

TeknosCityMartSign:
	jumpstd MartSignScript

TeknosCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_TEKNOS_CITY_HIDDEN_HYPER_POTION
	
TeknosCityRocket3Text:
	text "Oh, man!"
	para "This is going to"
	line "be fun!"
	done
	
TeknosCityRocket4Text:
	text "Almost time to"
	line "make our presence"
	cont "known!"
	done
	
TeknosCityRocket5Text:
	text "The AQUARIUM won't"
	line "know what hit it!"
	done

TeknosCityRocket1Text:
	text "Stay out of the"
	line "AQUARIUM if you"
	para "know what's good"
	line "for you, kid!"
	done
	
TeknosCityRocket2Text:
	text "Hehehehe!"
	para "This place has to"
	line "be full of rare"
	para "#MON we can"
	line "sell off to the"
	cont "highest bidder!"
	
	done


TeknosCityGramps1Text:
	text "I've lived here"
	line "my whole life."
	para "This city is a"
	line "whole lot busier"
	para "than when I was"
	line "young."
	done

TeknosCityGramps2Text:
	text "This city is going"
	line "to grow even more"
	para "once the BOARDWALK"
	line "is finished."
	para "Many more people"
	line "will be passing"
	cont "through."
	done
	
TeknosCityGramps2Text2:
	text "I have to admit,"
	line "I'm a big fan of"
	para "the new GAME"
	line "CORNER that just"
	para "opened north of"
	line "here."
	done

TeknosCityLass1Text:
	text "TEKNOS used to be"
	line "a quiet town."
	para "But it's grown"
	line "quickly, and I"
	para "don't think"
	line "everyone has"
	para "adjusted to it"
	line "yet."
	done

TeknosCityLass2Text:
	text "WHITNEY is our GYM"
	line "LEADER here!"
	para "She's always been"
	line "a huge help to"
	cont "the town!"
	para "Sometimes it's"
	line "hard to catch her"
	para "at her GYM, since"
	line "she'll always be"
	para "out if there's"
	line "some issue that"
	para "she feels she can"
	line "help with."
	done

TeknosCityLass2Text_ReleasedBeasts:
	text "Three big #MON"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"
	done

TeknosCityFisherText:
	text "The AQUARIUM isn't"
	line "too interesting to"
	cont "SAILORS like me."
	para "We see all these"
	line "#MON out on the"
	cont "sea! Ohoho!"
	done

TeknosCityFisherText_TheresRockets:
	text "These guys sure do"
	line "look like TEAM"
	cont "ROCKET members."
	para "I thought they"
	line "weren't around"
	cont "anymore?"
	done

TeknosCityYoungsterText:
	text "I've tried many"
	line "times, but I've"
	para "never been able to"
	line "defeat WHITNEY…"
	done

TeknosCityGramps3Text:
	text "TEKNOS is starting"
	line "to grow as another"
	cont "port town."
	para "It's always been"
	line "a favorite of mine"
	cont "to visit."
	para "I hope it doesn't"
	line "get too crowded"
	cont "here!"
	done

TeknosCitySignText:
	text "TEKNOS CITY"
	para "A City that"
	line "Embraces the"
	cont "Future"
	done

TinTowerSignText:
	text "COMING SOON!"
	para "BOARDWALK and"
	line "BOARDWALK GAME"
	cont "CORNER!"
	para "A walkable seaside"
	line "connection from"
	para "TEKNOS CITY to"
	line "SANSKRIT TOWN,"
	para "with games and"
	line "prizes galore!"
	done

TinTowerSignText2:
	text "North to BOARDWALK"
	line "and BOARDWALK"
	cont "GAME CORNER!"
	para "Games, prizes, and"
	line "fun!"
	done

BirdonGymSignText:
	text "TEKNOS CITY"
	line "#MON GYM"
	cont "LEADER: WHITNEY"

	para "The Energetic"
	line "Go-Getter!"
	done

TeknosDanceTheaterSignText:
	text "TEKNOS CITY"
	line "AQUARIUM"
	done

BurnedTowerSignText:
	text "FISHING GURU"
	line "ARNOLD'S HOUSE"
	done
	
TeknosCityDocksText:
	text "TEKNOS CITY DOCKS"
	done

TeknosCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event 22, 31, TEKNOS_PORT_PASSAGE, 1
	warp_event 23, 31, TEKNOS_PORT_PASSAGE, 2
	warp_event 31, 10, TEKNOS_POKECENTER_1F, 1
	warp_event  7, 17, TEKNOS_FISHING_HOUSE, 1
	warp_event  7, 27, TEKNOS_AQUARIUM_1F, 2
	warp_event 31, 16, TEKNOS_MART, 1
	warp_event 10, 11, TEKNOS_GYM, 1
	warp_event 15, 17, TEKNOS_ITEMFINDER_HOUSE, 1
	warp_event  6, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event  9, 11, ROUTE_109_ROUTE_110_GATE, 4
	warp_event 22,  1, BOARDWALK_TEKNOS_GATE, 3
	warp_event 23,  1, BOARDWALK_TEKNOS_GATE, 4
	warp_event 11, 11, TEKNOS_GYM, 2
	warp_event 33, 20, TEKNOS_TRADE_HOUSE, 1

	db 0 ; coord events

	db 9 ; bg events
	bg_event 18, 20, BGEVENT_READ, TeknosCitySign
	bg_event 24,  8, BGEVENT_READ, TinTowerSign
	bg_event 12, 12, BGEVENT_READ, BirdonGymSign
	bg_event 10, 27, BGEVENT_READ, TeknosDanceTheaterSign
	bg_event 10, 17, BGEVENT_READ, BurnedTowerSign
	bg_event 32, 10, BGEVENT_READ, TeknosCityPokecenterSign
	bg_event 32, 16, BGEVENT_READ, TeknosCityMartSign
	bg_event  5, 18, BGEVENT_ITEM, TeknosCityHiddenHyperPotion
	bg_event 24, 29, BGEVENT_READ, TeknosCityDocksSign

	db 12 ; object events
	object_event 14, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps1Script, -1
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps2Script, -1
	object_event 28, 27, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosCityLass1Script, -1
	object_event 23, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, TeknosCityLass2Script, -1
	object_event 10, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeknosCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TeknosCityYoungsterScript, -1
	object_event 22, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps3Script, -1
	object_event  5, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket1Script, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  8, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket2Script, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7, 28, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket3Script, EVENT_ROCKETS_BLOCKING_AQUARIUM
	object_event  7, 30, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket4Script, EVENT_ROCKETS_BLOCKING_AQUARIUM
	object_event  6, 29, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket5Script, EVENT_ROCKETS_BLOCKING_AQUARIUM

	