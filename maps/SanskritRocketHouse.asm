	object_const_def ; object_event constants
	const SANSKRITROCKETHOUSE_KEY_GUY
	const SANSKRITROCKETHOUSE_BIRD
	const SANSKRITROCKETHOUSE_ROCKET_1
	const SANSKRITROCKETHOUSE_ROCKET_2
	const SANSKRITROCKETHOUSE_ROCKET_3
	const SANSKRITROCKETHOUSE_ITEM

SanskritRocketHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .RemoveKeyIfAlreadyHave

.RemoveKeyIfAlreadyHave:
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .RemoveThatKey
	return
	
.RemoveThatKey
	disappear SANSKRITROCKETHOUSE_ITEM
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	return


SanskritRocketHouseKeyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GiveKey
	writetext SanskritRocketHouseKeyGuyText
	waitbutton
	closetext
	end

.GiveKey:
	checkevent EVENT_TALKED_TO_ROCKET_WITH_KEY
	iftrue .AlreadyGotKey
	writetext SanskritRocketHouseKeyGuyTextKeyTime
	waitbutton
	closetext
	winlosstext RocketKey_WinText, RocketKey_LossText
	loadtrainer GRUNTM, GRUNTM_23
	startbattle
	reloadmapafterbattle
	jump .returnfrombattlerocketkey
	
	
.returnfrombattlerocketkey
	opentext
	writetext RocketKey_AfterText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_ROCKET_WITH_KEY
	setevent EVENT_KEY_GUY_IS_GONE
	appear SANSKRITROCKETHOUSE_ITEM
	clearevent EVENT_SANSKRIT_ROCKET_HOUSE_KEY_ITEM
	checkcode VAR_FACING
	ifequal LEFT, .walk_down_around_player
	applymovement SANSKRITROCKETHOUSE_KEY_GUY, KeyGuyRunsAwayInShame
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	end
	
.walk_down_around_player
	applymovement SANSKRITROCKETHOUSE_KEY_GUY, KeyGuyRunsAwayInShame2
	disappear SANSKRITROCKETHOUSE_KEY_GUY
	end

.AlreadyGotKey:; this is unused now
	writetext RocketKey_Afterwards
	waitbutton
	closetext
	end

SanskritRocketHouseBirdScript:
	faceplayer
	opentext
	writetext SanskritRocketHouseBirdText
	cry MURKROW
	waitbutton
	closetext
	end

SanskritRocketHouseRocket1Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN1KeyScript
	writetext SanskritRocketHouseRocket1Text
	waitbutton
	closetext
	end

.SN1KeyScript:
	writetext SanskritRocketHouseRocket1TextKey
	waitbutton
	closetext
	end

SanskritRocketHouseRocket2Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GMKeyScript
	writetext SanskritRocketHouseRocket2Text
	waitbutton
	closetext
	end

.GMKeyScript:
	writetext SanskritRocketHouseRocket2TextKey
	waitbutton
	closetext
	end


SanskritRocketHouseRocket3Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN2KeyScript
	writetext SanskritRocketHouseRocket3Text
	waitbutton
	closetext
	end

.SN2KeyScript:
	writetext SanskritRocketHouseRocket3TextKey
	waitbutton
	closetext
	end


SanskritRocketHousePoster:
	jumptext SanskritRocketHousePosterText

SanskritRocketHouseTelevisionSign:
	jumptext SanskritRocketHouseTelevisionSignText

SanskritRocketHouseReferenceLibrary:
; unreferenced
	jumptext SanskritRocketHouseReferenceLibraryText
	
KeyGuyRunsAwayInShame:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
KeyGuyRunsAwayInShame2:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
SanskritRocketHouseShipKeyItem:
	itemball BASEMENT_KEY

SanskritRocketHouseKeyGuyText:
	text "Ha!"
	para "Supplies are"
	line "rolling in fast"
	para "over at the SUN-"
	line "POINT DOCKS!"
	para "We've almost got"
	line "everything we need"
	para "to begin the next"
	line "phase of our plan!"
	para "The crew over in"
	line "STAND CITY will be"
	para "so impressed with"
	line "our work here!"
	done

SanskritRocketHouseBirdText:
	text "MURKROW: KRAWW!"
	done

SanskritRocketHouseRocket1Text:
	text "GAME CORNERS are"
	line "always reliable"
	cont "sources of income!"
	para "Remember that!"
	done
	
SanskritRocketHouseRocket1TextKey:
	text "Hm? A key?"
	para "Nah, I don't have"
	line "that."
	para "But why would you"
	line "want it?"
	para "Stay out of TEAM"
	line "ROCKET's way, kid!"
	done

SanskritRocketHouseRocket2Text:
	text "Some kid has been"
	line "messing with our"
	cont "plans."
	para "First the AQUARIUM"
	line "heist, then the"
	cont "SLOWPOKE WELL…"
	para "But it doesn't"
	line "matter!"
	para "Minor setbacks,"
	line "those were!"
	para "HA!"
	done

SanskritRocketHouseRocket2TextKey:
	text "What key?"
	line "I don't have any"
	cont "keys."
	para "Hey!"
	para "I hope you're not"
	line "that kid that's"
	para "been messing with"
	line "our plans!"
	para "Cut it out, if"
	line "you know what's"
	cont "good for you!"
	done


SanskritRocketHouseRocket3Text:
	text "Just a bit longer"
	line "until we can show"
	para "the world what"
	line "TEAM ROCKET is"
	cont "truly capable of!"
	done

SanskritRocketHouseRocket3TextKey:
	text "Nah, I don't have"
	line "any keys."
	para "The CAPTAIN"
	line "doesn't trust me"
	cont "with any of those."
	done

SanskritRocketHouseRocket3Text_GotExpnCard:
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "I'm responsible"
	line "for the gorgeous"

	para "melodies that go"
	line "out over the air."

	para "Don't be square."
	line "Grab your music"
	cont "off the air!"
	done

SanskritRocketHousePosterText:
	text "All #MON exist"
	line "for the glory of"
	cont "TEAM ROCKET!"
	done

SanskritRocketHouseTelevisionSignText:
	text "It's a rerun…"
	done

SanskritRocketHouseReferenceLibraryText:
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done
	
SanskritRocketHouseKeyGuyTextKeyTime:
	text "A SHIP KEY?"
	para "Maybe I have it."
	line "What's it to you?"
	done

RocketKey_WinText:
	text "What!?"
	done
	
RocketKey_LossText:
	text "Ha!"
	done
	
RocketKey_AfterText:
	text "Oh no, the CAPTAIN"
	line "will have my head"
	cont "for this!"
	done

RocketKey_AfterText2:
	text "Get out of here!"
	done
	
RocketKey_Afterwards:
	text "Don't talk to me!"
	done

SanskritRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, SANSKRIT_TOWN, 5
	warp_event 17,  7, SANSKRIT_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16,  2, BGEVENT_READ, SanskritRocketHousePoster
	bg_event  6,  1, BGEVENT_READ, SanskritRocketHouseTelevisionSign

	db 6 ; object events
	object_event  9,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseKeyGuyScript, EVENT_KEY_GUY_IS_GONE
	object_event 17,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseBirdScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket1Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 19,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket2Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 15,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseRocket3Script, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SanskritRocketHouseShipKeyItem, EVENT_SANSKRIT_ROCKET_HOUSE_KEY_ITEM
