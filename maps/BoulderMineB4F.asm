	object_const_def ; object_event constants
	const BOULDER_MINE_B4F_ITEMBALL
	const BOULDER_MINE_B4F_ITEMBALL_2
	const BOULDER_MINE_B4F_ITEMBALL_3

BoulderMineB4F_MapScripts:
	db 2 ; scene scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.RivalEncounter:
	end

.DummyScene:
	end
	


BoulderMineB4FDomeFossil:
	itemball DOME_FOSSIL
	
BoulderMineB4FTMGigaDrain:
	itemball TM_GIGA_DRAIN

BoulderMineB4FStrength:
	itemball HM_STRENGTH

BoulderMineB4FCovenantOrb:
	itemball COVENANT_ORB

BoulderMineB4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  1, BOULDER_MINE_B3F, 1
	warp_event 17,  9, BOULDER_MINE_B5F, 1
	warp_event 17, 13, BOULDER_MINE_B3F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 22, 7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB4FStrength, EVENT_BOULDER_MINE_B4F_HM_STRENGTH
	object_event 16, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB4FTMGigaDrain, EVENT_BOULDER_MINE_B4F_GIGA_DRAIN
	object_event  2, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB4FDomeFossil, EVENT_BOULDER_MINE_B4F_DOME_FOSSIL
	object_event 14,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB4FCovenantOrb, EVENT_BOULDER_MINE_B4F_COVENANT_ORB
