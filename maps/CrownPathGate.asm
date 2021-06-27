	object_const_def ; object_event constants
	const CROWNPATHGATE_OFFICER
	const CROWNPATHGATE_COOLTRAINERM
	const CROWNPATHGATE_COOLTRAINERF

CrownPathGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

CrownPathGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	jump CrownPathGateBadgeCheckScript

CrownPathGateOfficerScript:
	faceplayer
CrownPathGateBadgeCheckScript:
	opentext
	writetext CrownPathGateOfficerText
	buttonsound
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .NoPokemonEvenYet
	checkcode VAR_BADGES
	ifgreater NUM_NIHON_BADGES - 1, .AllEightBadges
	writetext CrownPathGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, CrownPathGateStepDownMovement
	end

.NoPokemonEvenYet
	writetext CrownPathGateNotEvenATrainer
	waitbutton
	closetext
	applymovement PLAYER, CrownPathGateStepDownMovement
	end

.AllEightBadges:
	writetext CrownPathGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

CrownPathGateStepDownMovement:
	step DOWN
	step_end
	
CrownPathGateCooltrainerMScript:
	jumptextfaceplayer CrownPathGateCooltrainerMText
	
CrownPathGateCooltrainerFScript:
	jumptextfaceplayer CrownPathGateCooltrainerFText
	
CrownPathGateCooltrainerMText:
	text "I can't believe"
	line "it!"
	para "It's almost time"
	line "for me to take on"
	cont "the LEAGUE!"
	para "I've been waiting"
	line "my whole life for"
	cont "this!"
	done
	
CrownPathGateCooltrainerFText:
	text "CROWN PATH may"
	line "be a cakewalk, but"
	para "the real challenge"
	line "is making it to"
	para "the top of MT.FUJI"
	line "from CROWN CITY."
	done
	
CrownPathGateNotEvenATrainer:
	text "You don't even"
	line "appear to be a"
	cont "#MON trainer."
	para "Sorry, kid. But I"
	line "can only let"
	para "qualified trainers"
	line "pass through."
	done

CrownPathGateOfficerText:
	text "Only trainers who"
	line "have proven them-"
	cont "selves may pass."
	done

CrownPathGateNotEnoughBadgesText:
	text "You don't have"
	line "eight BADGES."
	para "I'm sorry, but"
	line "only trainers with"
	para "enough BADGES are"
	line "permitted to enter"
	para "CROWN CITY and"
	line "climb MT.FUJI."
	done

CrownPathGateEightBadgesText:
	text "Ah! Eight BADGES!"

	para "You have proven"
	line "yourself worthy."
	para "Please, go on"
	line "through!"
	done

CrownPathGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 17, SILENT_NORTH, 1
	warp_event 10, 17, SILENT_NORTH, 1
	warp_event  9,  0, CROWN_PATH, 1
	warp_event 10,  0, CROWN_PATH, 2

	db 1 ; coord events
	coord_event 10, 11, SCENE_DEFAULT, CrownPathGateBadgeCheckScene

	db 0 ; bg events

	db 3 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CrownPathGateOfficerScript, -1
	object_event 12,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownPathGateCooltrainerMScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, CrownPathGateCooltrainerFScript, -1
