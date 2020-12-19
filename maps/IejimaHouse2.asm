	object_const_def ; object_event constants
	const IEJIMA_HOUSE2_TEACHER
	const IEJIMA_HOUSE2_BUGCATCHER
	const IEJIMA_HOUSE2_TWIN

IejimaHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
IejimaTownHouse2Teacher:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .House2TeacherNotFixed
	writetext IejimaTownHouse2TeacherText
	waitbutton
	closetext
	end
	
.House2TeacherNotFixed
	writetext IejimaTownHouse2TeacherText2
	waitbutton
	closetext
	end
	
IejimaTownHouse2BugCatcher:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .House2BugCatcherNotFixed
	writetext IejimaTownHouse2BugCatcherText
	waitbutton
	closetext
	end
	
.House2BugCatcherNotFixed
	writetext IejimaTownHouse2BugCatcherText2
	waitbutton
	closetext
	end
	
IejimaTownHouse2Twin:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .House2TwinNotFixed
	writetext IejimaTownHouse2TwinText
	waitbutton
	closetext
	end
	
.House2TwinNotFixed
	writetext IejimaTownHouse2TwinText2
	waitbutton
	closetext
	end
	
IejimaTownHouse2TeacherText2:
	text "My children love"
	line "to swim in the"
	para "pond in front of"
	line "the waterfall,"
	para "but we can't do"
	line "that right now."
	done
	
IejimaTownHouse2TeacherText:
	text "I'll have to take"
	line "my kids swimming"
	cont "soon."
	done
	
IejimaTownHouse2BugCatcherText2:
	text "I want to go"
	line "swimming!"
	done
	
IejimaTownHouse2BugCatcherText:
	text "Let's go swimming!"
	done
	
IejimaTownHouse2TwinText2:
	text "Why can't we go"
	line "swimming?"
	done
	
IejimaTownHouse2TwinText:
	text "I love going"
	line "swimming!"
	done
	
IejimaHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IEJIMA_TOWN, 4
	warp_event  5,  7, IEJIMA_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, IejimaTownHouse2Teacher, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownHouse2BugCatcher, -1
	object_event  9,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IejimaTownHouse2Twin, -1
