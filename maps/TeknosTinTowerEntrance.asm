	object_const_def ; object_event constants
	const TEKNOSTINTOWERENTRANCE_SAGE1
	const TEKNOSTINTOWERENTRANCE_SAGE2
	const TEKNOSTINTOWERENTRANCE_SAGE3
	const TEKNOSTINTOWERENTRANCE_GRAMPS

TeknosTinTowerEntrance_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

TeknosTinTowerEntranceSageBlocksLeft:
	checkevent EVENT_TEKNOS_TIN_TOWER_ENTRANCE_SAGE_RIGHT
	iftrue TeknosTinTowerEntranceAlreadyBlocked
	applymovement TEKNOSTINTOWERENTRANCE_SAGE2, TeknosTinTowerEntranceSageBlocksLeftMovement
	moveobject TEKNOSTINTOWERENTRANCE_SAGE1, 4, 6
	appear TEKNOSTINTOWERENTRANCE_SAGE1
	pause 5
	disappear TEKNOSTINTOWERENTRANCE_SAGE2
	end

TeknosTinTowerEntranceSageBlocksRight:
	checkevent EVENT_TEKNOS_TIN_TOWER_ENTRANCE_SAGE_LEFT
	iftrue TeknosTinTowerEntranceAlreadyBlocked
	applymovement TEKNOSTINTOWERENTRANCE_SAGE1, TeknosTinTowerEntranceSageBlocksRightMovement
	moveobject TEKNOSTINTOWERENTRANCE_SAGE2, 5, 6
	appear TEKNOSTINTOWERENTRANCE_SAGE2
	pause 5
	disappear TEKNOSTINTOWERENTRANCE_SAGE1
	end

TeknosTinTowerEntranceAlreadyBlocked:
	end

TeknosTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkflag ENGINE_FOGBADGE
	iftrue .BlockPassage_GotFogBadge
	writetext TeknosTinTowerEntranceSageText
	waitbutton
	closetext
	end

.BlockPassage_GotFogBadge:
	writetext TeknosTinTowerEntranceSageText_GotFogBadge
	waitbutton
	closetext
	end

TeknosTinTowerEntranceWanderingSageScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	writetext TeknosTinTowerEntranceWanderingSageText
	waitbutton
	closetext
	end

.GotRainbowWing:
	writetext TeknosTinTowerEntranceWanderingSageText_GotRainbowWing
	waitbutton
	closetext
	end

TeknosTinTowerEntranceGrampsScript:
	jumptextfaceplayer TeknosTinTowerEntranceGrampsText

TeknosTinTowerEntranceSageBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

TeknosTinTowerEntranceSageBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

TeknosTinTowerEntranceSageText:
	text "TIN TOWER is off"
	line "limits to anyone"

	para "without TEKNOS"
	line "GYM's BADGE."

	para "Sorry, but you'll"
	line "have to leave."
	done

TeknosTinTowerEntranceSageText_GotFogBadge:
	text "TIN TOWER is off"
	line "limits to anyone"

	para "without TEKNOS"
	line "GYM's BADGE."

	para "Ah!"

	para "TEKNOS's GYM"
	line "BADGE! Please, go"
	cont "right through."
	done

TeknosTinTowerEntranceWanderingSageText:
	text "The TIN TOWER up"
	line "ahead was built"

	para "as a roost for"
	line "flying #MON."
	done

TeknosTinTowerEntranceWanderingSageText_GotRainbowWing:
	text "The TIN TOWER"
	line "shook! A #MON"

	para "must have returned"
	line "to the top!"
	done

TeknosTinTowerEntranceGrampsText:
	text "Two towers…"
	line "Two #MON…"

	para "But when one"
	line "burned down, both"

	para "#MON flew away,"
	line "never to return."
	done

TeknosTinTowerEntrance_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 17, TEKNOS_CITY, 3
	warp_event  5, 17, TEKNOS_CITY, 3
	warp_event  5,  3, TEKNOS_TIN_TOWER_ENTRANCE, 4
	warp_event 17, 15, TEKNOS_TIN_TOWER_ENTRANCE, 3
	warp_event 17,  3, TEKNOS_TIN_TOWER_BACK_ENTRANCE, 3

	db 2 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, TeknosTinTowerEntranceSageBlocksLeft
	coord_event  5,  7, SCENE_DEFAULT, TeknosTinTowerEntranceSageBlocksRight

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosTinTowerEntranceSageScript, EVENT_TEKNOS_TIN_TOWER_ENTRANCE_SAGE_LEFT
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosTinTowerEntranceSageScript, EVENT_TEKNOS_TIN_TOWER_ENTRANCE_SAGE_RIGHT
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosTinTowerEntranceWanderingSageScript, -1
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosTinTowerEntranceGrampsScript, -1
