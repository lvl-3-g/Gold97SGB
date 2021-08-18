FujiSummit_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_MOUNT_FUJI
	return

MountFujiSign:
	jumptext MountFujiSignText

MountFujiSignText:
	text "MT.FUJI"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "NIHON #MON"
	line "LEAGUE HQ"
	done

FujiSummit_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  9,  5, MOUNT_FUJI_POKECENTER_1F, 1
	warp_event 10,  5, MOUNT_FUJI_POKECENTER_1F, 2
	warp_event 10, 15, MT_FUJI_INTERIOR_UPPER, 4
	warp_event 11, 15, MT_FUJI_INTERIOR_UPPER, 4
	warp_event  8,  5, MOUNT_FUJI_POKECENTER_1F, 1
	warp_event 11,  5, MOUNT_FUJI_POKECENTER_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  7, BGEVENT_READ, MountFujiSign

	db 0 ; object events
