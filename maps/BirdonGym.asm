	object_const_def ; object_event constants
	const BIRDONGYM_MORTY
	const BIRDONGYM_GYM_GUY
	const BIRDONGYM_GRANNY1
	const BIRDONGYM_GRANNY2
	const BIRDONGYM_GRAMPS

BirdonGym_MapScripts:
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.ForcedToLeave:
	end


.DummyScene:
	end
	


TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSageYurei:
	trainer SAGE, YUREI, EVENT_BEAT_SAGE_YUREI, SageYureiSeenText, SageYureiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageYureiAfterBattleText
	waitbutton
	closetext
	end


TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script
	

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

BirdonGymMortyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_MORTY
	iftrue RematchScriptMorty
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptMorty
	
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_MEDIUM_REBECCA
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	checkcode VAR_BADGES
	scall BirdonGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_SAGE_YUREI
	writetext MortyText_FogBadgeSpeech
	buttonsound
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end
	
RematchScriptMorty:
	opentext
	writetext MortyRematchText
	waitbutton
	closetext
	winlosstext MortyRematchWinText, 0
	loadtrainer MORTY, MORTY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_MORTY
	opentext
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptMorty:
	opentext
	writetext MortyAfterRematchText
	waitbutton
	closetext
	end

MortyRematchText:
	text "Am I seeing a"
	line "ghost, or have"
	para "you returned to"
	line "my GYM once more?"
	
	para "if it be true,"
	line "then please"
	para "indulge me in a"
	line "battle once"
	para "again so I may"
	line "further my"
	cont "training!"
	done

MortyRematchWinText:
	text "Impeccable…"
	done

MortyAfterRematchText:
	text "That rainbow bird"
	line "of legend… did"
	para "you ever witness"
	line "it during your"
	cont "travels?"
	
	para "If it were to"
	line "appear for anyone,"
	para "I would think it"
	line "to be you."
	done



BirdonGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript







BirdonGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .BirdonGymGuyWinScript
	writetext BirdonGymGuyText
	waitbutton
	closetext
	end

.BirdonGymGuyWinScript:
	writetext BirdonGymGuyWinText
	waitbutton
	closetext
	end

BirdonGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext MORTY, MORTY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BirdonGymPlayerStepUpMovement:
	step UP
	step_end

BirdonGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

BirdonGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Good of you to"
	line "have come."

	para "Here in BIRDON,"
	line "#MON have been"
	cont "revered."

	para "It's said that a"
	line "rainbow-colored"

	para "#MON of flame"
	line "will come down"

	para "before a truly"
	line "powerful trainer."

	para "I believed that"
	line "tale, so I have"

	para "secretly trained"
	line "here all my life."

	para "As a result, I can"
	line "now see what"
	cont "others cannot."

	para "Just a bit more…"

	para "With a little"
	line "more, I could see"

	para "a future in which"
	line "I meet the #MON"
	cont "of rainbow colors."

	para "You're going to"
	line "help me reach that"
	cont "level!"
	done

MortyWinLossText:
	text "I'm not good"
	line "enough yet…"

	para "All right. This"
	line "BADGE is yours."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> received"
	line "FOGBADGE."
	done

MortyText_FogBadgeSpeech:
	text "By having FOG-"
	line "BADGE, #MON up"

	para "to L50 will obey"
	line "you."

	para "Also, #MON that"
	line "know SURF will be"

	para "able to use that"
	line "move anytime."

	para "I want you to have"
	line "this too."
	done

MortyText_ShadowBallSpeech:
	text "It's SHADOW BALL."
	line "It causes damage"

	para "and may reduce"
	line "SPCL.DEF."

	para "Use it if it"
	line "appeals to you."
	done

MortyFightDoneText:
	text "I see…"

	para "Your journey has"
	line "taken you to far-"
	cont "away places."

	para "And you have wit-"
	line "nessed much more"
	cont "than I."

	para "I envy you for"
	line "that…"
	done


MediumRebeccaSeenText:
	text "The power of all"
	line "those you defeated"
	cont "comes to me!"
	done

MediumRebeccaBeatenText:
	text "Strong…"
	line "Far too strong…"
	done

MediumRebeccaAfterBattleText:
	text "What is the source"
	line "of your power?"
	done

BirdonGymGuyText:
	text "The GYM here is"
	line "full of holes that"
	para "will send you back"
	line "to the entrance."
	para "But some can be"
	line "walked over to get"
	cont "by."
	para "Watch your step!"
	done

BirdonGymGuyWinText:
	text "Whew, <PLAYER>."
	line "You did great!"

	para "I was cowering in"
	line "the corner out of"
	cont "pure terror!"
	done

SageYureiSeenText:
	text "Can you prove that"
	line "you are alive?"
	done
	
SageYureiBeatenText:
	text "I see…"
	done
	
SageYureiAfterBattleText:
	text "Can you prove that"
	line "I am even alive?"
	done

MediumDorisSeenText:
	text "Fufufufu…"
	line "I see it clearly."

	para "I can see into"
	line "your soul!"
	done

MediumDorisBeatenText:
	text "Though I read you,"
	line "I still lost…"
	done

MediumDorisAfterBattleText:
	text "Darn! I forgot"
	line "that I predicted I"
	cont "would lose to you."
	done

BirdonGym_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  2,  9, BIRDON_TOWN, 5
	warp_event  3,  9, BIRDON_TOWN, 9
	warp_event  2,  7, BIRDON_GYM, 4
	warp_event  1,  0, BIRDON_GYM, 3
	warp_event  2,  0, BIRDON_GYM, 3
	warp_event  3,  0, BIRDON_GYM, 3
	warp_event  9,  9, BIRDON_GYM, 3
	warp_event 13,  0, BIRDON_GYM, 3
	warp_event 17,  4, BIRDON_GYM, 3
	warp_event  0,  0, BIRDON_GYM, 3
	warp_event  4,  0, BIRDON_GYM, 3
	warp_event  5,  0, BIRDON_GYM, 3
	warp_event  7,  0, BIRDON_GYM, 3
	warp_event 12,  0, BIRDON_GYM, 3
	warp_event 14,  0, BIRDON_GYM, 3
	warp_event  8,  0, BIRDON_GYM, 3
	warp_event 16,  4, BIRDON_GYM, 3
	warp_event 10,  0, BIRDON_GYM, 3
	warp_event 15,  0, BIRDON_GYM, 3
	warp_event  6,  4, BIRDON_GYM, 3
	warp_event  6,  5, BIRDON_GYM, 3
	warp_event  7,  8, BIRDON_GYM, 3
	warp_event  6,  8, BIRDON_GYM, 3
	warp_event 18,  0, BIRDON_GYM, 3
	warp_event 17,  0, BIRDON_GYM, 3
	warp_event  2,  4, BIRDON_GYM, 3
	warp_event  3,  4, BIRDON_GYM, 3
	warp_event 19,  0, BIRDON_GYM, 3
	warp_event 16,  0, BIRDON_GYM, 3
	warp_event 17,  6, BIRDON_GYM, 3
	warp_event 17,  7, BIRDON_GYM, 3
	warp_event 12,  8, BIRDON_GYM, 3
	warp_event 13,  8, BIRDON_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1,  7, BGEVENT_READ, BirdonGymStatue
	bg_event  4,  7, BGEVENT_READ, BirdonGymStatue

	db 5 ; object events
	object_event 16,  2, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdonGymMortyScript, -1
	object_event  0,  7, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdonGymGuyScript, -1
	object_event  5,  6, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event 11,  5, SPRITE_SABRINA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSageYurei, -1

