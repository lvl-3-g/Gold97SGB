	object_const_def ; object_event constants
	const ISEN_LAB_BACK_MEWTWO
;	const ISEN_LAB_BACK_MEW

IsenLabBack_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
;	callback MAPCALLBACK_OBJECTS, .CheckForMew
;	
;.CheckForMew:
;	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
;	iftrue .NoMew
;	checkflag ENGINE_GOT_SHUCKIE_TODAY
;	iftrue .NoMew
;	checkevent EVENT_SWITCH_11
;	iffalse .NoMew
;	checkevent EVENT_EXPLODING_TRAP_17
;	iftrue .NoMew
;	appear ISEN_LAB_BACK_MEW
;	return
	
;.NoMew
;	disappear ISEN_LAB_BACK_MEW
;	return
	

MewtwoScript:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_SWITCH_11
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_GOT_SHUCKIE_TODAY
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDSWISLANDS
	loadwildmon MEWTWO, 50
	startbattle
	disappear ISEN_LAB_BACK_MEWTWO
	reloadmapafterbattle
	end
	


;MewScript:
;	faceplayer
;	opentext
;	writetext MewText
;	cry MEW
;	pause 15
;	closetext
;	setevent EVENT_EXPLODING_TRAP_17
;	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDSWISLANDS
;	loadwildmon MEW, 5
;	startbattle
;	disappear ISEN_LAB_BACK_MEW
;	reloadmapafterbattle
;	end
	
MewtwoText:
	text "Gyargh!"
	done
	
;MewText:
;	text "Meew?"
;	done

IsenLabBack_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ISEN_LAB_FRONT, 3
	warp_event  5,  7, ISEN_LAB_FRONT, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewtwoScript, EVENT_SWITCH_11
;	object_event  4,  2, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MewScript, EVENT_EXPLODING_TRAP_18
