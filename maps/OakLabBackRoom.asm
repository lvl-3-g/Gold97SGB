	object_const_def ; object_event constants
	const OAK2SLAB_OAK2
	const OAK2SLAB_POKE_BALL1
	const OAK2SLAB_POKE_BALL2
	const OAK2SLAB_POKE_BALL3
	const OAK2SLAB_BLUE
	const OAK2SLAB_SILVER

OakLabBackRoom_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetOak2 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_OAK2SLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_OAK2SLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_OAK2SLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_OAK2SLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_OAK2SLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveOak2Callback

.MeetOak2:
	priorityjump .WalkUpToOak2
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveOak2Callback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject OAK2SLAB_OAK2, 4, 2
.Skip:
	return

.WalkUpToOak2:
	applymovement PLAYER, OakLabBackRoom_WalkUpToOak2Movement
	pause 5
	opentext
	writetext Text_OakTakeAMon
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_SILVER, 15
	opentext
	writetext Text_SilverGetsOneToo
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_YesSilverGetsOneToo
	waitbutton
	closetext
	applymovement OAK2SLAB_SILVER, MoveHeadLeft
	opentext
	writetext Text_RivalGenerous
	waitbutton
	closetext
	applymovement OAK2SLAB_SILVER, MoveHeadUp
	setscene SCENE_OAK2SLAB_CANT_LEAVE
	end

OakLabBackRoomSilverScript:
	jumptextfaceplayer Text_Best

OakLabBackRoomBlueScript:
	end

ProfOak2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue Oak2CheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Oak2GiveTicketScript
Oak2CheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_OAK
	iftrue Oak2CheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue Oak2GiveMasterBallScript
Oak2CheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_OAK
	iftrue Oak2Script_CallYou
	checkevent EVENT_TOLD_OAK2_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse Oak2CheckTogepiEgg
	waitbutton
	closetext
	end

Oak2CheckTogepiEgg:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Oak2AfterLeagueInPerson
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue Oak2AfterRadioTowerInPerson
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue Oak2RocketsReturnedScript
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE ; why are we checking it again?
	iftrue OakHearsYouChallengeLeagueScript ; gonna make this about league challenge
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue Oak2DescribesMrPokemonScript
	writetext Oak2Text_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject OAK2SLAB_OAK2, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OakLabBackRoom_CantLeaveMovement
	end
	
OakHearsYouChallengeLeagueScript:
	writetext OakHearsYouChallengeLeagueText
	waitbutton
	closetext
	end
	
Oak2RocketsReturnedScript:
	writetext Oak2RocketsReturnedText
	waitbutton
	closetext
	end
	
Oak2AfterRadioTowerInPerson:
	writetext Oak2YoureBasicallyAHeroText
	waitbutton
	closetext
	end
	
Oak2AfterLeagueInPerson:
	writetext Oak2AfterLeagueInPersonText
	waitbutton
	closetext
	end

CubburnPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	setval CUBBURN
	special ShowPokedexEntry
	opentext
	writetext TakeCubburnText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL1
	setevent EVENT_GOT_CUBBURN_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CUBBURN, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CUBBURN, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetCruiseMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL2
	opentext
	writetext Text_SilverGetCruise
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_PALSSIO_POKEBALL_IN_OAK_LAB_BACK_ROOM
	jump Oak2DirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	setval PALSSIO
	special ShowPokedexEntry
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL2
	setevent EVENT_GOT_PALSSIO_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem PALSSIO, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke PALSSIO, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetChikoritaMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetChikorita
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CHIKORITA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	jump Oak2DirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	setval CHIKORITA
	special ShowPokedexEntry
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHIKORITA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetCubburnMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetCubburn
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CUBBURN_POKEBALL_IN_OAK_LAB_BACK_ROOM
	jump Oak2DirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

