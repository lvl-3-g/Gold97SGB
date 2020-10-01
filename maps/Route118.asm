	object_const_def ; object_event constants
	const ROUTE118_YOUNGSTER
	const ROUTE118_LASS1
	const ROUTE118_LASS2
	const ROUTE118_POKE_BALL
	const SANSKRIT_ROUTE_TRAINER
	const SANSKRIT_ROUTE_MON
	const ROUTE118_FRUIT_TREE

Route118_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SanskritTownRouteCooltrainermScript:
	end
SanskritTownRouteMonsterScript:
	end
	
MotobuPathFruitTree:
	fruittree FRUITTREE_MOTOBU_PATH

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end
	

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route118HPUp:
	itemball HP_UP

Route118HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_118_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "I'm raising my"
	line "#MON. Want to"
	cont "battle with me?"
	done

BirdKeeperHankBeatenText:
	text "Ack! I lost that"
	line "one…"
	done

BirdKeeperHankAfterBattleText:
	text "If you have a"
	line "specific #MON"

	para "that you want to"
	line "raise, put it out"

	para "first, then switch"
	line "it right away."

	para "That's how to do"
	line "it."
	done

PicnickerHopeSeenText:
	text "I have a feeling"
	line "that I can win."

	para "Let's see if I'm"
	line "right!"
	done

PicnickerHopeBeatenText:
	text "Aww, you are too"
	line "strong."
	done

PicnickerHopeAfterBattleText:
	text "I hear that some"
	line "#MON have baby"
	para "forms that hatch"
	line "from EGGs."

	para "But where does one"
	line "get #MON EGGs?"
	done

PicnickerSharonSeenText:
	text "Um…"
	line "I…"
	para "Battle me?"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "……I came here to"
	line "look for CLEFAIRY,"
	para "but I haven't"
	line "found any."
	done
	

	
SwimmermRandallSeenText:
	text "Hey, you're young"
	line "and fit!"

	para "Don't ride your"
	line "#MON! Swim!"
	done

SwimmermRandallBeatenText:
	text "Uh-oh. I lost…"
	done

SwimmermRandallAfterBattleText:
	text "Swimming exercises"
	line "your entire body."
	cont "It's healthy."
	done

MtMoonSquareSignText:
	text "ROUTE 118"
	para "SUNPOINT CITY -"
	line "SANSKRIT TOWN"
	done

Route118_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 11, ROUTE_118_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 10, BGEVENT_READ, MtMoonSquareSign
	bg_event 12, 13, BGEVENT_ITEM, Route118HiddenUltraBall

	db 8 ; object events
	object_event 64,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHope, -1
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event  5,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route118HPUp, EVENT_ROUTE_118_HP_UP
	object_event 72,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteCooltrainermScript, -1
	object_event 72,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteMonsterScript, -1
	object_event 16,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MotobuPathFruitTree, -1
	object_event 45, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSwimmermRandall, -1
