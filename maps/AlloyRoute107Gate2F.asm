	object_const_def ; object_event constants
	const ALLOYROUTE107GATE2F_LASS
	const ALLOYROUTE107GATE2F_TWIN

AlloyRoute107Gate2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

	
AlloyRoute107Gate2FCooltrainerfScript:
	jumptextfaceplayer AlloyRoute107Gate2FCooltrainerfText

AlloyRoute107Gate2FCooltrainerfText:
	text "I like to watch"
	line "the waves of the"
	para "ocean from this"
	line "gate."
	done
	
AlloyRoute107Gate2FBugCatcherScript:
	jumptextfaceplayer AlloyRoute107Gate2FBugCatcherText

AlloyRoute107Gate2FBugCatcherText:
	text "I wish I had"
	line "a #MON that"
	para "could carry me"
	line "across water!"
	done
	
AlloyRoute107Gate2FSign:
	jumptext AlloyRoute107Gate2FSignText
	
AlloyRoute107Gate2FSignText:
	text "<PLAYER> peeked"
	line "through the"
	cont "telescope!"
	para "A small island"
	line "town sits in"
	cont "the distance!"
	done

AlloyRoute107Gate2FSign2:
	jumptext AlloyRoute107Gate2FSign2Text
	
AlloyRoute107Gate2FSign2Text:
	text "<PLAYER> peeked"
	line "through the"
	cont "telescope!"
	para "The waters look"
	line "rough!"
	done
	
AlloyRoute107Gate2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  0, ALLOY_ROUTE_107_GATE, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 1,  0, BGEVENT_READ, AlloyRoute107Gate2FSign
	bg_event 3,  0, BGEVENT_READ, AlloyRoute107Gate2FSign2

	db 2 ; object events
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AlloyRoute107Gate2FCooltrainerfScript, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AlloyRoute107Gate2FBugCatcherScript, -1
	