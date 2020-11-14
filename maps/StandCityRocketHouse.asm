	object_const_def ; object_event constants
	const STANDCITYROCKETHOUSE_ROCKET
	const STANDCITYROCKETHOUSE_OKERA
	const STANDCITYROCKETHOUSE_SILVER

StandCityRocketHouse_MapScripts:
	db 3 ; scene scripts
	scene_script .SceneStandCityRocketHouseRocketSpots ; SCENE_DEFAULT
	scene_script .SceneStandCityRocketHouseNothing ;
	scene_script .SceneStandCityRocketHouseBaseUncovered ;

	db 1 ; callbacks	
	callback MAPCALLBACK_TILES, .CheckStairsUncovered


.CheckStairsUncovered:
	checkevent EVENT_BOARDWALK_GATE_ROCKETS
	iffalse .NoStairsYet
	changeblock 19, 7, $2a 
	return

.NoStairsYet:
	return

.SceneStandCityRocketHouseRocketSpots
	end

.SceneStandCityRocketHouseNothing
	end
	
.SceneStandCityRocketHouseBaseUncovered
	end
SilverFindsStairsLeft:
	opentext
	writetext SilverShowsUpInBase
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	turnobject PLAYER, DOWN
	pause 5
	moveobject STANDCITYROCKETHOUSE_OKERA, 13, 5
	appear STANDCITYROCKETHOUSE_OKERA
	applymovement STANDCITYROCKETHOUSE_OKERA, SilverWalksToHiddenStairsMovementPart2
	opentext
	writetext SilverTellsYouAboutHiddenStairs
	waitbutton
	closetext
	applymovement STANDCITYROCKETHOUSE_OKERA, SilverWalksToHiddenStairsMovement2Part2
	applymovement PLAYER, SilverWalksToHiddenStairsMovement2Part2
	jump SilverFindsStairsMain
	end
	
SilverFindsStairsDown:
	opentext
	writetext SilverShowsUpInBase
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 5
	moveobject STANDCITYROCKETHOUSE_OKERA, 14, 5
	appear STANDCITYROCKETHOUSE_OKERA
	applymovement STANDCITYROCKETHOUSE_OKERA, SilverWalksToHiddenStairsMovement
	opentext
	writetext SilverTellsYouAboutHiddenStairs
	waitbutton
	closetext
	applymovement STANDCITYROCKETHOUSE_OKERA, SilverWalksToHiddenStairsMovement2
	applymovement PLAYER, SilverWalksToHiddenStairsMovement2
	jump SilverFindsStairsMain
	end
	
SilverFindsStairsMain:
	opentext
	writetext SilverTellsYouAboutHiddenStairs2
	waitbutton
	closetext
	playsound SFX_STRENGTH
	earthquake 80
	waitsfx
	playsound SFX_ENTER_DOOR
	changeblock 19, 7, $2a ; stairs
	reloadmappart
	pause 15
	turnobject STANDCITYROCKETHOUSE_OKERA, UP
	opentext
	writetext SilverLetsGoDownThere
	waitbutton
	closetext
	pause 15
	opentext
	writetext SilverActuallyShowsUpNow1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	turnobject PLAYER, LEFT
	turnobject STANDCITYROCKETHOUSE_OKERA, LEFT
	pause 10
	moveobject STANDCITYROCKETHOUSE_SILVER, 14, 5
	appear STANDCITYROCKETHOUSE_SILVER
	applymovement STANDCITYROCKETHOUSE_SILVER, SilverActuallyShowsUpMovement
	opentext
	writetext SilverActuallyShowsUpNow2
	waitbutton
	closetext
	pause 10
	opentext
	writetext SilverActuallyShowsUpNow3
	waitbutton
	closetext
	pause 10
	opentext
	writetext SilverActuallyShowsUpNow4
	waitbutton
	closetext
	applymovement STANDCITYROCKETHOUSE_SILVER, SilverRunsIntoStairsMovement
	playsound SFX_EXIT_BUILDING
	disappear STANDCITYROCKETHOUSE_SILVER
	waitsfx
	pause 10
	turnobject PLAYER, DOWN
	turnobject STANDCITYROCKETHOUSE_OKERA, UP
	opentext
	writetext SilverActuallyShowsUpNow5
	waitbutton
	closetext
	applymovement STANDCITYROCKETHOUSE_OKERA, OkeraGoesToZoo
	disappear STANDCITYROCKETHOUSE_OKERA
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	setevent EVENT_BOARDWALK_GATE_ROCKETS
	setevent EVENT_OKERA_NOT_IN_GYM
	end
	
RocketSpotsTop1:
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	applymovement STANDCITYROCKETHOUSE_ROCKET, ShockedRocket2Steps 
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsTop2:
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	applymovement STANDCITYROCKETHOUSE_ROCKET, ShockedRocket1Step 
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsTop3:
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, UP
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsBottom1:
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsBottom2:
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	applymovement STANDCITYROCKETHOUSE_ROCKET, ShockedRocket1StepDown
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
RocketSpotsBottom3:
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, STANDCITYROCKETHOUSE_ROCKET, 30
	applymovement STANDCITYROCKETHOUSE_ROCKET, ShockedRocket2StepsDown
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
;	loadtrainer SABRINA, SABRINA1,
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject STANDCITYROCKETHOUSE_ROCKET, DOWN
	setscene SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	end
	
