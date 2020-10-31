add_stdscript: MACRO
\1StdScript::
	dba \1
ENDM

StdScripts::
	add_stdscript PokecenterNurseScript
	add_stdscript DifficultBookshelfScript
	add_stdscript PictureBookshelfScript
	add_stdscript MagazineBookshelfScript
	add_stdscript TeamRocketOathScript
	add_stdscript IncenseBurnerScript
	add_stdscript MerchandiseShelfScript
	add_stdscript TownMapScript
	add_stdscript WindowScript
	add_stdscript TVScript
	add_stdscript HomepageScript ; unused
	add_stdscript Radio1Script
	add_stdscript Radio2Script
	add_stdscript TrashCanScript
	add_stdscript StrengthBoulderScript
	add_stdscript SmashRockScript
	add_stdscript PokecenterSignScript
	add_stdscript MartSignScript
	add_stdscript WestportRocketsScript
	add_stdscript RadioTowerRocketsScript
	add_stdscript ElevatorButtonScript
	add_stdscript DayToTextScript
	add_stdscript BugContestResultsWarpScript
	add_stdscript BugContestResultsScript
	add_stdscript InitializeEventsScript
	add_stdscript AskNumber1MScript
	add_stdscript AskNumber2MScript
	add_stdscript RegisteredNumberMScript
	add_stdscript NumberAcceptedMScript
	add_stdscript NumberDeclinedMScript
	add_stdscript PhoneFullMScript
	add_stdscript RematchMScript
	add_stdscript AskNumber1FScript
	add_stdscript AskNumber2FScript
	add_stdscript RegisteredNumberFScript
	add_stdscript NumberAcceptedFScript
	add_stdscript NumberDeclinedFScript
	add_stdscript PhoneFullFScript
	add_stdscript RematchFScript
	add_stdscript GymStatue1Script
	add_stdscript GymStatue2Script
	add_stdscript ReceiveItemScript
	add_stdscript ReceiveTogepiEggScript
	add_stdscript PCScript
	add_stdscript GameCornerCoinVendorScript
	add_stdscript HappinessCheckScript

PokecenterNurseScript:
	opentext
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	checktime NITE
	iftrue .nite
	sjump .ok

.morn
	writetext NurseMornText
	promptbutton
	sjump .ok

.day
	writetext NurseDayText
	promptbutton
	sjump .ok

.nite
	writetext NurseNiteText
	promptbutton
	sjump .ok

.ok
	writetext NurseAskHealText
	yesorno
	iffalse .done

	writetext NurseTakePokemonText
	pause 20
	turnobject LAST_TALKED, LEFT
	pause 10
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_POKECENTER
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	turnobject LAST_TALKED, DOWN
	pause 10

	checkphonecall ; oak2 already called about pokerus
	iftrue .no
	checkflag ENGINE_CAUGHT_POKERUS
	iftrue .no
	special CheckPokerus
	iftrue .pokerus
.no
	writetext NurseReturnPokemonText
	pause 20

.done
	writetext NurseGoodbyeText

	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10

	waitbutton
	closetext
	end

.pokerus
	writetext NursePokerusText
	waitbutton
	closetext
	setflag ENGINE_CAUGHT_POKERUS
	specialphonecall SPECIALCALL_POKERUS
	end

DifficultBookshelfScript:
	jumptext DifficultBookshelfText

PictureBookshelfScript:
	jumptext PictureBookshelfText

MagazineBookshelfScript:
	jumptext MagazineBookshelfText

TeamRocketOathScript:
	jumptext TeamRocketOathText

IncenseBurnerScript:
	jumptext IncenseBurnerText

MerchandiseShelfScript:
	jumptext MerchandiseShelfText

TownMapScript:
	opentext
	writetext LookTownMapText
	waitbutton
	special OverworldTownMap
	closetext
	end

WindowScript:
	jumptext WindowText

TVScript:
	opentext
	writetext TVText
	waitbutton
	closetext
	end

HomepageScript:
	jumptext HomepageText

Radio1Script:
	opentext
	setval MAPRADIO_POKEMON_CHANNEL
	special MapRadio
	closetext
	end

Radio2Script:
; Lucky Channel
	opentext
	setval MAPRADIO_LUCKY_CHANNEL
	special MapRadio
	closetext
	end

