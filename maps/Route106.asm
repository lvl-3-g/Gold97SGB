	object_const_def ; object_event constants
	;const ROUTE106_FISHER
	const ROUTE106_YOUNGSTER
	const ROUTE106_BUG_CATCHER
	const ROUTE106_COOLTRAINER_M
	const ROUTE106_FRUIT_TREE
	const ROUTE106_POKE_BALL1
	const ROUTE106_POKE_BALL2
	const ROUTE106_GRAMPS
	const ROUTE113_DAY_CARE_MON_1
	const ROUTE113_DAY_CARE_MON_2
;	const ROUTE106_POKEFAN_M
	const ROUTE106_BUG_CATCHER_2
	const ROUTE106_YOUNGSTER_2

Route106_MapScripts:
	db 0 ; scene scripts


	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	jump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_113
	jump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	checkcode VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE106_GRAMPS, Route113MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE106_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE106_GRAMPS, Route113MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE106_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end


TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	checkevent EVENT_CHAD_READY_FOR_REMATCH
	iftrue .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftrue .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumber1
	sjump .AskToRegisterNumber

.SecondTimeAsking:
	scall .AskPhoneNumber2
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .SaidNo
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall .RegisteredChad
	sjump .HaveChadsNumber

.ChadRematch:
	scall .Rematch
	winlosstext SchoolboyChad1BeatenText, 0
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_CHAD_READY_FOR_REMATCH
	end

.AskPhoneNumber1:
	jumpstd AskNumber1MScript
	end

.AskPhoneNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredChad:
	jumpstd RegisteredNumberMScript
	end

.HaveChadsNumber:
	jumpstd NumberAcceptedMScript
	end

.SaidNo:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end


TrainerFledglingPaulson:
	trainer FLEDGLING, PAULSON, EVENT_BEAT_FLEDGLING_PAULSON, FledglingPaulsonSeenText, FledglingPaulsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingPaulsonAfterText
	waitbutton
	closetext
	end


TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

Route106YoungsterScript:
	jumptextfaceplayer Route106YoungsterText

Route106Sign:
	jumptext Route106SignText

DarkCaveSign:
	jumptext DarkCaveSignText

JadeSign:
	jumptext JadeSignText
	
Route106PokecenterSign:
	jumpstd PokecenterSignScript

Route106CooltrainerMScript:
	jumptextfaceplayer Route106CooltrainerMText

Route106FruitTree:
	fruittree FRUITTREE_ROUTE_106

Route106Potion:
	itemball SUPER_POTION

Route106PokeBall:
	itemball GREAT_BALL
	
Route113MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route113MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end
	
BugCatcherRobSeenText:
	text "Did you see any"
	line "cool bugs in the"
	cont "FOREST?"
	done
	
BugCatcherRobBeatenText:
	text "My bugs are down!"
	done
	
BugCatcherRobAfterBattleText:
	text "That was a trick"
	line "question."
	para "All bugs are cool."
	done


SchoolboyChad1SeenText:
	text "I'm studying rare"
	line "#MON."
	done

SchoolboyChad1BeatenText:
	text "I didn't study"
	line "enough, I guess."
	done

SchoolboyChadSoManyTestsText:
	text "Have you ever"
	line "heard of EEVEE?"
	para "Rumor has it they"
	line "live right here!"
	para "I've never seen"
	line "one though."
	para "I'd definitely"
	line "let you know if"
	cont "I ever saw any."
	done

FledglingPaulsonSeenText:
	text "I battle right"
	line "by the #MON"
	cont "CENTER."
	para "That way it's easy"
	line "to heal after I"
	cont "lose."
	done

FledglingPaulsonBeatenText:
	text "Not again!"
	done

FledglingPaulsonAfterText:
	text "My #MON are"
	line "getting stronger,"
	cont "slowly but surely."
	done
	


Route106CooltrainerMText:
	text "Have you ever used"
	line "a #MON DAYCARE?"
	para "The friendly old"
	line "couple in that"
	para "house will raise"
	line "your #MON."
	done

BugCatcherWade1SeenText:
	text "I caught a bunch"
	line "of #MON. Let me"
	cont "battle with you!"
	done

BugCatcherWade1BeatenText:
	text "Awwwww…"
	done

BugCatcherWade1AfterText:
	text "You can catch"
	line "#MON even if"

	para "you have six with"
	line "you."

	para "If you catch one,"
	line "it'll go to your"
	cont "BOX automatically."
	done


Route106YoungsterText:
	text "I found a good"
	line "#MON in JADE"
	cont "FOREST."

	para "I'm going to raise"
	line "it to take on"
	cont "JASMINE."

	para "She's the leader"
	line "of ALLOY CITY's"
	cont "GYM."
	done

Route106SignText:
	text "ROUTE 106"

	para "ALLOY CITY -"
	line "BIRDON TOWN"
	done

DarkCaveSignText:
	text "#MON DAYCARE"
	para "Let us raise your"
	line "#MON!"
	done

JadeSignText:
	text "JADE FOREST"
	para "Entrance to the"
	line "right."
	done

HikerAnthony2SeenText:
	text "I came through the"
	line "forest, but I"

	para "still have plenty"
	line "of energy left."
	done

HikerAnthony2BeatenText:
	text "Whoa! You've got"
	line "more zip than me!"
	done

HikerAnthony2AfterText:
	text "We HIKERS are at"
	line "our best when"
	para "we're free to"
	line "explore endlessly."
	done

HikerAnthonyParaText:
	text "Hey, did you get"
	line "an EEVEE?"

	para "I caught one too."

	para "They're so fluffy!"
	done

Route106_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  8,  5, ROUTE_105_ROUTE_106_GATE, 3
	warp_event  9,  5, ROUTE_105_ROUTE_106_GATE, 4
	warp_event 16, 12, JADE_FOREST, 1
	warp_event 16, 13, JADE_FOREST, 2
	warp_event 23,  8, JADE_FOREST, 3
	warp_event 23,  9, JADE_FOREST, 4
	warp_event 33,  5, DAY_CARE, 1
	warp_event 36,  5, DAY_CARE, 3
	warp_event  9, 10, ROUTE_106_POKECENTER_1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 52,  8, BGEVENT_READ, Route106Sign
	bg_event 30,  5, BGEVENT_READ, DarkCaveSign
	bg_event 12, 12, BGEVENT_READ, JadeSign
	bg_event 10, 10, BGEVENT_READ, Route106PokecenterSign

	db 11 ; object events
	;object_event 52, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106MailRecipientScript, -1
	object_event  7, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106YoungsterScript, -1
	object_event 24,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherRob, -1
	object_event 42, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106CooltrainerMScript, -1
	object_event  4, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106FruitTree, -1
	object_event 11,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route106Potion, EVENT_ROUTE_106_POTION
	object_event 33, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route106PokeBall, EVENT_ROUTE_106_POKE_BALL
	object_event 38,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_113
	object_event 40,  7, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 42,  6, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
;	object_event 49,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event  4,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerFledglingPaulson, -1
	object_event 50,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
