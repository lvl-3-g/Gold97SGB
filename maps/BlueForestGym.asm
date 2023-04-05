	object_const_def ; object_event constants
	const SANSKRITGYM_PRYCE
	const SANSKRITGYM_BUENA1
	const SANSKRITGYM_BUENA2
	const SANSKRITGYM_ROCKER2
	const SANSKRITGYM_ROCKER3
	const SANSKRITGYM_GYM_GUY

BlueForestGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestGymPryceScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_PRYCE
	iftrue RematchScriptPryce
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptPryce
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall BlueForestGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_ROUTE_112_SNOW_STORM; for workers south of town
	setevent EVENT_STAND_CITY_ZOO_MONS; makes normal pokes in zoo disappear
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse BlueForestGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end
	
RematchScriptPryce:
	opentext
	writetext PryceRematchText
	waitbutton
	closetext
	winlosstext PryceRematchWinText, 0
	loadtrainer PRYCE, PRYCE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_PRYCE
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptPryce:
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
BlueForestGym_NoRoomForIcyWind:
	closetext
	end


BlueForestGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

BlueForestGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iftrue .PryceNotAround
	checkevent EVENT_BEAT_PRYCE
	iftrue .BlueForestGymGuyWinScript
	writetext BlueForestGymGuyText
	waitbutton
	closetext
	end
	
.PryceNotAround:
	writetext BlueForestGymGuyNotAroundText
	waitbutton
	closetext
	end

.BlueForestGymGuyWinScript:
	writetext BlueForestGymGuyWinText
	waitbutton
	closetext
	end

BlueForestGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext PRYCE, PRYCE1, MEM_BUFFER_1
	jumpstd GymStatue2Script
	

PryceRematchText:
	text "So, you have"
	line "returned from the"
	cont "LEAGUE."
	
	para "Just because you"
	line "have climbed the"
	para "peak, don't assume"
	line "you're no longer"
	para "subject to the"
	line "mountain's frozen"
	cont "winds!"
	
	para "Let me show you"
	line "the full arsenal"
	para "of what I've"
	line "learned in my"
	cont "time!"
	done

PryceRematchWinText:
	text "Perhaps there is"
	line "something to be"
	cont "said of youth…"
	done

PryceAfterRematchText:
	text "I am impressed"
	line "by your prowess."
	
	para "With your strong"
	line "will, I know you"
	para "can overcome all"
	line "life's obstacles!"
	done

BlueForestGymGuyNotAroundText:
	text "Hey, kid!"
	para "PRYCE is an ice-"
	line "cold battler!"
	para "But he's got a"
	line "heart of gold."
	para "He cares about his"
	line "#MON and he"
	para "cares about his"
	line "family."
	para "He spends his days"
	line "in serious"
	para "training in the"
	line "DEEPWATER PASSAGE."
	para "What I'm trying to"
	line "say is that he's"
	cont "not here often."
	para "It might be a"
	line "while before he"
	cont "returns."
	para "If you want to"
	line "battle, it might"
	para "do you good to"
	line "go look for him."
	done

PryceText_Intro:
	text "So nice to see"
	line "you again."
	
	para "#MON have many"
	line "experiences in"

	para "their lives, just"
	line "like we do. "

	para "I, too, have seen"
	line "and suffered much"
	cont "in my life."
	
	para "That is why I have"
	line "decided in my old"
	para "age to focus on"
	line "what is important."
	
	para "#MON. Family."
	
	para "These are the"
	line "things I cherish."
	
	para "Make sure you make"
	line "time for things"
	cont "that you cherish."
	
	para "A good battle,"
	line "however, is still"
	
	para "an important"
	line "experience."
	
	para "Here, let me show"
	line "you what I mean."
	done


PryceText_Impressed:
	text "Ah, I am impressed"
	line "by your prowess."

	para "With your strong"
	line "will, I know you"

	para "will overcome all"
	line "life's obstacles."

	para "You are worthy of"
	line "this BADGE!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> received"
	line "GLACIERBADGE."
	done

PryceText_GlacierBadgeSpeech:
	text "That BADGE will"
	line "raise the SPECIAL"
	cont "stats of #MON."

	para "It also lets your"
	line "#MON use WHIRL-"
	cont "POOL to get across"
	cont "real whirlpools."

	para "And this… This is"
	line "a gift from me!"
	done

PryceText_IcyWindSpeech:
	text "That TM contains"
	line "ICY WIND."

	para "It inflicts damage"
	line "and lowers speed."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done

PryceText_CherishYourPokemon:
	text "When the ice and"
	line "snow melt, spring"
	cont "arrives."

	para "You and your #-"
	line "MON will be to-"

	para "gether for many"
	line "years to come."

	para "Cherish your time"
	line "together!"
	done


BoarderBradSeenText:
	text "This GYM has a"
	line "slippery floor."

	para "It's fun, isn't"
	line "it?"

	para "But hey--we're"
	line "not playing games"
	cont "here!"
	done

BoarderBradBeatenText:
	text "Do you see how"
	line "serious we are?"
	done

BoarderBradAfterBattleText:
	text "This GYM is great."
	line "I love boarding"
	cont "with my #MON!"
	done

BoarderDouglasSeenText:
	text "I know PRYCE's"
	line "secret."
	done

BoarderDouglasBeatenText:
	text "OK. I'll tell you"
	line "PRYCE's secret."
	done

BoarderDouglasAfterBattleText:
	text "The secret behind"
	line "PRYCE's power…"

	para "He trains in"
	line "the harsh"
	
	para "conditions of the"
	line "DEEPWATER PASSAGE."
	done

SkierRoxanneSeenText:
	text "To get to PRYCE,"
	line "our GYM LEADER,"

	para "you need to think"
	line "before you skate."
	done

SkierRoxanneBeatenText:
	text "I wouldn't lose to"
	line "you in skiing!"
	done

SkierRoxanneAfterBattleText:
	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this GYM."
	done

SkierClarissaSeenText:
	text "Check out my"
	line "parallel turn!"
	done

SkierClarissaBeatenText:
	text "No! You made me"
	line "wipe out!"
	done

SkierClarissaAfterBattleText:
	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done

BlueForestGymGuyText:
	text "PRYCE is a veteran"
	line "who has trained"

	para "#MON for some"
	line "50 years."

	para "He's said to be"
	line "good at freezing"

	para "opponents with"
	line "ice-type moves."

	para "That means you"
	line "should melt him"

	para "with your burning"
	line "ambition!"
	done

BlueForestGymGuyWinText:
	text "PRYCE is some-"
	line "thing, but you're"
	cont "something else!"

	para "That was a hot"
	line "battle that"

	para "bridged the gen-"
	line "eration gap!"
	done

BlueForestGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, BLUE_FOREST, 1
	warp_event  5, 17, BLUE_FOREST, 11

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlueForestGymStatue
	bg_event  6, 15, BGEVENT_READ, BlueForestGymStatue

	db 6 ; object events
	object_event  3,  2, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestGymPryceScript, EVENT_PRYCE_IN_GYM
	object_event  9, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  0,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestGymGuyScript, -1
