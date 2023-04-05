	object_const_def ; object_event constants
	const BOARDWALK_BUG_CATCHER
	const BOARDWALK_SUPER_NERD2
	const BOARDWALK_SUPER_NERD3
	const BOARDWALK_FISHER
	const BOARDWALK_FISHER2
	const BOARDWALK_YOUNGSTER

Boardwalk_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor



.MoveTutor:
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear BOARDWALK_FISHER2
	return

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear BOARDWALK_FISHER2
.MoveTutorDone:
	return
	
TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_BRENT_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end



	
TrainerFledglingHidalgo:
	trainer FLEDGLING, HIDALGO, EVENT_BEAT_FLEDGLING_HIDALGO, FledglingHidalgoSeenText, FledglingHidalgoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHidalgoAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end


MoveTutorScript:
	faceplayer
	opentext
	writetext ICanTeachYourMonMovesText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext ItWIllCostYouText
	yesorno
	iffalse .Refused2
	checkcoins 2000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext YouWontRegretItText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	jump .Incompatible

.Flamethrower:
	writebyte MOVETUTOR_FLAMETHROWER
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.Thunderbolt:
	writebyte MOVETUTOR_THUNDERBOLT
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.IceBeam:
	writebyte MOVETUTOR_ICE_BEAM
	writetext WeirdNotSureText
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "FLAMETHROWER@"
	db "THUNDERBOLT@"
	db "ICE BEAM@"
	db "CANCEL@"

.Refused:
	writetext UnknownText_0x1990b4
	waitbutton
	closetext
	end

.Refused2:
	writetext HmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	special DisplayCoinCaseBalance; looks like putting this here fixed weird CGB glitch
	writetext IfYouUnderstandText
	buttonsound
	takecoins 2000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext WahahahaFarewellKidText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .WalkAroundPlayer
	applymovement BOARDWALK_FISHER2, MovementData_0x198a5f
	jump .GoInside

.WalkAroundPlayer:
	applymovement BOARDWALK_FISHER2, MovementData_0x198a63
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear BOARDWALK_FISHER2
	clearevent EVENT_BOARDWALK_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext UnknownText_0x1991a4
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext YouDontHaveEnoughCoinsTutorText
	waitbutton
	closetext
	end

BoardwalkSign1:
	jumptext BoardwalkSign1Text

BoardwalkSign2:
	jumptext BoardwalkSign2Text

BoardwalkTrainerTips:
	jumptext BoardwalkTrainerTipsText

BoardwalkFruitTree:
	fruittree FRUITTREE_TREE_ROUTE_112


MovementData_0x198a5f:
	step LEFT
	step LEFT
	step UP
	step_end

MovementData_0x198a63:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step_end


ICanTeachYourMonMovesText:
	text "I can teach your"
	line "#MON amazing"

	para "moves if you'd"
	line "like."

	para "Should I teach a"
	line "new move?"
	done

ItWIllCostYouText:
	text "It will cost you"
	line "2000 coins. Okay?"
	done

UnknownText_0x1990b4:
	text "Aww… But they're"
	line "amazing…"
	done

YouWontRegretItText:
	text "Wahahah! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

HmTooBadText:
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

IfYouUnderstandText:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

WahahahaFarewellKidText:
	text "Wahahah!"
	line "Farewell, kid!"
	done

UnknownText_0x1991a4:
	text "B-but…"
	done

YouDontHaveEnoughCoinsTutorText:
	text "…You don't have"
	line "enough coins here…"
	done

WeirdNotSureText:
	text_start
	done


FledglingHidalgoSeenText:
	text "Can I try battling"
	line "against you?"
	done
	
FledglingHidalgoBeatenText:
	text "This is tough!"
	done
	
FledglingHidalgoAfterBattleText:
	text "I'll work hard to"
	line "keep getting"
	cont "better at this!"
	done
	

PokemaniacBrentSeenText:
	text "Hey! Do you have"
	line "any rare #MON?"
	done

