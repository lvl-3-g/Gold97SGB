	object_const_def ; object_event constants
	const OAK2ENTRANCE_AIDE
	const OAK2ENTRANCE_SILVER
	const OAK2ENTRANCE_BLUE
	const OAK2ENTRANCE_DAISY
	const OAK2ENTRANCE_DEX1
	const OAK2ENTRANCE_DEX2
	const OAK2ENTRANCE_OAK
	const OAK2ENTRANCE_SILVER2
	const OAK2ENTRANCE_BLUE2

OakLabFrontRoom_MapScripts:
	db 8 ; scene scripts
	scene_script .SceneOak2DoorLocked ; SCENE_DEFAULT
	scene_script .SceneHeadToTheBack ;
	scene_script .SceneOakLabFrontRoomNothing ;does this work?
	scene_script .SceneOakLabFrontRoomPokedex ;seems to!
	scene_script .SceneOakLabFrontRoomDaisy
	scene_script .SceneOakLabFrontGoSeeOak
	scene_script .SceneOakLabFrontRoomBattle
	scene_script .SceneOakLabFrontRoomAfterTalkingToClerk

	db 0 ; callbacks
	
.SceneOak2DoorLocked:
	end
	
.SceneOakLabFrontRoomAfterTalkingToClerk
	end
	
.SceneHeadToTheBack:
	priorityjump .SceneHeadToTheBack2
	end
	
.SceneHeadToTheBack2
	turnobject OAK2ENTRANCE_BLUE, DOWN
	turnobject PLAYER, UP
	opentext
	writetext Text_InBack
	waitbutton
	closetext
	applymovement PLAYER, PlayerLabDummyMovement
	follow OAK2ENTRANCE_BLUE, PLAYER
	applymovement OAK2ENTRANCE_BLUE, Movement_BlueToBack
	stopfollow
	showemote EMOTE_SHOCK, OAK2ENTRANCE_OAK, 15
	opentext
	writetext Oak2Text_Intro
	waitbutton
	closetext
	turnobject OAK2ENTRANCE_SILVER2, RIGHT
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	turnobject OAK2ENTRANCE_SILVER2, UP
	pause 15
	opentext
	writetext Text_OakSpeech
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2ENTRANCE_SILVER2, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeechComeToBack
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_OAK, OakGoesIntoBackMovement
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_OAK
	applymovement OAK2ENTRANCE_SILVER2, SilverGoesIntoBackMovement
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_SILVER2
	setscene SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK
	setevent EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	end

.SceneOakLabFrontRoomNothing:
	end

.SceneOakLabFrontRoomPokedex
	end

.SceneOakLabFrontRoomDaisy:
	end
	
.SceneOakLabFrontGoSeeOak:
	end

.SceneOakLabFrontRoomBattle:
	end
	

GetDexScript:
	applymovement PLAYER, Movement_OverToBlue
	playsound SFX_EXIT_BUILDING
	moveobject OAK2ENTRANCE_SILVER, 4, 0
	appear OAK2ENTRANCE_SILVER
	applymovement OAK2ENTRANCE_SILVER, Movement_SilverToBlue
	turnobject OAK2ENTRANCE_BLUE2, RIGHT
	opentext
	writetext BlueWillGiveDexText
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex1Movement
	pause 10
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex2Movement
	disappear OAK2ENTRANCE_DEX1
	disappear OAK2ENTRANCE_DEX2
	pause 20
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex3Movement
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex4Movement
	pause 10
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex5Movement
	pause 10
	opentext
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_BLUE2, BlueGoesToGetDex6Movement
	playsound SFX_EXIT_BUILDING
	moveobject OAK2ENTRANCE_OAK, 4, 0
	appear OAK2ENTRANCE_OAK
	applymovement OAK2ENTRANCE_OAK, OakWalksOverToGivePhoneNumber
	pause 5
	turnobject PLAYER, RIGHT
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	opentext
	writetext Oak2DirectionsText1
	waitbutton
	addcellnum PHONE_OAK2
	opentext
	writetext GotOak2sNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	pause 5
	opentext
	writetext Oak2DirectionsText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_OAK, OakWalksBackToBackRoom
	playsound SFX_ENTER_DOOR
	disappear OAK2ENTRANCE_OAK
	setscene SCENE_OAK_LAB_FRONT_ROOM_BATTLE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end
	
