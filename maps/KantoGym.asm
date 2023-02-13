	object_const_def ; object_event constants
	const KANTOGYM_RED
	const KANTOGYM_COOLTRAINERM1
	const KANTOGYM_COOLTRAINERM2
	const KANTOGYM_COOLTRAINERF1
	const KANTOGYM_COOLTRAINERF2
	const KANTOGYM_RED_DUMMY
	const KANTOGYM_GYM_GUY

KantoGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGymRedScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_RED
	iftrue RematchScriptRed
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptRed
	
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .FightDone
	writetext RedBeforeBattleText
	waitbutton
	closetext
	winlosstext RedBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ACTUALLY_RED
	opentext
	writetext PlayerReceivedTheRisingBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RISINGBADGE
.FightDone:
	writetext RedAfterBattleText
	waitbutton
	closetext
	end
	
RematchScriptRed:
	opentext
	writetext RedRematchText
	waitbutton
	closetext
	winlosstext RedRematchWinText, 0
	loadtrainer RED, RED1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_RED
	opentext
	writetext RedAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptRed:
	opentext
	writetext RedAfterRematchText
	waitbutton
	closetext
	end

KantoGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jump HaventBeatenRedScript
.Beaten:
	trainertotext ERIKA, ERIKA1, MEM_BUFFER_1
	jumpstd GymStatue2Script


TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfFran:
	trainer COOLTRAINERF, FRAN, EVENT_BEAT_COOLTRAINERF_FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfFranAfterBattleText
	waitbutton
	closetext
	end
	
RedEntersGymScene:
	checkevent EVENT_BEAT_COOLTRAINERF_FRAN
	iftrue .CheckGymTrainer2
	end
	
.CheckGymTrainer2
	checkevent EVENT_BEAT_COOLTRAINERF_LOLA
	iftrue .CheckGymTrainer3
	end
	
.CheckGymTrainer3
	checkevent EVENT_BEAT_COOLTRAINERM_MIKE
	iftrue .CheckGymTrainer4
	end
	
.CheckGymTrainer4
	checkevent EVENT_BEAT_COOLTRAINERM_PAUL
	iftrue .ItsRedTime
	end
	
.ItsRedTime
	playsound SFX_EXIT_BUILDING
	moveobject KANTOGYM_RED_DUMMY, 4, 17
	appear KANTOGYM_RED_DUMMY
	applymovement KANTOGYM_RED_DUMMY, RedDummyDummyMovement
	pause 20
	applymovement KANTOGYM_RED_DUMMY, RedDummyWalksToSpotRight
	disappear KANTOGYM_RED_DUMMY
	appear KANTOGYM_RED
	setscene SCENE_RED_IS_HERE
	clearevent EVENT_RED_IN_KANTO_GYM
	end
	
	
RedEntersGymScene2:
	checkevent EVENT_BEAT_COOLTRAINERF_FRAN
	iftrue .CheckGymTrainer22
	end
	
.CheckGymTrainer22
	checkevent EVENT_BEAT_COOLTRAINERF_LOLA
	iftrue .CheckGymTrainer32
	end
	
.CheckGymTrainer32
	checkevent EVENT_BEAT_COOLTRAINERM_MIKE
	iftrue .CheckGymTrainer42
	end
	
.CheckGymTrainer42
	checkevent EVENT_BEAT_COOLTRAINERM_PAUL
	iftrue .ItsRedTime2
	end
	
.ItsRedTime2
	playsound SFX_EXIT_BUILDING
	moveobject KANTOGYM_RED_DUMMY, 5, 17
	appear KANTOGYM_RED_DUMMY
	applymovement KANTOGYM_RED_DUMMY, RedDummyDummyMovement
	pause 20
	applymovement KANTOGYM_RED_DUMMY, RedDummyWalksToSpotLeft
	disappear KANTOGYM_RED_DUMMY
	appear KANTOGYM_RED
	setscene SCENE_RED_IS_HERE
	clearevent EVENT_RED_IN_KANTO_GYM
	end
	

KantoGymGuyScript2:
	faceplayer
	checkevent EVENT_RED_IN_KANTO_GYM
	iftrue .KantoGymGuyRedNotHereScript2
	checkevent EVENT_BEAT_ACTUALLY_RED
	iftrue .KantoGymGuyWinScript2
	opentext
	writetext KantoGymGuyText2
	waitbutton
	closetext
	end
	
