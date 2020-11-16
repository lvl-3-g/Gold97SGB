	object_const_def ; object_event constants
	const KANTO_LABORATORY_FOSSIL_SCIENTIST
	const KANTO_LABORATORY_SCIENTIST_1
	const KANTO_LABORATORY_GENTLEMAN

KantoLaboratory_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoLaboratoryFossilScientist:
	faceplayer
	opentext
	checkitem OLD_AMBER; old amber
	iftrue .GetAerodactyl
	checkitem HELIX_FOSSIL; helix fossil
	iftrue .GetOmanyte
	checkitem DOME_FOSSIL; dome fossil
	iftrue .GetKabuto
	writetext FossilScientistIntroText
	waitbutton
	closetext
	end
	
.GetAerodactyl
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveOldAmberText
	yesorno
	iftrue .GetAerodactyl2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetAerodactyl2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullAerodactyl
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnAerodactyl
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 15
	takeitem OLD_AMBER
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullAerodactyl
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
	
.GetOmanyte
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveHelixFossilText
	yesorno
	iftrue .GetOmanyte2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetOmanyte2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullOmanyte
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnOmanyte
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 15
	takeitem HELIX_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullOmanyte
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	

.GetKabuto
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveDomeFossilText
	yesorno
	iftrue .GetKabuto2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetKabuto2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullKabuto
	closetext
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine1
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine2
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine3
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine4
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine5
	pause 15
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	special FadeInPalettes
	waitsfx
	pause 15
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine6
	playsound SFX_ENTER_DOOR
	disappear KANTO_LABORATORY_FOSSIL_SCIENTIST
	pause 80
	playsound SFX_ENTER_DOOR
	moveobject KANTO_LABORATORY_FOSSIL_SCIENTIST, 2, 0
	appear KANTO_LABORATORY_FOSSIL_SCIENTIST
	applymovement KANTO_LABORATORY_FOSSIL_SCIENTIST, ScientistGoesToMachine7
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAKabuto
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 15
	takeitem DOME_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullKabuto
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
KantoLaboratoryScientist1Script:
	jumptextfaceplayer KantoLaboratoryScientist1Text
	
KantoLaboratoryGentlemanScript:
	jumptextfaceplayer KantoLaboratoryGentlemanText
	
KantoLaboratoryBookshelf:
	jumpstd DifficultBookshelfScript

	
ScientistGoesToMachine1:
	step UP
	step UP
	step UP
	step_end
	
ScientistGoesToMachine2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
ScientistGoesToMachine3:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end
	
ScientistGoesToMachine4:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
ScientistGoesToMachine5:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
ScientistGoesToMachine6:
	step LEFT
	step UP
	step_end
	
ScientistGoesToMachine7:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
KantoLaboratoryGentlemanText:
	text "This place is a"
	line "hub for NIHON's"
	para "brightest"
	line "researchers."
	done
	
KantoLaboratoryScientist1Text:
	text "Did you know?"
	para "We've made great"
	line "strides in #MON"
	cont "fossil technology!"
	para "We are now able"
	line "to bring back"
	para "fossilized #MON"
	line "in mere seconds!"
	done

ScientistHereYouGoText:
	text "All done!"
	para "Here you go!"
	done
	
IfYouHaveAnyOtherFossilsText:
	text "Let me know if"
	line "you come across"
	cont "any other fossils!"
	done
	
NoRoomForFossilmon:
	text "Oh, wait! I can't"
	line "do this yet!"
	para "You'd have no room"
	line "to hold onto this"
	cont "#MON!"
	para "Come back once you"
	line "have some space in"
	cont "your party!"
	done
	
PlayerGetsAnOmanyte:
	text "<PLAYER> received"
	line "OMANYTE!"
	done
	
PlayerGetsAKabuto:
	text "<PLAYER> received"
	line "KABUTO!"
	done
	
PlayerGetsAnAerodactyl:
	text "<PLAYER> received"
	line "AERODACTYL!"
	done
	
TimeToGetAFossilmonText:
	text "Alright, just let"
	line "me see this fossil"
	para "and I'll have it"
	line "back to life in"
	cont "just a second!"
	done
	
YouHaveHelixFossilText:
	text "Oh, what's this?"
	para "You have a HELIX"
	line "FOSSIL!"
	para "Want me to turn it"
	line "into a #MON?"
	done
	
YouHaveDomeFossilText:
	text "Oh, what's this?"
	para "You have a DOME"
	line "FOSSIL!"
	para "Want me to turn it"
	line "into a #MON?"
	done
	
YouHaveOldAmberText:
	text "Oh, what's this?"
	para "You have an OLD"
	line "AMBER!"
	para "Want me to turn it"
	line "into a #MON?"
	done
	
AnotherTimeFossilText:
	text "Oh, really?"
	para "Well, let me know"
	line "if you change your"
	cont "mind."
	done
	
FossilScientistIntroText:
	text "Hiya! I'm a"
	line "scientist who"
	para "specializes in"
	line "#MON fossils!"
	para "Let me know if you"
	line "have any fossils"
	para "and I can turn"
	line "them back into"
	cont "living #MON!"
	done

KantoLaboratory_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  2, 15, KANTO_REGION, 28
	warp_event  3, 15, KANTO_REGION, 29
	warp_event 14, 10, KANTO_LABORATORY, 4
	warp_event  2,  7, KANTO_LABORATORY, 3
	warp_event  3,  7, KANTO_LABORATORY, 3
	warp_event 10, 10, KANTO_LABORATORY, 7
	warp_event 14,  5, KANTO_LABORATORY, 6
	warp_event 15,  5, KANTO_LABORATORY, 6

	db 0 ; coord events

	db 8 ; bg events
	bg_event 15,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 14,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 13,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event 12,  1, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  7, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  6, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  5, 13, BGEVENT_READ, KantoLaboratoryBookshelf
	bg_event  4, 13, BGEVENT_READ, KantoLaboratoryBookshelf

	db 3 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryFossilScientist, EVENT_SCIENTIST_SEQUENCE
	object_event 17,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryScientist1Script, -1
	object_event 16, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLaboratoryGentlemanScript, -1
