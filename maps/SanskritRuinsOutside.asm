	object_const_def ; object_event constants
	const SANSKRITRUINSOUTSIDE_YOUNGSTER1
	const SANSKRITRUINSOUTSIDE_SCIENTIST
	const SANSKRITRUINSOUTSIDE_FISHER
	const SANSKRITRUINSOUTSIDE_YOUNGSTER2
	const SANSKRITRUINSOUTSIDE_YOUNGSTER3

SanskritRuinsOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	scene_script .DummyScene1 ; SCENE_SANSKRITRUINSOUTSIDE_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	jump .NoScientist

.MaybeScientist:
	checkcode VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	jump .NoScientist

.YesScientist:
	checkevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	iftrue .ActuallyNoScientist
	appear SANSKRITRUINSOUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_GET_UNOWN_DEX
	return
	
.ActuallyNoScientist
	disappear SANSKRITRUINSOUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	return

.NoScientist:
	disappear SANSKRITRUINSOUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	return

SanskritRuinsOutsideScientistScene1:
	turnobject SANSKRITRUINSOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	jump SanskritRuinsOutsideScientistSceneContinue

SanskritRuinsOutsideScientistScene2:
	turnobject SANSKRITRUINSOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	jump SanskritRuinsOutsideScientistSceneContinue

SanskritRuinsOutsideScientistScript:
	faceplayer
SanskritRuinsOutsideScientistSceneContinue:
	opentext
	writetext SanskritRuinsOutsideScientistText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .scientist_walks_around_player
	applymovement SANSKRITRUINSOUTSIDE_SCIENTIST, ScientistWalksDownMovementData
	disappear SANSKRITRUINSOUTSIDE_SCIENTIST
	setevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	setmapscene SANSKRIT_RUINS_RESEARCH_CENTER, SCENE_SANSKRITRUINSRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

.scientist_walks_around_player
	applymovement SANSKRITRUINSOUTSIDE_SCIENTIST, ScientistWalksDownMovementData2
	disappear SANSKRITRUINSOUTSIDE_SCIENTIST
	setevent EVENT_TALKED_TO_OUTSIDE_SCIENTIST
	setscene SCENE_SANSKRITRUINSOUTSIDE_NOTHING
	setmapscene SANSKRIT_RUINS_RESEARCH_CENTER, SCENE_SANSKRITRUINSRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

SanskritRuinsOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext SanskritRuinsOutsideFisherText1
	buttonsound
.Next:
	writetext SanskritRuinsOutsideFisherText2
	waitbutton
	closetext
	end

SanskritRuinsOutsideYoungster1Script:
	faceplayer
	opentext
	writetext SanskritRuinsOutsideYoungster1Text
	waitbutton
	closetext
	end

SanskritRuinsOutsideYoungster2Script:
	faceplayer
	opentext
	writetext SanskritRuinsOutsideYoungster2Text
	waitbutton
	closetext
	turnobject SANSKRITRUINSOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdStan:
	trainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdStanAfterBattleText
	waitbutton
	closetext
	end



SanskritRuinsSign:
	jumptext SanskritRuinsSignText

SanskritRuinsResearchCenterSign:
	jumptext SanskritRuinsResearchCenterSignText

ScientistWalksDownMovementData:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ScientistWalksDownMovementData2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x580c5:
	step UP
	step_end

SanskritRuinsOutsideScientistText:
	text "Hm? That's a #-"
	line "DEX, isn't it?"
	cont "May I see it?"

	para "There are so many"
	line "kinds of #MON."

	para "Hm? What's this?"

	para "What is this"
	line "#MON?"

	para "It looks like the"
	line "strange writing on"

	para "the walls of the"
	line "RUINS."

	para "If those drawings"
	line "are really #-"
	cont "MON, there should"
	cont "be many more."

	para "I know! Let me up-"
	line "grade your #-"
	cont "DEX."
	
	para "Come visit me in"
	line "the lab just down"
	cont "in SANSKRIT TOWN."
	done

SuperNerdStanSeenText:
	text "What do you want?"
	line "I'm studying--"
	cont "don't disturb me!"
	done

SuperNerdStanBeatenText:
	text "Sorry…"
	line "I'm frustrated by"

	para "our lack of real"
	line "understanding…"
	done

SuperNerdStanAfterBattleText:
	text "The RUINS are from"
	line "about 1500 years"
	cont "ago."

	para "Nobody knows who"
	line "built them."

	para "It's also not"
	line "known if the #-"
	cont "MON statues have"
	cont "any meaning."

	para "It's all one big"
	line "mystery…"
	done

PsychicNathanSeenText:
	text "Hmmm… This is a"
	line "strange place."
	done

PsychicNathanBeatenText:
	text "…"
	done

PsychicNathanAfterBattleText:
	text "I like thinking"
	line "here."
	done


SanskritRuinsSignText:
	text "SANSKRIT RUINS"
	line "OBSERVATION CENTER"
	done

SanskritRuinsResearchCenterSignText:
	text "SANSKRIT RUINS"
	line "RESEARCH CENTER"
	done

SanskritRuinsOutsideFisherText1:
	text "While exploring"
	line "the RUINS, we"

	para "suddenly noticed"
	line "an odd presence."

	para "We all got scared"
	line "and ran away."

	para "You should be"
	line "careful too."
	done

SanskritRuinsOutsideFisherText2:
	text "The RUINS hide a"
	line "huge secret!"

	para "…I think…"
	done

SanskritRuinsOutsideYoungster1Text:
	text "There are many"
	line "kinds of UNOWN, so"

	para "we use them for"
	line "our secret codes."
	done

SanskritRuinsOutsideYoungster2Text:
	text "A… H… E… A… D…"
	line "Hmm…"

	para "What?"

	para "I'm decoding this"
	line "message!"
	done

SanskritRuinsOutside_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 15,  9, SANSKRIT_RUINS_HO_OH_CHAMBER, 1
	warp_event  5, 27, SANSKRIT_RUINS_KABUTO_CHAMBER, 1
	warp_event  5,  5, SANSKRIT_RUINS_OMANYTE_CHAMBER, 1
	warp_event  3, 17, SANSKRIT_RUINS_AERODACTYL_CHAMBER, 1
	warp_event  9, 19, SANSKRIT_RUINS_INNER_CHAMBER, 1
	warp_event  5, 22, SANSKRIT_RUINS_RESEARCH_CENTER, 1
	warp_event 15,  3, ENDON_CAVE_RUINS_CONNECTION, 2

	db 2 ; coord events
	coord_event  9, 20, SCENE_SANSKRITRUINSOUTSIDE_GET_UNOWN_DEX, SanskritRuinsOutsideScientistScene1
	coord_event 11, 15, SCENE_SANSKRITRUINSOUTSIDE_GET_UNOWN_DEX, SanskritRuinsOutsideScientistScene2

	db 2 ; bg events
	bg_event  8, 32, BGEVENT_READ, SanskritRuinsSign
	bg_event  4, 22, BGEVENT_READ, SanskritRuinsResearchCenterSign

	db 5 ; object events
	object_event 14,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event  9, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRuinsOutsideScientistScript, EVENT_SANSKRIT_RUINS_OUTSIDE_SCIENTIST
	object_event 11, 26, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritRuinsOutsideFisherScript, EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_FISHER
	object_event  3, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SanskritRuinsOutsideYoungster1Script, EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_YOUNGSTERS
	object_event  8, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritRuinsOutsideYoungster2Script, EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_YOUNGSTERS
