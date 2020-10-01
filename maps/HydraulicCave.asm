	object_const_def ; object_event constants
	const HYDRODAM_OFFICER

HydraulicCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_DAM_IS_OPEN
	iftrue .DamIsOpen
	changeblock   1,  7, $0F ; water
	changeblock   3,  7, $0F ; water
	changeblock   5,  7, $0F ; water
	changeblock   7,  7, $0F ; water
	changeblock   9,  7, $0F ; water
	changeblock  11,  7, $0F ; water
	changeblock   1,  9, $0F ; water
	changeblock   3,  9, $0F ; water
	changeblock   5,  9, $0F ; water
	changeblock   7,  9, $0F ; water
	changeblock   9,  9, $0F ; water
	changeblock  11,  9, $0F ; water
	changeblock  13,  9, $3F ; dam
	changeblock  13,  7, $3F ; dam
	changeblock  19,  7, $02 ; land
	changeblock  17,  7, $02 ; land
	changeblock  15,  7, $02 ; land
	changeblock  19,  9, $02 ; land
	changeblock  17,  9, $02 ; land
	changeblock  15,  9, $02 ; land
	return
	
.DamIsOpen
	return
	
DamControlMachine:
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iftrue .LetsNotMessWithIt
	opentext
	writetext DamOpenText
	yesorno
	iffalse DamDoesntOpenScript
	closetext
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	opentext
	writetext DamOpenTextButton
	waitbutton
	closetext
	applymovement PLAYER, PlayerWatchesDamMovement
	opentext
	writetext DamOpenText2
	waitbutton
	closetext
	playsound SFX_MEGA_PUNCH
	changeblock  13,  9, $02 ; dam
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  13,  7, $02 ; dam
	reloadmappart
	waitsfx
;	playsound SFX_MEGA_PUNCH
	changeblock   1,  7, $21 ; water
	reloadmappart
;	playsound SFX_MEGA_PUNCH
	changeblock   1,  9, $21 ; water
	reloadmappart
;	waitsfx
;	playsound SFX_MEGA_PUNCH
	changeblock   3,  7, $21 ; water
	reloadmappart
	changeblock   3,  9, $21 ; water
	reloadmappart
;	waitsfx
;	playsound SFX_MEGA_PUNCH
	changeblock   5,  7, $21 ; water
	reloadmappart
	changeblock   5,  9, $21 ; water
	reloadmappart
;	waitsfx
;	playsound SFX_MEGA_PUNCH
	changeblock   7,  7, $21 ; water
	reloadmappart
	changeblock   7,  9, $21 ; water
	reloadmappart
;	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock   9,  7, $21 ; water
	reloadmappart
	changeblock   9,  9, $21 ; water
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  11,  7, $21 ; water
	reloadmappart
	changeblock  11,  9, $21 ; water
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  13,  7, $21 ; water
	reloadmappart
	changeblock  13,  9, $21 ; water
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  15,  7, $21 ; land
	reloadmappart
	changeblock  15,  9, $21 ; land
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  17,  7, $21 ; land
	reloadmappart
	changeblock  17,  9, $21 ; land
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  19,  7, $21 ; land
	reloadmappart
	changeblock  19,  9, $21 ; land
	reloadmappart
	waitsfx
	setevent EVENT_DAM_IS_OPEN
	opentext
	writetext DamOpenText3
	waitbutton
	closetext
	pause 15
	moveobject HYDRODAM_OFFICER, 9, 12
	appear HYDRODAM_OFFICER
	applymovement HYDRODAM_OFFICER, HydroOfficerWalksUp
	applymovement PLAYER, PlayerGreetsOfficer
	opentext
	writetext OfficerThanksYou
	waitbutton
	closetext
	applymovement HYDRODAM_OFFICER, HydroOfficerLeaves
	disappear HYDRODAM_OFFICER
	setevent EVENT_IEJIMA_TOWN_FIXED
	clearevent EVENT_IEJIMA_TOWN_NOT_FIXED
	clearevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
.LetsNotMessWithIt
	opentext
	writetext LetsNotMessWithItText
	waitbutton
	closetext
	end
	
DamDoesntOpenScript:
	closetext
	end

PlayerWatchesDamMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
HydroOfficerWalksUp:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
HydroOfficerLeaves:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
PlayerGreetsOfficer:
	step DOWN
	turn_head LEFT
	step_end
	
OfficerThanksYou:
	text "Well, now!"
	para "Thanks for helping"
	line "out here!"
	para "I was on my way to"
	line "deal with all of"
	para "these hooligans"
	line "that had made"
	para "their way into the"
	line "HYDRO PLANT."
	para "But you got here"
	line "first and tired"
	para "them all out with"
	line "#MON battles!"
	para "They didn't want"
	line "anything to do"
	para "with me and all"
	line "took off as soon"
	cont "as I showed up!"
	para "I'm sure the"
	line "citizens of IEJIMA"
	para "TOWN will be very"
	line "grateful to have"
	para "the water flowing"
	line "again!"
	para "We'll have to post"
	line "some more security"
	para "here for the"
	line "future to keep"
	cont "those guys out!"
	para "Anyways, thanks"
	line "again!"
	done
	
LetsNotMessWithItText:
	text "Better not mess"
	line "with this any"
	cont "more…"
	done

DamOpenText:
	text "It's the control"
	line "console for the"
	cont "dam."
	para "Want to open the"
	line "dam?"
	done
	
DamOpenTextButton:
	text "<PLAYER> pressed"
	line "the button."
	done
	
DamOpenText2:
	text "The dam is"
	line "opening!"
	done
	
DamOpenText3:
	text "Water is once"
	line "again flowing into"
	cont "IEJIMA TOWN!"
	done

HydraulicCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5, 17, HYDRO_PLANT, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 11, BGEVENT_READ, DamControlMachine

	db 1 ; object events
	object_event -5, -5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
