; block ids
UNDERGROUND_DOOR_CLOSED1 EQU $2a
UNDERGROUND_DOOR_CLOSED2 EQU $3e
UNDERGROUND_DOOR_CLOSED3 EQU $3f
UNDERGROUND_DOOR_OPEN1   EQU $2d
UNDERGROUND_DOOR_OPEN2   EQU $3d

ugdoor: MACRO
\1_YCOORD EQU \2
\1_XCOORD EQU \3
ENDM

	ugdoor UGDOOR_1,  $10, $06
	ugdoor UGDOOR_2,  $0a, $06
	ugdoor UGDOOR_3,  $02, $06
	ugdoor UGDOOR_4,  $02, $0a
	ugdoor UGDOOR_5,  $0a, $0a
	ugdoor UGDOOR_6,  $10, $0a
	ugdoor UGDOOR_7,  $0c, $06
	ugdoor UGDOOR_8,  $0c, $08
	ugdoor UGDOOR_9,  $06, $06
	ugdoor UGDOOR_10, $06, $08
	ugdoor UGDOOR_11, $0c, $0a
	ugdoor UGDOOR_12, $0c, $0c
	ugdoor UGDOOR_13, $06, $0a
	ugdoor UGDOOR_14, $06, $0c
	ugdoor UGDOOR_15, $12, $0a
	ugdoor UGDOOR_16, $12, $0c

doorstate: MACRO
	changeblock UGDOOR_\1_YCOORD, UGDOOR_\1_XCOORD, UNDERGROUND_DOOR_\2
ENDM

	object_const_def ; object_event constants
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_PHARMACIST1
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_PHARMACIST2
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_ROCKET1
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_ROCKET2
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_ROCKET3
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_ROCKET_GIRL
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_TEACHER
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_SUPER_NERD
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_POKE_BALL1
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_POKE_BALL2
	const WESTPORTUNDERGROUNDSWITCHROOMENTRANCES_SILVER

WestportUndergroundSwitchRoomEntrances_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UpdateDoorPositions

.DummyScene0:
	end

.DummyScene1:
	end

.UpdateDoorPositions:
	checkevent EVENT_SWITCH_4
	iffalse .false4
	doorstate 1, OPEN1
.false4
	checkevent EVENT_SWITCH_5
	iffalse .false5
	doorstate 2, OPEN1
.false5
	checkevent EVENT_SWITCH_6
	iffalse .false6
	doorstate 3, OPEN1
.false6
	checkevent EVENT_SWITCH_7
	iffalse .false7
	doorstate 4, OPEN1
.false7
	checkevent EVENT_SWITCH_8
	iffalse .false8
	doorstate 5, OPEN1
.false8
	checkevent EVENT_SPOKE_WITH_LASS_WHO_HEALS
	iffalse .false9
	doorstate 6, OPEN1
.false9
	checkevent EVENT_GET_SCOPE_LENS_GRANNY
	iffalse .false10
	doorstate 7, CLOSED1
	doorstate 8, OPEN1
.false10
	checkevent EVENT_FOR_MEWTWO_ENCOUNTER
	iffalse .false11
	doorstate 9, CLOSED1
	doorstate 10, OPEN1
.false11
	checkevent EVENT_SWITCH_12
	iffalse .false12
	doorstate 11, CLOSED1
	doorstate 12, OPEN1
.false12
	checkevent EVENT_SWITCH_13
	iffalse .false13
	doorstate 13, CLOSED1
	doorstate 14, OPEN1
.false13
	checkevent EVENT_GETTING_DRATINI
	iffalse .false14
	doorstate 15, CLOSED1
	doorstate 16, OPEN1
.false14
	return
	
CardKeySlotScript::; i just put this here, it goes unused
	end


WestportUndergroundSwitchRoomEntrances_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 23,  3, WESTPORT_UNDERGROUND, 6
	warp_event 22, 10, WESTPORT_UNDERGROUND_WAREHOUSE, 1
	warp_event 23, 10, WESTPORT_UNDERGROUND_WAREHOUSE, 2
	warp_event  5, 25, WESTPORT_UNDERGROUND, 2
	warp_event  4, 29, WESTPORT_CITY, 15
	warp_event  5, 29, WESTPORT_CITY, 15
	warp_event 21, 25, WESTPORT_UNDERGROUND, 1
	warp_event 20, 29, WESTPORT_CITY, 14
	warp_event 21, 29, WESTPORT_CITY, 14

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