Oak2DirectionsScript:
	applymovement OAK2SLAB_OAK2, Oak2ToTable
	turnobject PLAYER, UP
	opentext
	
	
	writetext Oak2DirectionsTextNew
	waitbutton
	closetext
	applymovement OAK2SLAB_OAK2, Oak2BackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CROWN_CITY
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM
	setscene SCENE_OAK2SLAB_NOTHING
	setmapscene SILENT_TOWN, SCENE_SILENT_NOTHING
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_POKEDEX
	setevent EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
	clearevent EVENT_DAISY_OAK_LAB_FRONT_ROOM
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	end

Oak2DescribesMrPokemonScript:
	writetext Oak2DescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtOak2PokeBallScript:
	opentext
	writetext Oak2PokeBallText
	waitbutton
	closetext
	end



Oak2GiveEverstoneScript:
	writetext Oak2GiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse Oak2Script_NoRoomForEverstone
	writetext Oak2GiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_OAK
	end

Oak2Script_CallYou:
	writetext Oak2Text_CallYou
	waitbutton
Oak2Script_NoRoomForEverstone:
	closetext
	end

Oak2GiveMasterBallScript:
	writetext Oak2GiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_OAK
	writetext Oak2GiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

Oak2GiveTicketScript:
	writetext Oak2GiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_OAK
	writetext Oak2GiveTicketText2
	waitbutton
	closetext
	end

Oak2JumpBackScript1:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, Oak2JumpDownScript
	ifequal UP, Oak2JumpUpScript
	ifequal LEFT, Oak2JumpLeftScript
	ifequal RIGHT, Oak2JumpRightScript
	end

Oak2JumpBackScript2:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, Oak2JumpUpScript
	ifequal UP, Oak2JumpDownScript
	ifequal LEFT, Oak2JumpRightScript
	ifequal RIGHT, Oak2JumpLeftScript
	end

Oak2JumpUpScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpUpMovement
	opentext
	end

Oak2JumpDownScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpDownMovement
	opentext
	end

Oak2JumpLeftScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpLeftMovement
	opentext
	end

Oak2JumpRightScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpRightMovement
	opentext
	end



OakLabBackRoomTrashcan:
	jumptext OakLabBackRoomTrashcanText


OakLabBackRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
Oak2BackFromTable:
	step LEFT
	step LEFT
	step DOWN
	step_end

MoveHeadLeft:
	turn_head LEFT
	step_end
	
MoveHeadUp:
	turn_head UP
	step_end
	
Oak2ToTable:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
SilverGetCruiseMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetCubburnMovement:
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetChikoritaMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

OakLabBackRoom_WalkUpToOak2Movement:
	step UP
	slow_step UP
	step_end

OakLabBackRoom_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksRight2:
	step DOWN
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksLeft1:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

Oak2JumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

Oak2JumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

Oak2JumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

Oak2JumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

OakLabBackRoom_Oak2ToDefaultPositionMovement1:
	step UP
	step_end

OakLabBackRoom_Oak2ToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCubburnMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterCruiseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end
	
BlueGivesDex1:
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
BlueGivesDex2:
	step LEFT
	turn_head DOWN
	step_end
	
BlueGivesDex3:
	step UP
	step LEFT
	turn_head DOWN
	step_end
	
Text_YesSilverGetsOneToo:
	text "OAK: Yes, of"
	line "course."
	para "Go on, choose!"
	done
	
Text_SilverGetsOneToo:
	text "<RIVAL>: We"
	line "both get one?"
	para "I get one too!?"
	done
	

	
Text_SilverTakeThisOne:
	text "You sure you chose"
	line "right, <PLAYER>?"
	para "This #MON looks"
	line "much stronger!"
	done
	
Text_SilverGetCruise:
	text "<RIVAL> received"
	line "PALSSIO!"
	done
	
Text_SilverGetCubburn:
	text "<RIVAL> received"
	line "CUBBURN!"
	done
	
Text_SilverGetChikorita:
	text "<RIVAL> received"
	line "CHIKORITA!"
	done
		
Text_Best:
	text "My #MON is"
	line "gonna be the best"
	cont "one!"
	done

