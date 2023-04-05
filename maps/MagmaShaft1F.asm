	object_const_def ; object_event constants
	const MAGMASHAFT1F_POKE_BALL
	const MAGMASHAFT1F_ENTEI

MagmaShaft1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MagmaShaft1FTMRest:
	itemball TM_REST

MagmaShaft1FHiddenBurnHeal:
	hiddenitem BURN_HEAL, EVENT_MAGMA_SHAFT_1F_HIDDEN_BURN_HEAL
	

EnteiEvent:
	faceplayer
	opentext
	writetext EnteiText
	cry ENTEI
	pause 15
	closetext
	setevent EVENT_ENTEI_APPEARS
	loadwildmon ENTEI, 40
	startbattle
	disappear MAGMASHAFT1F_ENTEI
	reloadmapafterbattle
	end
	
EnteiText:
	text "Groroa!"
	done

MagmaShaft1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1, 17, SUNPOINT_CITY, 2
	warp_event  3,  5, MAGMA_SHAFT_B1F, 1
	warp_event 15, 17, MAGMA_SHAFT_B2F, 8
	warp_event 12, 17, MAGMA_SHAFT_B2F, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5, 13, BGEVENT_ITEM, MagmaShaft1FHiddenBurnHeal

	db 2 ; object events
	object_event  0, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaft1FTMRest, EVENT_MAGMA_SHAFT_1F_TM_REST
	object_event 14,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EnteiEvent, EVENT_ENTEI_APPEARS
