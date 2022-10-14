	object_const_def ; object_event constants
	const SILENTNORTH_SHINYTEST


SilentNorth_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
ShinyPokeScript:
	faceplayer
	opentext
	writetext ShinyPokeText
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	loadwildmon MIMMEO, 1
	startbattle
	reloadmapafterbattle
	end
	
ShinyPokeText:
	text "Shiny #MON test"
	done
	

SilentNorth_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  7, CROWN_PATH_GATE, 1
	warp_event 11,  7, HALL_OF_FAME, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ShinyPokeScript, -1
