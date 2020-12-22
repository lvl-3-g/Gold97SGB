	object_const_def ; object_event constants
	const ROUTE116GATE_SCIENTIST
	const ROUTE116GATE_ROCKET1
	const ROUTE116GATE_ROCKET2

Route116BirdonGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route116BirdonGateRocket1Script:
	opentext
	writetext Route116BirdonGateRocket1Text
	waitbutton
	closetext
	end
	
Route116BirdonGateRocket2Script:
	opentext
	writetext Route116BirdonGateRocket2Text
	waitbutton
	closetext
	end

Route116BirdonGateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue .NoBirdonRockets
	writetext Route116BirdonGateScientistText
	waitbutton
	closetext
	end

.NoBirdonRockets:
	writetext Route116BirdonGateScientistTextNoRockets
	waitbutton
	closetext
	end
	
Route116BirdonGateRocket1Text:
	text "Fufufufu…"
	para "Our SLOWPOKE team"
	line "should be back"
	para "with the next"
	line "batch of TAILS"
	cont "soon…"
	done
	
Route116BirdonGateRocket2Text:
	text "Hehehehe…"
	para "No one will even"
	line "notice the TAILS"
	para "missing from those"
	line "SLOWPOKE until"
	cont "it's too late…"
	done

Route116BirdonGateScientistText:
	text "These men look"
	line "like members of"
	cont "TEAM ROCKET."
	para "Could they really"
	line "be?"
	para "I wish they'd stop"
	line "blocking the gate,"
	para "but they kind of"
	line "scare me…"
	done
	
Route116BirdonGateScientistTextNoRockets:
	text "Past here is a"
	line "winding maze of"
	para "trees and a tough"
	line "cave to traverse."
	para "Make sure you're"
	line "prepared!"
	done

Route116BirdonGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_116, 1
	warp_event  5,  0, ROUTE_116, 2
	warp_event  4,  7, BIRDON_TOWN, 7
	warp_event  5,  7, BIRDON_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Route116BirdonGateScientistScript, -1
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Route116BirdonGateRocket1Script, EVENT_103_SLOWPOKE_SALESMAN
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Route116BirdonGateRocket2Script, EVENT_103_SLOWPOKE_SALESMAN
	