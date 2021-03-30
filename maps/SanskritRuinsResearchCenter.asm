	object_const_def ; object_event constants
	const SANSKRITRUINSRESEARCHCENTER_SCIENTIST1
	const SANSKRITRUINSRESEARCHCENTER_SCIENTIST2
	const SANSKRITRUINSRESEARCHCENTER_SCIENTIST3

SanskritRuinsResearchCenter_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SANSKRITRUINSRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_SANSKRITRUINSRESEARCHCENTER_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	priorityjump .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_SANSKRITRUINSRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	return

.ShowScientist:
	moveobject SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, 2, 4
	appear SANSKRITRUINSRESEARCHCENTER_SCIENTIST3
	return

.GetUnownDexScript:
	pause 15
	turnobject SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, DOWN
	showemote EMOTE_SHOCK, SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, 15
	opentext
	writetext SanskritRuinsResearchCenterModifiedDexBeforeText
	waitbutton
	closetext
	applymovement SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext SanskritRuinsResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, MovementData_0x59274
	opentext
	writetext SanskritRuinsResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext SanskritRuinsResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement SANSKRITRUINSRESEARCHCENTER_SCIENTIST3, MovementData_0x59276
	setscene SCENE_SANSKRITRUINSRESEARCHCENTER_NOTHING
	end

SanskritRuinsResearchCenterScientist3Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext SanskritRuinsResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext SanskritRuinsResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

SanskritRuinsResearchCenterScientist1Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext SanskritRuinsResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext SanskritRuinsResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext SanskritRuinsResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext SanskritRuinsResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_YOUNGSTERS
	end

SanskritRuinsResearchCenterScientist2Script:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext SanskritRuinsResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext SanskritRuinsResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	checkevent EVENT_GOT_UNOWN_DOLL_FROM_SCIENTIST
	iffalse .GetDoll
	writetext SanskritRuinsResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end
	
.GetDoll
	writetext SanskritRuinsResearchCenterScientist2Text_GetDoll
	waitbutton
	waitsfx
	writetext GotUnownDollText
	playsound SFX_ITEM
	waitsfx
;	waitbutton
	setevent EVENT_GOT_UNOWN_DOLL_FROM_SCIENTIST
	setevent EVENT_DECO_UNOWN_DOLL
	writetext SanskritRuinsResearchCenterScientist2Text_GetDoll2
	waitbutton
	closetext
	end

SanskritRuinsResearchCenterComputer:
	opentext
	checkevent EVENT_SANSKRIT_RUINS_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext SanskritRuinsResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext SanskritRuinsResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

SanskritRuinsResearchCenterPrinter:
	opentext
	checkevent EVENT_SANSKRIT_RUINS_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext SanskritRuinsResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext SanskritRuinsResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

SanskritRuinsResearchCenterPhoto:
; unreferenced
	jumptext SanskritRuinsResearchCenterProfSilktreePhotoText

SanskritRuinsResearchCenterBookshelf:
SanskritRuinsResearchCenterBookshelf2:
SanskritRuinsResearchCenterBookshelf3:
	jumptext SanskritRuinsResearchCenterAcademicBooksText
	
SanskritRuinsResearchCenterComputer2:
	jumptext SanskritRuinsResearchCenterComputer2Text

MovementData_0x5926f:
	step DOWN
	step DOWN
	step UP
	step UP
	turn_head UP
	step_end

MovementData_0x59274:
	step DOWN
	step DOWN
	step_end

MovementData_0x59276:
	step UP
	step UP
	step_end
	
GotUnownDollText:
	text "<PLAYER> got"
	line "UNOWN DOLL!"
	done
	
SanskritRuinsResearchCenterScientist2Text_GetDoll:
	text "Wow! You got every"
	line "kind of UNOWN!"
	para "Here's a small"
	line "gift to celebrate"
	cont "the occasion!"
	done
	
SanskritRuinsResearchCenterScientist2Text_GetDoll2:
	text "It's a decorative"
	line "UNOWN DOLL."
	para "Set it up in your"
	line "bedroom!"
	done
	
SanskritRuinsResearchCenterComputer2Text:
	text "It's a computer"
	line "displaying images"
	cont "of strange glyphs."
	done
	
SanskritRuinsResearchCenterModifiedDexBeforeText:
	text "Ah!"
	line "There you are!"
	para "Here, let me see"
	line "your #DEX for"
	cont "a second."
	done

