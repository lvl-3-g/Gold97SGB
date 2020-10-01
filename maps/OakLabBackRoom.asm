	object_const_def ; object_event constants
	const OAK2SLAB_OAK2
	const OAK2SLAB_OAK2S_AIDE
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
	showemote EMOTE_SHOCK, OAK2SLAB_OAK2, 15
	opentext
	writetext Oak2Text_Intro
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_SILVER, 15
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeech
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_SILVER, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_BLUE, 15
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement OAK2SLAB_BLUE, BlueGivesDex1
	pause 10
	applymovement OAK2SLAB_BLUE, BlueGivesDex2
	pause 5
	opentext
;	buttonsound
;	waitsfx
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement OAK2SLAB_BLUE, BlueGivesDex3
	opentext
	writetext Text_OakDream
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

FlambearPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	pokepic FLAMBEAR
	cry FLAMBEAR
	waitbutton
	closepokepic
	opentext
	writetext TakeFlambearText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL1
	setevent EVENT_GOT_FLAMBEAR_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem FLAMBEAR, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke FLAMBEAR, 5, BERRY
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
	setevent EVENT_CRUISEAL_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump Oak2DirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	pokepic CRUISEAL
	cry CRUISEAL
	waitbutton
	closepokepic
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL2
	setevent EVENT_GOT_CRUISEAL_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CRUISEAL, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CRUISEAL, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetHappaMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetHappa
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_HAPPA_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump Oak2DirectionsScript

HappaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	pokepic HAPPA
	cry HAPPA
	waitbutton
	closepokepic
	opentext
	writetext TakeHappaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL3
	setevent EVENT_GOT_HAPPA_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem HAPPA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke HAPPA, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetFlambearMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetFlambear
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_FLAMBEAR_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
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
	writetext Oak2DirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_OAK2
	opentext
	writetext GotOak2sNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	opentext
	writetext Oak2DirectionsText2
	waitbutton
	closetext
	opentext
	writetext Oak2DirectionsText3
	waitbutton
	closetext
	applymovement OAK2SLAB_OAK2, Oak2BackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CROWN_CITY
	setscene SCENE_OAK2SLAB_AIDE_GIVES_POTION
	setmapscene SILENT_TOWN, SCENE_SILENT_NOTHING
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_BATTLE
	setevent EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
	clearevent EVENT_DAISY_OAK_LAB_FRONT_ROOM
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

AideScript_WalkPotion1:
	applymovement OAK2SLAB_OAK2S_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement OAK2SLAB_OAK2S_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement OAK2SLAB_OAK2S_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement OAK2SLAB_OAK2S_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	buttonsound
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_OAK2SLAB_NOTHING
	end


AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

Oak2sAideScript:
	faceplayer
	opentext
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

OakLabBackRoomTrashcan:
	jumptext OakLabBackRoomTrashcanText


OakLabBackRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
Oak2BackFromTable:
	step LEFT
	step LEFT
	step DOWN
;	turn_head DOWN
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
	
SilverGetFlambearMovement:
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetHappaMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

OakLabBackRoom_WalkUpToOak2Movement:
	step UP
	step UP
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

AfterFlambearMovement:
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

AfterHappaMovement:
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
	
Oak2Text_Accepted3:
	text "Hi <PLAYER>!"
	para "Thanks for that"
	line "incredible battle!"
	para "Me and my #MON"
	line "felt as fired up"
	cont "as we ever had!"
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
	
Text_SilverTakeThisOne:
	text "You sure you chose"
	line "right, <PLAYER>?"
	para "This #MON looks"
	line "much stronger!"
	done
	
Text_SilverGetCruise:
	text "<RIVAL> received"
	line "CRUISEAL!"
	done
	
Text_SilverGetFlambear:
	text "<RIVAL> received"
	line "FLAMBEAR!"
	done
	
Text_SilverGetHappa:
	text "<RIVAL> received"
	line "HAPPA!"
	done
		
Text_Best:
	text "My #MON is"
	line "gonna be the best"
	cont "one!"
	done

Text_OakDream:
	text "OAK: To make a"
	line "complete guide on"
	para "all of the #MON"
	line "in the world…"
	para "That was my dream!"
	line "But #MON are"
	para "being discovered"
	line "even as we speak!"
	para "I don't have"
	line "enough time left"
	cont "in this world."
	para "So you two are"
	line "going to help me"
	cont "fulfill my dream!"
	para "And to do that,"
	line "you'll need your"
	cont "own #MON!"
	para "There on the"
	line "table are three"
	cont "#BALLs."
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

Lab_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
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
	line "and my AIDEs help,"
	para "but it's not quite"
	line "enough!"
	para "<PLAYER>!"
	para "<RIVAL>!"
	para "Please help me"
	line "research #MON!"
	done
	
Text_OakIsOld:
	text "<RIVAL>: I can't"
	line "believe this old"
	para "geezer is PROF."
	line "OAK…"
	done

Oak2Text_Intro:
	text "OAK: <PLAYER>!"
	line "There you are!"

	done

Oak2Text_Accepted:
	text "Thanks, <PLAYER>!"

	para "I appreciate you"
	line "helping out my"
	cont "grandpa."
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
	para "I have something"
	line "for you both!"
	para "Here! Take this"
	line "#DEX!"
	para "It automatically"
	line "records data on"
	para "#MON you've"
	line "seen or caught!"
	done

Text_Interesting:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"

	para "This just got"
	line "interesting!"

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

TakeFlambearText:
	text "OAK: You'll take"
	line "FLAMBEAR, the"
	cont "fire #MON?"
	done

TakeCruiseText:
	text "OAK: Do you want"
	line "CRUISEAL, the"
	cont "water #MON?"
	done

TakeHappaText:
	text "OAK: So, you like"
	line "HAPPA, the"
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

Oak2DirectionsText1:
	text "ROUTE 101 and"
	line "SILENT HILLS would"
	
	para "be great places to"
	line "start looking for"
	
	para "#MON. If you"
	line "want to get some"
	
	para "#BALLs, you"
	line "should head"
	
	para "towards PAGOTA"
	line "CITY nearby"
	
	para "to pick some up at"
	line "their MART."
	
	para "I'm sure you'll do"
	line "great!"

	para "But just in case,"
	line "here's my phone"

	para "number. Call me if"
	line "anything comes up!"
	done

Oak2DirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with the"
	line "#MON CENTER"
	
	para "just behind the"
	line "lab."

	para "Feel free to use"
	line "it anytime."
	done

Oak2DirectionsText3:
	text "<PLAYER>."
	para "<RIVAL>."
	para "I'm counting on"
	line "you both!"
	done

GotOak2sNumberText:
	text "<PLAYER> got OAK's"
	line "phone number."
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
	text "The docks in WEST"
	line "CITY take boats"
	para "down to NIHON's"
	line "SOUTHWEST ISLANDS."
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


	db 4 ; coord events
	coord_event  3,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  3,  7, SCENE_OAK2SLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  4,  7, SCENE_OAK2SLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  2,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  3,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  0,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  9,  3, BGEVENT_READ, OakLabBackRoomTrashcan

	db 7 ; object events
	object_event  4,  2, SPRITE_OAK2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOak2Script, -1
	object_event  7,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Oak2sAideScript, EVENT_OAK2S_AIDE_IN_LAB
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlambearPokeBallScript, EVENT_FLAMBEAR_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_CRUISEAL_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HappaPokeBallScript, EVENT_HAPPA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomBlueScript, EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomSilverScript, EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
