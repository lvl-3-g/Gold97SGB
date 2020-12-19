	object_const_def ; object_event constants
	const WESTPORTDEPTSTORE3F_CLERK
	const WESTPORTDEPTSTORE3F_CLERK2
	const WESTPORTDEPTSTORE3F_SUPER_NERD
	const WESTPORTDEPTSTORE3F_ROCKER

WestportDeptStore3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_WESTPORT_3F
	closetext
	end
	
WestportDeptStore3FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_WESTPORT_NEW
	closetext
	end

WestportDeptStore3FSuperNerdScript:
	jumptextfaceplayer WestportDeptStore3FSuperNerdText

WestportDeptStore3FRockerScript:
	jumptextfaceplayer WestportDeptStore3FRockerText

WestportDeptStore3FDirectory:
	jumptext WestportDeptStore3FDirectoryText

WestportDeptStore3FElevatorButton:
	jumpstd ElevatorButtonScript

WestportDeptStore3FSuperNerdText:
	text "It's tough to"
	line "choose."
	para "Certain items,"
	line "like X ATTACK,"
	para "only work if the"
	line "trainer uses them."
	para "But other items,"
	line "like SHARP HORNS,"
	para "can be used by"
	line "a #MON that"
	cont "holds it."
	para "Which type is"
	line "better?"
	done

WestportDeptStore3FRockerText:
	text "X SPECIAL is very"
	line "useful if you have"
	para "a #MON with"
	line "offensive SPECIAL"
	cont "moves."
	done

WestportDeptStore3FDirectoryText:
	text "For Victory"
	line "Seekers"

	para "3F BATTLE"
	line "   COLLECTION"
	done

WestportDeptStore3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, WESTPORT_DEPT_STORE_2F, 1
	warp_event 15,  0, WESTPORT_DEPT_STORE_4F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore3FElevatorButton

	db 4 ; object events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore3FClerkScript, -1
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore3FClerk2Script, -1
	object_event   2,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WestportDeptStore3FSuperNerdScript, -1
	object_event  12,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore3FRockerScript, -1
