	object_const_def ; object_event constants
	const ENDONCAVE1F_POKEFAN_M
	const ENDONCAVE1F_POKEMANIAC
	const ENDONCAVE1F_ITEM_1

EndonCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


EndonCave1FTMDynamicpunch:
	itemball TM_DYNAMICPUNCH
	
EndonCave1FSuperPotion:
	itemball SUPER_POTION
	
EndonCave1FUltraBall:
	itemball ULTRA_BALL

EndonCave1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_ENDON_CAVE_1F_HIDDEN_MAX_REVIVE

EndonCave1FSteelShell:
	itemball STEEL_SHELL

EndonCave1FRichGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext EndonCave1FRichGuyText
	buttonsound
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext EndonCave1FRichGuyText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

TrainerPokemaniacCalvin:
	trainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacCalvinAfterBattleText
	waitbutton
	closetext
	end

EndonCave1FRichGuyText:
	text "Hello!"
	para "I may not look it,"
	line "but I'm fabulously"
	cont "wealthy."
	
	para "But alas! Wealth"
	line "does bore me."
	
	para "So I spend my time"
	line "wandering in"
	para "search of anything"
	line "that can amuse me."
	
	para "Right now, I've"
	line "decided to explore"
	cont "caves!"
	
	para "Caves are"
	line "fascinating!"
	
	para "It's so easy to"
	line "get lost in them!"
	
	para "Around every turn"
	line "is a new surprise!"
	
	para "Oh, and thank you"
	line "for listening!"
	
	para "Here, take this!"
	done

EndonCave1FRichGuyText_GotNugget:
	text "That's a NUGGET."

	para "It's worth a lot"
	line "of money."
	
	para "It's actually not"
	line "taken from my"
	cont "saved wealth!"
	
	para "I found it in this"
	line "cave!"
	
	para "Ahahahahah!"
	done
	
PokemaniacCalvinSeenText:
	text "I spend all my"
	line "time raising my"
	para "#MON in this"
	line "cave."
	para "I wish to battle"
	line "with you."
	done
	
PokemaniacCalvinBeatenText:
	text "…sigh… I must"
	line "train some more…"
	done

PokemaniacCalvinAfterBattleText:
	text "Have you ever been"
	line "to SANSKRIT TOWN?"
	para "It's a mysterious"
	line "place."
	done

EndonCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 15, ROUTE_117, 1
	warp_event 55, 15, ROUTE_117, 2
	warp_event 25,  5, ENDON_CAVE_2F, 1
	warp_event 51, 11, ENDON_CAVE_2F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7, 10, BGEVENT_ITEM, EndonCave1FHiddenMaxRevive

	db 6 ; object events
	object_event 16,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EndonCave1FRichGuyScript, -1
	object_event 14, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacCalvin, -1
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCave1FTMDynamicpunch, EVENT_ENDON_CAVE_1F_DYNAMICPUNCH
	object_event 16, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCave1FSuperPotion, EVENT_ENDON_CAVE_1F_SUPER_POTION
	object_event  3,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCave1FUltraBall, EVENT_ENDON_CAVE_1F_ULTRA_BALL
	object_event 48,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCave1FSteelShell, EVENT_ENDON_CAVE_1F_STEEL_SHELL

