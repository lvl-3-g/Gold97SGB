	object_const_def ; object_event constants
	const ROUTE112STANDGATE_OFFICER
	const ROUTE112STANDGATE_GRAMPS
	const ROUTE112STANDGATE_RIVAL

Route112StandGate_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRoute112StandGateRival ; SCENE_DEFAULT
	scene_script .SceneRoute112StandGateNothing ;

	db 0 ; callbacks

.SceneRoute112StandGateRival
	end

.SceneRoute112StandGateNothing
	end
	
R36GateMoveIntoPlace1:
	applymovement PLAYER, R36M1
	jump Route102GateRivalScript
	end
	
R36GateMoveIntoPlace2:
	applymovement PLAYER, R36M2
	jump Route102GateRivalScript
	end
	
R36GateMoveIntoPlace3:
	applymovement PLAYER, R36M3
	jump Route102GateRivalScript
	end
	
R36GateMoveIntoPlace4:
	applymovement PLAYER, R36M4
	jump Route102GateRivalScript
	end
	
Route102GateRivalScript:
	disappear ROUTE112STANDGATE_RIVAL
	pause 10
	playsound SFX_EXIT_BUILDING
	waitsfx
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject ROUTE112STANDGATE_RIVAL, 4, 7
	appear ROUTE112STANDGATE_RIVAL
	applymovement ROUTE112STANDGATE_RIVAL, R36DummyMove
	pause 20
	opentext
	writetext R36GSilverGreets
	waitbutton
	closetext
	applymovement ROUTE112STANDGATE_RIVAL, R36GSilverWalksToYou
	opentext
	writetext R36GSilverGreets2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE112STANDGATE_RIVAL, 15
	opentext
	writetext R36GSilverGreets3
	waitbutton
	closetext
	pause 5
	applymovement ROUTE112STANDGATE_RIVAL, SilverChecksGuard
	pause 25
	opentext
	writetext R36GSilverGreets3_5
	waitbutton
	closetext
	turnobject ROUTE112STANDGATE_RIVAL, RIGHT
	opentext
	writetext R36GSilverGreets4
	waitbutton
	closetext
	applymovement ROUTE112STANDGATE_RIVAL, SilverChecksGuard2
	pause 5
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .R36GCruiseal
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .R36GHappa
	winlosstext Route102GSilverWinText, Route102GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_CRUISEAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GCruiseal:
	winlosstext Route102GSilverWinText, Route102GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_HAPPA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GHappa:
	winlosstext Route102GSilverWinText, Route102GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GAfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route102GRivalAfterText
	waitbutton
	closetext
	applymovement ROUTE112STANDGATE_RIVAL, Route102GRivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE112STANDGATE_RIVAL
	setscene SCENE_ROUTE_112_STAND_GATE_NOTHING
	setevent EVENT_SILVER_IN_STAND_GATE
	waitsfx
	playmapmusic
	end

	
Route112StandGateOfficerScript:
;	clearevent EVENT_STAND_CITY_ZOO_MONS
;	setevent EVENT_CLEARED_RADIO_TOWER
;	setevent EVENT_BEAT_CHUCK
;	setevent EVENT_JADE_FOREST_APPRENTICE
	jumptextfaceplayer Route112StandGateOfficerText

Route112StandGateGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RocketsGoneRoute102Gate
	writetext StandCitySomethingIsUpText
	waitbutton
	closetext
	end
	
.RocketsGoneRoute102Gate
	writetext StandCityIsDoingBetterText
	waitbutton
	closetext
	end

SilverChecksGuard2:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

SilverChecksGuard:
	step LEFT
	step LEFT
	step_end

Route102GRivalBattleExitMovement:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end

R36DummyMove:
	step_end
	
R36M1:
	step DOWN
	step RIGHT
	step DOWN
	step_end
	
R36M2:
	step DOWN
	step DOWN
	step_end
	
R36M3:
	step LEFT
	step DOWN
	step DOWN
	step_end
	
R36M4:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end
	
R36GSilverWalksToYou:
	step UP
	step UP
	step UP
	step_end
	
Route102GSilverWinText:
	text "What? Again!?"
	done
	
Route102GSilverLossText:
	text "Haha! Yes!"
	done
	
Route102GRivalAfterText:
	text "Wow, you actually"
	line "seem to be raising"
	para "your #MON to be"
	line "pretty strong!"
	para "I gotta step it up"
	line "even more!"
	para "Also, be careful"
	line "if you're heading"
	cont "into STAND CITY."
	para "There seems to be"
	line "some sort of"
	para "#MON illness"
	line "going around."
	para "Don't want your"
	line "#MON getting"
	para "sick if you want"
	line "them to be strong!"
	para "Anyways, I'm off!"
	line "see you around!"
	done
	
R36GSilverGreets:
	text "<PLAYER>!"
	done
	
R36GSilverGreets2:
	text "Long time no see!"
	para "How have your"
	line "travels been"
	cont "going?"
	para "Wait, hold on!"
	para "I don't really"
	line "care about that!"
	para "What I want to"
	line "know is how strong"
	para "your team has"
	line "gotten!"
	para "My #MON are so"
	line "strong!"
	para "I'm almost ready"
	line "to take on the"
	cont "LEAGUE!"
	para "Here, let me show"
	line "you!"
	done
	
R36GSilverGreets3:
	text "Oh, wait!"
	para "Let me make sure"
	line "we're okay to"
	cont "battle in here!"
	done
	
R36GSilverGreets3_5:
	text "…"
	done
	
R36GSilverGreets4:
	text "Okay!"
	para "He says we're good"
	line "as long as we're"
	cont "careful!"
	para "Here I come!"
	done
	
StandCityIsDoingBetterText:
	text "I'm glad all of"
	line "the #MON are"
	cont "feeling better."
	done

Route112StandGateOfficerText:
	text "STAND CITY is"
	line "known for its"
	para "beautiful greenery"
	line "and parks."
	done

StandCitySomethingIsUpText:
	text "Something is going"
	line "on in STAND CITY."
	para "I swear I've seen"
	line "men who look like"
	para "members of TEAM"
	line "ROCKET."
	done

Route112StandGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_112, 1
	warp_event  5,  0, ROUTE_112, 2
	warp_event  4,  7, STAND_CITY, 8
	warp_event  5,  7, STAND_CITY, 9

	db 4 ; coord events
	coord_event 3, 1, SCENE_DEFAULT, R36GateMoveIntoPlace1
	coord_event 4, 1, SCENE_DEFAULT, R36GateMoveIntoPlace2
	coord_event 5, 1, SCENE_DEFAULT, R36GateMoveIntoPlace3
	coord_event 6, 1, SCENE_DEFAULT, R36GateMoveIntoPlace4

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route112StandGateOfficerScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route112StandGateGrampsScript, -1
	object_event  4,  9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SILVER_IN_STAND_GATE
