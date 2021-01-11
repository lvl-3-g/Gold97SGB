	object_const_def ; object_event constants
	const TEKNOSITEMFINDERHOUSE_COOLTRAINER_M
	const TEKNOSITEMFINDERHOUSE_POKEDEX

TeknosItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeknosItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext TeknosItemfinderAdventureText
	yesorno
	iffalse .no
	writetext TeknosItemfinderTrueSpiritText
	buttonsound
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext TeknosItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

TeknosHistoryBook:
	faceplayer
	opentext
	writetext TeknosHistoryBookText
	waitbutton
	closetext
	end


ItemFinderHouseRadio:
	jumpstd Radio2Script

TeknosItemfinderAdventureText:
	text "I can't thank you"
	line "enough for finding"
	cont "my granddaughter!"
	para "She needs to be"
	line "more mindful in"
	para "the future, but"
	line "right now I'm"
	para "just glad she's"
	line "okay!"
	para "You handled"
	line "yourself very well"
	cont "in the MINE."
	para "If you know where"
	line "to look, you can"
	para "find a lot of"
	line "interesting items"
	para "hidden in caves"
	line "like that."
	para "If you want, I can"
	line "give you something"
	para "that could help"
	line "you find more"
	cont "items."
	done

TeknosItemfinderTrueSpiritText:
	text "Here you go! Take"
	line "this with you."
	done

ItemfinderExplanationText:
	text "There are many"
	line "items lying about"

	para "that aren't ob-"
	line "vious."

	para "Use ITEMFINDER to"
	line "check if there is"

	para "an item on the"
	line "ground near you."

	para "It doesn't show"
	line "the exact spot,"

	para "so you'll have to"
	line "look yourself."
	done

TeknosItemfinderToEachHisOwnText:
	text "You sure? I think"
	line "you'd find this"
	cont "useful."
	done

TeknosHistoryBookText:
	text "Grandpa doesn't"
	line "want me playing in"
	cont "the MINE."
	para "I guess that makes"
	line "sense. He just"
	para "wants me to be"
	line "safe."
	done


TeknosItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 8
	warp_event  5,  7, TEKNOS_CITY, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 2 ; object events
	object_event  4,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TeknosItemfinderGuy, EVENT_GRAMPS_IS_AT_GRAMPS_HOUSE
	object_event  2,  6, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, TeknosHistoryBook, EVENT_GIRL_IS_BACK_AT_HOUSE