PokemaniacBrentBeatenText:
	text "Oh, my poor #-"
	line "MON! Darlings!"
	done

PokemaniacBrentAfterBattleText:
	text "I'd be happy just"
	line "to own a single"
	cont "rare #MON."
	done

PokemaniacRonSeenText:
	text "Would you get"
	line "this?"

	para "Some <RIVAL> guy"
	line "beat my team!"

	para "Darn it! My #-"
	line "MON are great!"
	
	para "Surely I can win"
	line "against you!"
	done

PokemaniacRonBeatenText:
	text "My team did"
	line "pretty right on!"
	done

PokemaniacRonAfterBattleText:
	text "It's okay for"
	line "people to like"

	para "different types"
	line "of #MON."

	para "#MON isn't just"
	line "about having the"
	cont "most powerful one."
	done

FisherMarvinSeenText:
	text "I'm in a slump."

	para "Maybe it's the"
	line "gear I'm using."

	para "Let's battle for a"
	line "change of pace!"
	done

FisherMarvinBeatenText:
	text "I lost, but I feel"
	line "better anyway."
	done

FisherMarvinAfterBattleText:
	text "KURT's LURE BALL"
	line "is the best for"

	para "catching hooked"
	line "#MON."

	para "It's much more"
	line "effective than a"
	cont "ULTRA BALL."
	done

CamperSpencerSeenText:
	text "I can do so much"
	line "with my #MON--"
	cont "it's super-fun!"
	done

CamperSpencerBeatenText:
	text "Losing isn't fun"
	line "at all…"
	done

CamperSpencerAfterBattleText:
	text "Have you ever been"
	line "to JADE FOREST?"

	para "We were planning"
	line "to camp there."
	done

PicnickerTiffanySeenText:
	text "Are you going to"
	line "the GAME CORNER?"

	para "Let's play for a "
	line "little while!"
	done

PicnickerTiffanyBeatenText:
	text "I played too much!"
	done

PicnickerTiffanyWantsPicnicText:
	text "I'm having a pic-"
	line "nic with #MON."

	para "Won't you join us?"
	done

PicnickerTiffanyClefairyText:
	text "Isn't my CLEFAIRY"
	line "just the most"
	cont "adorable thing?"
	done

BoardwalkSign1Text:
	text "BOARDWALK"

	para "SANSKRIT TOWN -"
	line "TEKNOS CITY"
	done

BoardwalkSign2Text:
	text "BOARDWALK GAME"
	line "CORNER"
	para "Your source for"
	line "fun!"
	done

BoardwalkTrainerTipsText:
	text "TRAINER TIPS"

	para "All #MON have"
	line "pros and cons"

	para "depending on their"
	line "types."

	para "If their types"
	line "differ, a higher-"

	para "level #MON may"
	line "lose in battle."

	para "Learn which types"
	line "are strong and"

	para "weak against your"
	line "#MON's type."
	done

Boardwalk_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  6, 51, BOARDWALK_TEKNOS_GATE, 1
	warp_event  7, 51, BOARDWALK_TEKNOS_GATE, 2
	warp_event 14,  5, BOARDWALK_GATE, 3
	warp_event 14,  2, BOARDWALK_GATE, 1
	warp_event 15,  2, BOARDWALK_GATE, 2
	warp_event 15,  5, BOARDWALK_GATE, 4
	warp_event 10, 21, BOARDWALK_GAME_CORNER, 1
	warp_event 11, 21, BOARDWALK_GAME_CORNER, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11,  8, BGEVENT_READ, BoardwalkSign1
	bg_event  9, 22, BGEVENT_READ, BoardwalkSign2
	bg_event 13, 38, BGEVENT_READ, BoardwalkTrainerTips

	db 6 ; object events
	object_event 17, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerFledglingHidalgo, -1
	object_event  7, 35, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event  8,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacRon, -1
	object_event  2, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event 13, 22, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 4, MoveTutorScript, EVENT_BOARDWALK_MOVE_TUTOR
	object_event  8, 42, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSpencer, -1
