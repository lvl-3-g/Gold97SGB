	object_const_def ; object_event constants
	const DAITOHOUSE_GEOFFREY
	const DAITOHOUSE_GNOTE

GardenerGeoffDaitoHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


GeoffInsideScript:
	faceplayer
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue gotjuiceoutside
	opentext
	writetext GeoffInsideMeetText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse NoRoomGeoff
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
gotjuiceoutside:
	opentext
	writetext WantFactText
	yesorno
	iffalse EndConvo
	random 5
	jump GeoffJumptable
EndConvo:
	writetext AhOkText
	waitbutton
NoRoomGeoff:
	closetext
	end
	
GeoffJumptable:
	ifequal 0, papayas
	ifequal 1, coconuts
	ifequal 2, mangoes
	ifequal 3, bananas
	ifequal 4, pineapples
	
papayas:
	writetext PapayaText
	waitbutton
	jump NoRoomGeoff
	
	
WantFactText:
	text "Want to hear"
	line "about some of"
	para "the tropical"
	line "fruits I've"
	cont "been growing?"
	done
	
AhOkText:
	text "Ah, alright."
	line "Maybe another"
	cont "time, then."
	done
	
PapayaText:
	text "Papayas are one"
	line "of the easiest"
	para "tropical fruit"
	line "to grow."
	para "All you really"
	line "need to do is"
	para "throw the seeds in"
	line "your yard and"
	cont "watch 'em grow!"
	
	para "The things take"
	line "so well that"
	para "they're almost"
	line "like a weed!"
	
	para "The male plants"
	line "won't produce"
	para "any fruit - feel"
	line "free to just"
	cont "chop them down."
	done
	
coconuts:
	writetext CoconutText
	waitbutton
	jump NoRoomGeoff
	
CoconutText:
	text "People usually"
	line "think of a"
	para "coconut as a"
	line "hairy, brown"
	cont "sphere."
	
	para "Actually, they"
	line "only look like"
	para "that after their"
	line "dense, fibrous"
	cont "husk is removed."
	
	para "The best way to"
	line "husk a coconut is"
	para "with the nail"
	line "removing end"
	para "of a hammer, by"
	line "making slats in"
	para "the husk then"
	line "prying it back"
	cont "in parts!"
	
	para "Try this trick"
	line "if you ever"
	para "end up stranded"
	line "on an island"
	cont "with a carpenter."
	done
	
mangoes:
	writetext MangoText
	waitbutton
	jump NoRoomGeoff
	
MangoText:
	text "Mangoes take a"
	line "few months to"
	para "fully mature on"
	line "the tree."
	
	para "And the trees"
	line "themselves can"
	para "take years to"
	line "get large enough"
	para "to produce a"
	line "single mango."
	
	para "Some cultures eat"
	line "mangoes unripe."
	
	para "They're painfully"
	line "hard to bite"
	para "into, and very"
	line "ascorbic."
	
	para "I eat them like"
	line "that anyways"
	para "because I'm"
	line "impatient!"
	done
	
	
bananas:
	writetext BananaText
	waitbutton
	jump NoRoomGeoff
	
BananaText:
	text "Bananas are one"
	line "of the most"
	para "recognizable of"
	line "all the fruits."
	
	para "But did you know"
	line "all the bananas"
	para "you see at the"
	line "supermarket are"
	para "genetically the"
	line "same?"
	
	para "Commercial banana"
	line "crops have no"
	para "seeds due to"
	line "domestication, so"
	para "they have to be"
	line "stem-propagated."
	
	para "This means all"
	line "banana plants in a"
	para "crop are basically"
	line "identical!"
	
	para "This backfired"
	line "once when a"
	para "blight made an"
	line "entire cultivar"
	para "of banana go"
	line "extinct, and"
	para "growers had"
	line "to switch to"
	para "one that was"
	line "immune!"
	done
	
	
	
pineapples:
	writetext PineappleText
	waitbutton
	jump NoRoomGeoff

PineappleText:
	text "Similar to the"
	line "banana, most"
	para "pineapples are"
	line "exactly the"
	para "same because of"
	line "how they're"
	cont "propagated!"
	
	para "Try this at"
	line "home if you live"
	para "somewhere warm"
	line "enough:"
	
	para "Keep the top"
	line "spines of your"
	para "pineapple from"
	line "the store, and"
	para "plant it right"
	line "back into the"
	cont "ground."
	
	para "Water it and"
	line "take good care"
	para "and you'll soon"
	line "find it growing"
	para "again, and it'll"
	line "even sprout a"
	cont "new pineapple!"

	para "Repeat this"
	line "process for an"
	para "endless supply of"
	line "free pineapples."
	done

GeoffInsideMeetText:
	text "Hey, didn't we"
	line "meet back over on"
	cont "ROUTE 104?"
	
	para "I was sick of"
	line "trying to grow"
	para "crops out in the"
	line "desert, so I've"
	para "moved myself out"
	line "here to work on"
	cont "this RANCH!"

	para "Since you took"
	line "the time to come"
	para "all the way out"
	line "here to see me,"
	para "this drink's on"
	line "the house!"
	done


GeoffOutNote:
	jumptext GeoffOutNoteText
	
GeoffOutNoteText:
	text "Out getting some"
	line "supplies, be back"
	cont "in the afternoon" 
	para "- GEOFFREY"
	done

GardenerGeoffDaitoHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 3
	warp_event  5,  7, DAITO_RANCH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN,0, 0, -1, NITE, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, GeoffInsideScript, -1
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, MORN, PAL_OW_GRAY, OBJECTTYPE_SCRIPT, 0, GeoffOutNote, -1
