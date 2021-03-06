	object_const_def ; object_event constants
	const WESTPORTHAPPINESSRATER_TEACHER
	const WESTPORTHAPPINESSRATER_POKEFAN_M
	const WESTPORTHAPPINESSRATER_TWIN
	

WestportHappinessRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext WestportHappinessRaterTeacherText
	buttonsound
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	jump .LooksMean

.LovesYouALot:
	writetext WestportHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext WestportHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext WestportHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext WestportHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext WestportHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext WestportHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

WestportHappinessRaterPokefanMScript:
	jumptextfaceplayer WestportHappinessRaterPokefanMText

WestportHappinessRaterTwinScript:
	jumptextfaceplayer WestportHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd DifficultBookshelfScript

HappinessRatersHouseRadio:
	jumpstd Radio2Script

WestportHappinessRaterTeacherText:
	text "If you treat your"
	line "#MON nicely,"

	para "they will love you"
	line "in return."

	para "Oh? Let me see"
	line "your @"
	text_ram wStringBuffer3
	text "…"
	done

WestportHappinessRatingText_LovesYouALot:
	text "It looks really"
	line "happy! It must"
	cont "love you a lot."
	done

WestportHappinessRatingText_ReallyTrustsYou:
	text "I get the feeling"
	line "that it really"
	cont "trusts you."
	done

WestportHappinessRatingText_SortOfHappy:
	text "It's friendly to-"
	line "ward you. It looks"
	cont "sort of happy."
	done

WestportHappinessRatingText_QuiteCute:
	text "It's quite cute."
	done

WestportHappinessRatingText_NotUsedToYou:
	text "You should treat"
	line "it better. It's"
	cont "not used to you."
	done

WestportHappinessRatingText_LooksMean:
	text "It doesn't seem to"
	line "like you at all."
	cont "It looks mean."
	done

WestportHappinessRaterPokefanMText:
	text "I keep losing in"
	line "battles, and my"

	para "#MON end up"
	line "fainting…"

	para "Maybe that's why"
	line "my #MON don't"
	cont "like me much…"
	done

WestportHappinessRaterTwinText:
	text "When I use an item"
	line "on my #MON, it"
	cont "acts really glad!"
	done

WestportHappinessRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, WESTPORT_CITY, 2
	warp_event  5,  7, WESTPORT_CITY, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, HappinessRatersHouseRadio

	db 3 ; object events
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterTeacherScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterPokefanMScript, -1
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportHappinessRaterTwinScript, -1
