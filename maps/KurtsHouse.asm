	object_const_def ; object constants
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_FALKNER

KurtsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneFalknerVisit1 ; SCENE_DEFAULT
	scene_script .SceneKurtsHouseNothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtCallback
	
.SceneFalknerVisit1
	priorityjump .SceneFalknerVisit2
	end

.SceneFalknerVisit2
	applymovement PLAYER, WalkUpToFalkner
	showemote EMOTE_SHOCK, KURTSHOUSE_FALKNER, 15
	applymovement KURTSHOUSE_FALKNER, FalknerWalksToYou
	opentext
	writetext FalknerGreets
	waitbutton
	closetext
	applymovement KURTSHOUSE_FALKNER, FalknerLeaves
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_FALKNER
	clearevent EVENT_PAGOTA_GYM_FALKNER
	pause 15
	applymovement PLAYER, WalkUpToKurt
	pause 15
	opentext
	writetext KurtTalks
	waitbutton
	closetext
	
	setscene SCENE_KURTS_HOUSE_NOTHING
	end
	
.SceneKurtsHouseNothing:
	end

.KurtCallback:
;	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	return

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
.Done:
	return

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iftrue .GotBlessing
	writetext UnknownText_0x18e473
	waitbutton
	closetext
;	special FadeOutMusic
;	setevent EVENT_BIRDON_TOWN_SLOWPOKETAIL_ROCKET
;	checkcode VAR_FACING
;	ifequal UP, .RunAround
;	turnobject PLAYER, DOWN
;	playsound SFX_FLY
;	applymovement KURTSHOUSE_KURT1, MovementData_0x18e466
;	playsound SFX_EXIT_BUILDING
;	disappear KURTSHOUSE_KURT1
;	waitsfx
;	special RestartMapMusic
	end

;.RunAround:
;	turnobject PLAYER, DOWN
;	playsound SFX_FLY
;	applymovement KURTSHOUSE_KURT1, MovementData_0x18e46c
;	playsound SFX_EXIT_BUILDING
;	disappear KURTSHOUSE_KURT1
;	waitsfx
;	special RestartMapMusic
;	end

.GotBlessing:
	writetext UnknownText_0x18e615
	buttonsound
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	writetext KurtsHouseKurtBallsFromApricornsText
	promptbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	closetext
	end

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_KURT_MAKING_BALLS
.WaitForApricorns:
	writetext KurtsHouseKurtItWillTakeADayText
	waitbutton
	closetext
	end

.Cancel:
	writetext KurtsHouseKurtThatsALetdownText
	waitbutton
	closetext
	end

.KurtMakingBallsScript:
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext KurtsHouseKurtTurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LEVEL_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem MOON_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FRIEND_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FAST_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem HEAVY_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LOVE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump ._ThatTurnedOutGreat


Script_FirstTimeBuggingKurt:
	writetext UnknownText_0x18e863
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, LEFT
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end




Kurt2:
	faceplayer
	opentext
;	checkevent EVENT_GAVE_GS_BALL_TO_KURT
;	iftrue KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, LEFT
	end
Falkner:
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseLeafeonStatue:
	jumptext KurtsHouseLeafeonStatueText

KurtsHouseBookshelf:
	jumpstd DifficultBookshelfScript

KurtsHouseRadio:
	jumpstd Radio2Script
	
WalkUpToKurt:
	step RIGHT
	step UP
	step_end

WalkUpToFalkner:
	slow_step UP
	slow_step UP
	step_end
	
FalknerWalksToYou:
	step LEFT
	turn_head DOWN
	step_end
	
FalknerLeaves:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x18e46c:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

UnknownText_0x18e473:
	text "Climb the 5 FLOOR"
	line "TOWER."
	para "It is a great test"
	line "of your potential"
	cont "as a trainer."
	done

UnknownText_0x18e615:
	text "You have learned"
	line "of the ways of"
	cont "#MON."
	para "I would be honored"
	line "to provide"
	cont "assistance to you."
	para "I can build"
	line "# BALLS. Unique"
	para "custom ones that"
	line "may prove useful."
	para "Here, I'll give"
	line "one to you now."
	done

KurtsHouseKurtBallsFromApricornsText:
	text "KURT: I make BALLS"
	line "from APRICORNS."

	para "Collect them from"
	line "trees and bring"
	cont "'em to me."

	para "I'll make BALLS"
	line "out of them."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "KURT: You have an"
	line "APRICORN for me?"

	para "Fine! I'll turn it"
	line "into a BALL."
	done

