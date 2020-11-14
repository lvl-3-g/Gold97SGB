	object_const_def ; object_event constants
	const AQUA1F_RECEPTIONIST
	const AQUA1F_ROCKET2
	const AQUA1F_ROCKETF1
	const AQUA1F_YOUNGSTER
	const AQUA1F_LASS
	const AQUA1F_WHITNEYROCKET1
	const AQUA1F_WHITNEYROCKET2
	const AQUA1F_WHITNEYAQUA1
	const AQUA1F_WHITNEYAQUA2

TeknosAquarium1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end
	
AquaReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .ReceptionistNoRockets
	writetext AquaReceptionistRocketsText
	waitbutton
	closetext
	end

.ReceptionistNoRockets:
	writetext AquaReceptionistNoRocketsText
	waitbutton
	closetext
	end
	
AquaYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .YoungsterNoRockets
	writetext AquaYoungsterRocketsText
	waitbutton
	closetext
	end

.YoungsterNoRockets:
	writetext AquaYoungsterNoRocketsText
	waitbutton
	closetext
	end
	
AquaLassScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .LassNoRockets
	writetext AquaLassRocketsText
	waitbutton
	closetext
	end

.LassNoRockets:
	writetext AquaLassNoRocketsText
	waitbutton
	closetext
	end
	
Aqua1FExhibit1Script:
	jumptext Aqua1FExhibit1Text
	
Aqua1FExhibit2Script:
	jumptext Aqua1FExhibit2Text
	
Aqua1FExhibit3Script:
	jumptext Aqua1FExhibit3Text
	
Aqua1FExhibit4Script:
	jumptext Aqua1FExhibit4Text
	
WhitneyRocket1:
	faceplayer
	opentext
	writetext WhitneyRocket1Text
	waitbutton
	closetext
	turnobject AQUA1F_WHITNEYROCKET1, DOWN
	end
	
WhitneyRocket2:
	faceplayer
	opentext
	writetext WhitneyRocket2Text
	waitbutton
	closetext
	turnobject AQUA1F_WHITNEYROCKET2, RIGHT
	end
	
TeknosAquariumLeftScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 13, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets
	applymovement PLAYER, PlayerWalksOverLeftScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end

TeknosAquariumUpLeftScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 13, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets
	applymovement PLAYER, PlayerWalksOverLeftUpScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end
TeknosAquariumUpRightScene:
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEYAQUA1, 12, 7
	appear AQUA1F_WHITNEYAQUA1
	turnobject AQUA1F_WHITNEYAQUA1, UP
	pause 15
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyDummyMovement
	opentext
	writetext WhitneyWhatIsThisText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEYAQUA1, WhitneyWalksToRockets2
	applymovement PLAYER, PlayerWalksOverRightUpScene
	turnobject AQUA1F_WHITNEYAQUA1, DOWN
	opentext
	writetext WhitneyWhatIsThisText2
	waitbutton
	closetext
	setscene SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	setevent EVENT_WHITNEY_2_AQUARIUM
	clearevent EVENT_WHITNEY_1_AQUARIUM
	appear AQUA1F_WHITNEYAQUA2
	disappear AQUA1F_WHITNEYAQUA1
	end
	
WhitneyAquaScript:
	opentext
	writetext WhitneyInAquaText
	waitbutton
	closetext
	end
	
PlayerWalksOverRightUpScene:
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksOverLeftUpScene:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
WhitneyWalksToRockets2:
	step UP
	step UP
	step LEFT
	step LEFT
	step_end
		
WhitneyWalksToRockets:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PlayerWalksOverLeftScene:
	step LEFT
	step UP
	step_end
	
WhitneyDummyMovement:
	step_end
	
WhitneyInAquaText:
	text "Don't think I'll"
	line "hold back!"
	done
	
WhitneyRocket1Text:
	text "Ugh, she's tough."
	done
	
WhitneyRocket2Text:
	text "I don't know if"
	line "I've ever seen a"
	para "MILTANK that's"
	line "this strong…"
	done
	
WhitneyWhatIsThisText:
	text "What is going on"
	line "here?"
	para "This is unaccept-"
	line "able!"
	para "TEAM ROCKET has no"
	line "business here!"
	done
	
