	object_const_def ; object_event constants
	const DEEPWATERPASSAGEEASTCAVERN_PRYCE
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_1
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_2
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_3
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_4
	const DEEPWATERPASSAGEEASTCAVERN_ITEMBALL_5
 
DeepwaterPassageEastCavern_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
DeepwaterPassageEastCavernMaxRevive:
	itemball MAX_REVIVE

DeepwaterPassageEastCavernRareCandy:
	itemball RARE_CANDY

DeepwaterPassageEastCavernMaxEther:
	itemball MAX_ETHER
	
DeepwaterPassageEastCavernTMSwagger:
	itemball TM_SWAGGER
	
DeepwaterPassageEastCavernHpUp:
	itemball HP_UP

DeepwaterPassageEastCavernPryceScript:
	faceplayer
	opentext
	writetext PryceGreetingText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .PryceWalksAroundPlayer
	applymovement DEEPWATERPASSAGEEASTCAVERN_PRYCE, PryceLeavesMovement
	disappear DEEPWATERPASSAGEEASTCAVERN_PRYCE
	setevent EVENT_PRYCE_IN_DEEPWATER
	clearevent EVENT_PRYCE_IN_HOME
	end
	
.PryceWalksAroundPlayer:
	applymovement DEEPWATERPASSAGEEASTCAVERN_PRYCE, PryceLeavesMovementAlt
	disappear DEEPWATERPASSAGEEASTCAVERN_PRYCE
	setevent EVENT_PRYCE_IN_DEEPWATER
	clearevent EVENT_PRYCE_IN_HOME
	end

PryceGreetingText:
	text "Ah, hello."
	para "It's not often"
	line "that I get any"
	cont "visitors here."
	para "My name is PRYCE."
	para "I am the GYM"
	line "LEADER in BLUE"
	cont "FOREST."
	para "But often I like"
	line "to get away from"
	para "my GYM and come"
	line "train deep in"
	cont "this cave."
	para "Live among the"
	line "ice #MON in"
	para "order to truly"
	line "understand them."
	para "…"
	para "I also understand"
	line "if you would like"
	para "me to resume my"
	line "post at my GYM."
	para "I will do that"
	line "in due time."
	para "I have family that"
	line "live up in"
	cont "FROSTPOINT TOWN."
	para "I have already"
	line "informed them that"
	para "I would be coming"
	line "to visit."
	para "I will not back"
	line "out on that"
	cont "promise."
	para "I hope you"
	line "understand."
	para "…"
	para "I can sense that"
	line "you possess a"
	para "great deal of"
	line "respect for"
	cont "#MON."
	para "I admire that."
	para "Please, when you"
	line "get a chance, come"
	para "visit me and my"
	line "family in"
	cont "FROSTPOINT TOWN."
	para "I will return to"
	line "the GYM once I"
	para "have completed my"
	line "visit."
	done

PryceLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PryceLeavesMovementAlt:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

DeepwaterPassageEastCavern_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3, 33, DEEPWATER_PASSAGE_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 26, 31, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DeepwaterPassageEastCavernPryceScript, EVENT_PRYCE_IN_DEEPWATER
	object_event  5, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernTMSwagger, EVENT_DEEPWATER_EAST_TM_SWAGGER
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernMaxEther, EVENT_DEEPWATER_EAST_MAX_ETHER
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernMaxRevive, EVENT_DEEPWATER_EAST_MAX_REVIVE
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernRareCandy, EVENT_DEEPWATER_EAST_RARE_CANDY
	object_event 10, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageEastCavernHpUp, EVENT_DEEPWATER_EAST_HP_UP

