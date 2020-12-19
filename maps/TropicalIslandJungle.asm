	object_const_def ; object_event constants
	const MEW_SPOT_1
	const MEW_SPOT_5

TropicalIslandJungle_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MewTextCommon1:
	text "MEW!"
	done

MewSpot1Script:
	opentext
	writetext MewTextCommon1
	cry MEW
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_WARP_TO
	pause 10
	disappear MEW_SPOT_1
	special FadeInPalettes
	setevent EVENT_MEW_SPOT_1_FOUND
	setevent EVENT_SLOWKING_HINT_2
	clearevent EVENT_MEW_SPOT_2_FOUND
	end
	
	
MewSpot5Script:
	opentext
	writetext MewTextCommon1
	cry MEW
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_WARP_TO
	pause 10
	disappear MEW_SPOT_5
	special FadeInPalettes
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_SLOWKING_HINT_6
	clearevent EVENT_MEW_SPOT_6_FOUND
	end

TropicalIslandJungle_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 18, 35, TROPICAL_ISLAND_OUTSIDE, 1
	warp_event 19, 35, TROPICAL_ISLAND_OUTSIDE, 2
	warp_event 37,  7, TROPICAL_ISLAND_OUTSIDE, 3
	warp_event 36,  7, TROPICAL_ISLAND_OUTSIDE, 4
	warp_event  2, 27, TROPICAL_ISLAND_OUTSIDE, 5
	warp_event  3, 27, TROPICAL_ISLAND_OUTSIDE, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 17, 31, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MewSpot1Script, EVENT_MEW_SPOT_1_FOUND
	object_event 10,  4, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MewSpot5Script, EVENT_MEW_SPOT_5_FOUND
	