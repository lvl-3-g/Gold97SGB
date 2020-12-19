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
	checkevent EVENT_EXPLODING_TRAP_16
	iftrue .disapearSZSilver
	appear NANJO_FOREST_SILVER
	return

WisdomOrbYoungsterScript:
	faceplayer
	checkevent EVENT_EXPLODING_TRAP_12
	iftrue .AlreadyGaveWisdomOrb
	checkevent EVENT_RETURNED_FUEL_LINE
	iftrue .TryGivingWisdomOrb
.NoWisdomOrbYet
	opentext
	writetext NoWisdomOrbYetText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.TryGivingWisdomOrb
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NoWisdomOrbYet
	checkevent EVENT_EXPLODING_TRAP_11
	iffalse .SetUpWisdomOrb
	opentext
	writetext HeresWisdomOrbText
	waitbutton
	verbosegiveitem WISDOM_ORB
	iffalse .NoOrbFull
	writetext WhatDoesWisdomOrbDoText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_12
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.NoOrbFull
	closetext
	end
	
.SetUpWisdomOrb
	opentext
	writetext NoWisdomOrbYetText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_11
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.AlreadyGaveWisdomOrb
	opentext
	writetext AlreadyGaveWisdomOrbText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
WisdomOrbBugCatcherScript:
	faceplayer
	opentext
	writetext WisdomOrbBugCatcherText
	waitbutton
	closetext
	turnobject NANJO_FOREST_BUG_CATCHER, RIGHT
	end
	
NanjoFruitTree1:
	fruittree FRUITTREE_KIKAI_STRAIT
	
NanjoFruitTree2:
	fruittree FRUITTREE_TROPICAL_ISLAND_JUNGLE
	
NanjoForestSilverScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .TalkToSilverAfterBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	writetext NanjoForestSilverBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .Happa
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CRUISEAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_HAPPA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Happa:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_FLAMBEAR
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
	setevent EVENT_EXPLODING_TRAP_16
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
	
WhatDoesWisdomOrbDoText:
	text "I wonder what it"
	line "came from."
	para "Could it have been"
	line "a #MON?"
	done
	
HeresWisdomOrbText:
	text "Hey, check this"
	line "out!"
	para "It's some sort"
	line "of ball?"
	para "Not sure what it"
	line "is, but you can"
	cont "have it!"
	done
	
AlreadyGaveWisdomOrbText:
	text "You never know"
	line "what you'll find"
	cont "here."
	done
	
NoWisdomOrbYetText:
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
	
WisdomOrbBugCatcherText:
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
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WisdomOrbYoungsterScript, -1
	object_event 23,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, WisdomOrbBugCatcherScript, -1
	object_event  6,  8, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NanjoForestSilverScript, EVENT_EXPLODING_TRAP_15
	object_event 26, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestMaxRevive, EVENT_PICKED_UP_BERRY_FROM_KABUTO_ITEM_ROOM
	object_event 12,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestUltraBall, EVENT_PICKED_UP_PSNCUREBERRY_FROM_KABUTO_ITEM_ROOM
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullHeal, EVENT_PICKED_UP_HEAL_POWDER_FROM_KABUTO_ITEM_ROOM
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullRestore, EVENT_PICKED_UP_ENERGYPOWDER_FROM_KABUTO_ITEM_ROOM
	object_event 27, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree1, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NanjoFruitTree1, -1
