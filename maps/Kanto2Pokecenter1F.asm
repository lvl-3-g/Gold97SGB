	object_const_def ; object_event constants
	const KANTO2POKECENTER1F_NURSE
	const KANTO2POKECENTER1F_COOLTRAINERM
	const KANTO2POKECENTER1F_GRANNY
	const KANTO2POKECENTER1F_YOUNGSTER

Kanto2Pokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Kanto2Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
Kanto2PokecenterCooltrainerMScript:
	jumptextfaceplayer Kanto2PokecenterCooltrainerMText
	
Kanto2PokecenterGrannyScript:
	jumptextfaceplayer Kanto2PokecenterGrannyText
	
Kanto2PokecenterYoungsterScript:
	jumptextfaceplayer Kanto2PokecenterYoungsterText
	
Kanto2PokecenterCooltrainerMText:
	text "There's a lot to"
	line "see and do around"
	cont "here."
	para "Have you been to"
	line "the local GYM?"
	done
	
Kanto2PokecenterGrannyText:
	text "There are a lot of"
	line "tough trainers"
	para "that come through"
	line "this town looking"
	para "to challenge our"
	line "GYM."
	para "The GYM LEADER"
	line "there is a very"
	cont "talented trainer."
	done
	
Kanto2PokecenterYoungsterText:
	text "I heard there's a"
	line "#MON daycare"
	para "over near ALLOY"
	line "CITY."
	done

Kanto2Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KANTO_REGION, 21
	warp_event  6,  7, KANTO_REGION, 21
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Kanto2Pokecenter1FNurseScript, -1
	object_event  3,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kanto2PokecenterCooltrainerMScript, -1
	object_event 10,  1, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kanto2PokecenterGrannyScript, -1
	object_event 14,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kanto2PokecenterYoungsterScript, -1
