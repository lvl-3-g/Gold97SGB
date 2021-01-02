	object_const_def ; object constants
	const RIVALSHOUSE_RIVALS_MOM
	const RIVALSHOUSE_RIVALS_BROTHER

RivalsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalsMom:
	jumptextfaceplayer RivalsMomText

RivalsBrother:
	jumptextfaceplayer RivalsBrotherText


RivalsHouseBookshelf:
	jumpstd DifficultBookshelfScript

RivalsPCScript:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .RivalPCIsOff
	writetext AnEmailForRivalText
	yesorno
	iftrue .PlayerReadsRivalsMail
	writetext PlayerDoesntReadMailText
	waitbutton
	closetext
	end
	
.RivalPCIsOff
	writetext RivalPCIsOffText
	waitbutton
	closetext
	end

.PlayerReadsRivalsMail
	writetext RivalsEmailText
	waitbutton
	closetext
	end
	
AnEmailForRivalText:
	text "What's this?"
	para "An e-mail for"
	line "<RIVAL>?"
	para "Want to read it?"
	done
	
PlayerDoesntReadMailText:
	text "Right, it's not"
	line "good to read"
	para "other people's"
	line "mail…"
	done

RivalPCIsOffText:
	text "It appears to be"
	line "powered off…"
	done
	
RivalsEmailText:
	text "…"
	
	para "I hope you'll"
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

RivalsMomText:
	text "Hi, <PLAYER>! My"
	line "son's always so"
	cont "energetic."
	para "When he gets his"
	line "mind set on"
	para "something, he'll"
	line "just go at it,"
	cont "full speed ahead."
	done

RivalsBrotherText:
	text "The other day, I"
	line "saw a strangely-"
	cont "colored PIDGEY!"
	done




RivalsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SILENT_TOWN, 4
	warp_event  5,  7, SILENT_TOWN, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4,  0, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  5,  0, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  0,  1, BGEVENT_READ, RivalsPCScript

	db 2 ; object events
	object_event  5,  3, SPRITE_RIVALS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RivalsMom, -1
	object_event  2,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalsBrother, -1
