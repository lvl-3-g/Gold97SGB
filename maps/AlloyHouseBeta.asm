	object_const_def ; object_event constants
	const ALLOYHOUSEBETA_ELDER
;	const ALLOYHOUSEBETA_RHYDON

AlloyHouseBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyHouseBetaElderScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterEverythingHoOh
	faceplayer
	opentext
	writetext AlloyHouseBetaElderIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyHouseBetaElderEvilText
	waitbutton
	closetext
	end
	
.NoEvilLeft
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .NotBlessed
	writetext AlloyHouseBetaElderText2
	yesorno
	iffalse AlloyElderNoStory
	writetext AlloyElderStoryText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .ElderWalkAroundPlayer
	applymovement ALLOYHOUSEBETA_ELDER, ElderWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYHOUSEBETA_ELDER
	setevent EVENT_ALLOY_CAPTAIN_AT_HOME
	setevent EVENT_HO_OH_EVENT_STARTED
	clearevent EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene FIVE_FLOOR_TOWER_5F, SCENE_HO_OH_EVENT
	end
	
.ElderWalkAroundPlayer
	applymovement ALLOYHOUSEBETA_ELDER, ElderWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYHOUSEBETA_ELDER
	setevent EVENT_ALLOY_CAPTAIN_AT_HOME
	setevent EVENT_HO_OH_EVENT_STARTED
	clearevent EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene FIVE_FLOOR_TOWER_5F, SCENE_HO_OH_EVENT
	end
	
.NotBlessed
	writetext AlloyHouseBetaElderNotBlessedText
	waitbutton
	closetext
	end
	
.AfterEverythingHoOh
	faceplayer
	opentext
	writetext SometimesYouLiveLongEnough
	waitbutton
	closetext
	end
	
AlloyElderNoStory:
	writetext AlloyHouseBetaElderAnotherTime
	waitbutton
	closetext
	end
	
ElderWalksAroundPlayerMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ElderWalksOutMovement:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end
	
SometimesYouLiveLongEnough:
	text "Sometimes you live"
	line "long enough to"
	para "witness things you"
	line "never thought you"
	cont "would see."
	para "I had an encounter"
	line "with the bird of"
	cont "legend."
	para "Truly a magical"
	line "event."
	para "You know, you"
	line "should search"
	para "NIHON for the"
	line "legendary beasts."
	para "If HO-OH returned,"
	line "anything is"
	cont "possible."
	done
	
AlloyElderStoryText:
	text "Listen closely…"
	para "Many years ago,"
	line "NIHON was guarded"
	para "by a noble bird,"
	line "whose wings burned"
	cont "hot as fire."
	para "This bird made its"
	line "nest at the top"
	para "of the 5 FLOOR"
	line "TOWER over in"
	cont "PAGOTA CITY."
	para "This is where it"
	line "roosted for many"
	cont "years."
	para "Some say it sat"
	line "for centuries."
	para "However, the bird"
	line "became restless,"
	para "and one fateful"
	line "day, left the top"
	cont "of the tower."
	para "As it flew, ashes"
	line "fell from its"
	cont "wings."
	para "From these ashes"
	line "rose three beasts,"
	para "who were meant to"
	line "keep watch over"
	para "NIHON while the"
	line "bird was away."
	para "The beasts"
	line "scattered, and"
	para "no one has seen"
	line "them since."
	para "But it is known"
	line "that they have"
	para "remained in NIHON,"
	line "watching over it"
	cont "in secret."
	para "It is said that"
	line "one day, the bird"
	cont "shall return."
	para "…"
	para "I feel we are upon"
	line "that day."
	para "Could it be?"
	done
	
AlloyHouseBetaElderAnotherTime:
	text "Another time,"
	line "then."
	done

AlloyHouseBetaElderText2:
	text "Do you want to"
	line "hear the story of"
	cont "the bird?"
	done
	
AlloyHouseBetaElderIntroText:
	text "One day I hope I"
	line "can experience the"
	para "conclusion of the"
	line "legend."
	done

AlloyHouseBetaElderEvilText:
	text "I sense an evil"
	line "presence looming"
	cont "over NIHON."
	para "Surely the bird"
	line "shall not return"
	cont "until it is gone."
	done
	
AlloyHouseBetaElderNotBlessedText:
	text "The time could be"
	line "any day now, yet"
	para "I do not sense"
	line "that you are the"
	para "type of trainer"
	line "that the bird"
	para "would present"
	line "itself to."
	done

AlloyHouseBeta_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 9
	warp_event  5,  7, ALLOY_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloyHouseBetaElderScript, EVENT_ALLOY_CAPTAIN_AT_HOME
