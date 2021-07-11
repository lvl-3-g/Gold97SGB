	object_const_def ; object_event constants
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2
	const ROCKTUNNEL1F_BOULDER
	const ROCKTUNNEL1F_WHITNEY
	const ROCKTUNNEL1F_ITEMBALL

BoulderMineB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BoulderMineB2FElixer:
	itemball ELIXER

BoulderMineB2FTMSteelWing:
	itemball TM_STEEL_WING

BoulderMineB2FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_BOULDER_MINE_B2F_HIDDEN_X_ACCURACY

BoulderMineB2FHiddenSteelShell:
	hiddenitem STEEL_SHELL, EVENT_BOULDER_MINE_B2F_HIDDEN_STEEL_SHELL
	
BoulderMineB2FHeartStone:
	itemball HEART_STONE

	
BoulderMineB2FBoulder:
	jumpstd StrengthBoulderScript
	
RockTunnelWhitneyScript:
	jumptextfaceplayer RockTunnelWhitneyText
	end

RockTunnelWhitneyText:
	text "WHITNEY: Hi, I'm"
	line "WHITNEY, leader of"
	cont "the TEKNOS GYM."
	para "I heard rumor that"
	line "there could be a"
	para "missing girl lost"
	line "somewhere in here."
	para "I'm doing my best"
	line "to help locate"
	cont "her."
	para "Making sure she's"
	line "safe is more"
	para "important than GYM"
	line "battles right now."
	done

BoulderMineB2F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, BOULDER_MINE_B1F, 1
	warp_event 13,  3, BOULDER_MINE_B1F, 2
	warp_event 31,  3, BOULDER_MINE_B1F, 5
	warp_event 21,  5, BOULDER_MINE_B3F, 2
	warp_event 37,  5, BOULDER_MINE_B3F, 3
	warp_event  3, 15, BOULDER_MINE_B3F, 4
	warp_event 35, 13, BOULDER_MINE_B3F, 6
	warp_event 35, 11, BOULDER_MINE_B1F, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event 29,  1, BGEVENT_ITEM, BoulderMineB2FHiddenXAccuracy
	bg_event 26,  8, BGEVENT_ITEM, BoulderMineB2FHiddenSteelShell

	db 5 ; object events
	object_event  8, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB2FElixer, EVENT_BOULDER_MINE_B2F_ELIXER
	object_event 39,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB2FTMSteelWing, EVENT_BOULDER_MINE_B2F_TM_STEEL_WING
	object_event 16, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoulderMineB2FBoulder, -1
	object_event 15,  1, SPRITE_WHITNEY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RockTunnelWhitneyScript, EVENT_BOULDER_MINE_WHITNEY
	object_event 37, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB2FHeartStone, EVENT_PICKED_UP_GOLD_BERRY_FROM_AERODACTYL_ITEM_ROOM