WhitneyWhatIsThisText2:
	text "You're <PLAYER>,"
	line "right?"
	para "Didn't I see you"
	line "in the MINE?"
	para "How about I take"
	line "these guys down,"
	para "and you go on up"
	line "ahead?"
	para "Let's show them"
	line "a thing or two!"
	done
	
Aqua1FExhibit1Text:
	text "KRABBY like to"
	line "hide under sand."
	para "Look closely to"
	line "find the burrowed"
	cont "#MON."
	done
	
Aqua1FExhibit2Text:
	text "NEW EXHIBIT COMING"
	line "SOON"
	done

Aqua1FExhibit3Text:
	text "OSUNFISH and"
	line "MAGIKARP can"
	para "peacefully share"
	line "the same living"
	cont "space."
	para "These #MON"
	line "often inhabit"
	cont "the same waters."
	done
	
GruntM2SeenText:
	text "We're gonna come"
	line "in here, take what"
	para "we want, and sell"
	line "it off!"
	para "We need the money,"
	line "cause we've got"
	cont "big plans, kid!"
	done
	
Aqua1FExhibit4Text:
	text "LAPRAS STATUE"
	para "Occasional reports"
	line "have claimed that"
	para "LAPRAS can be"
	line "found living deep"
	para "in the MINE west"
	line "of town."
	done

GruntM2BeatenText:
	text "Just…"
	line "Too strong…"
	done

GruntM2AfterBattleText:
	text "You'll be seeing"
	line "more of us!"
	done
	

AquaReceptionistRocketsText:
	text "Be careful! Kids"
	line "shouldn't be here"
	cont "right now."
	para "We're having an"
	line "issue with"
	para "dangerous criminal"
	line "activity here."
	done

AquaReceptionistNoRocketsText:
	text "Welcome to the"
	line "TEKNOS CITY"
	cont "AQUARIUM!"
	para "Please feel free"
	line "to look around."
	done

GruntF1SeenText:
	text "This place has"
	line "rare #MON that"
	para "we can steal and"
	line "sell off!"
	para "Don't get in our"
	line "way, kid!"
	done

GruntF1BeatenText:
	text "You rotten brat!"
	done

GruntF1AfterBattleText:
	text "TEAM ROCKET won't"
	line "forget this!"
	done
	
AquaYoungsterRocketsText:
	text "Hmm… I don't"
	line "think these guys"
	para "in black are"
	line "supposed to be"
	cont "here…"
	done

AquaYoungsterNoRocketsText:
	text "I was hoping I'd"
	line "see an ANCHORAGE"
	para "in person, but"
	line "there isn't one"
	cont "here."
	done
	
AquaLassRocketsText:
	text "Eeek!"
	para "Oh, you're not"
	line "with them."
	para "These people here"
	line "are scaring me."
	para "I should probably"
	line "leave."
	done

AquaLassNoRocketsText:
	text "This AQUARIUM is"
	line "pretty new."
	para "They don't have"
	line "too many exhibits"
	cont "yet."
	done

TeknosAquarium1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  7, TEKNOS_CITY, 9
	warp_event 13,  7, TEKNOS_CITY, 5
	warp_event  0,  7, TEKNOS_AQUARIUM_2F, 1

	db 3 ; coord events
	coord_event 11,  7, SCENE_DEFAULT, TeknosAquariumLeftScene
	coord_event 12,  6, SCENE_DEFAULT, TeknosAquariumUpLeftScene
	coord_event 13,  6, SCENE_DEFAULT, TeknosAquariumUpRightScene

	db 4 ; bg events
	bg_event  1,  3, BGEVENT_READ, Aqua1FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua1FExhibit2Script
	bg_event 10,  3, BGEVENT_READ, Aqua1FExhibit3Script
	bg_event  4,  1, BGEVENT_READ, Aqua1FExhibit4Script


	db 9 ; object events
	object_event 15,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaReceptionistScript, -1
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM2, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  5,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event 13,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaYoungsterScript, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaLassScript, -1
	object_event 10,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyRocket1, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  9,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyRocket2, EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	object_event  7,  6, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyAquaScript, EVENT_WHITNEY_2_AQUARIUM
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyAquaScript, EVENT_WHITNEY_1_AQUARIUM