BattleScript2:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse YouReloadedMapScriptRight
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouR1
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	turnobject PLAYER, LEFT
	jump BattleScriptMainBranch
	end

BattleScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse YouReloadedMapScriptLeft
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouL1
	turnobject OAK2ENTRANCE_SILVER, LEFT
	turnobject PLAYER, RIGHT
	jump BattleScriptMainBranch
	end
	
BattleScriptMainBranch:
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext TimeToBattle
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Palssio
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_PALSSIO
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat


.Palssio:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Chikorita:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CUBBURN
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement OAK2ENTRANCE_SILVER, SilverLeavesLab
	disappear OAK2ENTRANCE_SILVER
	setscene SCENE_OAK_LAB_FRONT_ROOM_DAISY
	special HealParty
	playmapmusic
	end
	
	
YouReloadedMapScriptRight:
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouR2
	turnobject OAK2ENTRANCE_SILVER, RIGHT
	turnobject PLAYER, LEFT
	jump BattleScriptMainBranch
	end

	
YouReloadedMapScriptLeft:
	applymovement OAK2ENTRANCE_SILVER, SilverConfrontsYouL2
	turnobject OAK2ENTRANCE_SILVER, LEFT
	turnobject PLAYER, RIGHT
	jump BattleScriptMainBranch
	end


DoorLockedScript:
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DoorLockedScriptWeekends:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .DoorIsLockedWeekend
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .DoorIsLockedWeekend
	end

.DoorIsLockedWeekend
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DaisyStopsScript1:
	applymovement OAK2ENTRANCE_DAISY, DaisyWalksUp1
	jump .DaisySpeech

.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	itemtotext POTION, MEM_BUFFER_1
	scall DaisyScript_ReceiveThePotion
	giveitem POTION, 1
	itemnotify
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE101_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"
	

DaisyStopsScript2:
	applymovement OAK2ENTRANCE_DAISY, DaisyWalksUp2
	jump .DaisySpeech
	
.DaisySpeech:
	opentext
	writetext DaisySpeechText
	buttonsound
	itemtotext POTION, MEM_BUFFER_1
	scall DaisyScript_ReceiveThePotion
	giveitem POTION, 1
	itemnotify
	writetext DaisySpeechText2
	buttonsound
	itemtotext POKE_BALL, MEM_BUFFER_1
	scall DaisyScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	itemnotify
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAK2ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE101_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"
	
DaisyScript_ReceiveTheBalls:
	jumpstd ReceiveItemScript
	end
	
DaisyScript_ReceiveThePotion:
	jumpstd ReceiveItemScript
	end
	
OakLabFrontRoomDexScript:
	opentext
	writetext WhatIsDexText
	waitbutton
	closetext
	end
	
OakLabFrontRoomBlueScript:
	checkevent EVENT_BLUE_ON_RAINBOW_ISLAND
	iftrue .BlueAfterBlueBattle
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BlueAfterEliteFour
	faceplayer
	opentext
	writetext Oak2Text_Accepted
	waitbutton
	closetext
	end
	
.BlueAfterEliteFour
	faceplayer
	opentext
	writetext Oak2Text_Accepted2
	waitbutton
	closetext
	end
	
.BlueAfterBlueBattle
	faceplayer
	opentext
	writetext Oak2Text_Accepted3
	waitbutton
	closetext
	end


	
OakLabFrontRoomDaisyScript:
	jumptextfaceplayer Text_RootingText

OakLabFrontRoomSilverScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .SilverLabScriptAfterMon
	writetext OakLabFrontRoomSilverText
	waitbutton
	closetext
	end
	
.SilverLabScriptAfterMon:
	writetext OakLabFrontRoomSilverText2
	waitbutton
	closetext
	end

OakLabFrontRoomAideScript:
	jumptextfaceplayer OakLabFrontRoomAideText
	
