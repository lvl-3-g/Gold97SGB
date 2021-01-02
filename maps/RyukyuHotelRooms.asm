	object_const_def ; object_event constants
	const RYUKYU_HOTEL_ROOMS_OAK

RyukyuHotelRooms_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekOakBattle
	
.CheckDayOfWeekOakBattle:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .ItsWeekendOak
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .ItsWeekendOak
	disappear RYUKYU_HOTEL_ROOMS_OAK
	return
	
.ItsWeekendOak
	appear RYUKYU_HOTEL_ROOMS_OAK
	return

RyukyuHotelRoomsOakScript:
	checkevent EVENT_BATTLED_OAK
	iftrue .TalkToOakAfterBattle
	faceplayer
	opentext
	writetext RyukyuHotelRoomsOakBefore
	yesorno
	iffalse .NoOakBattleYet
	writetext RyukyuHotelRoomsOakBefore2
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .Happa
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_HAPPA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Happa:
	winlosstext RyukyuHotelRoomsOakTextWin, RyukyuHotelRoomsOakTextLoss
	loadtrainer MISTY, OAK_HAS_CRUISEAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	opentext
	writetext RyukyuHotelRoomsOakAfter
	waitbutton
	closetext
	setevent EVENT_BATTLED_OAK
	end
	
.NoOakBattleYet
	writetext RyukyuHotelRoomsOakNoBattle
	waitbutton
	closetext
	end
	
.TalkToOakAfterBattle
	faceplayer
	opentext
	writetext RyukyuHotelRoomsOakAfter
	waitbutton
	closetext
	end
	
RyukyuHotelRoomsOakBefore2:
	text "Let's both give"
	line "it our best!"
	done
	
RyukyuHotelRoomsOakNoBattle:
	text "Not a problem!"
	para "Some other time,"
	line "then."
	done
	
RyukyuHotelRoomsOakBefore:
	text "Why, <PLAYER>!"
	para "How good to see"
	line "you here!"
	para "It seems like"
	line "you've had an"
	para "exciting and ful-"
	line "filling adventure"
	cont "with #MON!"
	para "I've been so in-"
	line "spired by you and"
	cont "<RIVAL>!"
	para "I've taken up"
	line "raising some #-"
	cont "MON."
	para "It's something I"
	line "haven't done in"
	cont "quite some time!"
	para "If you would like,"
	line "we could battle!"
	para "I'm sure both of"
	line "our #MON would"
	cont "enjoy it."
	para "How about it?"
	done
	
RyukyuHotelRoomsOakTextWin:
	text "That was so"
	line "exciting!"
	done
	
RyukyuHotelRoomsOakTextLoss:
	text "Oh, dear!"
	done
	
RyukyuHotelRoomsOakAfter:
	text "I can't thank"
	line "you enough for"
	cont "all of your help!"
	para "I've reached new"
	line "hights in my"
	para "research and love"
	line "of #MON that I"
	cont "never have before!"
	done

HotelBed:	
	opentext
	writetext HotelBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext HotelBedText2
	waitbutton
	closetext
	end
	
HotelBedText1:
	text "It's your hotel"
	line "bed."
	para "Time for a rest…"
	done
	
HotelBedText2:
	text "Refreshed and"
	line "restored!"
	done


RyukyuHotelRooms_MapEvents:
	db 0, 0 ; filler


	db 16 ; warp events
	warp_event  1,  5, RYUKYU_HOTEL_2F, 4
	warp_event  2,  5, RYUKYU_HOTEL_2F, 4
	warp_event  1, 17, RYUKYU_HOTEL_2F, 5
	warp_event  2, 17, RYUKYU_HOTEL_2F, 5
	
	warp_event 12,  5, RYUKYU_HOTEL_3F, 4
	warp_event 13,  5, RYUKYU_HOTEL_3F, 4
	warp_event 12, 17, RYUKYU_HOTEL_3F, 5
	warp_event 13, 17, RYUKYU_HOTEL_3F, 5
	
	warp_event 24,  7, RYUKYU_HOTEL_4F, 4
	warp_event 25,  7, RYUKYU_HOTEL_4F, 4
	warp_event 24, 17, RYUKYU_HOTEL_4F, 5
	warp_event 25, 17, RYUKYU_HOTEL_4F, 5
	
	warp_event 36,  5, RYUKYU_HOTEL_5F, 3
	warp_event 37,  5, RYUKYU_HOTEL_5F, 3
	warp_event 36, 17, RYUKYU_HOTEL_5F, 4
	warp_event 37, 17, RYUKYU_HOTEL_5F, 4
	db 0 ; coord events

	db 2 ; bg events
	bg_event 39, 12, BGEVENT_READ, HotelBed
	bg_event 39, 13, BGEVENT_READ, HotelBed

	db 1 ; object events
	object_event 35,  1, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, RyukyuHotelRoomsOakScript, EVENT_OAK_HERE_ON_WEEKENDS

