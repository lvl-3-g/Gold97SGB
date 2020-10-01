	const_def 2 ; object constants
	const SILENTTOWN_TEACHER
	const SILENTTOWN_FISHER
	const SILENTTOWN_SILVER
	const SILENTTOWN_BLUE

SilentTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	iftrue .SilentRocksDone
	changeblock  19, 7, $6B ; rock
	return
	
.SilentRocksDone
	return

.DummyScene0:
	end


.DummyScene1:
	end
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_SILENT
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return
	
SilentTownPokecenterSign:
	jumpstd PokecenterSignScript
	
SilentTown_RivalGreets:
	applymovement SILENTTOWN_SILVER, Movement_SilverComesFromTheShadows_NBT
	applymovement PLAYER, Movement_PlayerTurnsHead
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SilentTownRivalText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SILENTTOWN_SILVER, 15
	opentext
	writetext SilentTownRivalText2
	waitbutton
	closetext
	applymovement SILENTTOWN_SILVER, Movement_SilverPushesYouAway_NBT
	disappear SILENTTOWN_SILVER
	setscene SCENE_TEACHER_STOPS
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	setevent EVENT_RIVAL_SILENT_TOWN
	setevent EVENT_BLUE_OAK_LAB_FRONT_ROOM
	setevent EVENT_DAISY_OAK_LAB_FRONT_ROOM
	setevent EVENT_PAGOTA_GYM_FALKNER
	setmapscene RADIO_TOWER_6F, SCENE_RADIOTOWER6F_NOTHING; this makes it so the giovanni scene plays, was missed for a while
	end

SilentTown_TeacherStopsYouScene2:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	moveobject SILENTTOWN_BLUE, 7, 9
	appear SILENTTOWN_BLUE
	applymovement SILENTTOWN_BLUE, Movement_TeacherRunsToYou1_NBT
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow SILENTTOWN_BLUE, PLAYER
	applymovement SILENTTOWN_BLUE, Movement_TeacherBringsYouBack1_NBT
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	follow SILENTTOWN_BLUE, PLAYER
	applymovement SILENTTOWN_BLUE, Movement_BlueTakesToLab
	stopfollow
	applymovement SILENTTOWN_BLUE, Movement_BlueIntoLab
	playsound SFX_ENTER_DOOR
	disappear SILENTTOWN_BLUE
	setevent EVENT_RIVAL_OAK_LAB_FRONT_ROOM
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_HEAD_TO_THE_BACK
	setmapscene OAK_LAB_BACK_ROOM, SCENE_DEFAULT
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM
	applymovement PLAYER, Movement_PlayerIntoLab
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAK_LAB_FRONT_ROOM, 4, 15
	end

SilentTown_TeacherStopsYouScene1:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Movement_OneDown
	turnobject PLAYER, RIGHT
	moveobject SILENTTOWN_BLUE, 7, 9
	appear SILENTTOWN_BLUE
	applymovement SILENTTOWN_BLUE, Movement_TeacherRunsToYou1_NBT
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow SILENTTOWN_BLUE, PLAYER
	applymovement SILENTTOWN_BLUE, Movement_TeacherBringsYouBack1_NBT
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	follow SILENTTOWN_BLUE, PLAYER
	applymovement SILENTTOWN_BLUE, Movement_BlueTakesToLab
	stopfollow
	applymovement SILENTTOWN_BLUE, Movement_BlueIntoLab
	playsound SFX_ENTER_DOOR
	disappear SILENTTOWN_BLUE
	setevent EVENT_RIVAL_OAK_LAB_FRONT_ROOM
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_HEAD_TO_THE_BACK
	setmapscene OAK_LAB_BACK_ROOM, SCENE_DEFAULT
	clearevent EVENT_BLUE_OAK_LAB_FRONT_ROOM
	applymovement PLAYER, Movement_PlayerIntoLab
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAK_LAB_FRONT_ROOM, 4, 15
	end


SilentTownRivalScript:
	faceplayer
	opentext
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end
	
SilentTownBlueScript:
	opentext
	writetext Text_Study101
	waitbutton
	closetext
	end

SilentTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iftrue .CallMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	iftrue .TellMomYoureLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.TellMomYoureLeaving:
	writetext Text_TellMomIfLeaving
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

SilentTownFisherScript:
	jumptextfaceplayer Text_Oak2DiscoveredNewMon

SilentTownSilverScript:
	opentext
	writetext SilentTownRivalText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SILENTTOWN_SILVER, 15
	opentext
	writetext SilentTownRivalText2
	waitbutton
	closetext
	applymovement SILENTTOWN_SILVER, Movement_SilverPushesYouAway_NBT
	end