OakLabFrontRoomComputerScript:
	jumptext OakLabFrontRoomComputerText
	
OakLabFrontRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
OakLabFrontRoomSign:
	jumptext OakLabFrontRoomSignText
	
GoSeeOakScript:
	turnobject OAK2ENTRANCE_BLUE, DOWN
	opentext
	writetext Text_GoSeeOak
	waitbutton
	closetext
	applymovement PLAYER, GoSeeOakOneUp
	end

OakWalksOverToGivePhoneNumber:
	step DOWN
	step DOWN
	step DOWN
	turn_head LEFT
	step_end
	
OakWalksBackToBackRoom:
	step UP
	step UP
	slow_step UP
	step_end

OakGoesIntoBackMovement:
	step UP
	slow_step UP
	step_end
	
SilverGoesIntoBackMovement:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end
	
SilverConfrontsYouR1:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end

SilverConfrontsYouL1:
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
SilverConfrontsYouR2:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
SilverConfrontsYouL2:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step DOWN
	step_end
	
GoSeeOakOneUp:
	slow_step UP
	step_end
	
BlueGoesToGetDex1Movement:
	step LEFT
	step UP
	step_end
	
BlueGoesToGetDex2Movement:
	step RIGHT
	turn_head UP
	step_end
	
BlueGoesToGetDex3Movement:
	step LEFT
	step DOWN
	turn_head RIGHT
	step_end
	
BlueGoesToGetDex4Movement:
	step DOWN
	step RIGHT
	step_end
	
BlueGoesToGetDex5Movement:
	step UP
	turn_head RIGHT
	step_end
	
BlueGoesToGetDex6Movement:
	step LEFT
	turn_head RIGHT
	step_end
	

Oak2Text_Accepted:
	text "Thanks, <PLAYER>!"

	para "I appreciate you"
	line "helping out my"
	cont "grandpa."
	done

Oak2Text_Accepted2:
	text "How are things"
	line "now that you've"
	cont "beat the LEAGUE?"
	para "I hope they're"
	line "going well."
	para "Have you seen"
	line "<RIVAL> lately?"
	para "I know he's out"
	line "training with his"
	cont "#MON."
	para "I think he's"
	line "learned how to"
	para "work together with"
	line "them as a team."
	done
	
Oak2Text_Accepted3:
	text "Hi <PLAYER>!"
	para "Thanks for that"
	line "incredible battle!"
	para "Me and my #MON"
	line "felt as fired up"
	cont "as we ever had!"
	done
	
	
OakLabFrontRoomSilverText2:
	text "My #MON will be"
	line "the best ever!"
	done
	
Oak2DirectionsText3:
	text "<PLAYER>."
	para "<RIVAL>."
	para "I'm counting on"
	line "you both!"
	done

Oak2DirectionsText1:
	text "OAK: With that"
	line "#DEX, you're"
	para "ready to begin the"
	line "adventure of a"
	cont "lifetime!"
	
	para "ROUTE 101 and"
	line "SILENT HILLS would"
	
	para "be great places to"
	line "start looking for"
	cont "#MON."
	
	para "If you want to get"
	line "some # BALLS,"
	para "you should head"
	line "towards PAGOTA"
	para "CITY nearby to"
	line "pick some up at"
	cont "their MART."
	
	para "If your #MON is"
	line "hurt, you should"

	para "heal it with the"
	line "#MON CENTER"
	
	para "just behind the"
	line "lab."

	para "Feel free to use"
	line "it anytime."

	
	para "I'm sure you'll do"
	line "great!"

	para "But just in case,"
	line "here's my phone"
	cont "number."

	para "Call me if any-"
	line "thing comes up!"
	done
	

GotOak2sNumberText:
	text "<PLAYER> got OAK's"
	line "phone number."
	done
	
	
Lab_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done


BlueText_Pokedex:
	text "BLUE: I used to"
	line "want to be the"
	para "world's best"
	line "#MON trainer."
	para "But when I got"
	line "too arrogant…"
	para "There was someone"
	line "who showed me"
	cont "humility."
	para "<PLAYER>, you"
	line "remind me of him."
	para "And <RIVAL>!"
	line "You remind me of"
	cont "myself!"
	para "Right, though!"
	para "Here! Take this"
	line "#DEX!"
	para "It automatically"
	line "records data on"
	para "#MON you've"
	line "seen or caught!"
	done


	
BlueWillGiveDexText:
	text "BLUE: Ah, I see"
	line "you both got a"
	cont "#MON!"
	para "Here, I have"
	line "something else"
	cont "for you!"
	done

Text_GoSeeOak:
	text "BLUE: Gramps is"
	line "waiting for you in"
	cont "the back!"
	done

Text_Interesting:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"

	para "This just got"
	line "interesting!"

	done

Text_OakSpeechComeToBack:
	text "OAK: Won't you two"
	line "follow me to the"
	cont "back?"
	done
	
Text_OakSpeech:
	text "OAK: Indeed! I am"
	line "PROF.OAK! You've"
	para "got quite the"
	line "mouth on you!"
	para "Won't you listen"
	line "for a while?"
	para "One year ago, in"
	line "KANTO, I entrusted"
	para "two boys with a"
	line "#MON and a"
	para "#DEX each to"
	line "assist in my"
	cont "research."
	para "In the end, they"
	line "did an astounding"
	cont "job!"
	para "They succeeded in"
	line "documenting 150"
	para "species of"
	line "#MON!"
	para "However, new"
	line "#MON are being"
	para "found all over"
	line "NIHON!"
	para "Therefore, I moved"
	line "my lab from KANTO"
	para "to here, SILENT"
	line "TOWN, to further"
	cont "my research."
	para "My grandson BLUE"
	line "and my AIDES help,"
	para "but it's not quite"
	line "enough!"
	para "<PLAYER>!"
	para "<RIVAL>!"
	para "Please help me"
	line "research #MON!"
	done
	
	

Oak2Text_Intro:
	text "OAK: <PLAYER>!"
	line "There you are!"

	done	
	
Text_OakIsOld:
	text "<RIVAL>: I can't"
	line "believe this old"
	para "geezer is PROF."
	line "OAK…"
	done
	
WhatIsDexText:
	text "What is this?"
	para "Some sort of"
	line "encyclopedia?"
	done
	
OakLabFrontRoomSignText:
	text "Remember to SAVE"
	line "your progress!"
	done	
	
OakLabFrontRoomComputerText:
	text "It's a paper on"
	line "#MON habitats."
	done
	
Text_RootingText:
	text "I'll be rooting"
	line "for you!"
	done
	
DaisySpeechText:
	text "The boy who"
	line "brought you"
	para "here is my little"
	line "brother."
	para "In other words…"
	para "I'm PROF.OAK's"
	line "granddaughter!"
	para "Grandpa's a"
	line "fantastic"
	cont "researcher!"
	para "…But he can be a"
	line "little forgetful."
	para "He was also"
	line "supposed to give"
	cont "you this!"
	done

DaisySpeechText2:
	text "A POTION helps"
	line "restore your"
	para "#MON's health"
	line "if you're not at"
	cont "a #MON CENTER!"
	para "I'll also throw"
	line "in a few"
	para "# BALLS to"
	line "help out."
	done

DaisySpeechText3:
	text "But like Grandpa"
	line "said, if you need"
	para "more # BALLS,"
	line "you can find them"
	para "at just about any"
	line "MART."
	para "Also, we can't"
	line "have your family"
	para "worrying, so make"
	line "sure to say"
	para "goodbye to your"
	line "MOM and KEN before"
	cont "you leave town!"
	para "I'll be rooting"
	line "for you!"
	done

SilverEntranceWinText:
	text "Wow! I thought my"
	line "#MON would have"
	para "been the best!"
	done

EntranceRivalText_YouLost:
	text "<PLAYER>! I'm"
	line "so ready to show"
	para "the world how"
	line "great my #MON"
	cont "is!"
	para "I'll see you"
	line "around soon!"
	done

SilverEntranceLossText:
	text "Alright! My"
	line "#MON rules!"
	done

