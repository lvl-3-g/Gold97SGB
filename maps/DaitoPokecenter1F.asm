	object_const_def ; object_event constants
	const DAITOPOKECENTER1F_NURSE
	const DAITOPOKECENTER1F_GRANNY
	const DAITOPOKECENTER1F_YOUNGSTER

DaitoPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaitoPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

DaitoPokecenter1FGrannyScript:
	jumptextfaceplayer DaitoPokecenter1FGrannyText
	
DaitoPokecenter1FYoungsterScript:
	jumptextfaceplayer DaitoPokecenter1FYoungsterText

DaitoPokecenter1FGrannyText:
	text "Oh, I do just love"
	line "the fresh APPLES"
	cont "you can find here!"
	done
	
DaitoPokecenter1FYoungsterText:
	text "I think I had some"
	line "MOOMOO milk in"
	para "BIRDON TOWN that"
	line "originated here."
	done

DaitoPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, DAITO_RANCH, 5
	warp_event  6,  7, DAITO_RANCH, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DaitoPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaitoPokecenter1FGrannyScript, -1
	object_event  9,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaitoPokecenter1FYoungsterScript, -1
