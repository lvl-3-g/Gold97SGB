	object_const_def ; object_event constants
	const NANJO_FOREST_YOUNGSTER
	const NANJO_FOREST_BUG_CATCHER
	const NANJO_FOREST_SILVER
	const NANJO_FOREST_ITEMBALL_1
	const NANJO_FOREST_ITEMBALL_2
	const NANJO_FOREST_ITEMBALL_3
	const NANJO_FOREST_ITEMBALL_4
	const NANJO_FOREST_TREE_1
	const NANJO_FOREST_TREE_2

NanjoForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckDayOfWeekSZ
	
.CheckDayOfWeekSZ:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WednesdaySZ
.disapearSZSilver
	disappear NANJO_FOREST_SILVER
	return
	
.WednesdaySZ
	checkevent EVENT_DEFEATED_SILVER_IN_NANJO_FOREST
	iftrue .disapearSZSilver
	appear NANJO_FOREST_SILVER
	return

LuckyEggYoungsterScript:
	faceplayer
	checkevent EVENT_GOT_LUCKY_EGG_FROM_NANJO_FOREST_GUY
	iftrue .AlreadyGaveLuckyEgg
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .TryGivingLuckyEgg
.NoLuckyEggYet
	opentext
	writetext NoLuckyEggYetText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.TryGivingLuckyEgg
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NoLuckyEggYet
	checkevent EVENT_TALKED_TO_NANJO_FOREST_GUY_ONCE
	iffalse .SetUpLuckyEgg
	opentext
	writetext HeresLuckyEggText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse .NoEggFull
	writetext WhatDoesLuckyEggDoText
	waitbutton
	closetext
	setevent EVENT_GOT_LUCKY_EGG_FROM_NANJO_FOREST_GUY
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.NoEggFull
	closetext
	end
	
.SetUpLuckyEgg
	opentext
	writetext NoLuckyEggYetText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_NANJO_FOREST_GUY_ONCE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.AlreadyGaveLuckyEgg
	opentext
	writetext AlreadyGaveLuckyEggText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
LuckyEggBugCatcherScript:
	faceplayer
	opentext
	writetext LuckyEggBugCatcherText
	waitbutton
	closetext
	turnobject NANJO_FOREST_BUG_CATCHER, RIGHT
	end
	
NanjoFruitTree1:
	fruittree FRUITTREE_TREE_NANJO_FOREST
	
NanjoFruitTree2:
	fruittree FRUITTREE_TREE_NANJO_FOREST_2
	
NanjoForestSilverScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .TalkToSilverAfterBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	writetext NanjoForestSilverBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .Chikorita
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Chikorita:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	setevent EVENT_DEFEATED_SILVER_IN_NANJO_FOREST
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	playmapmusic
	end
	
.TalkToSilverAfterBattle
	faceplayer
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	end
	

NanjoForestMaxRevive:
	itemball MAX_REVIVE

NanjoForestUltraBall:
	itemball ULTRA_BALL

NanjoForestFullHeal:
	itemball FULL_HEAL

NanjoForestFullRestore:
	itemball FULL_RESTORE
	
NanjoForestSign:
	jumptext NanjoForestSignText
	
NanjoForestSign2:
	jumptext NanjoForestSign2Text
	
NanjoForestSignText:
	text "'NO LITTERING'"
	para "Please pick up"
	line "after yourself."
	done
	
NanjoForestSign2Text:
	text "Exit here for"
	line "GREAT EAST STRAIT"
	done
	
NanjoForestSilverBefore:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"
	para "It's been a while!"
	para "I'm here out on"
	line "the ISLANDS to"
	para "continue training"
	line "and bonding with"
	cont "my #MON."
	para "I've learned more"
	line "about how to work"
	para "with them as a"
	line "team."
	para "We've grown a lot"
	line "closer recently."
	para "But we've also"
	line "grown a lot"
	cont "stronger!"
	para "You know what that"
	line "means!"
	done
	
NanjoForestSilverTextWin:
	text "You got me!"
	done
	
NanjoForestSilverTextLoss:
	text "Alright!"
	done
	
NanjoForestSilverAfter:
	text "Whew, that was a"
	line "great battle."
	para "I think I'm about"
	line "done training"
	cont "here."
	para "Maybe I'll catch"
	line "you around some-"
	cont "place else!"
	done
	
WhatDoesLuckyEggDoText:
	text "I wonder where it"
	line "came from."
	para "Can #MON use"
	line "it?"
	done
	
HeresLuckyEggText:
	text "Hey, check this"
	line "out!"
	para "I found something!"
	para "It's some sort"
	line "of EGG?"
	para "Not sure what it"
	line "is, but you can"
	cont "have it!"
	done
	
AlreadyGaveLuckyEggText:
	text "You never know"
	line "what you'll find"
	cont "here."
	done
	
NoLuckyEggYetText:
	text "I'm looking for"
	line "interesting things"
	para "that wash up on"
	line "the shore."
	para "I find lots of"
	line "items like POTIONS"
	cont "and FULL HEALS."
	para "Once I even found"
	line "a NUGGET!"
	para "You can find some"
	line "cool stuff here."
	para "Come back and"
	line "check with me"
	cont "sometime."
	para "I'll share some-"
	line "thing I find"
	cont "with you."
	done
	
LuckyEggBugCatcherText:
	text "My brother and I"
	line "find lots of cool"
	para "things that wash"
	line "up on the shore!"
	para "We don't think of"
	line "it as trash,"
	para "because sometimes"
	line "we find treasure!"
	done	

NanjoForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0, 18, URASOE_TRAIL, 3
	warp_event  0, 19, URASOE_TRAIL, 4
	warp_event 39,  6, GREAT_EAST_STRAIT, 1
	warp_event 39,  7, GREAT_EAST_STRAIT, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 29, 21, BGEVENT_READ, NanjoForestSign
	bg_event 37,  7, BGEVENT_READ, NanjoForestSign2

	db 9 ; object events
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LuckyEggYoungsterScript, -1
	object_event 23,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, LuckyEggBugCatcherScript, -1
	object_event  6,  8, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NanjoForestSilverScript, EVENT_SILVER_APPEARS_IN_NANJO_FOREST
	object_event 32, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestMaxRevive, EVENT_PICKED_UP_MAX_REVIVE_FROM_NANJO_FOREST
	object_event 12,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestUltraBall, EVENT_PICKED_UP_ULTRA_BALL_FROM_NANJO_FOREST
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullHeal, EVENT_PICKED_UP_FULL_HEAL_FROM_NANJO_FOREST
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullRestore, EVENT_PICKED_UP_FULL_RESTORE_FROM_NANJO_FOREST
	object_event 33, 29, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree1, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree2, -1