Text_OakTakeAMon:
	text "OAK: Look over"
	line "there!"
	para "On the table are"
	line "three # BALLS."
	para "Each of you,"
	line "choose one to be"
	para "your own partner"
	line "#MON!"
	done
	
Text_RivalGenerous:
	text "<RIVAL>: I'll"
	line "let you choose"
	para "first, <PLAYER>,"
	line "because I'm a"
	para "generous kind of"
	line "guy!"
	done





Oak2Text_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoingText:
	text "OAK: Wait! Where"
	line "are you going?"
	done

TakeCubburnText:
	text "OAK: You'll take"
	line "CUBBURN, the"
	cont "fire #MON?"
	done

TakeCruiseText:
	text "OAK: Do you want"
	line "PALSSIO, the"
	cont "water #MON?"
	done

TakeChikoritaText:
	text "OAK: So, you like"
	line "CHIKORITA, the"
	cont "grass #MON?"
	done

DidntChooseStarterText:
	text "OAK: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "OAK: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done
	
Oak2DirectionsTextNew:
	text "OAK: Your partner"
	line "#MON wil be an"
	para "important ally as"
	line "well as a friend."
	para "Be sure to treat"
	line "it kindly."
	para "Now, both of you"
	line "should go see"
	cont "BLUE."
	para "He has something"
	line "important to give"
	cont "to you."
	done


Oak2DirectionsText2:
	text "notused"
	done


Oak2DescribesMrPokemonText:
	text "This is such an"
	line "exciting"
	cont "opportunity!"
	done

Oak2PokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.OAK."
	done

OakLabBackRoomHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

OakLabBackRoomHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

Oak2AfterTheftText1:
	text "OAK2: <PLAYER>, this"
	line "is terrible…"

	para "Oh, yes, what was"
	line "MR.#MON's big"
	cont "discovery?"
	done

Oak2AfterTheftText2:
	text "<PLAYER> handed"
	line "the MYSTERY EGG to"
	cont "PROF.OAK2."
	done

Oak2AfterTheftText3:
	text "OAK2: This?"
	done

Oak2AfterTheftText4:
	text "But… Is it a"
	line "#MON EGG?"

	para "If it is, it is a"
	line "great discovery!"
	done

Oak2AfterTheftText5:
	text "OAK2: What?!?"

	para "PROF.OAK gave you"
	line "a #DEX?"

	para "<PLAYER>, is that"
	line "true? Th-that's"
	cont "incredible!"

	para "He is superb at"
	line "seeing the poten-"
	cont "tial of people as"
	cont "trainers."

	para "Wow, <PLAYER>. You"
	line "may have what it"

	para "takes to become"
	line "the CHAMPION."

	para "You seem to be"
	line "getting on great"
	cont "with #MON too."

	para "You should take"
	line "the #MON GYM"
	cont "challenge."

	para "The closest GYM"
	line "would be the one"
	cont "in PAGOTA CITY."
	done

Oak2AfterTheftText6:
	text "…<PLAYER>. The"
	line "road to the"

	para "championship will"
	line "be a long one."

	para "Before you leave,"
	line "make sure that you"
	cont "talk to your mom."
	done

Oak2StudyingEggText:
	text "OAK2: Don't give"
	line "up! I'll call if"

	para "I learn anything"
	line "about that EGG!"
	done

Oak2AideHasEggText:
	text "OAK2: <PLAYER>?"
	line "Didn't you meet my"
	cont "assistant?"

	para "He should have met"
	line "you with the EGG"

	para "at PAGOTA CITY's"
	line "#MON CENTER."

	para "You must have just"
	line "missed him. Try to"
	cont "catch him there."
	done

OakHearsYouChallengeLeagueText:
	text "So, I hear you're"
	line "taking the NIHON"
	para "#MON LEAGUE"
	line "challenge."
	para "That's great!"
	line "I'm sure you've"
	para "got a fighting"
	line "chance to do"
	cont "great things!"
	done


Oak2GiveEverstoneText1:
	text "Thanks, <PLAYER>!"
	line "You're helping"

	para "unravel #MON"
	line "mysteries for us!"

	para "I want you to have"
	line "this as a token of"
	cont "our appreciation."
	done



