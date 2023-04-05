	object_const_def ; object_event constants
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_ROCKER
	const RADIOTOWER2F_GRUNTM24
	const RADIOTOWER2F_GRUNTM26
	const RADIOTOWER2F_BUENA

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end


RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end




RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText
	
RadioTower2fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fRocker
	writetext RadioTower2fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover2fRocker
	writetext RadioTower2fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower2fBuena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fBuena
	writetext RadioTower2fBuenaText
	waitbutton
	closetext
	end
.MidRocketTakeover2fBuena
	writetext RadioTower2fBuenaTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntM26:
	trainer GRUNTM, GRUNTM_26, EVENT_BEAT_ROCKET_GRUNTM_26, GruntM26SeenText, GruntM26BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM26AfterBattleText
	waitbutton
	closetext
	end
	
RadioTower2fBuenaText:
	text "Hi! I'm BUENA!"
	para "I was just hired"
	line "to host a new"
	cont "radio show!"
	para "I can't wait until"
	line "it starts airing!"
	done
	
RadioTower2fBuenaTextTakeover:
	text "Eek!"
	para "This is not what"
	line "I expected out of"
	cont "radio business!"
	done
	
	
GruntM24SeenText:
	text "TEAM ROCKET can"
	line "conduct operations"
	cont "in secret bases."
	para "But we also have"
	line "no problem barging"
	para "in and taking what"
	line "we need if it's"
	cont "necessary!"
	done
	
GruntM24BeatenText:
	text "And you had no"
	line "problem defeating"
	cont "me!"
	done
	
GruntM24AfterBattleText:
	text "Have you met our"
	line "leader?"
	para "I have a feeling"
	line "you two wouldn't"
	cont "get along."
	done

GruntM26SeenText:
	text "Why are we here?"
	para "Because you and"
	line "your friend"
	para "destroyed our"
	line "antenna!"
	para "Why build another"
	line "when we could just"
	cont "take this one?"
	done
	
GruntM26BeatenText:
	text "Yeowch!"
	done
	
GruntM26AfterBattleText:
	text "I blame you for"
	line "all the problems"
	cont "we've had!"
	done

	
RadioTower2fRockerTextTakeover:
	text "Every radio"
	line "station is talking"
	cont "about TEAM ROCKET!"
	done

RadioTower2fRockerText:
	text "Have you listened"
	line "to the #MON"
	cont "March?"
	para "It makes wild"
	line "#MON appear"
	cont "more frequently."
	done

RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done


RadioTower2FSalesSignText:
	text "2F STUDIO 1"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "PROF.OAK'S #MON"
	line "TALK"

	para "The Hottest Show"
	line "on the Air!"
	done

RadioTower2FPokemonRadioSignText:
	text "Anywhere, Anytime"
	line "#MON Radio"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event  7,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  6, -1, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  3,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 5 ; object events
	object_event  4,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event  6,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fRocker, -1
	object_event  2,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 4, TrainerGruntM26, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fBuena, -1
