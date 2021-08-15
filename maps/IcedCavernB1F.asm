	object_const_def ; object_event constants
	const MOUNTMORTARB1F_POKE_BALL1
	const MOUNTMORTARB1F_POKE_BALL2
	const MOUNTMORTARB1F_POKE_BALL3
	const MOUNTMORTARB1F_POKE_BALL4
	const MOUNTMORTARB1F_POKE_BALL5
	const MOUNT_MORTAR_ARTICUNO

IcedCavernB1F_MapScripts:
	db 0 ; scene scripts


	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Articuno

.Articuno:
	checkevent EVENT_FOUGHT_ARTICUNO
	iftrue .NoAppearA
	checkitem TRI_WING; change this to whatever becomes the tri-wing
	iftrue .AppearA
	jump .NoAppearA

.AppearA:
	appear MOUNT_MORTAR_ARTICUNO
	return

.NoAppearA:
	disappear MOUNT_MORTAR_ARTICUNO
	return
	
ArticunoScript:
	faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_FOUGHT_ARTICUNO
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDSWISLANDS
	loadwildmon ARTICUNO, 40
	startbattle
	disappear MOUNT_MORTAR_ARTICUNO
	reloadmapafterbattle
	end
	
ArticunoText:
	text "Aie!"
	done


IcedCavernB1FBoulder:
	jumpstd StrengthBoulderScript

IcedCavernB1FHyperPotion:
	itemball HYPER_POTION

IcedCavernB1FWaterTail:
	itemball WATER_TAIL

IcedCavernB1FFullRestore:
	itemball FULL_RESTORE

IcedCavernB1FMaxEther:
	itemball MAX_ETHER

IcedCavernB1FPPUp:
	itemball PP_UP

IcedCavernB1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_ICED_CAVERN_B1F_HIDDEN_MAX_REVIVE

IcedCavernB1F_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  3, 31, ICED_CAVERN_1F, 1
	warp_event  3,  9, ICED_CAVERN_1F, 2
	warp_event 25,  7, ICED_CAVERN_1F, 3
	warp_event 33, 17, ICED_CAVERN_1F, 4
	warp_event 37, 29, ICED_CAVERN_1F, 5
	warp_event 17, 33, ICED_CAVERN_1F, 6
	warp_event 17, 21, ICED_CAVERN_1F, 7
	warp_event 27, 33, ICED_CAVERN_B1F, 9
	warp_event 17, 15, ICED_CAVERN_B1F, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  5, BGEVENT_ITEM, IcedCavernB1FHiddenMaxRevive

	db 6 ; object events
	object_event 15,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavernB1FHyperPotion, EVENT_ICED_CAVERN_B1F_HYPER_POTION
	object_event  7, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavernB1FWaterTail, EVENT_ICED_CAVERN_B1F_WATER_TAIL
	object_event 37, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavernB1FFullRestore, EVENT_ICED_CAVERN_B1F_FULL_RESTORE
	object_event 37,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavernB1FMaxEther, EVENT_ICED_CAVERN_B1F_MAX_ETHER
	object_event 16, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcedCavernB1FPPUp, EVENT_ICED_CAVERN_B1F_PP_UP
	object_event 27, 24, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoScript, EVENT_ARTICUNO_IN_ICED_CAVERN
