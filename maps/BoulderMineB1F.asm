	object_const_def ; object_event constants
	const UNIONCAVEB1F_POKE_BALL1
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2
	const UNIONCAVEB1F_POKEMANIAC
	const UNIONCAVEB1F_HIKER
	const UNIONCAVEB1F_ITEMBALL

BoulderMineB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMineB1FTMSwift:
	itemball TM_SWIFT

BoulderMineB1FXDefend:
	itemball X_DEFEND



BoulderMineB1FBoulder:
	jumpstd StrengthBoulderScript

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerPhillip:
	trainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhillipAfterBattleText
	waitbutton
	closetext
	end
	
BoulderMineB1FMoonStone:
	itemball MOON_STONE
	
HikerPhillipSeenText:
	text "Hiking up"
	line "mountains is fun,"
	para "but exploring"
	line "caves is fun in"
	cont "a different way."
	done

HikerPhillipBeatenText:
	text "Don't get lost!"
	done
	
HikerPhillipAfterBattleText:
	text "My rock #MON"
	line "feel right at home"
	cont "here."
	done
	
PokemaniacAndrewSeenText:
	text "I hear a rare"
	line "#MON sometimes"
	para "appears deep under"
	line "these mines."
	done

PokemaniacAndrewBeatenText:
	text "I've been clubbed!"
	done
	
PokemaniacAndrewAfterBattleText:
	text "Have you seen this"
	line "rare #MON?"
	done

BoulderMineB1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  1,  1, BOULDER_MINE_B2F, 1
	warp_event  7,  3, BOULDER_MINE_B2F, 2
	warp_event 19,  3, BOULDER_MINE_1F, 2
	warp_event 35,  1, BOULDER_MINE_1F, 3
	warp_event 31,  3, BOULDER_MINE_B2F, 3
	warp_event 31, 11, BOULDER_MINE_B2F, 8
	warp_event 37,  9, BOULDER_MINE_1F, 4
	warp_event 37, 15, BOULDER_MINE_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 36,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB1FTMSwift, EVENT_BOULDER_MINE_B1F_TM_SWIFT
	object_event 20,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoulderMineB1FBoulder, -1
	object_event 27, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB1FXDefend, EVENT_BOULDER_MINE_B1F_X_DEFEND
	object_event 33,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacAndrew, -1
	object_event  5,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerHikerPhillip, -1
	object_event  0,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB1FMoonStone, EVENT_PICKED_UP_MOON_STONE_FROM_AERODACTYL_ITEM_ROOM

