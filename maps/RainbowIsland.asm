	object_const_def ; object_event constants
	const RAINBOWISLAND_BLUE

RainbowIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueScriptRI:
	special FadeOutMusic
	faceplayer
	opentext
	writetext BlueSeenText
	waitbutton
	closetext
	winlosstext BlueWinLossText, BlueWinLossText
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RAINBOWISLAND_BLUE
	setevent EVENT_BLUE_ON_RAINBOW_ISLAND
	setevent EVENT_DECO_SILVER_TROPHY; blue trophy
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM_2
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end
	
BlueWinLossText:
	text "It's all over!"
	
	para "That was a battle"
	line "for the history"
	para "books, no doubt"
	line "about it!"
	done

BlueSeenText:
	text "Hi, <PLAYER>!"
	para "I'm here studying"
	line "the many species"
	para "of #MON that"
	line "live on this"
	cont "island."
	
	
	para "But I see you have"
	line "a fire in your"
	cont "eyes."
	
	para "I know that"
	line "feeling well."
	
	para "It was what drove"
	line "me to become the"
	cont "CHAMPION."
	
	para "Well… There's"
	line "only one thing"
	para "I could imagine"
	line "you'd want!"
	
	para "<PLAYER>!"
	
	para "As the former"
	line "CHAMPION of the"
	para "#MON LEAGUE,"
	line "I challenge you!"
	done
	
BlueLeavesText:
	text "Whew…"
	
	para "I haven't had"
	line "someone give me a"
	para "run for my money"
	line "like that since"
	para "I fought my old"
	line "pal when I was"
	cont "CHAMPION!"
	
	para "Man… That still"
	line "feels like it was"
	cont "just yesterday…"
	
	para "Welp! I guess it's"
	line "time for me to"
	para "wrap up my"
	line "research tour."
	
	para "What a time it's"
	line "been!"
	
	para "<PLAYER>! I guess"
	line "I'll…"
	
	para "Smell ya later!"
	done

RainbowIsland_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 30,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueScriptRI, EVENT_BLUE_ON_RAINBOW_ISLAND