AideText_AfterTheft:
	text "We appreciate"
	line "your assistance!"
	done

Oak2GiveMasterBallText1:
	text "OAK: Hi, <PLAYER>!"
	line "Thanks to you, my"

	para "research is going"
	line "great!"

	para "Take this as a"
	line "token of my"
	cont "appreciation."
	done

Oak2GiveMasterBallText2:
	text "The MASTER BALL is"
	line "the best!"

	para "It's the ultimate"
	line "BALL! It'll catch"

	para "any #MON with-"
	line "out fail."

	para "It's given only to"
	line "recognized #MON"
	cont "researchers."

	para "I think you can"
	line "make much better"

	para "use of it than I"
	line "can, <PLAYER>!"
	done

Oak2GiveTicketText1:
	text "OAK: <PLAYER>!"
	line "There you are!"

	para "I called because I"
	line "have something for"
	cont "you."

	para "See? It's an"
	line "S.S.TICKET."
	done
Oak2GiveTicketText2:
	text "If you go to the"
	line "docks over in"
	cont "WESTPORT CITY,"
	para "you can take a"
	line "boat to NIHON's"
	cont "SOUTHWEST ISLANDS."
	para "There are lots of"
	line "rare #MON there"
	para "that can't be"
	line "found on the"
	cont "mainland."
	para "You should head on"
	line "down there when"
	cont "you get a chance."
	done


AideText_GiveYouPotion:
	text "<PLAYER>, I want"
	line "you to have"
	para "something that"
	line "might help you"
	cont "out."
	done

AideText_AlwaysBusy:
	text "We appreciate"
	line "your assistance!"
	done

AideText_TheftTestimony:
	text "We appreciate"
	line "your assistance!"
	done



OakLabBackRoomTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

OakLabBackRoomTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

OakLabBackRoomTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

OakLabBackRoomTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

OakLabBackRoomTrashcanText:
	text "The wrapper from"
	line "the snack PROF.OAK"
	cont "ate is in there…"
	done

Oak2GiveEverstoneText2:
	text "That's an"
	line "EVERSTONE."

	para "Some species of"
	line "#MON evolve"

	para "when they grow to"
	line "certain levels."

	para "A #MON holding"
	line "the EVERSTONE"
	cont "won't evolve."

	para "Give it to a #-"
	line "MON you don't want"
	cont "to evolve."
	done

Oak2Text_CallYou:
	text "OAK: <PLAYER>, I'll"
	line "call you if any-"
	cont "thing comes up."
	done
	
Oak2RocketsReturnedText:
	text "I worry that TEAM"
	line "ROCKET is planning"
	para "something truly"
	line "terrible…"
	done
	
Oak2YoureBasicallyAHeroText:
	text "It's incredible you"
	line "and <RIVAL>"
	para "took on TEAM"
	line "ROCKET!"
	para "You both are"
	line "heroes to all"
	cont "#MON!"
	para "Keep up the great"
	line "work, and aim for"
	cont "MT.FUJI!"
	done
	
Oak2AfterLeagueInPersonText:
	text "Congratulations on"
	line "defeating the"
	cont "LEAGUE!"
	para "That's a huge"
	line "accomplishment!"
	para "And thanks again"
	line "for helping me"
	cont "with my research."
	para "If this is what"
	line "you've been able"
	para "to do already,"
	line "you've got a great"
	cont "future ahead!"
	done

OakLabBackRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OAK_LAB_FRONT_ROOM, 3
	warp_event  4,  7, OAK_LAB_FRONT_ROOM, 3


	db 2 ; coord events
	coord_event  3,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  2,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  3,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  0,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  9,  3, BGEVENT_READ, OakLabBackRoomTrashcan

	db 6 ; object events
	object_event  4,  2, SPRITE_OAK2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, ProfOak2Script, -1
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CubburnPokeBallScript, EVENT_CUBBURN_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_PALSSIO_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomBlueScript, EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomSilverScript, EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
