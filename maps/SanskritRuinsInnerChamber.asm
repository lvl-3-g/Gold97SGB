	object_const_def ; object_event constants
	const SANSKRITRUINSINNERCHAMBER_FISHER
	const SANSKRITRUINSINNERCHAMBER_TEACHER
	const SANSKRITRUINSINNERCHAMBER_GRAMPS

SanskritRuinsInnerChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_SANSKRITRUINSINNERCHAMBER_NOTHING
	scene_script .UnownAppear ; SCENE_SANSKRITRUINSINNERCHAMBER_STRANGE_PRESENCE

	db 0 ; callbacks

.DummyScene0:
	end

.UnownAppear:
	priorityjump .StrangePresenceScript
	end

.StrangePresenceScript:
	opentext
	writetext SanskritRuinsStrangePresenceText
	waitbutton
	closetext
	setscene SCENE_SANSKRITRUINSINNERCHAMBER_NOTHING
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_SANSKRIT_RUINS_OUTSIDE_TOURIST_FISHER
	end

SanskritRuinsInnerChamberFisherScript:
	jumptextfaceplayer SanskritRuinsInnerChamberFisherText

SanskritRuinsInnerChamberTeacherScript:
	jumptextfaceplayer SanskritRuinsInnerChamberTeacherText

SanskritRuinsInnerChamberGrampsScript:
	jumptextfaceplayer SanskritRuinsInnerChamberGrampsText

SanskritRuinsInnerChamberStatue:
	jumptext SanskritRuinsInnerChamberStatueText

SanskritRuinsStrangePresenceText:
	text "There is a strange"
	line "presence here…"
	done

SanskritRuinsInnerChamberFisherText:
	text "This is a big"
	line "room, but there's"
	cont "nothing here."
	done

SanskritRuinsInnerChamberTeacherText:
	text "This place has a"
	line "mystical quality"
	cont "to it."

	para "It feels sort of"
	line "ethereal even."
	done

SanskritRuinsInnerChamberGrampsText:
	text "Ancient buildings"
	line "are often tombs of"
	cont "kings."

	para "Like the pyramids,"
	line "for instance."
	done

SanskritRuinsInnerChamberStatueText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

SanskritRuinsInnerChamber_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 10, 13, SANSKRIT_RUINS_OUTSIDE, 5
	warp_event  3, 15, SANSKRIT_RUINS_HO_OH_CHAMBER, 3
	warp_event  4, 15, SANSKRIT_RUINS_HO_OH_CHAMBER, 4
	warp_event 15,  3, SANSKRIT_RUINS_KABUTO_CHAMBER, 3
	warp_event 16,  3, SANSKRIT_RUINS_KABUTO_CHAMBER, 4
	warp_event  3, 21, SANSKRIT_RUINS_OMANYTE_CHAMBER, 3
	warp_event  4, 21, SANSKRIT_RUINS_OMANYTE_CHAMBER, 4
	warp_event 15, 24, SANSKRIT_RUINS_AERODACTYL_CHAMBER, 3
	warp_event 16, 24, SANSKRIT_RUINS_AERODACTYL_CHAMBER, 4

	db 0 ; coord events

	db 26 ; bg events
	bg_event  2,  3, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  5,  3, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  8,  3, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 11,  3, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 14,  3, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 17,  3, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  2,  8, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  5,  8, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  8,  8, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 11,  8, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 14,  8, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 17,  8, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  2, 13, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 17, 13, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  2, 18, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  5, 18, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  8, 18, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 11, 18, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 14, 18, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 17, 18, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  2, 24, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  5, 24, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event  8, 24, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 11, 24, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 14, 24, BGEVENT_READ, SanskritRuinsInnerChamberStatue
	bg_event 17, 24, BGEVENT_READ, SanskritRuinsInnerChamberStatue

	db 3 ; object events
	object_event  3,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SanskritRuinsInnerChamberFisherScript, EVENT_SANSKRIT_RUINS_INNER_CHAMBER_TOURISTS
	object_event  9, 17, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRuinsInnerChamberTeacherScript, EVENT_SANSKRIT_RUINS_INNER_CHAMBER_TOURISTS
	object_event 17, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SanskritRuinsInnerChamberGrampsScript, EVENT_SANSKRIT_RUINS_INNER_CHAMBER_TOURISTS