SilentTownSign:
	jumptext SilentTownSignText

SilentTownPlayersHouseSign:
	jumptext SilentTownPlayersHouseSignText

SilentTownOakLabBackRoomSign:
	jumptext SilentTownOakLabBackRoomSignText

SilentTownRivalsHouseSign:
	jumptext SilentTownRivalsHouseSignText
	
Movement_PlayerIntoLab:
	step RIGHT
	step UP
	step_end
	
Movement_BlueIntoLab:
	step UP
	step_end
	
Movement_BlueTakesToLab:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
Movement_OneDown:
	step DOWN
	step_end
	
Movement_MoveFromDoor:
	step DOWN
	step_end

Movement_TeacherRunsToYou1_NBT:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Movement_TeacherRunsToYou2_NBT:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

Movement_TeacherBringsYouBack1_NBT:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

Movement_SilverPushesYouAway_NBT:
	turn_head RIGHT
	step RIGHT
	turn_head DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

Movement_SilverShovesYouOut_NBT:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

Movement_SilverComesFromTheShadows_NBT:
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_end
	
Movement_PlayerTurnsHead:
	turn_head RIGHT
	step_end
	
Text_Study101:
	text "…And if we spend"
	line "just a few more"
	para "days observing the"
	line "#MON living in"
	para "ROUTE 101…"
	
	para "…"
	para "He seems to be"
	line "completely"
	cont "occupied…"
	
	done

Text_GearIsImpressive:
	text "Wow, your #GEAR"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_WaitPlayer:
	text "Wait! Stop!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Wild #MON"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	
	para "You need your own"
	line "#MON for"
	cont "protection!"
	
	para "Ah! Wait, are you"
	line "perhaps…?"
	
	para "…Come with me!"
	done

Text_YourMonIsAdorable:
	text "Oh! Your #MON"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAYER>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

Text_Oak2DiscoveredNewMon:
	text "Yo, <PLAYER>!"

	para "I hear PROF.OAK"
	line "discovered some"
	cont "new #MON."
	done

SilentTownRivalText1:
	text "<RIVAL>: Hey,"
	line "<PLAYER>!"
	para "There's something"
	line "I gotta brag to"
	cont "you about!"
	
	para "I got an email"
	line "from PROF.OAK!"

	para "Yeah, the famous"
	line "one!"
	done

SilentTownRivalText2:
	text "You got one too?!"
	line "Man, that's no"
	cont "fun! Hmph!"
	
	para "Well, I'm off to"
	line "OAK's!"
	cont "See you there!"
	done

SilentTownSignText:
	text "Forever Peaceful"
	line "SILENT TOWN"
	done

SilentTownPlayersHouseSignText:
	text "<PLAYER>'s House"
	done

SilentTownOakLabBackRoomSignText:
	text "OAK #MON LAB"
	done

SilentTownRivalsHouseSignText:
	text "<RIVAL>'s House"
	done

SilentTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 14, 11, OAK_LAB_FRONT_ROOM, 1
	warp_event  5,  4, PLAYERS_HOUSE_1F, 1
	warp_event 13,  4, SILENT_POKECENTER_1F, 1
	warp_event  3, 12, RIVALS_HOUSE, 1
	warp_event 15, 11, OAK_LAB_FRONT_ROOM, 2
	warp_event  9,  9, AMAMI_POKECENTER_1F, 1


	db 3 ; coord events
	coord_event  1,  8, SCENE_TEACHER_STOPS, SilentTown_TeacherStopsYouScene1
	coord_event  1,  9, SCENE_TEACHER_STOPS, SilentTown_TeacherStopsYouScene2
	coord_event  5,  5, SCENE_DEFAULT, SilentTown_RivalGreets

	db 5 ; bg events
	bg_event 16,  5, BGEVENT_READ, SilentTownSign
	bg_event  8,  4, BGEVENT_READ, SilentTownPlayersHouseSign
	bg_event 10, 11, BGEVENT_READ, SilentTownOakLabBackRoomSign
	bg_event  6, 12, BGEVENT_READ, SilentTownRivalsHouseSign
	bg_event 14,  4, BGEVENT_READ, SilentTownPokecenterSign

	db 4 ; object events
	object_event  9,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownTeacherScript, -1
	object_event 12, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1,  0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentTownFisherScript, -1
	object_event  7, 10, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownRivalScript, EVENT_RIVAL_SILENT_TOWN
	object_event  3,  9, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownBlueScript, EVENT_BLUE_SILENT_TOWN
