	object_const_def ; object_event constants
	const MOUNTFUJIPOKECENTER1F_NURSE
	const MOUNTFUJIPOKECENTER1F_CLERK
	const MOUNTFUJIPOKECENTER1F_COOLTRAINER_M


MountFujiPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .PrepareElite4

.DummyScene:
	end

.PrepareElite4:
	setmapscene WILLS_ROOM, SCENE_DEFAULT
	setmapscene KOGAS_ROOM, SCENE_DEFAULT
	setmapscene AGATHAS_ROOM, SCENE_DEFAULT
	setmapscene MISTYS_ROOM, SCENE_DEFAULT
	setmapscene LANCES_ROOM, SCENE_DEFAULT
	setmapscene HALL_OF_FAME, SCENE_DEFAULT
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	clearevent EVENT_MISTYS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_MISTYS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_AGATHA
	clearevent EVENT_BEAT_ELITE_4_MISTY
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_PROFESSOR_OAK
	return


MountFujiPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

MountFujiPokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_MOUNT_FUJI
	closetext
	end

MountFujiPokecenter1FCooltrainerMScript:
	jumptextfaceplayer MountFujiPokecenter1FCooltrainerMText

MountFujiPokecenter1FCooltrainerMText:
	text "At the NIHON"
	line "LEAGUE, you'll get"

	para "tested by the"
	line "ELITE FOUR."

	para "You have to beat"
	line "them all. If you"

	para "lose, you have to"
	line "start all over!"
	done


MountFujiPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  8, 13, FUJI_SUMMIT, 1
	warp_event  9, 13, FUJI_SUMMIT, 2
	warp_event  0, 13, POKECENTER_2F, 1
	warp_event  8,  0, WILLS_ROOM, 1
	warp_event  9,  0, WILLS_ROOM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  9, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MountFujiPokecenter1FNurseScript, -1
	object_event 14,  9, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountFujiPokecenter1FClerkScript, -1
	object_event 16, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountFujiPokecenter1FCooltrainerMScript, -1
