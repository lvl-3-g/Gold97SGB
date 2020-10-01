	object_const_def ; object_event constants
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_RED_IN_KANTO_GYM
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterRinring
	yesorno
	iffalse .refusetotakeshuckie
	special GiveRinring
	iffalse .partyfull
	writetext ManiaText_TakeCareOfRinring
	promptbutton
	waitsfx
	writetext ManiaText_GotRinring
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_RED_IN_KANTO_GYM
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfRinring
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnRinring
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_RinringNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_RinringLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft
	writetext ManiaText_RinringIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf:
; unused
	jumpstd PictureBookshelfScript

ManiaText_AskLookAfterRinring:
	text "I, I'm in shock!"

	para "A guy about your"
	line "age with piercing"

	para "eyes and long hair"
	line "came in."

	para "He scared me into"
	line "giving him my"
	cont "prized #MON!"

	para "I still have one"
	line "left, but what if"
	cont "he comes back?"

	para "You look strong."
	line "Could you look"

	para "after my #MON"
	line "for a while?"
	done

ManiaText_TakeCareOfRinring:
	text "Oh, thank you!"

	para "Take good care of"
	line "it, please!"
	done

ManiaText_GotRinring:
	text "<PLAYER> received a"
	line "#MON."
	done

ManiaText_PartyFull:
	text "Your #MON party"
	line "is full."
	done

ManiaText_IfHeComesBack:
	text "Oh, no… What'll"
	line "I do if he comes"
	cont "back?"
	done

ManiaText_CanIHaveMyMonBack:
	text "Hi! How's my #-"
	line "MON?"

	para "I think I'm safe"
	line "now, so may I have"
	cont "it back?"
	done

ManiaText_ThankYou:
	text "Thank you!"
	done

ManiaText_RinringNotThere:
	text "Hey, you don't"
	line "have my #MON"
	cont "with you."
	done

ManiaText_RinringLikesYou:
	text "My #MON has"
	line "come to like you."

	para "All right, you"
	line "should keep it."

	para "But promise to"
	line "be good to it!"
	done

ManiaText_SameAsBeingRobbed:
	text "Oh, no, no… That's"
	line "the same as being"
	cont "robbed."
	done

ManiaText_HappinessSpeech:
	text "For #MON, hap-"
	line "piness is being"

	para "with a person who"
	line "treats them well."
	done

ManiaText_RinringIsYourLastMon:
	text "If I take my #-"
	line "MON back, what are"

	para "you going to use"
	line "in battle?"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SUNPOINT_CITY, 1
	warp_event  3,  7, SUNPOINT_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
