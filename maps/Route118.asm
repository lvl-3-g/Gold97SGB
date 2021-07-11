	object_const_def ; object_event constants
	const ROUTE118_YOUNGSTER
	const ROUTE118_LASS1
	const ROUTE118_LASS2
	const ROUTE118_POKE_BALL
	const SANSKRIT_ROUTE_TRAINER
	const SANSKRIT_ROUTE_MON
	const ROUTE118_FRUIT_TREE
	const ROUTE118_SWIMMERM
	const ROUTE118_SWIMMERM2
	const ROUTE118_SWIMMERM3

Route118_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SanskritTownRouteCooltrainermScript:
	end
SanskritTownRouteMonsterScript:
	end
	
Route118FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_118

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
	

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermHal:
	trainer SWIMMERM, HAL, EVENT_BEAT_SWIMMERM_HAL, SwimmermHalSeenText, SwimmermHalBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHalAfterBattleText
	waitbutton
	closetext
	end

Route118Sign:
	jumptext Route118SignText

Route118HPUp:
	itemball HP_UP

Route118HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_118_HIDDEN_ULTRA_BALL
	
	
SwimmermHalSeenText:
	text "Are you going to"
	line "SUNPOINT?"

	para "How about a quick"
	line "battle first?"
	done
	
SwimmermHalBeatenText:
	text "I lost that one!"
	done


SwimmermHalAfterBattleText:
	text "I'd say I'm a bet-"
	line "ter swimmer than"
	cont "you. Yeah!"
	done

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
	line "from EGGS."

	para "But where does one"
	line "get #MON EGGS?"
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

Route118SignText:
	text "ROUTE 118"
	para "SUNPOINT CITY -"
	line "SANSKRIT TOWN"
	done
	
SwimmermBerkeSeenText:
	text "The water's warm"
	line "here. I'm loose"
	cont "and limber."

	para "Sure, I'll take"
	line "you on!"
	done
	
SwimmermBerkeBeatenText:
	text "Yikes! I've got"
	line "prune skin!"
	done

SwimmermBerkeAfterBattleText:
	text "Isn't it relaxing"
	line "just floating like"
	cont "this?"
	done

Route118_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 11, ROUTE_118_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 10, BGEVENT_READ, Route118Sign
	bg_event 12, 13, BGEVENT_ITEM, Route118HiddenUltraBall

	db 10 ; object events
	object_event 64,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHope, -1
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 20,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route118HPUp, EVENT_ROUTE_118_HP_UP
	object_event 72,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteCooltrainermScript, -1
	object_event 72,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritTownRouteMonsterScript, -1
	object_event  5,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route118FruitTree, -1
	object_event 55,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermRandall, -1
	object_event 44,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerSwimmermBerke, -1
	object_event 30,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerSwimmermHal, -1
