	object_const_def ; object_event constants
	const ROUTE103NATIONALPARKGATE_OFFICER1
	const ROUTE103NATIONALPARKGATE_YOUNGSTER
	const ROUTE103NATIONALPARKGATE_OFFICER2

Route103NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE103NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE103NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE103NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	prioritysjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE103NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE103NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	disappear ROUTE103NATIONALPARKGATE_OFFICER1
	appear ROUTE103NATIONALPARKGATE_YOUNGSTER
	appear ROUTE103NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE103NATIONALPARKGATE_OFFICER1
	disappear ROUTE103NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE103NATIONALPARKGATE_OFFICER2
	return

.LeavingContestEarly:
	applymovement PLAYER, Route103NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE103NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route103NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route103NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd BugContestResultsWarpScript

.GoBackToContest:
	writetext Route103NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route103NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeBlackQuickly
	waitsfx
	warp NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route103OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route103NationalParkGate_NoContestToday
	ifequal MONDAY, Route103NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route103NationalParkGate_NoContestToday
	ifequal FRIDAY, Route103NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route103NationalParkGate_ContestIsOver
	scall Route103NationalParkGate_GetDayOfWeek
	writetext Route103NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route103NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route103NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route103NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route103NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route103NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route103NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route103NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeBlackQuickly
	waitsfx
	special SelectRandomBugContestContestants
	warp NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route103NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route103NationalParkGate_FacingLeft
	applymovement PLAYER, Route103NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route103NationalParkGate_FacingLeft:
	applymovement PLAYER, Route103NationalParkGatePlayerEnterParkMovement
	end

Route103NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route103NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route103NationalParkGate_NoRoomInBox

Route103NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route103NationalParkGate_FirstMonIsEgg
	writetext Route103NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route103NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route103NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route103NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route103NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route103NationalParkGate_OkayToProceed

Route103NationalParkGate_DeclinedToParticipate:
	writetext Route103NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route103NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route103NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route103NationalParkGate_FirstMonIsFainted:
	writetext Route103NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route103NationalParkGate_NoRoomInBox:
	writetext Route103NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route103NationalParkGate_FirstMonIsEgg:
	writetext Route103NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route103NationalParkGate_ContestIsOver:
	writetext Route103NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route103NationalParkGate_NoContestToday:
	jumptextfaceplayer Route103NationalParkGateOfficer1WeHoldContestsText

Route103NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route103NationalParkGate_ContestIsOver
	writetext Route103NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route103NationalParkGateYoungsterScript:
	jumptextfaceplayer Route103NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route103NationalParkGate_GetDayOfWeek:
	jumpstd DayToTextScript
	end

Route103NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route103NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route103NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route103NationalParkGateOfficer1AskToParticipateText:
	text "Today's @"
	text_ram wStringBuffer3
	text "."
	line "That means the"

	para "Bug-Catching Con-"
	line "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "bug #MON to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done

Route103NationalParkGateOfficer1GiveParkBallsText:
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done

Route103NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> received"
	line "20 PARK BALLS."
	done

Route103NationalParkGateOfficer1ExplainsRulesText:
	text "The person who"
	line "gets the strong-"
	cont "est bug #MON"
	cont "is the winner."

	para "You have 20"
	line "minutes."

	para "If you run out of"
	line "PARK BALLS, you're"
	cont "done."

	para "You can keep the"
	line "last #MON you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"

	para "#MON you can"
	line "find!"
	done

Route103NationalParkGateOfficer1AskToUseFirstMonText:
	text "Uh-oh…"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_ram wStringBuffer3
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done

Route103NationalParkGateOfficer1WellHoldYourMonText:
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done

Route103NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER>'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done

Route103NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done

Route103NationalParkGateOfficer1TakePartInFutureText:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

Route103NationalParkGateOfficer1FirstMonCantBattleText:
	text "Uh-oh…"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

Route103NationalParkGateOfficer1MakeRoomText:
	text "Uh-oh…"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "to put the bug"
	cont "#MON you catch."

	para "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done

Route103NationalParkGateOfficer1EggAsFirstMonText:
	text "Uh-oh…"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

Route103NationalParkGateOfficer1WantToFinishText:
	text "You still have @"
	text_ram wStringBuffer3
	text_start
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

Route103NationalParkGateOfficer1WaitAtNorthGateText:
	text "OK. Please wait at"
	line "the North Gate for"

	para "the announcement"
	line "of the winners."
	done

Route103NationalParkGateOfficer1OkGoFinishText:
	text "OK. Please get"
	line "back outside and"
	cont "finish up."
	done

Route103NationalParkGateOfficer1ContestIsOverText:
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done

Route103NationalParkGateOfficer1WeHoldContestsText:
	text "We hold Contests"
	line "regularly in the"

	para "PARK. You should"
	line "give it a shot."
	done

Route103NationalParkGateYoungsterText:
	text "When is the next"
	line "Bug-Catching Con-"
	cont "test going to be?"
	done

BugCatchingContestExplanationText:
	text "The Bug-Catching"
	line "Contest is held on"

	para "Tuesday, Thursday"
	line "and Saturday."

	para "Not only do you"
	line "earn a prize just"

	para "for participating,"
	line "you also get to"

	para "keep a bug #MON"
	line "that you catch."
	done

Route103NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_103, 3
	warp_event  4,  7, ROUTE_103, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 3 ; object events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103OfficerScriptContest, EVENT_ROUTE_103_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route103NationalParkGateYoungsterScript, EVENT_ROUTE_103_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route103NationalParkGateOfficerScript, EVENT_ROUTE_103_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
