	object_const_def ; object_event constants
	const ROUTE101_COOLTRAINER_M1
	const ROUTE101_YOUNGSTER
	const ROUTE101_TEACHER1
	const ROUTE101_FRUIT_TREE
	const ROUTE101_POKE_BALL

Route101_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE101_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE101_CATCH_TUTORIAL

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end



Route101Tutorial1:
	turnobject ROUTE101_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE101_COOLTRAINER_M1, 15
	applymovement ROUTE101_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, DOWN
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE101_COOLTRAINER_M1, PLAYER
	applymovement ROUTE101_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	turnobject PLAYER, DOWN
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE101_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE101_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route101Tutorial2:
	turnobject ROUTE101_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE101_COOLTRAINER_M1, 15
	applymovement ROUTE101_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, DOWN
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE101_COOLTRAINER_M1, PLAYER
	applymovement ROUTE101_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	turnobject PLAYER, DOWN
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE101_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE101_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	setscene SCENE_ROUTE101_NOTHING
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	setscene SCENE_ROUTE101_NOTHING
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	checkcode VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route101YoungsterScript:
	jumptextfaceplayer Route101YoungsterText

Route101TeacherScript:
	jumptextfaceplayer Route101TeacherText


Route101Sign1:
	jumptext Route101Sign1Text


SilentHillsEntranceSign:
	jumptext SilentHillsEntranceSignText
	
DebugSign:
	opentext
;	setflag ENGINE_RADIO_CARD
;	setflag ENGINE_ZEPHYRBADGE
;	setflag ENGINE_HIVEBADGE
;	setflag ENGINE_PLAINBADGE
;	setflag ENGINE_FOGBADGE
 ;	setflag ENGINE_MINERALBADGE
;	setflag ENGINE_STORMBADGE
;	setflag ENGINE_RISINGBADGE
;	setflag ENGINE_GLACIERBADGE
;	giveitem HM_FLY
;	giveitem HM_WATERFALL
;	giveitem HM_SURF
;	giveitem HM_CUT
;	giveitem HM_STRENGTH
;	giveitem HM_WHIRLPOOL
;	giveitem TM_FLASH
;	giveitem HM_ROCK_SMASH
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem RARE_CANDY, 99
	giveitem MASTER_BALL, 99
;	giveitem HELIX_FOSSIL
;	giveitem DOME_FOSSIL
;	giveitem LONG_TONGUE
;	giveitem LONG_VINE
;	giveitem OLD_AMBER
;	giveitem APPLE, 10
;	giveitem SNAKESKIN
;	giveitem PRETTY_TAIL
;	giveitem EARTHEN_CLAY
;	giveitem STIMULUS_ORB
;	giveitem CONFUSE_CLAW
;	giveitem FOCUS_ORB
;	giveitem CALM_SEED
;	giveitem WATER_TAIL
;	giveitem FIRE_TAIL
;	giveitem THUNDER_TAIL
;	giveitem WISDOM_ORB
;	giveitem DETECT_ORB
;	giveitem ENERGY_WALL
;	giveitem STEEL_SHELL
;	giveitem POWER_WINGS
;	givepoke TYKER, 5
;	givepoke BIPULLA, 5
;	givepoke REMORAID, 5
;	givepoke STROMEN, 5
;	givepoke SCYTHER, 5
;	givepoke SNEASEL, 5
	givepoke SUNFLORA, 5
	jumptext DebugSignText
	closetext
	end

Route101FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_101

Route101Potion:
	itemball POTION
	

DudeMovementData1a:
	step UP
	step UP
	step_end

DudeMovementData2a:
	step UP
	step_end

DudeMovementData1b:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

DudeMovementData2b:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end
	
DebugSignText:
	text "Debug sign"
	done

CatchingTutorialBoxFullText:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

CatchingTutorialIntroText:
	text "Well, hey now!"

	para "You sure look like"
	line "a rookie trainer!"
	
	para "I bet you'll be"
	line "wanting to catch"
	cont "some #MON!"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done

CatchingTutorialDebriefText:
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done

CatchingTutorialDeclinedText:
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done

CatchingTutorialRepeatText:
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done

Route101YoungsterText:
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done

Route101TeacherText:
	text "See that ledge?"
	line "It's scary to jump"
	cont "off of it."

	para "But you can jump"
	line "down them as a"

	para "shortcut in many"
	line "places."
	done

Route101Sign1Text:
	text "ROUTE 101"

	para "SILENT TOWN -"
	line "PAGOTA CITY"
	
	para "SILENT HILLS"
	line "In Between"
	done

SilentHillsEntranceSignText:
	text "SILENT HILLS"
	
	para "Entrance to the"
	line "left"
	done

Route101_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8,  8, SILENT_HILLS, 8
	warp_event  8,  9, SILENT_HILLS, 9

	db 2 ; coord events
	coord_event 23,  8, SCENE_ROUTE101_CATCH_TUTORIAL, Route101Tutorial1
	coord_event 23,  9, SCENE_ROUTE101_CATCH_TUTORIAL, Route101Tutorial2

	db 3 ; bg events
	bg_event 20,  8, BGEVENT_READ, Route101Sign1
	bg_event 12,  7, BGEVENT_READ, SilentHillsEntranceSign
	bg_event 16,  2, BGEVENT_READ, DebugSign

	db 5 ; object events
	object_event 23, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 12,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101YoungsterScript, -1
	object_event 17,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route101TeacherScript, -1
	object_event 22,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101FruitTree, -1
	object_event 23,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route101Potion, EVENT_ROUTE_101_POTION
