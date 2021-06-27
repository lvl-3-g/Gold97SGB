	object_const_def ; object_event constants
	const EARLMUSEUM_EARL
	const EARLMUSEUM_BIRD
	const EARLMUSEUM_DRAGON
	const EARLMUSEUM_LASS
	const EARLMUSEUM_POKEFAN_M

EarlsMuseum_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ArtHousePagotaTreeGone
	
.ArtHousePagotaTreeGone
	setevent EVENT_PAGOTA_TREE_CUT
	return

BirdScript:
	opentext
	writetext BirdText
	waitbutton
	closetext
	end

DragonScript:
	opentext
	writetext DragonText
	waitbutton
	closetext
	end

ArtistEarl:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext ArtistEarlIntroText
	buttonsound
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext ArtistEarlLickitungText
	buttonsound
	writetext ArtistEarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal LUXWAN, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	jump .ShowedLickitung

.GotEverstone:
	writetext ArtistEarlOddishText
	buttonsound
	writetext ArtistEarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal DRATINI, .WrongPokemon; edit here, change back to dratini
	scall .CorrectPokemon
	clearevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	jump .ShowedOddish


.ShowedOddish:
	scall .ReceiveItem
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	clearevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ExcitedToSee:
	writetext ArtistEarlExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext ArtistEarlYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext ArtistEarlShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext ArtistEarlTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext ArtistEarlComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext ArtistEarlShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext ArtistEarlWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end
	
EggStatue:
	jumptext EggStatueText

ArtSign:
	jumptext ArtSignText
	
ArtHouseLassScript:
	jumptextfaceplayer ArtHouseLassText
	
ArtHousePokefanMScript:
	jumptextfaceplayer ArtHousePokefanMText
	
ArtHousePokefanMText:
	text "This guy's work"
	line "is really impress-"
	cont "ive!"
	done
	
ArtHouseLassText:
	text "You know, I like"
	line "this EGG one the"
	cont "best."
	done

EggStatueText:
	text "#MON EGG STATUE"
	line "by EARL"
	done
	
ArtSignText:
	text "EARL'S ART HOUSE"
	para "Please look, but"
	line "do not touch."
	done

ArtistEarlIntroText:
	text "Oh, boo."
	para "I'm a failure."
	para "Don't ask why!"
	para "Alright, I'll tell"
	line "you."
	para "My name is EARL,"
	line "and I'm an artist."
	para "Or at least, I"
	line "wish I was a"
	cont "decent one."
	para "I never feel"
	line "inspired."
	para "I opened this"
	line "ART HOUSE to"
	para "show off my work,"
	line "but the only"
	para "sculpture I've"
	line "ever finished is"
	para "a sculpture of a"
	line "#MON EGG."
	para "I need to do"
	line "something"
	cont "impressive!"
	para "I've been working"
	line "on a statue of the"
	para "#MON LUXWAN,"
	line "but it's not quite"
	para "finished."
	done

ArtistEarlAskToSeeMonText:
	text "If you have that"
	line "#MON, may I see"
	cont "it, please?"
	done

ArtistEarlExcitedToSeeText:
	text "You will show me?"
	line "How good of you!"
	done

ArtistEarlYouDontHaveItTextText:
	text "You don't have it?"
	line "That's too bad…"
	done

ArtistEarlShownPokemonText:
	text "Ah, yes! That is"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "Thank you so much!"
	line "I feel inspired!"
	done

ArtistEarlTokenOfAppreciationText:
	text "This is a token of"
	line "my appreciation."
	done

ArtistEarlComeAgainText:
	text "Come by again"
	line "sometime."
	done

ArtistEarlShownAllThePokemonText:
	text "Thanks for showing"
	line "me those #MON."
	para "With your help,"
	line "I've made great"
	para "progress on my"
	line "dream!"
	done

ArtistEarlWrongPokemonText:
	text "Hm?"

	para "That's not the"
	line "#MON that I was"
	cont "thinking about."
	done

ArtistEarlLickitungText:
	text "If I could only"
	line "see a LUXWAN in"
	para "person, I might"
	line "feel inspired to"
	cont "finish my statue."
	done
	

ArtistEarlOddishText:
	text "I've finished my"
	line "LUXWAN statue!"
	para "Now I'd like to"
	line "finish my statue"
	cont "of a DRATINI."
	para "If I could only"
	line "see a DRATINI in"
	para "person, I might"
	line "feel inspired to"
	cont "finish my statue."
	done

	
BirdText:
	text "LUXWAN STATUE"
	line "by EARL"
	done
	
DragonText:
	text "DRATINI STATUE"
	line "by EARL"
	done

EarlsMuseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PAGOTA_CITY, 13
	warp_event  3,  7, PAGOTA_CITY, 14

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 4, BGEVENT_READ, EggStatue
	bg_event 2, 3, BGEVENT_READ, ArtSign

	db 5 ; object events
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArtistEarl, -1
	object_event  5,  4, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdScript, EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	object_event  9,  4, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArtHouseLassScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, ArtHousePokefanMScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
