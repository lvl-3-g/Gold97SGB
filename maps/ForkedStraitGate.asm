	object_const_def ; object_event constants
	const FSG_COP
	const FSG_SCIENTIST1
	const FSG_SCIENTIST2
	const FSG_SCIENTIST3

ForkedStraitGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

NeedToWalkOverOneTile:
	step LEFT
	step_end

CredCheckLeft:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NoEntryYet
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2 ; blue no longer in the lab at silent town
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end
	
.NoEntryYet
	writetext NoEntryYetText
	waitbutton
	closetext
	applymovement PLAYER, OneStepUpNoEntryYet
	end
	

CredCheckRight:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement PLAYER, NeedToWalkOverOneTile
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NoEntryYet2
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end
	
.NoEntryYet2
	writetext NoEntryYetText
	waitbutton
	closetext
	applymovement PLAYER, OneStepUpNoEntryYet
	end

OneStepUpNoEntryYet:
	step UP
	step_end
	
NoEntryYetText:
	text "We have a team of"
	line "researchers out"
	para "on the SOUTHERN"
	line "ISLANDS doing a"
	para "controlled study"
	line "of #MON."
	para "We cannot allow"
	line "any entry, even"
	para "from those who"
	line "would normally be"
	cont "qualified."
	para "Please come by"
	line "later if you have"
	para "proper credentials"
	line "for clearance."
	done

EventCopHALT:
	text "HALT!"
	done

EventCopText:
	text "This is a"
	line "restricted area!"
	
	para "No #MON"
	line "trainers are"
	cont "allowed past this"
	cont "poin-"
	
	para "Wait."
	
	para "… … …"
	line "… … …"
	
	para "Are you…"
	
	para "<PLAYER>, the"
	line "NIHON LEAGUE's"
	cont "new CHAMPION?"
	
	para "You are!"
	line "My apologies!"
	
	para "The two SOUTHERN"
	line "ISLANDS are off"
	para "limits to members"
	line "of the general"
	para "public, but"
	line "someone of your"
	para "high level of"
	line "clearance I'll"
	cont "allow through."
	
	para "These islands are"
	line "natural #MON"
	para "paradises, fully"
	line "unspoiled by man."
	
	para "As such they are"
	line "highly valuable"
	para "for scientific"
	line "research."
	
	para "I assume you"
	line "must have been"
	cont "informed by BLUE."
	
	para "He passed through"
	line "on his way to"
	para "conduct research"
	line "on RAINBOW ISLAND"
	cont "to the west."
	
	para "Now, carry on!"
	done

FSGCopScript:
	jumptextfaceplayer FSGCopNormalText
	
FSGCopNormalText:
	text "<PLAYER>!"
	line "You may proceed!"
	done


FSGScientist1Script:
	jumptextfaceplayer FSGScientist1Text
	
FSGScientist1Text:
	text "TROPICAL ISLAND"
	line "to the east is"
	para "full of rare"
	line "#MON species!"
	
	para "I'm researching"
	line "the potential"
	para "of a NEW SPECIES"
	line "on the island."
	done

FSGScientist2Script:
	jumptextfaceplayer FSGScientist2Text
	
FSGScientist2Text:
	text "I'm one of the"
	line "lucky few that"
	para "could obtain the"
	line "clearance needed"
	para "to study the"
	line "SOUTHERN ISLANDS."
	
	para "They're even"
	line "printing a promo"
	para "card set with"
	line "the incredible"
	para "#MON photos"
	line "taken during our"
	cont "research tour!"
	done


FSGScientist3Script:
	jumptextfaceplayer FSGScientist3Text
	
FSGScientist3Text:
	text "There's ancient"
	line "manuscripts that"
	para "describe RAINBOW"
	line "ISLAND as a"
	para "miraculous site"
	line "cloaked always in"
	cont "rainbow light."
	
	para "I wonder if that"
	line "was just a legend"
	para "or if the island"
	line "really had some"
	cont "special power…"
	done

TropicalSign:
	jumptext TropicalSignText
	
RainbowSign:
	jumptext RainbowSignText
	
TropicalSignText:
	text "TROPICAL ISLAND"
	line "AHEAD TO EAST"
	done
	
RainbowSignText:
	text "RAINBOW ISLAND"
	line "AHEAD TO WEST"
	done


ForkedStraitGate_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 18,  0,  FORKED_STRAIT_NORTH, 1
	warp_event 19,  0,  FORKED_STRAIT_NORTH, 2
	warp_event 37, 13,  FORKED_STRAIT_EAST, 1
	warp_event 36, 13,  FORKED_STRAIT_EAST, 1
	warp_event  0, 13, FORKED_STRAIT_WEST, 1
	warp_event  1, 13, FORKED_STRAIT_WEST, 1

	db 2 ; coord events
	coord_event 18,  4, SCENE_DEFAULT, CredCheckLeft
	coord_event 19,  4, SCENE_DEFAULT, CredCheckRight

	db 2 ; bg events
	bg_event 34,  6, BGEVENT_READ, TropicalSign
	bg_event  2,  6, BGEVENT_READ, RainbowSign

	db 4 ; object events
	object_event 16,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGCopScript, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist1Script, -1
	object_event  8,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist2Script, -1
	object_event 28,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist3Script, -1
	