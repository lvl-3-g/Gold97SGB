	object_const_def ; object_event constants
	const SUNPOINTPOKECENTER1F_NURSE
	const SUNPOINTPOKECENTER1F_LASS
	const SUNPOINTPOKECENTER1F_GYM_GUY
	const SUNPOINTPOKECENTER1F_SUPER_NERD

SunpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SunpointPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SunpointPokecenter1FLassScript:
	jumptextfaceplayer SunpointPokecenter1FLassText

StandGymGuyScript:
	faceplayer
	checkevent EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	iftrue .StandGymGuyWinScript
	opentext
	writetext StandGymGuyText
	waitbutton
	closetext
	end

.StandGymGuyWinScript:
	opentext
	writetext StandGymGuyWinText
	waitbutton
	closetext
	end

SunpointPokecenter1FSuperNerdScript:
	jumptextfaceplayer SunpointPokecenter1FSuperNerdText

SunpointPokecenter1FLassText:
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"
	para "I always brag"
	line "about my beautiful"
	cont "BELLEDAM."
	done

StandGymGuyText:
	text "Did you go up to"
	line "the DOCKS?"
	para "Something fishy is"
	line "going on up there."
	done

StandGymGuyWinText:
	text "Those were TEAM"
	line "ROCKET members at"
	cont "the docks?"
	para "I can't believe"
	line "they showed their"
	cont "faces again!"
	done

SunpointPokecenter1FUnusedText1:
; unreferenced
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"

	para "I wish I could"
	line "show the #MON I"

	para "raised to my pal"
	line "in PAGOTA."
	done

SunpointPokecenter1FUnusedText2:
; unreferenced
	text "I've been battling"
	line "my pal in PAGOTA"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against him. I've"
	cont "gotta crank it up!"
	done

SunpointPokecenter1FSuperNerdText:
	text "I love showing off"
	line "the #MON that"

	para "I've raised."
	line "Don't you?"

	para "I'm going to get"
	line "into a bunch of"

	para "battles, and show"
	line "off my #MON!"
	done

SunpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SUNPOINT_CITY, 3
	warp_event  6,  7, SUNPOINT_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FLassScript, -1
	object_event 10,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript, -1
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FSuperNerdScript, -1
