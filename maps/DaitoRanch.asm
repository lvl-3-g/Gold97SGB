	object_const_def ; object_event constants
	const DAITO_MILTANK1
	const DAITO_MILTANK2
	const DAITO_MILTANK3
	const DAITO_JANINE
	const DAITO_FARMER1
	const DAITO_FARMER2
	const DAITO_GEOFFREY
	const APPLETREE1
	const APPLETREE2
	const APPLETREE3
	const APPLETREE4
	const APPLETREE5
	const APPLETREE6
	const APPLETREE7

DaitoRanch_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setevent EVENT_GEOFFREY_GONE_TO_DAITO
	setflag ENGINE_FLYPOINT_DAITO
	return

DaitoRanchSign:
	jumptext DaitoRanchSignText
	
DaitoRanchSignText:
	text "DAITO RANCH"
	para "Dairy Producers"
	line "Of the SOUTHWEST"
	cont "ISLANDS"
	done

SummerHomeSign:
	jumpstd PokecenterSignScript
	
SummerHomeSignText:
	text "GEOFFREY the"
	line "Gardener's summer"
	cont "resort house."
	done

DaitoRanchMiltank:
	opentext
	writetext DaitoRanchMiltankText
	cry MILTANK
	waitbutton
	closetext
	end
	
DaitoRanchJanine:
	jumptextfaceplayer DaitoRanchJanineText
	
AppleOrchardSign:
	jumptext AppleOrchardSignText
	
DaitoRanchJanineText:
	text "This is such a"
	line "lovely place,"
	cont "isn't it?"
	done
	
	
AppleOrchardSignText:
	text "DAITO APPLE"
	line "ORCHARD"
	done

Appletree1:
	fruittree FRUITTREE_TREE_DAITO_1
	
Appletree2:
	fruittree FRUITTREE_TREE_DAITO_2
	
Appletree3:
	fruittree FRUITTREE_TREE_DAITO_3
	
Appletree4:
	fruittree FRUITTREE_TREE_FIX_34; not used because doesn't respawn?
	
Appletree5:
	fruittree FRUITTREE_TREE_FIX_35; not used because doesn't respawn?
	
Appletree6:
	fruittree FRUITTREE_TREE_DAITO_4
	
Appletree7:
	fruittree FRUITTREE_TREE_DAITO_5

Route105FruitTree1:
	fruittree FRUITTREE_TREE_DAITO_6

Route105FruitTree2:
	fruittree FRUITTREE_TREE_DAITO_7


DaitoRanchMiltankText:
	text "MILTANK: Mooo!"
	done
	
DaitoFarmer1Script:
	jumptextfaceplayer DaitoFarmer1Text
	
DaitoFarmer1Text:
	text "See those trees?"
	
	para "This is called"
	line "a windbreak."
	para "It protects the"
	line "crops from being"
	para "damaged by the"
	line "winds that blow"
	cont "through here."
	done

DaitoFarmer2Script:
	jumptextfaceplayer DaitoFarmer2Text
	
DaitoFarmer2Text:
	text "This crop field"
	line "is full of"
	para "flowers right now"
	line "because we're"
	para "cycling the land"
	line "in preparation"
	para "for next planting"
	line "season!"
	
	para "If you look around"
	line "you might find"
	para "some left over"
	line "berries."
	done

HiddenBerry1:
	hiddenitem MIRACLEBERRY, EVENT_DAITO_HIDDENBERRY1
	
HiddenBerry2:
	hiddenitem GOLD_BERRY, EVENT_DAITO_HIDDENBERRY2
	
HiddenBerry3:
	hiddenitem MYSTERYBERRY, EVENT_DAITO_HIDDENBERRY3
	
HiddenBerry4:
	hiddenitem BITTER_BERRY, EVENT_DAITO_HIDDENBERRY4


DaitoGeoffPatioScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue .geoffpart2
	writetext GeoffThanksVisitText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
.geoffpart2:
	writetext GeoffIslandLifeText
	waitbutton
.NoRoom:
	closetext
	end

GeoffThanksVisitText:
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

GeoffIslandLifeText:
	text "What do you"
	line "think of this"
	cont "place?"
	
	para "Great view, isn't"
	line "it?"
	para "Much better than"
	line "dusty old ROUTE"
	cont "104."
	
	para "I can grow all"
	line "kinds of tropical"
	cont "plants here too!"
	
	para "Come inside some-"
	line "time later and"
	para "I'll tell you"
	line "all about it."
	done


DaitoRanch_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 13, 28, DAITO_RANCH_HOUSE, 1
	warp_event  9, 29, DAITO_RANCH_BARN, 1
	warp_event 21, 32, GARDENER_GEOFF_DAITO_HOUSE, 1
	warp_event  9,  5, DAITO_RANCH_ORCHARD_HOUSE, 1
	warp_event 23, 38, DAITO_POKECENTER_1F, 1
	warp_event 21, 45, DAITO_RANCH_OTHER_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 14, 31, BGEVENT_READ, DaitoRanchSign
	bg_event 24, 38, BGEVENT_READ, SummerHomeSign
	bg_event 14, 12, BGEVENT_READ, AppleOrchardSign
	bg_event 13, 49, BGEVENT_ITEM, HiddenBerry1
	bg_event 16, 48, BGEVENT_ITEM, HiddenBerry2
	bg_event 14, 47, BGEVENT_ITEM, HiddenBerry3
	bg_event 17, 47, BGEVENT_ITEM, HiddenBerry4

	db 14 ; object events
	object_event 10, 39, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DaitoRanchMiltank, -1
	object_event 14, 38, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DaitoRanchMiltank, -1
	object_event 13, 40, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, DaitoRanchMiltank, -1
	object_event 13, 34, SPRITE_JANINE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaitoRanchJanine, -1
	object_event 18, 45, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DaitoFarmer1Script, -1
	object_event 14, 48, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DaitoFarmer2Script, -1
	object_event 22, 29, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT,0, 0, -1, DAY, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, DaitoGeoffPatioScript, -1
	object_event 14,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Appletree1, -1
	object_event 15, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Appletree2, -1
	object_event 20,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Appletree3, -1
	object_event 18,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route105FruitTree1, -1
	object_event 17, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route105FruitTree2, -1
	object_event 19, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Appletree6, -1
	object_event 16,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Appletree7, -1
