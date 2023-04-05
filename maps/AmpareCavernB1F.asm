	object_const_def ; object_event constants
	const AMPARECAVERNB1F_ROCK1
	const AMPARECAVERNB1F_ROCK2
	const AMPARECAVERNB1F_ROCK3
	const AMPARECAVERNB1F_ROCK4
	const AMPARECAVERNB1F_POKE_BALL2
	const AMPARECAVERNB1F_POKE_BALL3
	const AMPARECAVERNB1F_POKE_BALL4
	const AMPARECAVERNB1F_RAIKOU
	const AMPARECAVERNB1F_POKE_BALL5

AmpareCavernB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RaikouEvent:
	faceplayer
	opentext
	writetext RaikouText
	cry RAIKOU
	pause 15
	closetext
	setevent EVENT_RAIKOU_APPEARS
	loadwildmon RAIKOU, 40
	startbattle
	disappear AMPARECAVERNB1F_RAIKOU
	reloadmapafterbattle
	end
	
RaikouText:
	text "Groroa!"
	done


AmpareCavernZapCannon:
	itemball TM_ZAP_CANNON


AmpareCavernB1FFullHeal:
	itemball FULL_HEAL

AmpareCavernB1FHyperPotion:
	itemball HYPER_POTION

AmpareCavernB1FDireHit:
	itemball DIRE_HIT

AmpareCavernB1FRock:
	jumpstd SmashRockScript

AmpareCavernB1FHiddenElixer:
	hiddenitem ELIXER, EVENT_AMPARE_CAVERN_B1F_HIDDEN_ELIXER

AmpareCavernB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0, 35, AMPARE_CAVERN_B1F, 3
	warp_event  3, 21, AMPARE_CAVERN_1F, 2
	warp_event 29,  5, AMPARE_CAVERN_B1F, 1
	warp_event  1, 35, AMPARE_CAVERN_B1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 23,  6, BGEVENT_ITEM, AmpareCavernB1FHiddenElixer

	db 9 ; object events
	object_event 31,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmpareCavernB1FRock, -1
	object_event 28,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmpareCavernB1FRock, -1
	object_event 34, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmpareCavernB1FRock, -1
	object_event 29,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmpareCavernB1FRock, -1
	object_event 18,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FFullHeal, EVENT_AMPARE_CAVERN_B1F_FULL_HEAL
	object_event 10, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FHyperPotion, EVENT_AMPARE_CAVERN_B1F_HYPER_POTION
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FDireHit, EVENT_AMPARE_CAVERN_B1F_DIRE_HIT
	object_event  8, 30, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, RaikouEvent, EVENT_RAIKOU_APPEARS
	object_event  3,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernZapCannon, EVENT_AMPARE_CAVERN_ZAP_CANNON
