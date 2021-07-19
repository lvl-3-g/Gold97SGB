	object_const_def ; object_event constants
	const TINTOWERROOF_HO_OH

FiveFloorTowerRoof_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .HoOh

.HoOh:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .NoAppear
	jump .Appear

.Appear:
	appear TINTOWERROOF_HO_OH
	return

.NoAppear:
	disappear TINTOWERROOF_HO_OH
	return

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_HO_OH
	clearevent EVENT_ALLOY_CAPTAIN_AT_HOME
	setmapscene PAGOTA_CITY, SCENE_DEFAULT
	setevent EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
	clearevent EVENT_ENTEI_APPEARS
	clearevent EVENT_SUICUNE_IN_WHIRL_ISLAND
	clearevent EVENT_RAIKOU_APPEARS
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon HO_OH, 30
	startbattle
	disappear TINTOWERROOF_HO_OH
	reloadmapafterbattle
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	pause 20
	playsound SFX_MEGA_PUNCH
	waitsfx
	pause 10
	cry RAIKOU
	pause 20
	playsound SFX_MEGA_PUNCH
	waitsfx
	pause 10
	cry ENTEI
	pause 20
	playsound SFX_MEGA_PUNCH
	waitsfx
	pause 10
	cry SUICUNE
	pause 20
	opentext
	writetext BeastsHaveScatteredText
	waitbutton
	closetext
	end

HoOhText:
	text "Shaoooh!"
	done
	
BeastsHaveScatteredText:
	text "It feels as though"
	line "three gusts of"
	para "wind have shaken"
	line "the land…"
	done

FiveFloorTowerRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 13, FIVE_FLOOR_TOWER_5F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  6, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_FIVE_FLOOR_TOWER_ROOF_HO_OH
