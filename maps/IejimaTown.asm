	object_const_def ; object_event constants
	const IEJIMA_GRAMPS
	const IEJIMA_BIKER1
	const IEJIMA_BIKER2
	const IEJIMA_BIKER3
	const IEJIMA_YOUNGSTER
	const IEJIMA_BIKER4
	const IEJIMA_BIKER5
	const IEJIMA_BIKER6
	const IEJIMA_SWIMMERF
	const IEJIMA_SWIMMERM
	const IEJIMA_LASS
	const IEJIMA_TRIWING

IejimaTown_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .NoWater

.NoWater:
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iftrue .IejimaTownFixed
	changeblock  11,  7, $7A ; floor
	changeblock  13,  7, $7A ; floor
	changeblock  15,  7, $7A ; floor
	changeblock  17,  7, $7A ; floor
	changeblock  13,  9, $7A ; floor
	changeblock  15,  9, $7A ; floor
	changeblock  17,  9, $7A ; floor
	changeblock  11, 11, $7A ; floor
	changeblock  13, 11, $7A ; floor
	changeblock  15, 11, $7A ; floor
	changeblock  17, 11, $7A ; floor
	changeblock  15, 13, $7A ; floor
	changeblock  13, 13, $7A ; floor
	changeblock  11, 13, $7A ; floor
	changeblock  19, 11, $7A ; floor
	changeblock  19,  9, $7A ; floor
	changeblock  19,  7, $6B ; rock
	changeblock  17, 13, $6B ; rock
	changeblock  11,  9, $6B ; rock
	changeblock  13,  1, $60 ; dry
	changeblock  13,  3, $60 ; dry
	changeblock  13,  5, $60 ; dry
	changeblock  15,  1, $60 ; dry
	changeblock  15,  3, $60 ; dry
	changeblock  15,  5, $60 ; dry
	changeblock  17,  1, $60 ; dry
	changeblock  17,  3, $60 ; dry
	changeblock  17,  5, $60 ; dry
	changeblock   9,  7, $10 ; left edge
	changeblock   9,  9, $10 ; left edge
	changeblock   9, 11, $10 ; left edge
	changeblock   9, 13, $10 ; left edge
	changeblock  21,  7, $12 ; right edge
	changeblock  21,  9, $12 ; right edge
	changeblock  21, 11, $12 ; right edge
	return
	
.IejimaTownFixed
	return
	
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_IEJIMA
	return
	
IejimaTownPokecenterSign:
	jumpstd PokecenterSignScript
	
IejimaTownGrampsBefore:
	jumptextfaceplayer IejimaTownGrampsBeforeText
	
IejimaTownBiker1:
	jumptextfaceplayer IejimaTownBiker1Text
	
IejimaTownBiker2:
	jumptextfaceplayer IejimaTownBiker2Text
	
IejimaTownBiker3:
	jumptextfaceplayer IejimaTownBiker3Text	
	
	
IejimaTownBiker4:
	jumptextfaceplayer IejimaTownBiker4Text
	
	
IejimaTownBiker5:
	jumptextfaceplayer IejimaTownBiker5Text
	
	
IejimaTownBiker6:
	jumptextfaceplayer IejimaTownBiker6Text
	
IejimaTownTriWingItem:
	turnobject IEJIMA_YOUNGSTER, DOWN
	opentext
	writetext ItemWashedUpText
	waitbutton
	closetext
	disappear IEJIMA_TRIWING
	opentext
	waitsfx
	giveitem TRI_WING
	writetext GotTriWingText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
IejimaTownLass:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .LassNotFixedYet
	writetext IejimaTownLassText
	waitbutton
	closetext
	end
	
.LassNotFixedYet
	writetext IejimaTownLassText2
	waitbutton
	closetext
	end

IejimaTownYoungster:
	faceplayer
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .YoungsterNotFixedYet
	checkevent EVENT_IEJIMA_TOWN_TRI_WING
	iffalse .GetTriWing
	writetext IejimaTownYoungsterText
	waitbutton
	closetext
	end
	
.GetTriWing
	writetext ItemWashedUpText
	waitbutton
	closetext
	pause 15
	turnobject IEJIMA_YOUNGSTER, DOWN
	disappear IEJIMA_TRIWING
	pause 15
	faceplayer
	opentext
	waitsfx
	giveitem TRI_WING
	writetext GotTriWingText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