.KantoGymGuyRedNotHereScript2
	opentext
	writetext KantoGymGuyRedNotHereText2
	waitbutton
	closetext
	end

.KantoGymGuyWinScript2:
	opentext
	writetext KantoGymGuyWinText2
	waitbutton
	closetext
	end
	
HaventBeatenRedScript:
	opentext
	writetext TextRedIsAMysteryStatue
	waitbutton
	closetext
	end
	
	
RedDummyDummyMovement:
	step_end
	
RedDummyWalksToSpotRight:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
RedDummyWalksToSpotLeft:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step UP
	step UP
	step_end
	
TextRedIsAMysteryStatue:
	text "KANTO REGION"
	line "#MON GYM"
	para "LEADER: ???"
	para "WINNING TRAINERS:"
	line "<RIVAL>"
	done
	
KantoGymGuyWinText2:
	text "What an incredible"
	line "battle!"
	para "How many BADGES do"
	line "you have now?"
	para "You might be ready"
	line "for the LEAGUE."
	done
	
KantoGymGuyText2:
	text "Go get him, champ-"
	line "in-the-making!"
	done
	
KantoGymGuyRedNotHereText2:
	text "Hey, champ-in-the-"
	line "making!"
	para "Do you know who"
	line "our GYM LEADER is?"
	para "He's not only a"
	line "GYM LEADER, but"
	para "he's also beaten"
	line "the LEAGUE."
	para "He's one tough"
	line "guy, but he's not"
	cont "much for words."
	para "He's also not here"
	line "right now."
	para "I'm sure he'll be"
	line "back soon. Why"
	para "don't you battle"
	line "the trainers here"
	para "while we wait for"
	line "his return?"
	done
	
CooltrainerfFranSeenText:
	text "I can't allow a"
	line "nameless trainer"
	cont "to defeat me!"
	done

CooltrainerfFranBeatenText:
	text "Awww… I lost…"
	done

CooltrainerfFranAfterBattleText:
	text "Huh. You might"
	line "have what it takes"
	cont "to win here."
	done

CooltrainerfLolaSeenText:
	text "What type of"
	line "#MON do we use?"
	para "Why, all of them,"
	line "like any good"
	cont "trainer should."
	done

CooltrainerfLolaBeatenText:
	text "Way to go!"
	done

CooltrainerfLolaAfterBattleText:
	text "A balanced party"
	line "is key to victory."
	done


CooltrainermMikeSeenText:
	text "My chance of"
	line "losing? Not even"
	cont "one percent!"
	done

CooltrainermMikeBeatenText:
	text "That's odd."
	done

CooltrainermMikeAfterBattleText:
	text "I know my short-"
	line "comings now."

	para "Thanks for showing"
	line "me!"
	done

CooltrainermPaulSeenText:
	text "Facing the LEADER"
	line "will be your"
	cont "toughest battle."
	para "But I can be a"
	line "close second!"
	done

CooltrainermPaulBeatenText:
	text "My #MON lost?"
	done

CooltrainermPaulAfterBattleText:
	text "You almost ready"
	line "to take on the"
	cont "LEAGUE?"
	done

RedBeforeBattleText:
	text "…"
	done

RedBeatenText:
	text "…"
	done
	
RedRematchText:
	text "…?"
	done

RedRematchWinText:
	text "…!"
	done

RedAfterRematchText:
	text "…"
	done

PlayerReceivedTheRisingBadgeText:
	text "<PLAYER> received"
	line "RISINGBADGE."
	done

ErikaExplainTMText:
	text "…"
	done

RedAfterBattleText:
	text "…"
	done


KantoGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, KANTO_REGION, 8
	warp_event  5, 17, KANTO_REGION, 15

	db 2 ; coord events
	coord_event  5, 13, SCENE_DEFAULT, RedEntersGymScene
	coord_event  4, 13, SCENE_DEFAULT, RedEntersGymScene2

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, KantoGymStatue
	bg_event  6, 15, BGEVENT_READ, KantoGymStatue

	db 7 ; object events
	object_event  4,  7, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymRedScript, EVENT_RED_IN_KANTO_GYM
	object_event  4,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermPaul, -1
	object_event  9,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermMike, -1
	object_event  5,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfLola, -1
	object_event  0,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfFran, -1
	object_event -5, -5, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymRedScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoGymGuyScript2, -1
