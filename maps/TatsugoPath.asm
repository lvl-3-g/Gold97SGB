	object_const_def ; object_event constants
	const TP_TEACHER
	const TP_INSTR
	const TP_SNERD
	const TP_SAILOR
	const TP_ITEMBALL

TatsugoPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end
	


SailorEugeneSeenText:
	text "I just got back"
	line "from sea."

	para "So how about a"
	line "#MON battle?"
	done

SailorEugeneBeatenText:
	text "Awaaargh!"
	done

SailorEugeneAfterBattleText:
	text "My #MON were"
	line "caught and raised"
	cont "overseas."

	para "They're my compan-"
	line "ions on those long"
	cont "voyages."
	done


TrainerTeacherHolly:
	trainer TEACHER, HOLLY, EVENT_BEAT_TEACHER_HOLLY, TeacherHollySeenText, TeacherHollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHollyAfterBattleText
	waitbutton
	closetext
	end
	

TeacherHollySeenText:
	text "Um, excuse me"
	line "but this is a"
	cont "private date!"
	done

TeacherHollyBeatenText:
	text "Buzz off twerp!"
	done

TeacherHollyAfterBattleText:
	text "As if I don't"
	line "have to deal"
	para "with enough kids"
	line "at work already!"
	done


TrainerInstrMoshe:
	trainer INSTRUCTOR, MOSHE, EVENT_BEAT_INSTRUCTOR_MOSHE, InstrMosheSeenText, InstrMosheBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstrMosheAfterBattleText
	waitbutton
	closetext
	end
	

InstrMosheSeenText:
	text "If you're looking"
	line "for tutoring, then"
	para "you've come at"
	line "the wrong time!"
	done

InstrMosheBeatenText:
	text "Ah, come on!"
	done

InstrMosheAfterBattleText:
	text "It's typical that"
	line "I can't even go"
	para "on a date without"
	line "being pestered by"
	cont "some kid."
	done

TrainerSNNorton:
	trainer SUPER_NERD, NORTON, EVENT_BEAT_SUPER_NERD_NORTON, SNNortonSeenText, SNNortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SNNortonAfterBattleText
	waitbutton
	closetext
	end
	

SNNortonSeenText:
	text "I hang around at"
	line "HEART POND every"
	cont "day!"
	para "So why can't I"
	line "find a girlfriend?"
	done

SNNortonBeatenText:
	text "The life of a NERD"
	line "is a tough one."
	done

SNNortonAfterBattleText:
	text "Would bathing in"
	line "the HEART POND"
	para "help my chances"
	line "at all?"
	done
	
TatsugoPathHiddenPPUP:
	hiddenitem PP_UP, EVENT_TATSUGO_PATH_HIDDEN_PP_UP


TPItemball:
	itemball ULTRA_BALL

HeartPondSign:
	jumptext HeartPondSignText
	
HeartPondSignText:
	text "HEART POND"
	para "A place where"
	line "lovers meet."
	done

KikaiStraitSign:
	jumptext KikaiStraitSignText
	
KikaiStraitSignText:
	text "TATSUGO PATH -"
	line "KIKAI STRAIT"
	
	para "KIKAI VILLAGE"
	line "AHEAD"
	done

TatsugoPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  9, AMAMI_TATSUGO_PATH_GATE, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event 21,  7, BGEVENT_READ, HeartPondSign
	bg_event 52, 10, BGEVENT_READ, KikaiStraitSign
	bg_event  4, 15, BGEVENT_ITEM, TatsugoPathHiddenPPUP

	db 5 ; object events
	object_event 19,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherHolly, -1
	object_event 19, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerInstrMoshe, -1
	object_event 35,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSNNorton, -1
	object_event 47, 12, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorEugene, -1
	object_event 43, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TPItemball, EVENT_TATSUGO_PATH_ITEMBALL
