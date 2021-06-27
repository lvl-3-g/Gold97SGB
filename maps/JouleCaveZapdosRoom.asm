	object_const_def ; object_event constants
	const JOULECAVE_ZAPDOS

JouleCaveZapdosRoom_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Zapdos

.Zapdos:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .NoAppearZ
	checkitem TRI_WING; change this to whatever becomes the tri-wing
	iftrue .AppearZ
	jump .NoAppearZ

.AppearZ:
	appear JOULECAVE_ZAPDOS
	return

.NoAppearZ:
	disappear JOULECAVE_ZAPDOS
	return
	
	
ZapdosScript:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_FOUGHT_ZAPDOS
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDSWISLANDS
	loadwildmon ZAPDOS, 40
	startbattle
	disappear JOULECAVE_ZAPDOS
	reloadmapafterbattle
	end
	
ZapdosText:
	text "Zyah!"
	done
	

ZapdosHiddenBrightPowder:
	hiddenitem BRIGHTPOWDER, EVENT_PICKED_UP_BRIGHTPOWDER_FROM_ZAPDOS_ROOM

JouleCaveZapdosRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7, 15, JOULE_CAVE_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  4, BGEVENT_ITEM, ZapdosHiddenBrightPowder

	db 1 ; object events
	object_event  7,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, ZapdosScript, EVENT_ZAPDOS_IN_JOULE_CAVE
