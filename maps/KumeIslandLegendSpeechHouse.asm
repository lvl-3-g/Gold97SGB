	object_const_def ; object_event constants
	const KUMEISLANDLEGENDSPEECHHOUSE_LADY

KumeIslandLegendSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KumeIslandLegendSpeechHouseLadyScript:
	faceplayer
	opentext
	writetext KumeIslandLegendSpeechHouseLadyText1
	yesorno
	iffalse .TellLegend
	writetext KumeIslandLegendSpeechHouseLadyText2
	waitbutton
	closetext
	end
	
.TellLegend
	writetext KumeIslandLegendSpeechHouseLadyText3
	waitbutton
	closetext
	end
	
KumeIslandLegendSpeechHouseLadyText1:
	text "Have you heard any"
	line "of our local"
	cont "legends?"
	done
	
KumeIslandLegendSpeechHouseLadyText2:

	text "Ah, then I won't"
	line "bother repeating"
	cont "them."
	done

KumeIslandLegendSpeechHouseLadyText3:
	text "Allow me to share"
	line "with you, then…"
	para "According to tales"
	line "told through many"
	cont "generations,"
	para "three mythical"
	line "bird #MON of"
	para "fire, ice, and"
	line "thunder watch over"
	cont "our ISLANDS."
	para "The three of them"
	line "work together in"
	para "harmony to keep"
	line "the delicate"
	para "balance of nature"
	line "intact."
	para "It is said they"
	line "roost within JOULE"
	para "CAVE, on top of"
	line "CHARRED SUMMIT,"
	para "and right behind"
	line "us in the ICED"
	cont "CAVERN."
	para "No one I know has"
	line "ever seen them."
	para "The legend is that"
	line "they will only"
	para "show themselves to"
	line "a person who has"
	para "something that"
	line "has the essence"
	para "of all three of"
	line "them…"
	para "I wonder what that"
	line "could be…"
	done
	
	

KumeIslandLegendSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KUME_CITY, 4
	warp_event  5,  7, KUME_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KumeIslandLegendSpeechHouseLadyScript, -1