TrashCanScript:
	jumptext TrashCanText

PCScript:
	opentext
	special PokemonCenterPC
	closetext
	end

ElevatorButtonScript:
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulderScript:
	farsjump AskStrengthScript

SmashRockScript:
	farsjump AskRockSmashScript

PokecenterSignScript:
	jumptext PokecenterSignText

MartSignScript:
	jumptext MartSignText

DayToTextScript:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
	getstring STRING_BUFFER_3, .SundayText
	end
.Monday:
	getstring STRING_BUFFER_3, .MondayText
	end
.Tuesday:
	getstring STRING_BUFFER_3, .TuesdayText
	end
.Wednesday:
	getstring STRING_BUFFER_3, .WednesdayText
	end
.Thursday:
	getstring STRING_BUFFER_3, .ThursdayText
	end
.Friday:
	getstring STRING_BUFFER_3, .FridayText
	end
.Saturday:
	getstring STRING_BUFFER_3, .SaturdayText
	end
.SundayText:
	db "SUNDAY@"
.MondayText:
	db "MONDAY@"
.TuesdayText:
	db "TUESDAY@"
.WednesdayText:
	db "WEDNESDAY@"
.ThursdayText:
	db "THURSDAY@"
.FridayText:
	db "FRIDAY@"
.SaturdayText:
	db "SATURDAY@"

WestportRocketsScript:
	clearevent EVENT_WESTPORT_CITY_ROCKET_TAKEOVER
	end

RadioTowerRocketsScript:
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_WESTPORT_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_SILVER_IN_WESTPORT
;	clearevent EVENT_GOT_FUEL_LINE
	setevent EVENT_SANSKRIT_TOWN_POKEFAN_M_BLOCKS_EAST
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	setmapscene SANSKRIT_TOWN, SCENE_FINISHED
	setmapscene RADIO_TOWER_6F, SCENE_DEFAULT
	end

BugContestResultsWarpScript:
	special ClearBGPalettes
	scall BugContestResults_CopyContestantsToResults
	setevent EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	clearevent EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	setevent EVENT_WARPED_FROM_ROUTE_103_NATIONAL_PARK_GATE
	warpfacing UP, STAND_CITY_NATIONAL_PARK_GATE, 0, 7
	applymovement PLAYER, Movement_ContestResults_WalkAfterWarp

BugContestResultsScript:
	clearflag ENGINE_BUG_CONTEST_TIMER
	clearevent EVENT_WARPED_FROM_ROUTE_103_NATIONAL_PARK_GATE
	clearevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	opentext
	writetext ContestResults_ReadyToJudgeText
	waitbutton
	special BugContestJudging
	getnum STRING_BUFFER_3
	ifequal 1, BugContestResults_FirstPlace
	ifequal 2, BugContestResults_SecondPlace
	ifequal 3, BugContestResults_ThirdPlace
	writetext ContestResults_ConsolationPrizeText
	promptbutton
	waitsfx
	verbosegiveitem BERRY
	iffalse BugContestResults_NoRoomForBerry

BugContestResults_DidNotWin:
	writetext ContestResults_DidNotWinText
	promptbutton
	sjump BugContestResults_FinishUp

BugContestResults_ReturnAfterWinnersPrize:
	writetext ContestResults_JoinUsNextTimeText
	promptbutton

BugContestResults_FinishUp:
	checkevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	iffalse BugContestResults_DidNotLeaveMons
	writetext ContestResults_ReturnPartyText
	waitbutton
	special ContestReturnMons
BugContestResults_DidNotLeaveMons:
	special CheckPartyFullAfterContest
	ifequal BUGCONTEST_CAUGHT_MON, BugContestResults_CleanUp
	ifequal BUGCONTEST_NO_CATCH, BugContestResults_CleanUp
	; BUGCONTEST_BOXED_MON
	writetext ContestResults_PartyFullText
	waitbutton
BugContestResults_CleanUp:
	closetext
	setscene SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	setmapscene ROUTE_103_NATIONAL_PARK_GATE, SCENE_ROUTE103NATIONALPARKGATE_NOTHING
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setflag ENGINE_DAILY_BUG_CONTEST
	special PlayMapMusic
	end

