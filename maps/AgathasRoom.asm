	object_const_def ; object_event constants
	const AGATHASROOM_AGATHA

AgathasRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AgathasRoomDoors

.LockDoor:
	priorityjump .AgathasDoorLocksBehindYou
	end

.DummyScene:
	end

.AgathasRoomDoors:
	checkevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $05 ; open door
.KeepExitClosed:
	return

.AgathasDoorLocksBehindYou:
	applymovement PLAYER, AgathasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

AgathaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_AGATHA
	iftrue AgathaScript_AfterBattle
	writetext AgathaScript_AgathaBeforeText
	waitbutton
	closetext
	winlosstext AgathaScript_BrunoBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue AgathaRematchTeam
	loadtrainer BRUNO, BRUNO1
ReturnToMainAgatha:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_AGATHA
	opentext
	writetext AgathaScript_AgathaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $05 ; open door
	reloadmappart
	closetext
	setevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	waitsfx
	end

AgathaScript_AfterBattle:
	writetext AgathaScript_AgathaDefeatText
	waitbutton
	closetext
	end
	
AgathaRematchTeam:
	loadtrainer BRUNO, BRUNO2
	jump ReturnToMainAgatha
	end

AgathasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

AgathaScript_AgathaBeforeText:
	text "Oho!"

	para "So, old OAK has"
	line "sent another child"
	cont "on one of his"
	cont "foolish errands…"

	para "I am AGATHA of"
	line "the ELITE FOUR."
	
	para "My years have seen"
	line "many travels and"
	cont "turmoil."
	
	para "That old fool OAK"
	line "just lives in his"
	cont "childhood dreams."
	
	para "#MON have"
	line "always been for"
	cont "battling!"

	para "Tell me, child."

	para "How far will your"
	line "resolve take you"
	para "in your journey"
	line "to complete the"
	cont "#DEX?"
	
	para "Let's find out."
    line "Fufufufu…"
	done

AgathaScript_BrunoBeatenText:
	text "My gracious!"
	
	para "You certainly have"
	line "it, my child."
	done

AgathaScript_AgathaDefeatText:
	text "Hmm…"
	
	para "Perhaps that old"
	line "fool does know"
	cont "your potential."
	
	para "Run along now."
	
	para "Your journey is"
	line "not yet over."
	done

AgathasRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, MISTYS_ROOM, 1
	warp_event  5,  2, MISTYS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, AgathaScript_Battle, -1
