	object_const_def ; object_event constants
	const KANTOGAMECORNERPRIZEROOM_GENTLEMAN
	const KANTOGAMECORNERPRIZEROOM_PHARMACIST

KantoGameCornerPrizeRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGameCornerPrizeRoomGentlemanScript:
	jumptextfaceplayer KantoGameCornerPrizeRoomGentlemanText

KantoGameCornerPrizeRoomPharmacistScript:
	jumptextfaceplayer KantoGameCornerPrizeRoomPharmacistText

KantoGameCornerPrizeRoomTMVendor:
;	faceplayer
	opentext
	writetext KantoPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse KantoPrizeRoom_NoCoinCase
	writetext KantoPrizeRoom_AskWhichPrizeText
KantoPrizeRoom_tmcounterloop:
	special DisplayCoinCaseBalance
	loadmenu KantoPrizeRoom_TMMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .kingsrock
	ifequal 2, .covenantorb
	ifequal 3, .metalcoat
	jump KantoPrizeRoom_cancel

.kingsrock
	checkcoins 2500
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	itemtotext KINGS_ROCK, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	giveitem KINGS_ROCK
	iffalse KantoPrizeRoom_notenoughroom
	takecoins 2500
	jump KantoPrizeRoom_purchased

.covenantorb
	checkcoins 2500
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	itemtotext COVENANT_ORB, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	giveitem COVENANT_ORB
	iffalse KantoPrizeRoom_notenoughroom
	takecoins 2500
	jump KantoPrizeRoom_purchased

.metalcoat
	checkcoins 2500
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	itemtotext METAL_COAT, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	giveitem METAL_COAT
	iffalse KantoPrizeRoom_notenoughroom
	takecoins 2500
	jump KantoPrizeRoom_purchased

KantoPrizeRoom_askbuy:
	writetext KantoPrizeRoom_ConfirmPurchaseText
	yesorno
	end

KantoPrizeRoom_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	jump KantoPrizeRoom_tmcounterloop

KantoPrizeRoom_notenoughcoins:
	writetext KantoPrizeRoom_NotEnoughCoinsText
	waitbutton
	closetext
	end

KantoPrizeRoom_notenoughroom:
	writetext KantoPrizeRoom_NotEnoughRoomText
	waitbutton
	closetext
	end

KantoPrizeRoom_cancel:
	writetext KantoPrizeRoom_ComeAgainText
	waitbutton
	closetext
	end

KantoPrizeRoom_NoCoinCase:
	writetext KantoPrizeRoom_NoCoinCaseText
	waitbutton
	closetext
	end

KantoPrizeRoom_TMMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "KING'S ROCK  2500@"
	db "COVENANT ORB 2500@"
	db "METAL COAT   2500@"
	db "CANCEL@"

KantoGameCornerPrizeRoomPokemonVendor:
;	faceplayer
	opentext
	writetext KantoPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse KantoPrizeRoom_NoCoinCase
.loop
	writetext KantoPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .pikachu
	ifequal 2, .porygon
	ifequal 3, .wolfan
	jump KantoPrizeRoom_cancel

.pikachu
	checkcoins 2222
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, KantoPrizeRoom_notenoughroom
	pokenamemem PIKACHU, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	writebyte PIKACHU
	special GameCornerPrizeMonCheckDex
	givepoke PIKACHU, 25
	takecoins 2222
	jump .loop

.porygon
	checkcoins 5555
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, KantoPrizeRoom_notenoughroom
	pokenamemem PORYGON, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	writebyte PORYGON
	special GameCornerPrizeMonCheckDex
	givepoke PORYGON, 15
	takecoins 5555
	jump .loop

.wolfan
	checkcoins 8888
	ifequal HAVE_LESS, KantoPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, KantoPrizeRoom_notenoughroom
	pokenamemem WOLFAN, MEM_BUFFER_0
	scall KantoPrizeRoom_askbuy
	iffalse KantoPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext KantoPrizeRoom_HereYouGoText
	waitbutton
	writebyte WOLFAN
	special GameCornerPrizeMonCheckDex
	givepoke WOLFAN, 40
	takecoins 8888
	jump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU    2222@"
	db "PORYGON    5555@"
	db "WOLFAN     8888@"
	db "CANCEL@"
	
DummyVendorScript:
	end

KantoGameCornerPrizeRoomGentlemanText:
	text "I wanted PORYGON,"
	line "but I was short by"
	cont "100 coins…"
	done

KantoGameCornerPrizeRoomPharmacistText:
	text "Whew…"

	para "I've got to stay"
	line "calm and cool…"

	para "I can't lose my"
	line "cool, or I'll lose"
	cont "all my money…"
	done

KantoPrizeRoom_PrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "coins for fabulous"
	cont "prizes!"
	done

KantoPrizeRoom_AskWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

KantoPrizeRoom_ConfirmPurchaseText:
	text "OK, so you wanted"
	line "a @"
	text_ram wStringBuffer3
	text "?"
	done

KantoPrizeRoom_HereYouGoText:
	text "Here you go!"
	done

KantoPrizeRoom_NotEnoughCoinsText:
	text "You don't have"
	line "enough coins."
	done

KantoPrizeRoom_NotEnoughRoomText:
	text "You have no room"
	line "for it."
	done

KantoPrizeRoom_ComeAgainText:
	text "Oh. Please come"
	line "back with coins!"
	done

KantoPrizeRoom_NoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

KantoGameCornerPrizeRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 7
	warp_event  5,  7, KANTO_REGION, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  2, BGEVENT_READ, KantoGameCornerPrizeRoomTMVendor
	bg_event  6,  2, BGEVENT_READ, KantoGameCornerPrizeRoomPokemonVendor

	db 4 ; object events
	object_event  0,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPrizeRoomGentlemanScript, -1
	object_event  8,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KantoGameCornerPrizeRoomPharmacistScript, -1
	object_event  3,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DummyVendorScript, -1
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DummyVendorScript, -1