BugContestResults_FirstPlace:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	getitemname STRING_BUFFER_4, HEART_STONE
	writetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem HEART_STONE
	iffalse BugContestResults_NoRoomForSunStone
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_SecondPlace:
	getitemname STRING_BUFFER_4, EVERSTONE
	writetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem EVERSTONE
	iffalse BugContestResults_NoRoomForEverstone
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_ThirdPlace:
	getitemname STRING_BUFFER_4, GOLD_BERRY
	writetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem GOLD_BERRY
	iffalse BugContestResults_NoRoomForGoldBerry
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForSunStone:
	writetext BugContestPrizeNoRoomText
	promptbutton
	setevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForEverstone:
	writetext BugContestPrizeNoRoomText
	promptbutton
	setevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForGoldBerry:
	writetext BugContestPrizeNoRoomText
	promptbutton
	setevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	sjump BugContestResults_ReturnAfterWinnersPrize

BugContestResults_NoRoomForBerry:
	writetext BugContestPrizeNoRoomText
	promptbutton
	setevent EVENT_CONTEST_OFFICER_HAS_BERRY
	sjump BugContestResults_DidNotWin

BugContestResults_CopyContestantsToResults:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .skip1
	clearevent EVENT_BUG_CATCHING_CONTESTANT_1B
.skip1
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .skip2
	clearevent EVENT_BUG_CATCHING_CONTESTANT_2B
.skip2
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .skip3
	clearevent EVENT_BUG_CATCHING_CONTESTANT_3B
.skip3
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .skip4
	clearevent EVENT_BUG_CATCHING_CONTESTANT_4B
.skip4
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .skip5
	clearevent EVENT_BUG_CATCHING_CONTESTANT_5B
.skip5
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .skip6
	clearevent EVENT_BUG_CATCHING_CONTESTANT_6B
.skip6
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .skip7
	clearevent EVENT_BUG_CATCHING_CONTESTANT_7B
.skip7
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .skip8
	clearevent EVENT_BUG_CATCHING_CONTESTANT_8B
.skip8
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .skip9
	clearevent EVENT_BUG_CATCHING_CONTESTANT_9B
.skip9
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .skip10
	clearevent EVENT_BUG_CATCHING_CONTESTANT_10B
.skip10
	end

InitializeEventsScript:
	setevent EVENT_OKERA_OWES_YOU_ONE
	setevent EVENT_WHITNEY_1_AQUARIUM
	setevent EVENT_WHITNEY_2_AQUARIUM
	setevent EVENT_IEJIMA_TOWN_TRI_WING
	setevent EVENT_IEJIMA_TOWN_NOT_FIXED
	setevent EVENT_TELEPORT_GUY; so he doesn't appear until after returning the fuel line
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA; makes youngster disappear from n64 house
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES; I added this, makes kurt and captain disappear until ho-oh
	setevent EVENT_RED_IN_KANTO_GYM; also added this, makes red disappear until you beat all trainers in gym
;	setevent EVENT_EARLS_ACADEMY_EARL
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	setevent EVENT_SILVER_IN_WESTPORT
	setevent EVENT_WESTPORT_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
;	setevent EVENT_JADE_FOREST_APPRENTICE
;	setevent EVENT_STAND_CITY_ZOO_MONS
	setevent EVENT_JADE_FOREST_CHARCOAL_MASTER
	setevent EVENT_OLD_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_TEAM_ROCKET_BASE_B1F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B1F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B1F_DRAGONITE
	setevent EVENT_RIVAL_TEAM_ROCKET_BASE; used to make suicune disappear
