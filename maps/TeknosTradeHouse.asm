	object_const_def ; object_event constants
	const PAGOTAKYLESHOUSE_POKEFAN_M
	const PAGOTAKYLESHOUSE_KYLE

TeknosTradeHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosTradeHousePokefanMScript:
	jumptextfaceplayer TeknosTradeHousePokefanMText

Kyle:
	faceplayer
	opentext
	trade NPC_TRADE_KYLE
	waitbutton
	closetext
	end

TeknosTradeHousePokefanMText:
	text "A #MON you get"
	line "in a trade grows"
	cont "quickly."

	para "But if you don't"
	line "have the right GYM"

	para "BADGE, they may"
	line "disobey you."
	done

TeknosTradeHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 14
	warp_event  5,  7, TEKNOS_CITY, 14

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosTradeHousePokefanMScript, -1
	object_event  7,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, Kyle, -1