.YoungsterNotFixedYet
	writetext IejimaTownYoungsterText2
	waitbutton
	closetext
	end
	
IejimaTownSwimmerGirl:
	jumptextfaceplayer IejimaTownSwimmerGirlText
	
IejimaTownSwimmerGuy:
	jumptextfaceplayer IejimaTownSwimmerGuyText
	
ItemWashedUpText:
	text "Hey, check this"
	line "out!"
	para "Something washed"
	line "onto the shore"
	para "when the water"
	line "started flowing"
	cont "again!"
	para "It looks like a"
	line "wing of some sort."
	para "I don't know what"
	line "to do with this,"
	cont "so you take it!"
	done
	
GotTriWingText:
	text "<PLAYER> got"
	line "TRI-WING!"
	done
	
IejimaTownLassText:
	text "I'm glad things"
	line "are okay at the"
	cont "HYDRO PLANT now."
	done
	
IejimaTownLassText2:
	text "The waterfall and"
	line "the pond it feeds"
	para "into are the pride"
	line "and joy of this"
	cont "town."
	para "It's definitely"
	line "bad that the water"
	cont "isn't flowing now."
	done
	
IejimaTownSwimmerGirlText:
	text "This pond is so"
	line "peaceful."
	done
	
IejimaTownSwimmerGuyText:
	text "I like swimming"
	line "laps around here"
	cont "to exercise!"
	done
	
IejimaTownBiker4Text:
	text "We got chased"
	line "out of the basin"
	cont "by some cops."
	para "Good thing, too,"
	line "cause the water"
	cont "started flowing!"
	done
	
IejimaTownBiker5Text:
	text "People really"
	line "didn't like it"
	para "when we stopped"
	line "the waterfall."
	para "Maybe we shouldn't"
	line "do that again if"
	para "we want to stay"
	line "out of trouble."
	done

IejimaTownBiker6Text:
	text "I'm up for riding"
	line "somewhere else."
	done
	
IejimaTownBiker1Text:
	text "Hehe!"
	para "This place is"
	line "great for riding"
	cont "our bikes around!"
	done
	
IejimaTownBiker2Text:
	text "Watch out, IEJIMA"
	line "TOWN!"
	para "We're here to"
	line "stay!"
	done
	
IejimaTownBiker3Text:
	text "This land has"
	line "dried up now that"
	para "we closed the dam"
	line "in the HYDRO"
	cont "PLANT!"
	para "There's so much"
	line "room to ride!"
	done
	
IejimaTownYoungsterText:
	text "It's so nice to"
	line "stand here by"
	cont "the water."
	done
	
IejimaTownYoungsterText2:
	text "This is horrible!"
	para "The water should"
	line "be coming up to"
	cont "my feet here!"
	para "What could be"
	line "going on at the"
	cont "HYDRO PLANT?"
	done
	
IejimaTownGrampsBeforeText:
	text "Oh, dear!"
	para "What has happened"
	line "to our beloved"
	cont "waterfall?"
	para "This has to have"
	line "something to do"
	para "with all of these"
	line "BIKERS that have"
	cont "shown up here!"
	done

IejimaTown_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 23,  7, MOTOBU_PATH_IEJIMA_GATE, 1
	warp_event  1,  6, IEJIMA_POKECENTER_1F, 1
	warp_event  7, 15, IEJIMA_HOUSE_1, 1
	warp_event 19, 14, IEJIMA_HOUSE_2, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  6, BGEVENT_READ, IejimaTownPokecenterSign

	db 12 ; object events
	object_event 13,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IejimaTownGrampsBefore, EVENT_IEJIMA_TOWN_FIXED
	object_event 11, 11, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker1, EVENT_IEJIMA_TOWN_FIXED
	object_event 15, 12, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker2, EVENT_IEJIMA_TOWN_FIXED
	object_event 16,  8, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker3, EVENT_IEJIMA_TOWN_FIXED
	object_event  7, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownYoungster, -1
	object_event 14, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker4, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 13, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker5, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 12, 14, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownBiker6, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 12,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IejimaTownSwimmerGirl, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 17, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, IejimaTownSwimmerGuy, EVENT_IEJIMA_TOWN_NOT_FIXED
	object_event 24, 11, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IejimaTownLass, -1
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IejimaTownTriWingItem, EVENT_IEJIMA_TOWN_TRI_WING
