	object_const_def ; object_event constants
	const KOBANHOUSE_1_CLAIR

KobanHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanHouse1ClairScript:
	faceplayer
	opentext
	checkevent EVENT_GETTING_DRATINI
	iftrue .AfterDratiniGift
	checkitem MACHINE_PART
	iffalse .NoOrbYet
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratiniClair
.AfterDratiniGift
	writetext DragonsAreGreatText
	waitbutton
	closetext
	end
	
.NoOrbYet
	writetext GoGetTheOrbText
	waitbutton
	closetext
	end
	
.GiveDratiniClair
	writetext ClairTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullClair
	writetext ClairPlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_GETTING_DRATINI
	takeitem MACHINE_PART
	writetext ClairSymbolicDragonText
	waitbutton
	closetext
	end	
	
.PartyFullClair:
	writetext KantoRestaurantPartyFullTextClair
	waitbutton
	closetext
	end
	
ClairPlayerReceivedDratiniText:
	text "<PLAYER> received"
	line "DRATINI!"
	done
	
ClairSymbolicDragonText:
	text "Dragon #MON are"
	line "difficult to"
	para "raise, but their"
	line "majesty and"
	para "strength make it"
	line "worth it."
	para "I trust you can"
	line "raise that DRATINI"
	cont "properly."
	done
	
KantoRestaurantPartyFullTextClair:
	text "You have no room"
	line "in your party for"
	cont "this!"
	done
	
ClairTakeThisDratiniText:
	text "Ah, the DRAGON"
	line "ORB!"
	para "I see you have"
	line "learned of the"
	para "power of dragon"
	line "#MON!"
	para "I would like to"
	line "reward you with"
	para "a special #MON"
	line "that deserves to"
	para "be raised by a"
	line "worthy trainer!"
	done
	
GoGetTheOrbText:
	text "Retreive the"
	line "DRAGON ORB from"
	para "a trainer in the"
	line "cave, and bring it"
	cont "to me."
	done
	
DragonsAreGreatText:
	text "Being a dragon"
	line "trainer requires"
	para "more dedication"
	line "than most types."
	para "It is very much a"
	line "way of life."
	done

KobanHouse1ClairText:
	text "yo sup"
	done

KobanHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 1
	warp_event  5,  7, KOBAN_ISLAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 4, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanHouse1ClairScript, EVENT_CLAIR_INSIDE_HOUSE
