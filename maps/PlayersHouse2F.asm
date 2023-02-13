	object_const_def ; object_event constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL
	const PLAYERSHOUSE2F_CLEFAIRY
	const PLAYERSHOUSE2F_KEN

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	return

.SkipInitialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler
	
MeetKenScript:
	turnobject PLAYER, LEFT
	turnobject PLAYERSHOUSE2F_KEN, RIGHT
PlayersHouse2F_Ken:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AT_BEGINNING
	iftrue .KenPart2
	writetext KenGreeting1
	setevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	checkevent EVENT_READ_OAKS_EMAIL
	iffalse .KenEmailScript
	waitbutton
	closetext
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.KenEmailScript
	waitbutton
	writetext KenGreeting1pt2
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .DontNeedToWalk
	applymovement PLAYER, PlayerToReadEmailMovement
	turnobject PLAYERSHOUSE2F_KEN, DOWN
	end
	
.DontNeedToWalk
	end
	
.KenPart2
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .KenGiveMapCard
	writetext KenGreeting2
	waitbutton
	closetext
	end
	
.KenGiveMapCard
	checkflag ENGINE_MAP_CARD
	iftrue .KenAlreadyGaveMap
	writetext KenGreeting3
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext KenGreeting4
	waitbutton
	closetext
	end
	
.KenAlreadyGaveMap
	writetext KenGreeting5
	waitbutton
	closetext
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"
	


Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .NormalRadio
	opentext
	writetext PlayersRadioText1
	waitbutton
	closetext
	end

.NormalRadio:
	checkevent EVENT_ROUTE_102_SILVER
	iftrue .NormalRadio2
	opentext
	writetext PlayersRadioText5
	waitbutton
	closetext
	end	
	
.NormalRadio2
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHouseBookshelfScript:
	jumpstd PictureBookshelfScript

PlayersHousePCScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .PlayersHousePC2
	opentext
	playsound SFX_BOOT_PC
	writetext PlayersRadioText2
	yesorno
	iffalse DontReadEmailNow
	writetext PlayersRadioTextNew
	waitbutton
	closetext
	setevent EVENT_READ_OAKS_EMAIL
	checkevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	iffalse .DontSetKenScene
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.DontSetKenScene
	end

.Warp:
	warp NONE, 0, 0
	end

.PlayersHousePC2
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
	
DontReadEmailNow:
	writetext NoTimeToReadEmail
	waitbutton
	closetext
	end

PlayersDollScript:
	opentext
	writetext PlayersDollText
	waitbutton
	closetext
	end
	
PlayerToReadEmailMovement:
	step DOWN
	step_end
	
NoTimeToReadEmail:
	text "No time right"
	line "now…"
	done
	
PlayersRadioText5:
	text "Looks like it"
	line "isn't on…"
	done
	
KenGreeting1:
	text "KEN: Hey, bro!"
	para "That shiny thing"
	line "on your wrist…"
	para "You finally got"
	line "a #GEAR!"
	para "It won't do very"
	line "much right out of"
	cont "the box, though…"
	para "Maybe I'll get you"
	line "the MAP CARD"
	cont "upgrade!"
	para "You know, if there"
	line "was ever a reason"
	cont "you'd need it."
	para "Come see me later"
	line "before you head"
	cont "out anywhere!"
	done
	
KenGreeting1pt2:
	text "Oh, yeah!"
	para "I think I saw that"
	line "you got a new"
	cont "e-mail on your PC."
	para "You might want to"
	line "check that before"
	cont "you leave."
	done
	
KenGreeting2:
	text "Come see me later"
	line "before you head"
	cont "out anywhere!"
	done
	
KenGreeting3:
	text "KEN: Hey, bro!"
	para "PROF.OAK asked you"
	line "to help him make"
	cont "a new #DEX?"
	para "Wow, good thing I"
	line "got this for you!"
	done
	
KenGreeting4:
	text "Now your #GEAR"
	line "can help you keep"
	para "track of where you"
	line "are at!"
	para "You'll never get"
	line "lost with this!"
	para "Also, guess what?"
	para "I got an interview"
	line "for a job as a"
	para "radio DJ in"
	line "WESTPORT CITY!"
	para "I could be on the"
	line "radio, bro!"
	para "Wish me luck!"
	para "And good luck out"
	line "there to you, too!"
	done
	
KenGreeting5:
	text "I got an interview"
	line "for a job as a"
	para "radio DJ in"
	line "WESTPORT CITY!"
	para "I could be on the"
	line "radio, bro!"
	para "Wish me luck!"
	para "And good luck out"
	line "there to you, too!"
	done

PlayersDollText:
	text "It's a doll you"
	line "got as a Christmas"
	para "present from a"
	line "relative in KANTO."
	done

PlayersRadioText1:
	text "<PLAYER> turned"
	line "on the radio."
	
	para "…"

	para "You're listening"
	line "to JOPM, the"
	para "#MON broadcast"
	line "station!"
	
	para "Coming up next is"
	line "#MON News!"
	
	para "… World famous"
	line "#MON researcher"
	para "PROF. OAK has"
	line "disappeared from"
	cont "KANTO!"
	
	para "Although some"
	line "consider he may"
	para "have moved in"
	line "search of a new"
	para "place to study,"
	line "there is also"
	para "the possibility"
	line "he was involved"
	para "in some sort of"
	line "incident."
	
	para "Concerned parties"
	line "are very worried."
	
	para "…"
	
	para "And that was"
	line "#MON News."
	
	para "…"
	
	
	
	done

PlayersRadioText2:
	text "<PLAYER> turned"
	line "on the PC."
	
	para "What's this?"
	line "A new e-mail?"
	
	para "Want to read it?"
	
	done
	
PlayersRadioTextNew:
	text "I hope you'll"
	line "excuse the sudden"
	para "e-mail, but there"
	line "is something that"
	para "I would like to"
	line "entrust you with."
	
	para "Won't you come by"
	line "to collect it?"
	
	para "#MON researcher"
	line "OAK"
	
	done

PlayersRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  0, PLAYERS_HOUSE_1F, 3

	db 1 ; coord events
	coord_event  9,  1, SCENE_DEFAULT, MeetKenScript


	db 5 ; bg events
	bg_event  3,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  8,  0, BGEVENT_IFSET, PlayersHousePosterScript

	db 6 ; object events
	object_event  7,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  6, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  6, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  6, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	object_event  6,  1, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersDollScript, -1
	object_event  8,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouse2F_Ken, EVENT_ROUTE_102_SILVER
