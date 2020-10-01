	object_const_def ; object_event constants
	const SWISLANDS_HOSPITAL_NURSE
	const SWISLANDS_HOSPITAL_ROCKER
	const SWISLANDS_HOSPITAL_JANINE

WestportMagnetTrainStation_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SWIslandsHospitalJanine:
	jumptextfaceplayer SWIslandsHospitalJanineText

SWIslandsHospitalNurse:
	jumptextfaceplayer SWIslandsHospitalNurseText

SWIslandsHospitalRocker:
	jumptextfaceplayer SWIslandsHospitalRockerText
	
SWIslandsHospitalJanineText:
	text "Me and my boy-"
	line "friend are on"
	cont "vacation!"
	done
	
SWIslandsHospitalRockerText:
	text "I've never been to"
	line "SWISLANDS before."
	para "There's a lot to"
	line "see here."
	done

SWIslandsHospitalNurseText:
	text "#MON? No, this"
	line "is a hotel for"
	cont "people."
	para "We're full up."
	done

WestportMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  7, KANTO_REGION, 16
	warp_event  2,  7, KANTO_REGION, 16

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SWIslandsHospitalNurse, -1
	object_event 10,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SWIslandsHospitalRocker, -1
	object_event 12,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SWIslandsHospitalJanine, -1
