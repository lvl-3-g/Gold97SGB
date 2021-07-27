	object_const_def ; object_event constants
	const STANDGYM_OKERA
	const STANDGYM_GYMGUY2
	const STANDGYM_COOLTRAINER
	const STANDGYM_COOLTRAINER2
	const STANDGYM_COOLTRAINER3
	const STANDGYM_COOLTRAINER4

StandGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandGymOkeraScript:
	faceplayer
	checkevent EVENT_OKERA_OWES_YOU_ONE
	iffalse OkeraOwesYouOneScript
	checkevent EVENT_REMATCH_AVAILABLE_OKERA
	iftrue RematchScriptOkera
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptOkera
	faceplayer
	opentext
	checkevent EVENT_BEAT_OKERA
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	winlosstext OkeraLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OKERA
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setmapscene STAND_CITY, SCENE_STAND_CITY_IMPOSTOR
	checkcode VAR_BADGES
;	scall StandGymActivateRockets
.FightDone:
	checkevent EVENT_ACTUALLY_GOT_TM46_THIEF
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_COOLTRAINERM_AARON
	setevent EVENT_BEAT_COOLTRAINERF_KELLY
	setevent EVENT_BEAT_COOLTRAINERF_JULIA
	setevent EVENT_BEAT_COOLTRAINERF_IRENE
	writetext ChuckExplainBadgeText
	buttonsound
	verbosegiveitem TM_THIEF
	iffalse .BagFull
	setevent EVENT_ACTUALLY_GOT_TM46_THIEF
	writetext OkeraExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext OkeraAfterText
	waitbutton
.BagFull:
	closetext
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript
	
OkeraOwesYouOneScript:
	opentext
	writetext OkeraGivesYouSomething
	waitbutton
	verbosegiveitem BLACKGLASSES
	iffalse .NoRoom
	writetext OkeraGivesYouSomething2
	waitbutton
	closetext
	setevent EVENT_OKERA_OWES_YOU_ONE
	end
	
.NoRoom:
	closetext
	end


RematchScriptOkera:
	opentext
	writetext OkeraRematchText
	waitbutton
	closetext
	winlosstext OkeraRematchWinText, 0
	loadtrainer CHUCK, CHUCK2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_OKERA
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptOkera:
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

StandGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext CHUCK, CHUCK1, MEM_BUFFER_1
	jumpstd GymStatue2Script
	

StandGymGuyScript2:
	faceplayer
	checkevent EVENT_BEAT_OKERA
	iftrue .StandGymGuyWinScript2
	opentext
	writetext StandGymGuyText2
	waitbutton
	closetext
	end

.StandGymGuyWinScript2:
	opentext
	writetext StandGymGuyWinText2
	waitbutton
	closetext
	end
	
TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfIreneAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfJulia:
	trainer COOLTRAINERF, JULIA, EVENT_BEAT_COOLTRAINERF_JULIA, CooltrainerfJuliaSeenText, CooltrainerfJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJuliaAfterText
	waitbutton
	closetext
	end
	
	

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end




TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end
	
LightSwitch:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   23,  31, $3D ; floor
	changeblock   21,  31, $3D ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   23,  31, $39 ; floor
	changeblock   21,  31, $39 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch2:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   19,  27, $3F ; floor
	changeblock   25,  23, $3D ; floor
	changeblock   27,  23, $19 ; floor
	changeblock   27,  21, $19 ; floor
	changeblock   27,  19, $19 ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   19,  27, $3B ; floor
	changeblock   25,  23, $39 ; floor
	changeblock   27,  23, $10 ; floor
	changeblock   27,  21, $10 ; floor
	changeblock   27,  19, $10 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch3:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   21,  13, $19 ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   21,  13, $10 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch4:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock   7,  13, $3F ; floor
	changeblock   7,  11, $3F ; floor
	changeblock   7,   9, $3F ; floor
	changeblock  13,  15, $3D ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock   7,  13, $3B ; floor
	changeblock   7,  11, $3B ; floor
	changeblock   7,   9, $3B ; floor
	changeblock  13,  15, $39 ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end
	
LightSwitch5:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	playsound SFX_MOONLIGHT
	special FadeOutPalettes
	changeblock    3,  7, $3F ; floor
	changeblock    3,  9, $3F ; floor
	changeblock    7,  9, $3F ; floor
	reloadmappart
	special FadeInPalettes
	special FadeBlackQuickly
	changeblock    3,  7, $3B ; floor
	changeblock    3,  9, $3B ; floor
	changeblock    7,  9, $3B ; floor
	reloadmappart
	special FadeInQuickly
	opentext
	writetext ItsASwitch2
	waitbutton
	closetext
	end
.no
	closetext
	end

OkeraGivesYouSomething:
	text "Hey, man."
	para "I guess I owe ya"
	line "one for kicking"
	para "out those ROCKET"
	line "losers."
	para "Here, I got some-"
	line "thing you could"
	cont "use."
	done
	
OkeraGivesYouSomething2:
	text "Maybe you'll find"
	line "that useful if"
	para "you have some"
	line "dark #MON."
	done

ItsASwitch:
	text "It's labeled"
	line "'FAULTY'."
	para "Press it?"
	done
	
ItsASwitch2:
	text "The lights don't"
	line "stay on!"
	done
	
	
