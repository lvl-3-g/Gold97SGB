	object_const_def ; object_event constants
	const ROUTE101N_TEACHER
	const ROUTE101N_POKE_BALL_2
	const ROUTE101N_FISHER
	const ROUTE101N_COOLTRAINERM
	const ROUTE101N_FLEDGLING
	const ROUTE101N_SILVER

Route101N_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Route101NTreeCut

.Route101NTreeCut:
	checkevent EVENT_ROUTE_101N_TREE_CUT
	iffalse .R101NTreeThere
	changeblock  5, 25, $34 ; notree
	return
	
.R101NTreeThere
	return

TrainerTeacherColette:
	trainer TEACHER, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end


Route101FisherScript:
	jumptextfaceplayer Route101FisherText

Route101CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route101CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route101CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

	
TrainerFledglingHugo:
	trainer FLEDGLING, HUGO, EVENT_BEAT_FLEDGLING_HUGO, FledglingHugoSeenText, FledglingHugoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHugoAfterBattleText
	waitbutton
	closetext
	end
	
Route101Potion2:
	itemball POTION

Route101Sign2:
	jumptext Route101Sign2Text
	
TreeGotCut:
	setevent EVENT_ROUTE_101N_TREE_CUT
	setscene SCENE_ROUTE_101N_TREE_CUT
	end
	
SilverAtTheGateCoord:
	turnobject PLAYER, LEFT
	turnobject ROUTE101N_SILVER, RIGHT
SilverAtTheGateScript:
	faceplayer
	opentext
	writetext SilverAtTheGateText
	waitbutton
	closetext
	applymovement ROUTE101N_SILVER, SilverGoesThroughGateMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE101N_SILVER
	setevent EVENT_SILVER_AT_ROUTE_101_GATE
	setscene SCENE_ROUTE_101N_AFTER_SILVER
	end
	
SilverGoesThroughGateMovement:
	step UP
	step_end
	
SilverAtTheGateText:
	text "<PLAYER>!"
	para "You made it out of"
	line "SILENT HILLS!"
	para "I wasn't sure you"
	line "could do it!"
	para "I already caught"
	line "some super awesome"
	cont "#MON!"
	para "You better stay on"
	line "top of your game"
	para "if you want to"
	line "keep up with me!"
	para "Anyways, see ya!"
	done
	
FledglingHugoSeenText:
	text "Um…"
	para "Are you a new"
	line "trainer too?"
	done

FledglingHugoBeatenText:
	text "Wow, you don't"
	line "seem new…"
	done

FledglingHugoAfterBattleText:
	text "How did you get"
	line "so good?"
	done


Route101FisherText:
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done

; unused
Text_WaitingForDay:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "daytime."
	done

Route101CooltrainerMText_WaitingForNight:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Route101CooltrainerMText_WaitingForMorning:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done


Route101Sign2Text:
	text "TRAINER TIPS"

	para "No stealing other"
	line "people's #MON!"

	para "# BALLS are to"
	line "be thrown only at"
	cont "wild #MON!"
	done


TeacherColetteSeenText:
	text "My CHIX is the"
	line "cutest in the"
	cont "world."
	done

TeacherColetteBeatenText:
	text "My CHIX!"
	done

TeacherColetteAfterBattleText:
	text "Look how adorable"
	line "my CHIX acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done



Route101N_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9,  5, ROUTE_101_PAGOTA_GATE, 4
	warp_event  8,  5, ROUTE_101_PAGOTA_GATE, 3
	warp_event  8, 25, SILENT_HILLS, 3
	warp_event  9, 25, SILENT_HILLS, 4

	db 2 ; coord events
	coord_event  5, 24, SCENE_ROUTE_101N_AFTER_SILVER, TreeGotCut
	coord_event  9,  6, SCENE_DEFAULT, SilverAtTheGateCoord

	db 1 ; bg events
	bg_event 10, 20, BGEVENT_READ, Route101Sign2

	db 6 ; object events
	object_event  7, 15, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 14, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route101Potion2, EVENT_ROUTE_101_POTION_2
	object_event 11, 18, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101FisherScript, -1
	object_event  4, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route101CooltrainerMScript, -1
	object_event  9, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerFledglingHugo, -1
	object_event  8,  6, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 2, SilverAtTheGateScript, EVENT_SILVER_AT_ROUTE_101_GATE
