	object_const_def ; object_event constants
;	const PAGOTACITY_EARL
	const PAGOTACITY_LASS
	const PAGOTACITY_SUPER_NERD
	const PAGOTACITY_GRAMPS
	const PAGOTACITY_YOUNGSTER
	const PAGOTACITY_FRUIT_TREE
	const PAGOTACITY_POKE_BALL1
	const PAGOTACITY_POKE_BALL2
	const PAGOTACITY_POKE_BALL3

PagotaCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .PagotaTreeCut
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_PAGOTA
	return

.PagotaTreeCut:
	checkevent EVENT_PAGOTA_TREE_CUT
	iffalse .PagotaTreeThere
	changeblock  9, 21, $6D ; notree
	return
	
.PagotaTreeThere
	return

PagotaCityLassScript:
	jumptextfaceplayer PagotaCityLassText

PagotaCitySuperNerdScript:
	jumptextfaceplayer PagotaCitySuperNerdText

PagotaCityGrampsScript:
	jumptextfaceplayer PagotaCityGrampsText

PagotaCityYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_PAGOTA_TREE_CUT
	iffalse .PagotaCityYoungsterScriptTree
	writetext PagotaCityYoungsterTextNoTree
	waitbutton
	closetext
	end
	
.PagotaCityYoungsterScriptTree
	writetext PagotaCityYoungsterTextTree
	waitbutton
	closetext
	end

KurtsHouseSign:
;	setevent EVENT_GOT_5F_SAGE_BLESSING
	jumptext KurtsHouseSignText

PagotaCitySign:
	jumptext PagotaCitySignText

PagotaGymSign:
	jumptext PagotaGymSignText

FiveFloorTowerSign:
	jumptext FiveFloorTowerSignText

PagotaPokemonAcademySign:
	jumptext PagotaPokemonAcademySignText

EarlsMuseumSign2:
	jumptext EarlsMuseumSign2Text

PagotaCityPokecenterSign:
	jumpstd PokecenterSignScript

PagotaCityMartSign:
	jumpstd MartSignScript

PagotaCityPPUp:
	itemball PP_UP

PagotaCityRareCandy:
	itemball RARE_CANDY
	
PagotaCityStimulusOrb:
	itemball STIMULUS_ORB
	

PagotaCityFruitTree:
	fruittree FRUITTREE_TREE_PAGOTA_CITY

PagotaCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_PAGOTA_CITY_HIDDEN_HYPER_POTION
	
KurtsDoorLockedScript:
	opentext
	writetext KurtsDoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, KurtsDoorLocked_Movement
	end
	
KurtsDoorLocked_Movement:
	step DOWN
	step_end


	
KurtsDoorLockedText:
	text "It's locked…"
	done

	
PagotaCityLassText:
	text "Ghosts are rumored"
	line "to appear in"
	cont "5 FLOOR TOWER."

	para "They said normal-"
	line "type #MON moves"

	para "had no effect on"
	line "ghosts."
	done

PagotaCitySuperNerdText:
	text "Hey, you're a"
	line "#MON trainer?"

	para "If you beat the"
	line "GYM LEADER here,"

	para "you'll be ready"
	line "for prime time!"
	done

PagotaCityGrampsText:
	text "FALKNER, from the"
	line "PAGOTA CITY"

	para "GYM, is a fine"
	line "trainer!"

	para "His flying-type"
	line "bird #MON are"
	para "trained to perform"
	line "in parades and"
	cont "other events."
	done

PagotaCityYoungsterTextTree:
	text "Behind me is the"
	line "5 FLOOR TOWER!"
	para "But getting to it"
	line "can be difficult"
	para "because of this"
	line "tree that's in the"
	cont "way."
	done
	
PagotaCityYoungsterTextNoTree:
	text "Cool! Now that the"
	line "tree is gone, I"
	para "can go play in the"
	line "tower!"
	done

PagotaCitySignText:
	text "PAGOTA CITY"

	para "Timeless As the"
	line "Stars Above"
	done

PagotaGymSignText:
	text "PAGOTA CITY"
	line "#MON GYM"
	cont "LEADER: FALKNER"

	para "The Elegant Master"
	line "of Flying #MON"
	done

FiveFloorTowerSignText:
	text "5 FLOOR TOWER"

	para "Experience the"
	line "Way of #MON"
	done

PagotaPokemonAcademySignText:
	text "EARL'S ART HOUSE"
	done
	
KurtsHouseSignText:
	text "KURT'S HOUSE"
	done
	
EarlsMuseumSign2Text:
	text "BILL'S HOUSE"
	done
	


PagotaCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event  3, 26, PAGOTA_MART, 1
	warp_event 26, 14, PAGOTA_GYM, 1
	warp_event 27, 14, PAGOTA_GYM, 2
	warp_event 10, 26, PAGOTA_NICKNAME_SPEECH_HOUSE, 1
	warp_event 27, 28, PAGOTA_POKECENTER_1F, 1
	warp_event 22, 26, PAGOTA_POKEMON_ACADEMY, 1
	warp_event 11, 17, FIVE_FLOOR_TOWER_1F, 1
	warp_event 19, 30, ROUTE_101_PAGOTA_GATE, 2
	warp_event 18, 30, ROUTE_101_PAGOTA_GATE, 1
	warp_event  3, 31, KURTS_HOUSE, 1
	warp_event 29, 22, KURTS_HOUSE, 5
	warp_event 12, 17, FIVE_FLOOR_TOWER_1F, 2
	warp_event  4, 14, EARLS_MUSEUM, 1
	warp_event  5, 14, EARLS_MUSEUM, 2
	warp_event 30, 22, BILLS_FAMILYS_HOUSE, 1

	db 1 ; coord events
	coord_event  3, 32, SCENE_KURTS_HOUSE_LOCKED, KurtsDoorLockedScript


	db 9 ; bg events
	bg_event 20, 29, BGEVENT_READ, PagotaCitySign
	bg_event 28, 16, BGEVENT_READ, PagotaGymSign
	bg_event  8, 16, BGEVENT_READ, FiveFloorTowerSign
	bg_event  8, 14, BGEVENT_READ, PagotaPokemonAcademySign
	bg_event 28, 28, BGEVENT_READ, PagotaCityPokecenterSign
	bg_event  4, 26, BGEVENT_READ, PagotaCityMartSign
	bg_event 24,  4, BGEVENT_ITEM, PagotaCityHiddenHyperPotion
	bg_event  4, 32, BGEVENT_READ, KurtsHouseSign
	bg_event 26, 22, BGEVENT_READ, EarlsMuseumSign2

	db 9 ; object events
	object_event 26, 30, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_SCRIPT, 0, PagotaCityLassScript, -1
	object_event 24, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, PagotaCitySuperNerdScript, -1
	object_event 15, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityGrampsScript, -1
	object_event 10, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityYoungsterScript, -1
	object_event 17, 17, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityFruitTree, -1
	object_event 14, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityPPUp, EVENT_PAGOTA_CITY_PP_UP
	object_event 23,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityRareCandy, EVENT_PAGOTA_CITY_RARE_CANDY
	object_event 16,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityStimulusOrb, EVENT_PAGOTA_CITY_STIMULUS_ORB
