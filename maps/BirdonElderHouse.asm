	object_const_def ; object_event constants
	const BIRDONELDERHOUSE_POKEFAN_M

BirdonElderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BirdonElderHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue .GiveSurf
	writetext ElderSlowpokeProblem
	waitbutton
	closetext
	end
	

.GiveSurf
	checkevent EVENT_GOT_HM03_SURF
	iftrue .GotSurf
	writetext ElderTakeThisSurfText
	yesorno
	iffalse .Refused
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext ElderSurfDescriptionText
	waitbutton
	closetext
	end

.NoRoom:
	writetext ElderNoSurf
	waitbutton
	closetext
	end

.Refused:
	writetext ElderNoSurf
	waitbutton
	closetext
	end

.GotSurf:
	writetext ElderStandardText
	waitbutton
	closetext
	end

BirdonElderHouseBookshelf:
	jumpstd PictureBookshelfScript

ElderSlowpokeProblem:
	text "My old bones sense"
	line "trouble in the"
	para "WELL beneath the"
	line "town."
	para "It's always been"
	line "my job to make"
	para "sure the SLOWPOKE"
	line "stay safe."
	para "I don't know if I"
	line "have the strength"
	cont "to protect them."
	para "I hope they're"
	line "okay…"
	done

ElderTakeThisSurfText:
	text "Ah!"
	para "Thank you for"
	line "stopping by!"
	para "I am ever so"
	line "grateful."
	para "And I'm sure the"
	line "SLOWPOKE are as"
	cont "well!"
	para "Here, let me"
	line "give you something"
	cont "for your troubles."
	done
	
ElderNoSurf:
	text "Are you sure?"
	line "You might need"
	cont "this."
	done
	
ElderSurfDescriptionText:
	text "This HM allows you"
	line "to teach your"
	para "#MON a move"
	line "that will let them"
	para "ferry you across"
	line "the water."
	para "There isn't much"
	line "water in this"
	para "town, but I'm sure"
	line "it'll be useful"
	cont "elsewhere."
	done
	
ElderStandardText:
	text "The SLOWPOKE of"
	line "the WELL deserve"
	cont "to be protected."
	done


BirdonElderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, BIRDON_TOWN, 4
	warp_event  4,  7, BIRDON_TOWN, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1,  1, BGEVENT_READ, BirdonElderHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BirdonElderHousePokefanMScript, -1
