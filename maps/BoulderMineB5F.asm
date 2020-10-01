	object_const_def ; object_event constants
	const UNIONCAVEB2F_POKE_BALL1
	const UNIONCAVEB2F_POKE_BALL2
	const UNIONCAVEB2F_LAPRAS

BoulderMineB5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Lapras

.Lapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	return

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	return

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 20
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end


BoulderMineB5FElixer:
	itemball ELIXER

BoulderMineB5FHyperPotion:
	itemball HYPER_POTION


BoulderMineB5F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  9, BOULDER_MINE_B4F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 18,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB5FElixer, EVENT_BOULDER_MINE_B5F_ELIXER
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMineB5FHyperPotion, EVENT_BOULDER_MINE_B5F_HYPER_POTION
	object_event 11,  1, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_BOULDER_MINE_B5F_LAPRAS
