	object_const_def ; object_event constants
	const TEKNOSGYM_WHITNEY
	const TEKNOSGYM_LASS1
	const TEKNOSGYM_LASS2
	const TEKNOSGYM_BUENA1
	const TEKNOSGYM_GYM_GUY

TeknosGym_MapScripts:
	db 0 ; scene scripts
	
	db 0 ; callbacks


TeknosGymWhitneyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_WHITNEY
	iftrue RematchScriptWhitney
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptWhitney
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	specialphonecall SPECIALCALL_ROBBED
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_DEFAULT
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	opentext
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	checkcode VAR_BADGES
	scall TeknosGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	writetext Whitney_BadgeSpeech
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext Whitney_GoodLuck
	waitbutton
.NoRoomForAttract
	closetext
	end
	
RematchScriptWhitney:
	opentext
	writetext WhitneyRematchText
	waitbutton
	closetext
	winlosstext WhitneyRematchWinText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_WHITNEY
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptWhitney:
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

WhitneyRematchText:
	text "Did you come all"
	line "the way back here"
	cont "just to see me?"
	
	para "Or did you come"
	line "here for another"
	cont "battle?"
	
	para "Either way, you"
	line "can have both!"
	done

WhitneyRematchWinText:
	text "Waah! No wonder"
	line "you beat me"
	cont "before!"
	done

WhitneyAfterRematchText:
	text "I heard that you"
	line "got rid of TEAM"
	cont "ROCKET for good!"
	
	para "I'm glad! I"
	line "haven't seen a"
	para "single ROCKET"
	line "since they were"
	cont "at the AQUARIUM."
	done


TeknosGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end



TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end



TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end



TeknosGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	iftrue .whitneynothere
	checkevent EVENT_BEAT_WHITNEY
	iftrue .TeknosGymGuyWinScript
	writetext TeknosGymGuyText
	waitbutton
	closetext
	end
	
.whitneynothere
	writetext TeknosGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.TeknosGymGuyWinScript:
	writetext TeknosGymGuyWinText
	waitbutton
	closetext
	end

TeknosGymStatue:
;	setmapscene OAK_LAB_FRONT_ROOM, SCENE_DEFAULT
;	specialphonecall SPECIALCALL_ROBBED
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

Whitney_GoodLuck:
	text "Good luck on your"
	line "LEAGUE challenge!"
	para "Don't let anything"
	line "get in the way of"
	cont "your dreams!"
	done

WhitneyBeforeText:
	text "Hi! I'm WHITNEY!"

	para "But I sure know"
	line "who you are,"
	cont "<PLAYER>!"
	para "You've already"
	line "made quite a"
	para "name for yourself"
	line "around town!"
	para "Usually it's me"
	line "who tries to help"
	para "out when something"
	line "has gone wrong,"
	para "but it seems like"
	line "you've shown in"
	para "both the MINE and"
	line "the AQUARIUM that"
	para "you've got what it"
	line "takes!"
	para "So I want to truly"
	line "thank you!"
	para "But I know you're"
	line "here for a battle!"
	para "And I can"
	line "definitely deliver"
	cont "on that!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Ha!"
	para "I see you're good"
	line "at battling, as"
	cont "well!"
	done



PlayerReceivedPlainBadgeText:
	text "<PLAYER> received"
	line "PLAINBADGE."
	done

Whitney_BadgeSpeech:
	text "PLAINBADGE boosts"
	line "your #MON's"
	cont "SPEED."

	para "Oh, you can have"
	line "this too!"
	done

WhitneyAttractText:
	text "It's ATTRACT!"
	line "It makes full use"

	para "of a #MON's"
	line "charm."

	para "Isn't it just per-"
	line "fect for a cutie"
	cont "like me?"
	done


LassCarrieSeenText:
	text "Don't let my"
	line "#MON's cute"

	para "looks fool you."
	line "They can whip you!"
	done

LassCarrieBeatenText:
	text "Darn… I thought"
	line "you were weak…"
	done

LassCarrieAfterBattleText:
	text "Do my #MON"
	line "think I'm cute?"
	done

LassBridgetSeenText:
	text "I like cute #-"
	line "MON better than"
	cont "strong #MON."

	para "But I have strong"
	line "and cute #MON!"
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "I'm trying to beat"
	line "WHITNEY, but…"
	cont "It's depressing."

	para "I'm okay! If I"
	line "lose, I'll just"

	para "try harder next"
	line "time!"
	done

BridgetWhitneyCriesText:
	text "Oh, no. You made"
	line "WHITNEY cry."

	para "It's OK. She'll"
	line "stop soon. She"

	para "always cries when"
	line "she loses."
	done



BeautySamanthaSeenText:
	text "Give it your best"
	line "shot, or I'll take"
	cont "you down!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, MEOWTH,"
	line "I'm so sorry!"
	done

BeautySamanthaAfterBattleText:
	text "I taught MEOWTH"
	line "moves for taking"
	cont "on any type…"
	done
	
TeknosGymGuyTextNotHere:
	text "Yo! CHAMP in"
	line "making!"
	para "WHITNEY is known"
	line "around town for"
	para "always being busy"
	line "and involved in"
	para "helping with local"
	line "issues."
	para "What I'm saying is"
	line "she's not here"
	cont "right now!"
	para "Something must be"
	line "going down around"
	cont "town."
	done

TeknosGymGuyText:
	text "Yo! CHAMP in"
	line "making!"

	para "This GYM is home"
	line "to normal-type"
	cont "#MON trainers."

	para "I recommend you"
	line "use fighting-type"
	cont "#MON."
	done

TeknosGymGuyWinText:
	text "You won? Great! I"
	line "was busy admiring"
	cont "the ladies here."
	done

TeknosGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, TEKNOS_CITY, 7
	warp_event  3, 17, TEKNOS_CITY, 13

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10, 14, BGEVENT_READ, TeknosGymStatue
	bg_event  4, 15, BGEVENT_READ, TeknosGymStatue

	db 5 ; object events
	object_event 16, 13, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, TeknosGymWhitneyScript, EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	object_event  4,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerLassCarrie, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerLassBridget, -1
	object_event 17,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosGymGuyScript, -1