;	setevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
;	setevent EVENT_GOT_FUEL_LINE
	setevent EVENT_RIVAL_CROWN_CITY
	setevent EVENT_ENTEI_APPEARS; used to make entei disappear
	setevent EVENT_RIVAL_WESTPORT_UNDERGROUND
	setevent EVENT_RAIKOU_APPEARS; used to make raikou disappear
	setevent EVENT_GUIDE_GENT_VISIBLE_IN_CROWN
	setevent EVENT_OAK2S_AIDE_IN_PAGOTA_POKEMON_CENTER
	setevent EVENT_COP_IN_OAK_LAB_BACK_ROOM
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	setevent EVENT_BOULDER_IN_ICE_PATH_1A
	setevent EVENT_BOULDER_IN_ICE_PATH_2A
	setevent EVENT_BOULDER_IN_ICE_PATH_3A
	setevent EVENT_BOULDER_IN_ICE_PATH_4A
	setevent EVENT_ROUTE_105_YOUNGSTER_JOEY
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setevent EVENT_FAST_SHIP_1F_GENTLEMAN
	setevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	setevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	setevent EVENT_KIKAI_VILLAGE_CIVILIANS
	setevent EVENT_OLD_MAHOGANY_MART_OWNERS
	setevent EVENT_FIVE_FLOOR_TOWER_ROOF_HO_OH
	setevent EVENT_WHIRL_ISLAND_BLISSEY_CHAMBER_BLISSEY

	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_1
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_2
	setevent EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_CARPET_1
	setevent EVENT_DECO_N64

	setevent EVENT_WESTPORT_TRAIN_STATION_GENTLEMAN
	setevent EVENT_ALLOY_GYM_JASMINE
	setevent EVENT_BLUE_FOREST_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	setevent EVENT_MET_BILL
	setevent EVENT_TEKNOS_POKE_CENTER_BILL
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	setevent EVENT_KIKAI_VILLAGE_LANCE
	setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_2; makes rocker disappear in n64 house
	setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_1; makes rocker disappear in game corner
	setevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_3; makes lass disappear in kume house
	setevent EVENT_WESTPORT_UNDERGROUND_WAREHOUSE_BLOCKED_OFF; makes lass disappear in n64 house
	setevent EVENT_DRAGONS_DEN_CLAIR
	setevent EVENT_RIVAL_ALLOY_CITY
	setevent EVENT_RIVAL_VICTORY_ROAD
	setevent EVENT_RIVAL_DRAGONS_DEN
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
;	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	setevent EVENT_BURNED_TOWER_B1F_BEASTS_1
	setevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	setevent EVENT_WESTPORT_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_KURTS_HOUSE_KURT_2
	setevent EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
	setevent EVENT_RANG_HELIX_FOSSIL_1
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_BIPETAL
	setevent EVENT_WESTPORT_CITY_MOVE_TUTOR
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	setevent EVENT_KANTO_RESTAURANT_CLAIR
	setevent EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	setevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setevent EVENT_BIRDON_TOWN_KURT
	setevent EVENT_BIRDON_TOWN_KURT
	setevent EVENT_JADE_FOREST_KURT
	setevent EVENT_ROUTE_113_ROUTE_114_GATE_TEACHER_IN_WALKWAY
;	setevent EVENT_JADE_FOREST_LASS
	setevent EVENT_WESTPORT_SALE_OFF
	setevent EVENT_TEKNOS_CITY_GRAMPS
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	setevent EVENT_SUNPOINT_CITY_EUSINE
	setevent EVENT_HYDRAULIC_CAVE_EUSINE
	setevent EVENT_HYDRAULIC_CAVE_WISE_TRIO_1
	setevent EVENT_HYDRAULIC_CAVE_WISE_TRIO_2
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_102
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_U4U
	setevent EVENT_SAW_SUICUNE_AT_SUNPOINT_CITY
	setevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	setflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setflag ENGINE_ROCKETS_IN_SANSKRIT
	variablesprite SPRITE_WEIRD_TREE, SPRITE_BIPETAL
	variablesprite SPRITE_ALLOY_RIVAL, SPRITE_POKEFAN_M
	variablesprite SPRITE_BIRDON_ROCKET, SPRITE_ROCKET
	variablesprite SPRITE_OLD_FUCHSIA_GYM_1, SPRITE_SURGE
	variablesprite SPRITE_OLD_FUCHSIA_GYM_2, SPRITE_ROCKET
	variablesprite SPRITE_OLD_FUCHSIA_GYM_3, SPRITE_JANINE
	variablesprite SPRITE_OLD_FUCHSIA_GYM_4, SPRITE_JANINE
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
;	setevent EVENT_FOUND_MACHINE_PART_IN_JADE_FOREST_SNORLAX_ROOM
	setevent EVENT_JADE_FOREST_SNORLAX_ROOM_ROCKET
	setevent EVENT_KUME_POINT_ROCKET
	setevent EVENT_MERIDIAN_PATH_MISTY_BOYFRIEND
	setevent EVENT_TRAINERS_IN_JADE_FOREST_SNORLAX_ROOM
	setevent EVENT_COPYCATS_HOUSE_2F_DOLL
	setevent EVENT_TEAM_ROCKET_SHIP_BASE_BLUE
	setevent EVENT_SEAFOAM_GYM_GYM_GUY
	setevent EVENT_MT_MOON_SQUARE_CLEFAIRY
	setevent EVENT_RYUKYU_TRAIN_STATION_POPULATION
	setevent EVENT_MOUNT_FUJI_POKECENTER_RIVAL
	setevent EVENT_INITIALIZED_EVENTS
	return