SanskritRuinsResearchCenterModifiedDexText:
	text "Done!"

	para "I modified your"
	line "#DEX."

	para "I added an"
	line "optional #DEX"

	para "to store UNOWN"
	line "data."

	para "It records them in"
	line "the sequence that"
	cont "they were caught."
	done

SanskritRuinsResearchCenterDexUpgradedText:
	text "<PLAYER>'s #DEX"
	line "was upgraded."
	done

SanskritRuinsResearchCenterScientist3Text:
	text "The UNOWN you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."
	done

SanskritRuinsResearchCenterScientist3_PrinterAvailable:
	text "You caught all the"
	line "UNOWN variations?"

	para "That's a great"
	line "achievement!"

	para "I've set up the"
	line "printer here for"
	cont "handling UNOWN."

	para "Feel free to use"
	line "it anytime."
	done

SanskritRuinsResearchCenterScientist1Text:
	text "The RUINS are"
	line "about 1500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done

SanskritRuinsResearchCenterScientist1Text_GotUnownDex:
	text "I wonder how many"
	line "kinds of #MON"
	cont "are in the RUINS?"
	done

SanskritRuinsResearchCenterScientist1Text_UnownAppeared:
	text "#MON appeared"
	line "in the RUINS?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done

SanskritRuinsResearchCenterScientist1Text_GotAllUnown:
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the RUINS."

	para "The RUINS appear"
	line "to have been built"

	para "as a habitat for"
	line "#MON."
	done

SanskritRuinsResearchCenterScientist2Text:
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "RUINS."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the RUINS."
	done

SanskritRuinsResearchCenterScientist2Text_UnownAppeared:
	text "The strange #-"
	line "MON you saw in the"
	cont "RUINS?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm…"

	para "That must mean"
	line "there are many"
	cont "kinds of them…"
	done

SanskritRuinsResearchCenterUnusedText1:
; unused
	text "We think something"
	line "caused the cryptic"

	para "patterns to appear"
	line "in the RUINS."

	para "We've focused our"
	line "studies on that."
	done

SanskritRuinsResearchCenterUnusedText2:
; unused
	text "According to my"
	line "research…"

	para "Those mysterious"
	line "patterns appeared"

	para "when the #COM"
	line "CENTER was built."

	para "It must mean that"
	line "radio waves have"

	para "some sort of a"
	line "link…"
	done

SanskritRuinsResearchCenterScientist2Text_GotAllUnown:
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done

SanskritRuinsResearchCenterComputerText:
	text "RUINS OF ALPH"

	para "Exploration"
	line "Year 10"
	done

SanskritRuinsResearchCenterComputerText_GotAllUnown:
	text "Mystery #MON"
	line "Name: UNOWN"

	para "A total of 26"
	line "kinds found."
	done

SanskritRuinsResearchCenterPrinterText_DoesntWork:
	text "This doesn't seem"
	line "to work yet."
	done

SanskritRuinsResearchCenterUnownPrinterText:
	text "UNOWN may be"
	line "printed out."
	done

SanskritRuinsResearchCenterProfSilktreePhotoText:
; unused
	text "It's a photo of"
	line "the RESEARCH"

	para "CENTER'S founder,"
	line "PROF.SILKTREE."
	done

SanskritRuinsResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
	done

SanskritRuinsResearchCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SANSKRIT_TOWN, 3
	warp_event  3,  7, SANSKRIT_TOWN, 3
	
	db 0 ; coord events

	db 6 ; bg events
	bg_event  1,  1, BGEVENT_READ, SanskritRuinsResearchCenterBookshelf
	bg_event  0,  1, BGEVENT_READ, SanskritRuinsResearchCenterBookshelf
	bg_event  3,  1, BGEVENT_READ, SanskritRuinsResearchCenterBookshelf
	bg_event  0,  0, BGEVENT_READ, SanskritRuinsResearchCenterComputer
	bg_event  6,  1, BGEVENT_READ, SanskritRuinsResearchCenterPrinter
	bg_event  2,  3, BGEVENT_READ, SanskritRuinsResearchCenterComputer2

	db 3 ; object events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRuinsResearchCenterScientist1Script, -1
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRuinsResearchCenterScientist2Script, -1
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRuinsResearchCenterScientist3Script, EVENT_SANSKRIT_RUINS_RESEARCH_CENTER_SCIENTIST