StandCityRocketHouse1FPoster:
	jumptext StandCityRocketHouse1FPosterText

StandCityRocketHouse1FTV:
	jumptext StandCityRocketHouse1FTVText

WardensGranddaughter:
	jumptextfaceplayer WardensGranddaughterText1
	
OkeraGoesToZoo:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
SilverWalksToHiddenStairsMovement2Part2:
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
StairsTimeOneStepDown:
	step DOWN
	step_end
	
SilverWalksToHiddenStairsMovementPart2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

SilverWalksToHiddenStairsMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverWalksToHiddenStairsMovement2:
	step DOWN
	step DOWN
	step DOWN
	step_end

ShockedRocket1StepDown:
	step DOWN
	step_end
	
ShockedRocket2StepsDown:
	step DOWN
	step DOWN
	step_end

ShockedRocket2Steps:
	step UP
	step UP
	step_end
	
ShockedRocket1Step:
	step UP
	step_end
	
SilverActuallyShowsUpMovement:
	step RIGHT
	step_end
	
SilverRunsIntoStairsMovement:	
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
SilverActuallyShowsUpNow1:
	text "Wait for me!"
	done
	
SilverActuallyShowsUpNow2:
	text "<RIVAL>: I'm"
	line "strong, too!"
	para "It's time for me"
	line "to show TEAM"
	cont "ROCKET who's boss!"
	done
	
SilverActuallyShowsUpNow3:
	text "OKERA: Um, sure."
	para "The more, the"
	line "merrier, I guess."
	done
	
SilverActuallyShowsUpNow4:
	text "<RIVAL>: Okay!"
	para "<PLAYER>, let's"
	line "go!"
	done
	
SilverActuallyShowsUpNow5:
	text "You better follow"
	line "him down before"
	para "he runs himself"
	line "right into"
	cont "trouble."
	para "I'm going to go"
	line "try to help out"
	para "with the sick"
	line "#MON over at"
	cont "the ZOO."
	done
	
StandCityRocketHouse1FTVText:
	text "It's not turned"
	line "on…"
	done
	
StandCityRocketHouse1FPosterText:
	text "All #MON are"
	line "for the profit of"
	cont "TEAM ROCKET!"
	done
	
SilverLetsGoDownThere:
	text "How are your"
	line "#MON feeling?"
	para "Mine aren't doing"
	line "so hot. I think"
	para "whatever TEAM"
	line "ROCKET is up to"
	para "is starting to"
	line "make them sick!"
	para "…"
	para "Show me that it"
	line "wasn't a fluke"
	para "that I lost to"
	line "you!"
	para "Go down there and"
	line "kick these guys"
	cont "outta my town!"
	done
	
SilverTellsYouAboutHiddenStairs2:
	text "Right here!"
	para "TEAM ROCKET is"
	line "hiding out down"
	cont "here!"
	done
	
SilverShowsUpInBase:
	text "OKERA: <PLAYER>!"
	para "Wait, don't leave!"
	done
	
SilverTellsYouAboutHiddenStairs:
	text "I don't know what"
	line "these TEAM ROCKET"
	para "thugs are doing"
	line "showing up in my"
	para "town, but they're"
	line "up to no good!"
	para "I heard one of"
	line "them talking about"
	para "a hidden basement"
	line "in this building."
	done
	
ShockedRocketWinText:
	text "Argh!"
	done

ShockedRocketLossText:
	text "Argh?"
	done

RocketShockedText:
	text "And who are you?"
	para "I hope you didn't"
	line "think you could"
	cont "sneak past me!"
	para "No one sneaks past"
	line "me!"
	done
	
WardensGranddaughterText1:
	text "You might not be"
	line "able to sneak"
	cont "past me,"
	para "but you sure can"
	line "just walk on by"
	para "if you've got"
	line "#MON that"
	cont "strong…"
	done



StandCityRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6,  7, STAND_CITY, 6
	warp_event  7,  7, STAND_CITY, 6
	warp_event 19,  7, TEAM_ROCKET_BASE_B1F, 1
	warp_event 19,  1, STAND_CITY_ROCKET_HOUSE_2F, 1

	db 8 ; coord events
	coord_event 15,  1, SCENE_DEFAULT, RocketSpotsTop1
	coord_event 15,  2, SCENE_DEFAULT, RocketSpotsTop2
	coord_event 15,  3, SCENE_DEFAULT, RocketSpotsTop3
	coord_event 15,  5, SCENE_DEFAULT, RocketSpotsBottom1
	coord_event 15,  6, SCENE_DEFAULT, RocketSpotsBottom2
	coord_event 15,  7, SCENE_DEFAULT, RocketSpotsBottom3
	coord_event 18,  1, SCENE_STAND_CITY_ROCKET_HOUSE_BASE_UNCOVERED, SilverFindsStairsLeft
	coord_event 19,  2, SCENE_STAND_CITY_ROCKET_HOUSE_BASE_UNCOVERED, SilverFindsStairsDown

	db 2 ; bg events
	bg_event  6,  0, BGEVENT_READ, StandCityRocketHouse1FPoster
	bg_event 12,  1, BGEVENT_READ, StandCityRocketHouse1FTV

	db 3 ; object events
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, EVENT_ROCKETS_IN_STAND_CITY
	object_event -5, -5, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -5, -5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