AskNumber1MScript:
	writetext AskNumber1MText
	end

AskNumber2MScript:
	writetext AskNumber2MText
	end

RegisteredNumberMScript:
	writetext RegisteredNumberMText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	end

NumberAcceptedMScript:
	writetext NumberAcceptedMText
	waitbutton
	closetext
	end

NumberDeclinedMScript:
	writetext NumberDeclinedMText
	waitbutton
	closetext
	end

PhoneFullMScript:
	writetext PhoneFullMText
	waitbutton
	closetext
	end

RematchMScript:
	writetext RematchMText
	waitbutton
	closetext
	end

AskNumber1FScript:
	writetext AskNumber1FText
	end

AskNumber2FScript:
	writetext AskNumber2FText
	end

RegisteredNumberFScript:
	writetext RegisteredNumberFText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	end

NumberAcceptedFScript:
	writetext NumberAcceptedFText
	waitbutton
	closetext
	end

NumberDeclinedFScript:
	writetext NumberDeclinedFText
	waitbutton
	closetext
	end

PhoneFullFScript:
	writetext PhoneFullFText
	waitbutton
	closetext
	end

RematchFScript:
	writetext RematchFText
	waitbutton
	closetext
	end

GymStatue1Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	writetext GymStatue_CityGymText
	waitbutton
	closetext
	end

GymStatue2Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	writetext GymStatue_CityGymText
	promptbutton
	writetext GymStatue_WinningTrainersText
	waitbutton
	closetext
	end

ReceiveItemScript:
	waitsfx
	writetext ReceivedItemText
	playsound SFX_ITEM
	waitsfx
	end

ReceiveTogepiEggScript:
	waitsfx
	writetext ReceivedItemText
	playsound SFX_GET_EGG
	waitsfx
	end

GameCornerCoinVendorScript:
	faceplayer
	opentext
	writetext CoinVendor_WelcomeText
	promptbutton
	checkitem COIN_CASE
	iftrue CoinVendor_IntroScript
	writetext CoinVendor_NoCoinCaseText
	waitbutton
	closetext
	end

CoinVendor_IntroScript:
	writetext CoinVendor_IntroText

.loop
	special DisplayMoneyAndCoinBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Buy50
	ifequal 2, .Buy500
	sjump .Cancel

.Buy50:
	checkcoins MAX_COINS - 50
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 50
	takemoney YOUR_MONEY, 1000
	waitsfx
	playsound SFX_TRANSACTION
	writetext CoinVendor_Buy50CoinsText
	waitbutton
	sjump .loop

.Buy500:
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 500
	takemoney YOUR_MONEY, 10000
	waitsfx
	playsound SFX_TRANSACTION
	writetext CoinVendor_Buy500CoinsText
	waitbutton
	sjump .loop

.NotEnoughMoney:
	writetext CoinVendor_NotEnoughMoneyText
	waitbutton
	closetext
	end

.CoinCaseFull:
	writetext CoinVendor_CoinCaseFullText
	waitbutton
	closetext
	end

.Cancel:
	writetext CoinVendor_CancelText
	waitbutton
	closetext
	end

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"

HappinessCheckScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	ifless 50, .Unhappy
	ifless 150, .KindaHappy
	writetext HappinessText3
	waitbutton
	closetext
	end

.KindaHappy:
	writetext HappinessText2
	waitbutton
	closetext
	end

.Unhappy:
	writetext HappinessText1
	waitbutton
	closetext
	end

Movement_ContestResults_WalkAfterWarp:
	step UP
	step UP
	step RIGHT
	turn_head UP
	step_end