EntranceRivalText_YouWon:
	text "<PLAYER>! I'm"
	line "so ready to show"
	para "the world how"
	line "great my #MON"
	cont "is!"
	para "I'll see you"
	line "around soon!"
	done
	
TimeToBattle:
	text "<PLAYER>!"
	para "You're not getting"
	line "off that easy!"
	para "OAK gave us these"
	line "#MON, so now"
	para "we gotta battle"
	line "them!"
	para "I'm not gonna hold"
	line "back!"
	done
	
Text_InBack:
	text "PROF.OAK just got"
	line "back in. He's"
	para "waiting to see"
	line "you!"
	done

OakLabFrontRoomAideText:
	text "I'm one of PROF."
	line "OAK's AIDES."
	para "Of course, we"
	line "respect each other"
	cont "greatly."
	done
	
DoorLockedText:
	text "The door seems to"
	line "be locked…"
	done
	
OakLabFrontRoomSilverText:
	text "Yo, <PLAYER>!"
	
	para "Looks like PROF."
	line "OAK isn't here!"
	
	para "I wonder when"
	line "he would have"
	
	para "expected us to"
	line "show up!"
	
	done
	
DaisyLeftMovement:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
DaisyWalksUp1:
	step RIGHT
	step RIGHT
	step UP
	step_end
	
DaisyWalksUp2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverLeavesLab:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Movement_SilverToBlue:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	slow_step LEFT
	step_end
	
Movement_OverToBlue:
	step DOWN
	step DOWN
	step LEFT
	slow_step LEFT
	step_end	
	
PlayerLabDummyMovement:
	step_end

DoorLocked_Movement:
	turn_head DOWN
	slow_step DOWN
	step_end

Movement_BlueToBack:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	slow_step UP
	slow_step RIGHT
	turn_head UP
	step_end
	
Movement_BlueThroughDoor:
	step UP
	step_end
	
Movement_PlayerThroughDoor:
	step UP
	step UP
	step_end

OakLabFrontRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, SILENT_TOWN, 1
	warp_event  4, 15, SILENT_TOWN, 5
	warp_event  4,  0, OAK_LAB_BACK_ROOM, 1


	db 9 ; coord events
	coord_event  4,  1, SCENE_DEFAULT, DoorLockedScript
	coord_event  3,  7, SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK, GoSeeOakScript
	coord_event  4,  7, SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK, GoSeeOakScript
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_POKEDEX, GetDexScript
	coord_event  3, 11, SCENE_OAK_LAB_FRONT_ROOM_DAISY, DaisyStopsScript1
	coord_event  4, 11, SCENE_OAK_LAB_FRONT_ROOM_DAISY, DaisyStopsScript2
	coord_event  3,  8, SCENE_OAK_LAB_FRONT_ROOM_BATTLE, BattleScript
	coord_event  4,  8, SCENE_OAK_LAB_FRONT_ROOM_BATTLE, BattleScript2
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_AFTER_TALKING_TO_CLERK, DoorLockedScriptWeekends

	db 14 ; bg events
	bg_event  6,  1, BGEVENT_READ, OakLabFrontRoomComputerScript
	bg_event  0,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  1,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  5,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  6,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  7,  7, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  0, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  1, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  5, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  6, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  7, 11, BGEVENT_READ, OakLabFrontRoomBookshelf
	bg_event  2,  0, BGEVENT_READ, OakLabFrontRoomSign


	db 9 ; object events
	object_event  6, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomAideScript, EVENT_OAK2S_AIDE_IN_LAB
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomSilverScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM
	object_event  4, 14, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomBlueScript, EVENT_BLUE_OAK_LAB_FRONT_ROOM
	object_event  1, 13, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDaisyScript, EVENT_DAISY_OAK_LAB_FRONT_ROOM
	object_event  1,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_LAB_DEX_TABLE
	object_event  0,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_LAB_DEX_TABLE
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomDexScript, EVENT_OAK_OAK_LAB_FRONT_ROOM
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomSilverScript, EVENT_RIVAL_OAK_LAB_FRONT_ROOM_2
	object_event  1,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabFrontRoomBlueScript, EVENT_BLUE_OAK_LAB_FRONT_ROOM_2

	
