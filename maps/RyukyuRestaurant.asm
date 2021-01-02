	object_const_def ; object_event constants
	const RYUKYU_RESTAURANT_CLERK_1
	const RYUKYU_RESTAURANT_CLERK_2
	const RYUKYU_RESTAURANT_PRIZE_VENDOR
	const RYUKYU_RESTAURANT_COIN_VENDOR
	const RYUKYU_RESTAURANT_BAR

RyukyuRestaurant_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckForRoomPassRestaurant
	

.CheckForRoomPassRestaurant:
	checkitem ROOM_PASS
	iffalse .TheatreClosed
	disappear RYUKYU_RESTAURANT_CLERK_1
	disappear RYUKYU_RESTAURANT_CLERK_2
	return

.TheatreClosed:
	appear RYUKYU_RESTAURANT_CLERK_1
	appear RYUKYU_RESTAURANT_CLERK_2
	return

RyukyuRestaurantBarScript:
	jumptextfaceplayer RyukyuRestaurantBarText

RyukyuRestaurantGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript
	
	
RyukyuRestaurantClerk:
	jumptextfaceplayer RyukyuRestaurantClerkText
	
RyukyuRestaurantGameCornerSlotsMachineScript:
	random 6
	ifequal 0, RyukyuRestaurantGameCornerLuckySlotsMachineScript
	refreshscreen
	writebyte FALSE
	special SlotMachine
	closetext
	end

RyukyuRestaurantGameCornerLuckySlotsMachineScript:
	refreshscreen
	writebyte TRUE
	special SlotMachine
	closetext
	end

RyukyuRestaurantGameCornerCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end
	


RyukyuRestaurantGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext RyukyuRestaurantGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse RyukyuRestaurantGameCornerPrizeVendor_NoCoinCaseScript
	writetext RyukyuRestaurantGameCornerPrizeVendorWhichPrizeText
RyukyuRestaurantGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu RyukyuRestaurantGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Fire
	ifequal 2, .Water
	ifequal 3, .Thunder
	jump RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript

.Fire:
	checkcoins 800
	ifequal HAVE_LESS, RyukyuRestaurantGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext FIRE_STONE, MEM_BUFFER_0
	scall RyukyuRestaurantGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript
	giveitem FIRE_STONE
	iffalse RyukyuRestaurantGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump RyukyuRestaurantGameCornerTMVendor_FinishScript

.Water:
	checkcoins 800
	ifequal HAVE_LESS, RyukyuRestaurantGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext WATER_STONE, MEM_BUFFER_0
	scall RyukyuRestaurantGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript
	giveitem WATER_STONE
	iffalse RyukyuRestaurantGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump RyukyuRestaurantGameCornerTMVendor_FinishScript

.Thunder:
	checkcoins 800
	ifequal HAVE_LESS, RyukyuRestaurantGameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext THUNDERSTONE, MEM_BUFFER_0
	scall RyukyuRestaurantGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript
	giveitem THUNDERSTONE
	iffalse RyukyuRestaurantGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 800
	jump RyukyuRestaurantGameCornerTMVendor_FinishScript

RyukyuRestaurantGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

RyukyuRestaurantGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext RyukyuRestaurantGameCornerPrizeVendorHereYouGoText
	waitbutton
	jump RyukyuRestaurantGameCornerTMVendor_LoopScript

RyukyuRestaurantGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

RyukyuRestaurantGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

RyukyuRestaurantGameCornerPrizeVendor_CancelPurchaseScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

RyukyuRestaurantGameCornerPrizeVendor_NoCoinCaseScript:
	writetext RyukyuRestaurantGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end
	
RyukyuRestaurantTheatreScript:
	jumptext RyukyuRestaurantTheatreText

RyukyuRestaurantGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FIRE STONE    800@"
	db "WATER STONE   800@"
	db "THUNDERSTONE  800@"
	db "CANCEL@"
	
RyukyuRestaurantTheatreText:
	text "Downstairs to"
	line "RYUKYU THEATRE"
	done

RyukyuRestaurantGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

RyukyuRestaurantGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

RyukyuRestaurantGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

RyukyuRestaurantGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

RyukyuRestaurantGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

RyukyuRestaurantGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

RyukyuRestaurantGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

RyukyuRestaurantGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done
	
RyukyuRestaurantClerkText:
	text "I'm sorry, but"
	line "access to the"
	para "THEATRE is for"
	line "HOTEL guests only."
	para "You'll need a ROOM"
	line "PASS to enter."
	done
	
RyukyuRestaurantBarText:
	text "Welcome!"
	para "I hope you enjoy"
	line "our many options"
	para "for entertainment"
	line "here at RYUKYU"
	cont "HOTEL!"
	done

RyukyuRestaurant_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10, 17, RYUKYU_CITY, 11
	warp_event 11, 17, RYUKYU_CITY, 11
	warp_event 19,  4, RYUKYU_HOTEL, 7
	warp_event 19,  5, RYUKYU_HOTEL, 8
	warp_event 14,  1, RYUKYU_THEATRE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event  1, 10, BGEVENT_LEFT, RyukyuRestaurantGameCornerSlotsMachineScript
	bg_event  1, 11, BGEVENT_LEFT, RyukyuRestaurantGameCornerSlotsMachineScript
	bg_event  1, 12, BGEVENT_LEFT, RyukyuRestaurantGameCornerSlotsMachineScript
	bg_event  1, 15, BGEVENT_LEFT, RyukyuRestaurantGameCornerCardFlipMachineScript
	bg_event  1, 14, BGEVENT_LEFT, RyukyuRestaurantGameCornerCardFlipMachineScript
	bg_event  1, 13, BGEVENT_LEFT, RyukyuRestaurantGameCornerCardFlipMachineScript
	bg_event 15,  0, BGEVENT_READ, RyukyuRestaurantTheatreScript
	
	db 6 ; object events
	object_event 15,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantClerk, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event 14,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantClerk, EVENT_HOTEL_UPSTAIRS_IS_BLOCKED
	object_event  0,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantGameCornerTMVendorScript, -1
	object_event  0,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantGameCornerCoinVendorScript, -1
	object_event  6,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, RyukyuRestaurantBarScript, -1
