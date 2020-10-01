	object_const_def ; object_event constants
	const OLDMAHOGANYMART1F_PHARMACIST
	const OLDMAHOGANYMART1F_BLACK_BELT
	const OLDMAHOGANYMART1F_LANCE
	const OLDMAHOGANYMART1F_DRAGONITE
	const OLDMAHOGANYMART1F_GRANNY

OldMahoganyMart1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_OLDMAHOGANYMART1F_NOTHING
	scene_script .LanceUncoversStaircase ; SCENE_OLDMAHOGANYMART1F_LANCE_UNCOVERS_STAIRS

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .OldMahoganyMart1FStaircase

.DummyScene0:
	end

.LanceUncoversStaircase:
	prioritysjump OldMahoganyMart1FLanceUncoversStaircaseScript
	end

.OldMahoganyMart1FStaircase:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_OLD_MAHOGANY_MART
	iftrue .ShowStairs
	return

.ShowStairs:
	changeblock 6, 2, $1e ; stairs
	return

OldMahoganyMart1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .LanceEntered
	pokemart MARTTYPE_STANDARD, MART_SANSKRIT_1
	closetext
	end

.LanceEntered:
	writetext OldMahoganyMart1FPharmacistText_LanceEntered
	waitbutton
	closetext
	end

OldMahoganyMart1FBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .LanceEntered
	writetext OldMahoganyMart1FBlackBeltText
	waitbutton
	closetext
	end

.LanceEntered:
	writetext OldMahoganyMart1FBlackBeltText_LanceEntered
	waitbutton
	closetext
	end

OldMahoganyMart1FLanceUncoversStaircaseScript:
	pause 15
	opentext
	writetext OldMahoganyMart1FLanceDragoniteHyperBeamText
	pause 15
	closetext
	playsound SFX_TACKLE
	applymovement OLDMAHOGANYMART1F_DRAGONITE, OldMahoganyMart1FDragoniteTackleMovement
	applymovement OLDMAHOGANYMART1F_BLACK_BELT, OldMahoganyMart1FBlackBeltKnockedBackMovement
	pause 15
	disappear OLDMAHOGANYMART1F_DRAGONITE
	pause 15
	applymovement OLDMAHOGANYMART1F_LANCE, OldMahoganyMart1FLanceApproachPlayerMovement
	opentext
	writetext OldMahoganyMart1FLanceRadioText
	waitbutton
	closetext
	follow OLDMAHOGANYMART1F_LANCE, PLAYER
	applymovement OLDMAHOGANYMART1F_LANCE, OldMahoganyMart1FLanceApproachPharmacistMovement
	applymovement OLDMAHOGANYMART1F_PHARMACIST, OldMahoganyMart1FPharmacistShovedAsideMovement
	applymovement OLDMAHOGANYMART1F_LANCE, OldMahoganyMart1FLanceApproachHiddenStairsMovement
	stopfollow
	opentext
	writetext OldMahoganyMart1FLanceStairsText
	waitbutton
	showemote EMOTE_SHOCK, OLDMAHOGANYMART1F_PHARMACIST, 10
	playsound SFX_FAINT
	changeblock 6, 2, $1e ; stairs
	reloadmappart
	closetext
	setevent EVENT_UNCOVERED_STAIRCASE_IN_OLD_MAHOGANY_MART
	turnobject OLDMAHOGANYMART1F_LANCE, LEFT
	opentext
	writetext OldMahoganyMart1FLanceSplitUpText
	waitbutton
	closetext
	applymovement OLDMAHOGANYMART1F_LANCE, OldMahoganyMart1FLanceGoDownStairsMovement
	playsound SFX_EXIT_BUILDING
	disappear OLDMAHOGANYMART1F_LANCE
	setscene SCENE_OLDMAHOGANYMART1F_NOTHING
	waitsfx
	end

OldMahoganyMart1FGrannyScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_SANSKRIT_2
	closetext
	end

OldMahoganyMart1FDragoniteTackleMovement:
	fix_facing
	big_step LEFT
	big_step RIGHT
	remove_fixed_facing
	step_end

OldMahoganyMart1FBlackBeltKnockedBackMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

OldMahoganyMart1FPharmacistShovedAsideMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

OldMahoganyMart1FLanceApproachPlayerMovement:
	slow_step LEFT
	turn_head DOWN
	step_end

OldMahoganyMart1FLanceApproachPharmacistMovement:
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

OldMahoganyMart1FLanceApproachHiddenStairsMovement:
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	step_end

OldMahoganyMart1FLanceGoDownStairsMovement:
	slow_step RIGHT
	step_end

OldMahoganyMart1FRageCandyBarText: ; unreferenced
	text "Hello, youngster!"

	para "How would you like"
	line "some RAGECANDYBAR?"

	para "It's the thing to"
	line "eat in SANSKRIT!"
	done

OldMahoganyMart1FPharmacistText_LanceEntered:
	text "Arrgh… You found"
	line "the secret stair-"
	cont "way…"
	done

OldMahoganyMart1FBlackBeltText:
	text "Heheh! The experi-"
	line "ment worked like a"
	cont "charm."

	para "MAGIKARP are just"
	line "worthless, but"

	para "GYARADOS are big"
	line "moneymakers."
	done

OldMahoganyMart1FBlackBeltText_LanceEntered:
	text "Urrgh…"

	para "That guy's dragon"
	line "#MON are tough…"
	done

OldMahoganyMart1FLanceDragoniteHyperBeamText:
	text "LANCE: DRAGONITE,"
	line "HYPER BEAM."
	done

OldMahoganyMart1FLanceRadioText:
	text "What took you,"
	line "<PLAYER>?"

	para "Just as I thought,"
	line "that strange radio"

	para "signal is coming"
	line "from here."
	done

OldMahoganyMart1FLanceStairsText:
	text "The stairs are"
	line "right here."
	done

OldMahoganyMart1FLanceSplitUpText:
	text "LANCE: <PLAYER>, we"
	line "should split up to"

	para "check this place."
	line "I'll go first."
	done

OldMahoganyMart1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SANSKRIT_TOWN, 1
	warp_event  4,  7, SANSKRIT_TOWN, 1
	warp_event  7,  3, TEAM_ROCKET_BASE_OFFICE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldMahoganyMart1FPharmacistScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  1,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldMahoganyMart1FBlackBeltScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OLD_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  3,  6, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OLD_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldMahoganyMart1FGrannyScript, EVENT_OLD_MAHOGANY_MART_OWNERS
