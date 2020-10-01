	
TrainerInstructorCliff:
	trainer INSTRUCTOR, CLIFF, EVENT_BEAT_INSTRUCTOR_CLIFF, InstructorCliffSeenText, InstructorCliffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorCliffAfterBattleText
	waitbutton
	closetext
	end



InstructorCliffSeenText:
	text "This new GAME"
	line "CORNER is great!"
	para "It's a fun way to"
	line "take a break from"
	cont "marking papers."
	done

InstructorCliffBeatenText:
	text "Losing at #MON"
	line "is less fun than"
	cont "the slots…"
	done

InstructorCliffAfterBattleText:
	text "There's never"
	line "enough time left"
	para "in the day once"
	line "grading is done."
	done