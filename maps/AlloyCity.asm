	object_const_def ; object_event constants
	const ALLOYCITY_SAILOR1
	const ALLOYCITY_STANDING_YOUNGSTER
	const ALLOYCITY_SAILOR2
	const ALLOYCITY_ALLOY_RIVAL
	const ALLOYCITY_GRAMPS

AlloyCity_MapScripts:
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
	setflag ENGINE_FLYPOINT_ALLOY
	return

AlloyCityRivalSceneTop:
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_SILVER
	special LoadUsedSpritesGFX
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ALLOYCITY_ALLOY_RIVAL
	waitsfx
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalWalkOutOfPokecenterMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AlloyCityRivalText
	waitbutton
	closetext
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalLeaving1
	turnobject PLAYER, LEFT
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalLeaving2
	setscene SCENE_FINISHED
	disappear ALLOYCITY_ALLOY_RIVAL
	special RestartMapMusic
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	special LoadUsedSpritesGFX
	end

AlloyCityRivalSceneBottom:
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_SILVER
	special LoadUsedSpritesGFX
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_ENTER_DOOR
	appear ALLOYCITY_ALLOY_RIVAL
	waitsfx
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalWalkOutOfPokecenterMovement2
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AlloyCityRivalText
	waitbutton
	closetext
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalLeaving3
	turnobject PLAYER, LEFT
	applymovement ALLOYCITY_ALLOY_RIVAL, AlloyRivalLeaving2
	disappear ALLOYCITY_ALLOY_RIVAL
	setscene SCENE_FINISHED
	special RestartMapMusic
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	special LoadUsedSpritesGFX
	end

AlloyCitySailor1Script:
	jumptextfaceplayer AlloyCitySailor1Text

AlloyCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext AlloyCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext AlloyCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

AlloyCityGrampsScript:
	jumptextfaceplayer AlloyCityGrampsText

AlloyCitySailor2Script:
	jumptextfaceplayer AlloyCitySailor2Text

AlloyCitySign:
	jumptext AlloyCitySignText

AlloyGymSign:
	jumptext AlloyGymSignText

AlloyDojoSign:
	jumptext AlloyDojoSignText

AlloyCityPokecenterSign:
	jumpstd PokecenterSignScript

AlloyCityMartSign:
	jumpstd MartSignScript

AlloyRivalWalkOutOfPokecenterMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

AlloyRivalWalkOutOfPokecenterMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

AlloyRivalLeaving1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

AlloyRivalLeaving2:
	step LEFT
	step LEFT
	step LEFT
	step_end

AlloyRivalLeaving3:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end


AlloyCityGrampsText:
	text "Ohohoho!"
	para "You ever battle"
	line "with the steel-"
	cont "type?"
	para "They have high"
	line "defenses!"
	para "Know this if you"
	line "plan to take on"
	cont "JASMINE!"
	done

AlloyCityRivalText:
	text "<PLAYER>!"
	para "It's been a while!"
	para "You just got"
	line "through JADE"
	cont "FOREST, right?"
	para "It's a tough place."
	para "But it's filled"
	line "with #MON!"
	para "I'm actually not"
	line "in the mood to"
	cont "battle right now."
	para "I'm headed back"
	line "out to the FOREST"
	para "to look for more"
	line "#MON!"
	para "Can't miss the"
	line "opportunity to"
	para "look for the"
	line "strongest #MON"
	cont "to add to my team!"
	para "This city's pretty"
	line "cool, though!"
	para "There's a GYM"
	line "LEADER that uses"
	cont "the steel-type!"
	para "I'd never even"
	line "heard of that type"
	cont "before!"
	para "Anyways, I'm off!"
	line "See you around!"
	done

AlloyCitySailor1Text:
	text "I've always had"
	line "a dream to move"
	para "farther north"
	line "where it snows."
	done

AlloyCityStandingYoungsterPokegearText:
	text "That thing you"
	line "have--it's a #-"
	cont "GEAR, right? Wow,"
	cont "that's cool."
	done

AlloyCityStandingYoungsterPokedexText:
	text "Wow, you have a"
	line "#DEX!"

	para "That is just so"
	line "awesome."
	done

AlloyCitySailor2Text:
	text "The canal that"
	line "runs through this"
	para "city is a sight"
	line "to behold at"
	cont "sunset."
	done

AlloyCitySignText:
	text "ALLOY CITY"

	para "A Bustling City"
	line "by Rough Waters"
	done

AlloyGymSignText:
	text "ALLOY CITY"
	line "#MON GYM"
	cont "LEADER: JASMINE"

	para "The Steel-Clad"
	line "Defense Girl"
	done

AlloyDojoSignText:
	text "FIGHTING DOJO"
	done

AlloyCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event  7,  8, ALLOY_POKECENTER_1F, 1
	warp_event 30,  9, ALLOY_GYM, 1
	warp_event 35, 30, ALLOY_TIMS_HOUSE, 1
	warp_event 34, 15, FIGHTING_DOJO, 2
	warp_event 11, 28, ALLOY_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 23, 22, ALLOY_GOOD_ROD_HOUSE, 1
	warp_event  5, 23, ALLOY_CAFE, 1
	warp_event  7, 14, ALLOY_MART, 1
	warp_event 23, 13, ALLOY_SAILOR_HO_OH_HOUSE, 1
	warp_event 18,  5, ALLOY_ROUTE_107_GATE, 3
	warp_event 33, 15, FIGHTING_DOJO, 1
	warp_event 19,  5, ALLOY_ROUTE_107_GATE, 4
	warp_event 31,  9, ALLOY_GYM, 2

	db 2 ; coord events
	coord_event  2,  9, SCENE_DEFAULT, AlloyCityRivalSceneTop
	coord_event  2, 10, SCENE_DEFAULT, AlloyCityRivalSceneBottom

	db 5 ; bg events
	bg_event 30, 21, BGEVENT_READ, AlloyCitySign
	bg_event 32, 10, BGEVENT_READ, AlloyGymSign
	bg_event 30, 15, BGEVENT_READ, AlloyDojoSign
	bg_event  8,  8, BGEVENT_READ, AlloyCityPokecenterSign
	bg_event  8, 14, BGEVENT_READ, AlloyCityMartSign

	db 5 ; object events
	object_event 10, 31, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloyCitySailor1Script, -1
	object_event 24,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, AlloyCityStandingYoungsterScript, -1
	object_event 26, 25, SPRITE_ALLOY_RIVAL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AlloyCitySailor2Script, -1
	object_event  7,  8, SPRITE_ALLOY_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_ALLOY_CITY
	object_event  8, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AlloyCityGrampsScript, -1
