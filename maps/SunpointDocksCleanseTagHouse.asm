	object_const_def ; object_event constants
	const SUNPOINTDOCKSCLEANSETAGHOUSE_GRANNY
	const SUNPOINTDOCKSCLEANSETAGHOUSE_TEACHER

SunpointDocksCleanseTagHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SunpointDocksCleanseTagHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext SunpointDocksCleanseTagHouseGrannyText1
	promptbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext SunpointDocksCleanseTagHouseGrannyText2
	waitbutton
.NoRoom:
	closetext
	end

SunpointDocksCleanseTagHouseTeacherScript:
	jumptextfaceplayer SunpointDocksCleanseTagHouseTeacherText

HouseForSaleBookshelf:
	jumpstd DifficultBookshelfScript

SunpointDocksCleanseTagHouseGrannyText1:
	text "Eeyaaaah!"

	para "I sense a sinister"
	line "shadow hovering"
	cont "over you."

	para "Take this to ward"
	line "it off!"
	done

SunpointDocksCleanseTagHouseGrannyText2:
	text "You were in mortal"
	line "danger, but you"
	cont "are protected now."
	done

SunpointDocksCleanseTagHouseTeacherText:
	text "My Grandma is into"
	line "warding off what"

	para "she believes to be"
	line "evil spirits."

	para "I'm sorry that she"
	line "startled you."
	done

SunpointDocksCleanseTagHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SUNPOINT_DOCKS, 4
	warp_event  3,  7, SUNPOINT_DOCKS, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, HouseForSaleBookshelf
	bg_event  1,  1, BGEVENT_READ, HouseForSaleBookshelf

	db 2 ; object events
	object_event  2,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SunpointDocksCleanseTagHouseGrannyScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SunpointDocksCleanseTagHouseTeacherScript, -1