CooltrainerfIreneSeenText:
	text "Kyaaah!"
	line "Someone found me!"
	done

CooltrainerfIreneBeatenText:
	text "Ohhh!"
	line "Too strong!"
	done

CooltrainerfIreneAfterText:
	text "The dark can be"
	line "scary."

	para "But it can be"
	line "safe too."
	done
	
CooltrainerfJuliaSeenText:
	text "Do you believe in"
	line "bad luck?"
	done

CooltrainerfJuliaBeatenText:
	text "I certainly have"
	line "bad luck!"
	done

CooltrainerfJuliaAfterText:
	text "These switches"
	line "have never worked"
	cont "correctly."
	done
	


OkeraRematchText:
	text "What do you want?"
	
	para "Aren't you the"
	line "CHAMPION now?"
	
	para "You want a second"
	line "BADGE from me or"
	cont "something?"
	
	para "Don't think I'll"
	line "back down from"
	para "a challenge like"
	line "this!"
	done

OkeraRematchWinText:
	text "Heh."
	done

OkeraAfterRematchText:
	text "I wasn't really"
	line "expecting to win,"
	para "but I'd never"
	line "back out of a"
	cont "fight."
	para "Even if all bets"
	line "are against me."
	
	para "You're the same"
	line "way, aren't you?"
	done


CooltrainerfKellySeenText:
	text "What do you see"
	line "when you open"
	para "your eyes in the"
	line "dark?"
	done

CooltrainerfKellyBeatenText:
	text "Fine. I lost."
	done

CooltrainerfKellyAfterBattleText:
	text "Where is the GYM"
	line "LEADER?"
	para "He lives in the"
	line "shadows, beyond"
	cont "what can be seen."
	done

CooltrainermAaronSeenText:
	text "Are you afraid"
	line "of the dark?"
	done

CooltrainermAaronBeatenText:
	text "Whew…"
	line "Good battle."
	done

CooltrainermAaronAfterBattleText:
	text "This GYM isn't"
	line "really that scary."
	para "The lights are"
	line "just turned off."
	done

StandGymGuyText2:
	text "Hey, champ-in-the-"
	line "making!"
	para "It sure is dark in"
	line "here!"
	para "OKERA can be kind"
	line "of moody, and he"
	cont "likes it dark."
	para "But don't let his"
	line "age and behavior"
	cont "fool you."
	para "He's one tough"
	line "trainer!"
	done
	
StandGymGuyWinText2:
	text "I knew you weren't"
	line "afraid of the"
	cont "dark!"
	done

ChuckIntroText1:
	text "Heh."
	para "You've traveled a"
	line "long way from"
	cont "home, haven't you?"
	para "You've experienced"
	line "a lot of new"
	cont "things."
	para "Met a lot of"
	line "people."
	para "Faced a lot of"
	line "challenges."
	para "…"
	para "But have you"
	line "faced the sheer"
	para "power that finds"
	line "its strength in"
	cont "the dark?"
	para "Dark-type #MON"
	line "possess a power"
	cont "like none other."
	para "Even in the short"
	line "time that I've"
	cont "been a GYM LEADER,"
	para "I've learned much"
	line "about what they"
	cont "are capable of."
	para "I will show you"
	line "now."
	done


OkeraLossText:
	text "Hm. I lost."

	para "This is"
	line "unexpected."
	para "But it proves you"
	line "are worthy to earn"
	cont "DUSKBADGE."
	done

GetStormBadgeText:
	text "<PLAYER> received"
	line "DUSKBADGE."
	done

ChuckExplainBadgeText:
	text "DUSKBADGE makes"
	line "all #MON up to"

	para "L70 obey, even"
	line "traded ones."

	para "Your #MON can"
	line "now use ROCK SMASH"

	para "when you're not in"
	line "a battle."
	
	para "I guess I'm in a"
	line "good mood, so you"
	cont "can have this too."
	done

OkeraExplainTMText:
	text "That move is"
	line "THIEF."

	para "It causes damage,"
	line "and also can steal"
	para "an opponent's held"
	line "item."
	done

OkeraAfterText:
	text "That was a good"
	line "battle."
	para "Your challenge was"
	line "worth my time."
	done

StandGym_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 26, 35, STAND_CITY, 3
	warp_event 27, 35, STAND_CITY, 12
	warp_event 26, 33, STAND_GYM, 4
	warp_event  7, 35, STAND_GYM, 3

	db 0 ; coord events

	db 7 ; bg events
	bg_event 25, 33, BGEVENT_READ, StandGymStatue
	bg_event 28, 33, BGEVENT_READ, StandGymStatue
	bg_event 24, 28, BGEVENT_READ, LightSwitch
	bg_event 22, 22, BGEVENT_READ, LightSwitch2
	bg_event 20,  8, BGEVENT_READ, LightSwitch3
	bg_event  8, 12, BGEVENT_READ, LightSwitch4
	bg_event  4,  4, BGEVENT_READ, LightSwitch5

	db 6 ; object events
	object_event  6, 33, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StandGymOkeraScript, EVENT_OKERA_NOT_IN_GYM
	object_event 29, 33, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript2, -1
	object_event 20, 25, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, -1
	object_event 23,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKelly, -1
	object_event 10, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfIrene, -1
	object_event  5,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfJulia, -1