KurtsHouseKurtItWillTakeADayText:
	text "KURT: It'll take a"
	line "day to make you a"

	para "BALL. Come back"
	line "for it later."
	done

KurtsHouseKurtThatsALetdownText:
	text "KURT: Oh…"
	line "That's a letdown."
	done

KurtsHouseKurtDontBotherMeText:
	text "KURT: I'm working!"
	line "Don't bother me!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "KURT: Ah, <PLAYER>!"
	line "I just finished"
	cont "your BALL. Here!"
	done

KurtsHouseKurtTurnedOutGreatText:
	text "KURT: That turned"
	line "out great."

	para "Try catching"
	line "#MON with it."
	done

UnknownText_0x18e863:
	text "I feel like I've"
	line "improved at this,"

	para "and can work much"
	line "faster than I used"
	cont "to be able to."
	done

UnknownText_0x18e8ab:
	text "Wh-what is that?"

	para "I've never seen"
	line "one before."

	para "It looks a lot"
	line "like a # BALL,"

	para "but it appears to"
	line "be something else."

	para "Let me check it"
	line "for you."
	done

UnknownText_0x18e934:
	text "I'm checking it"
	line "now."
	done

UnknownText_0x18e949:
	text "Ah-ha! I see!"
	line "So…"
	done

UnknownText_0x18e95c:
	text "<PLAYER>!"

	para "This BALL started"
	line "to shake while I"
	cont "was checking it."

	para "There must be"
	line "something to this!"
	done



KurtsHouseSlowpokeText:
	text "SLOWPOKE: …"
	line "Yawn?"
	done

KurtsHouseOakPhotoText:
	text "It's KURT standing"
	line "in the tower with"
	para "a SAGE and a man"
	line "in a CAPTAIN's"
	cont "hat."
	done

KurtsHouseLeafeonStatueText:
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done
	
FalknerGreets:
	text "FALKNER: Well who"
	line "might you be?"
	para "<PLAYER>, hm?"
	line "What brings you"
	cont "here?"
	para "Well, I'm sure"
	line "it's because I'm"
	para "not where I should"
	line "be right now."
	para "I'll get on back"
	line "to the GYM so you"
	para "can challenge me"
	line "for a BADGE."
	para "…"
	para "Hm?"
	para "You're not taking"
	line "the #MON LEAGUE"
	cont "challenge?"
	para "What brings you"
	line "to PAGOTA CITY?"
	para "…"
	para "Wow, it's very"
	line "impressive that"
	para "PROF.OAK has asked"
	line "you to go out and"
	para "help him research"
	line "#MON."
	para "But I see the"
	line "glimmer in your"
	cont "eye!"
	para "If you feel the"
	line "urge to start your"
	para "own LEAGUE"
	line "challenge,"
	para "feel free to stop"
	line "by to take me on!"
	para "Anyways, I'll be"
	line "on my way now."
	para "I hope I'll be"
	line "seeing you soon!"
	done
	
KurtTalks:
	text "KURT: I could tell"
	line "when you walked"
	cont "in the room."
	para "You have great"
	line "potential as a"
	cont "trainer."
	para "FALKNER could tell"
	line "as well."
	para "I strongly suggest"
	line "you take the"
	para "LEAGUE challenge"
	line "while traveling."
	para "But apart from"
	line "that, I want to"
	para "help you with your"
	line "research by"
	para "providing you with"
	line "something that can"
	para "help you catch"
	line "#MON."
	para "But I request that"
	line "you prove yourself"
	cont "first."
	para "PAGOTA CITY's 5"
	line "FLOOR TOWER is a"
	para "sacred place where"
	line "I spent many years"
	para "strengthening my"
	line "understanding of"
	para "the relationship"
	line "between people and"
	cont "#MON."
	para "I ask that you"
	line "climb this tower."
	para "Do this, then"
	line "return to me."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 10
	warp_event  4,  7, PAGOTA_CITY, 10

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6,  0, BGEVENT_READ, KurtsHouseRadio
	bg_event 14,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event 15,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  0, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  0, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  7,  0, BGEVENT_READ, KurtsHouseLeafeonStatue

	db 3 ; object events
	object_event  4,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event 15,  4, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event  4,  3, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Falkner, EVENT_KURTS_HOUSE_FALKNER
