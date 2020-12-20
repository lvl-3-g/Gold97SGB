	object_const_def ; object_event constants
	const AMAMITATSUGOPATHGATE_OFFICER


AmamiTatsugoPathGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

AmamiTatsugoPathGuardScript:
	jumptextfaceplayer AmamiTatsugoPathGuardWelcomeText


AmamiTatsugoPathGuardWelcomeText:
	text "Head east from"
	line "here to get to"
	cont "KIKAI VILLAGE."
	para "But be ready to"
	line "face the heat of"
	cont "the CALDERA."
	done


AmamiTatsugoPathGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, AMAMI_TOWN, 4
	warp_event  1,  7, AMAMI_TOWN, 4
	warp_event  8,  7, TATSUGO_PATH, 1
	warp_event  9,  7, TATSUGO_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, AmamiTatsugoPathGuardScript, -1
