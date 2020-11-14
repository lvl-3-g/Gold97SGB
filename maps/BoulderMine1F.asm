	object_const_def ; object_event constants
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_MINE_1
	const UNIONCAVE1F_MINE_2
	const UNIONCAVE1F_MINE_3
	const UNIONCAVE1F_TWIN
	const UNIONCAVE1F_COOLTRAINERF
	const UNIONCAVE1F_POKEMANIAC

BoulderMine1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GirlInMineScript:
	faceplayer
	opentext
	writetext Text_FoundMe
	waitbutton
	closetext
	setevent EVENT_TEKNOS_CITY_GRAMPS
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_BIRDON_GYM_GRAMPS
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	setevent EVENT_BOULDER_MINE_WHITNEY
	setevent EVENT_ROCKETS_BLOCKING_AQUARIUM
	checkevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	iftrue .AlreadySavedAquarium
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	pause 10
	warpfacing UP, TEKNOS_ITEMFINDER_HOUSE, 4, 7
	end
	
.AlreadySavedAquarium:
	clearevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	pause 10
	warpfacing UP, TEKNOS_ITEMFINDER_HOUSE, 4, 7
	end

BoulderMine1FGreatBall:
	itemball GREAT_BALL

BoulderMine1FXAttack:
	itemball SHARP_HORNS

BoulderMine1FPotion:
	itemball POTION
	
TrainerCooltrainerfEmma:
	trainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerFEmmaSeenText, CooltrainerFEmmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFEmmaAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end
	
BoulderMine1FBoulder:
	jumpstd StrengthBoulderScript
	
CooltrainerFEmmaSeenText:
	text "This cave is very"
	line "confusing to"
	cont "navigate."
	done

CooltrainerFEmmaBeatenText:
	text "I couldn't cut it!"
	done
	
CooltrainerFEmmaAfterBattleText:
	text "I hope no one has"
	line "gotten lost in"
	cont "here."
	para "That could be"
	line "pretty scary."
	done

PokemaniacLarrySeenText:
	text "I wonder what"
	line "gets mined from"
	cont "this cave…"
	done

PokemaniacLarryBeatenText:
	text "How are you so"
	line "strong?"
	done
	
PokemaniacLarryAfterBattleText:
	text "I wonder if there"
	line "is anything worth"
	cont "any money…"
	done

Text_FoundMe:
	text "Oh, hi!"
	para "Um…"
	line "Do you happen to"
	para "know the way out"
	line "of here?"
	para "…"
	para "Oh! Grandpa is"
	line "looking for me?"
	para "I didn't mean to"
	line "make him worry…"
	para "Okay! You'll help"
	line "me get out of"
	cont "here?"
	para "Let's go!"
	done

BoulderMine1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  1, ROUTE_120, 1
	warp_event 17,  3, BOULDER_MINE_B1F, 3
	warp_event 29,  3, BOULDER_MINE_B1F, 4
	warp_event 39, 11, BOULDER_MINE_B1F, 7
	warp_event 37, 15, BOULDER_MINE_B1F, 8

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event 14,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMine1FGreatBall, EVENT_BOULDER_MINE_1F_GREAT_BALL
	object_event  1,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMine1FXAttack, EVENT_BOULDER_MINE_1F_X_ATTACK
	object_event  1, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMine1FPotion, EVENT_BOULDER_MINE_1F_POTION
	object_event 23, 15, SPRITE_MINELR, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMine1FBoulder, -1
	object_event 35,  9, SPRITE_MINEUD, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMine1FBoulder, -1
	object_event  5, 10, SPRITE_MINEUD, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMine1FBoulder, -1
	object_event  8, 14, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GirlInMineScript, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event 10,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfEmma, -1
	object_event 19,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacLarry, -1


