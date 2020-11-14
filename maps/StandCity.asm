	object_const_def ; object_event constants
	const STANDCITY_ROCKER
	const STANDCITY_POKEFAN_M
	const STANDCITY_TWIN
	const STANDCITY_TEACHER
	const STANDCITY_FRUIT_TREE
	const STANDCITY_MONSTER1
	const STANDCITY_MONSTER2
	const STANDCITY_MONSTER3
	const STANDCITY_BIRD
	const STANDCITY_FAIRY
	const STANDCITY_BLOCKROCKET1
;	const STANDCITY_BLOCKROCKET2
;	const STANDCITY_BLOCKROCKET3
;	const STANDCITY_BLOCKROCKET4
	const STANDCITY_IMPOSTOR
	const STANDCITY_HQBLOCKROCKET
	const STANDCITY_NATIONALBLOCKROCKET

StandCity_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneStandCityNothing ; SCENE_DEFAULT
	scene_script .SceneStandCityImposter ;

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .StandCityBlockFence

.SceneStandCityNothing
	end

.SceneStandCityImposter
	end


.FlyPoint:
	setflag ENGINE_FLYPOINT_STAND
	return
	
.StandCityBlockFence:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .Done20
	changeblock  29, 35, $4C ; rock
	changeblock  31, 35, $39 ; rock
.Done20:
	return
	
ImposterIntro1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	jump ImposterSceneScript
	end
	
ImposterIntro2:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	applymovement PLAYER, ImposterSceneMove1
	jump ImposterSceneScript
	end
	
ImposterSceneScript:
	moveobject STANDCITY_TEACHER, 27, 23
	moveobject STANDCITY_TWIN, 29, 23
	moveobject STANDCITY_ROCKER, 28, 24
	moveobject STANDCITY_POKEFAN_M, 27, 25
	appear STANDCITY_POKEFAN_M
	appear STANDCITY_ROCKER
	appear STANDCITY_TWIN
	applymovement PLAYER, ImposterSceneMove2
	turnobject STANDCITY_POKEFAN_M, RIGHT
	applymovement PLAYER, ImposterSceneMove2_5
	turnobject STANDCITY_TEACHER, LEFT
	applymovement PLAYER, ImposterSceneMove2_7
	showemote EMOTE_SHOCK, STANDCITY_TWIN, 25
	turnobject STANDCITY_TEACHER, UP
	pause 3
	turnobject STANDCITY_ROCKER, UP
	pause 3
	turnobject STANDCITY_POKEFAN_M, UP
	pause 30
	opentext
	writetext ImposterText1
	waitbutton
	closetext
	moveobject STANDCITY_IMPOSTOR, 29, 19
	appear STANDCITY_IMPOSTOR
	applymovement STANDCITY_IMPOSTOR, ImposterWalksDown
	pause 10
	opentext
	writetext ImposterText2
	waitbutton
	closetext
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_ROCKER, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_TWIN, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_TEACHER, 5
	pause 3
	showemote EMOTE_SHOCK, STANDCITY_POKEFAN_M, 5
	pause 15
	opentext
	writetext ImposterText3
	waitbutton
	closetext
	pause 10
	applymovement STANDCITY_IMPOSTOR, ImposterWalksUp
	disappear STANDCITY_IMPOSTOR
	setevent EVENT_JADE_FOREST_APPRENTICE
	setscene SCENE_DEFAULT
	playmusic MUSIC_KANTO_REGION
	end


StandCityRocker:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RockerRocketsGone
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .RockerAfterImposter
	writetext StandCityRockerText
	waitbutton
	closetext
	end
	
.RockerRocketsGone
	writetext StandCityRockerAllGoodText
	waitbutton
	closetext
	end
	
.RockerAfterImposter
	writetext StandCityRockerImposterText
	waitbutton
	closetext
	end

StandCityPokefanM:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .PokefanRocketsGone
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .PokefanAfterImposter
	writetext StandCityPokefanMText
	waitbutton
	closetext
	end
	
.PokefanRocketsGone
	writetext StandCityPokefanAllGoodText
	waitbutton
	closetext
	end
	
.PokefanAfterImposter
	writetext StandCityPokefanImposterText
	waitbutton
	closetext
	end


StandCityTwin:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TwinRocketsGone
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .TwinAfterImposter
	writetext StandCityTwinText
	waitbutton
	closetext
	end
	
.TwinRocketsGone
	writetext StandCityTwinAllGoodText
	waitbutton
	closetext
	end
	
.TwinAfterImposter
	writetext StandCityTwinImposterText
	waitbutton
	closetext
	end
	
StandCityTeacher:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TeacherRocketsGone
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .TeacherAfterImposter
	writetext StandCityTeacherText
	waitbutton
	closetext
	end
	
.TeacherRocketsGone
	writetext StandCityTeacherAllGoodText
	waitbutton
	closetext
	end
	
.TeacherAfterImposter
	writetext StandCityTeacherImposterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket1:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket1AfterBase
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .BlockRocket1AfterImposter
	writetext BlockRocket1BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket1AfterBase
	writetext BlockRocket1AfterBaseText
	waitbutton
	closetext
	end

.BlockRocket1AfterImposter
	writetext BlockRocket1AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket2:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket2AfterBase
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .BlockRocket2AfterImposter
	writetext BlockRocket2BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket2AfterBase
	writetext BlockRocket2AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket2AfterImposter
	writetext BlockRocket2AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket3:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket3AfterBase
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .BlockRocket3AfterImposter
	writetext BlockRocket3BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket3AfterBase
	writetext BlockRocket3AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket3AfterImposter
	writetext BlockRocket3AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket4:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .BlockRocket4AfterBase
	checkevent EVENT_JADE_FOREST_APPRENTICE
	iftrue .BlockRocket4AfterImposter
	writetext BlockRocket4BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket4AfterBase
	writetext BlockRocket4AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket4AfterImposter
	writetext BlockRocket4AfterText
	waitbutton
	closetext
	end
	

StandCitySign:
	jumptext StandCitySignText

OldFuchsiaGymSign:
	jumptext OldFuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

SafariZoneClefairySign:
	jumptext SafariZoneClefairySignText
	
SafariZoneAmpharosSign:
	jumptext SafariZoneAmpharosSignText
	
SafariZoneSkarmorySign:
	jumptext SafariZoneSkarmorySignText
	
SafariZoneGolduckSign:
	jumptext SafariZoneGolduckSignText

NoLitteringSign:
	jumptext NoLitteringSignText

StandCityPokecenterSign:
;	setevent EVENT_STAND_CITY_ZOO_MONS
;	clearevent EVENT_JADE_FOREST_APPRENTICE
;	clearevent EVENT_JADE_FOREST_LASS
	jumpstd PokecenterSignScript

StandCityMartSign:
	jumpstd MartSignScript

StandCityFruitTree:
	fruittree FRUITTREE_STAND_CITY
	
StandCityHQBlockRocket:
	jumptextfaceplayer StandCityHQBlockRocketText
	
StandCityNationalBlockRocket:
	faceplayer
	opentext
	checkevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	iftrue .NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketText
	waitbutton
	closetext
	end

.NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketAfterBaseText
	waitbutton
	closetext
	end

ImposterSceneMove1:
	step LEFT
	step_end
	
ImposterSceneMove2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end
	
ImposterSceneMove2_5:
	step UP
	step UP
	step_end
	
ImposterSceneMove2_7:
	step UP
	step UP
	step UP
	step UP
	step_end
	
ImposterWalksDown:
	step DOWN
	step DOWN
	step_end
	
ImposterWalksUp:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end
	
StandCityNationalBlockRocketAfterBaseText:
	text "I always feel left"
	line "out…"
	para "No one tells me"
	line "what's going on"
	cont "over here…"
	done
	
BlockRocket4AfterBaseText:
	text "Everyone else is"
	line "gone?"
	para "You didn't have"
	line "anything to do"
	para "with this, did"
	line "you?"
	done

BlockRocket3AfterBaseText:
	text "Rumor is that the"
	line "gang is over in"
	cont "WESTPORT CITY."
	para "What does that"
	line "mean, though?"
	para "What happened to"
	line "our base?"
	done
	
BlockRocket2AfterBaseText:
	text "Is that right?"
	para "I'm hearing the"
	line "base is empty."
	para "Why are we still"
	line "here, then?"
	done
	
BlockRocket1AfterBaseText:
	text "Is the base empty?"
	para "Where did everyone"
	line "go?"
	done
	
StandCityHQBlockRocketText:
	text "All of us hate"
	line "guarding the"
	para "entrance to this"
	line "building."
	para "My shift is almost"
	line "over, though."
	para "I hope my"
	line "replacement"
	para "actually shows up"
	line "this time…"
	done
	
StandCityNationalBlockRocketText:
	text "No one needs to"
	line "enter the NATIONAL"
	cont "PARK right now!"
	para "Not while #MON"
	line "are getting sick."
	para "I care about their"
	line "health, see?"
	done
	
BlockRocket1BeforeText:
	text "There's nothing"
	line "south of here!"
	para "You should just"
	line "stay in town!"
	para "You don't want to"
	line "miss our celebrity"
	cont "speaker!"
	done

BlockRocket1AfterText:
	text "Hey, kid!"
	para "Wasn't that a"
	line "great speech by"
	para "the real, actual"
	line "PROF.OAK?"
	done
	
BlockRocket2BeforeText:
	text "You don't want"
	line "to leave town."
	para "We've got a"
	line "special guest"
	cont "coming soon!"
	done
	
BlockRocket2AfterText:
	text "Our research will"
	line "benefit the world!"
	done
	
BlockRocket3BeforeText:
	text "There's nothing"
	line "south of here!"
	para "You should just"
	line "stay in town!"
	done
	
BlockRocket3AfterText:
	text "The people love"
	line "PROF.OAK!"
	done
	
BlockRocket4BeforeText:
	text "It's almost time"
	line "for the world to"
	cont "hear our plan!"
	done
	
BlockRocket4AfterText:
	text "We're doing great"
	line "things, didn't you"
	cont "hear?"
	done
	
ImposterText1:
	text "Citizens of STAND"
	line "CITY!"
	done
	
ImposterText2:
	text "It is I, the"
	line "world-renowned"
	cont "PROF.OAK!"
	para "I have some"
	line "exciting news"
	para "about a break-"
	line "through in #MON"
	cont "research!"
	para "I have partnered"
	line "with TEAM ROCKET"
	para "to bring to you"
	line "this new"
	cont "technology!"
	done
	
ImposterText3:
	text "Do not be alarmed!"
	para "TEAM ROCKET is"
	line "doing great work"
	para "in developing a"
	line "high-powered radio"
	para "signal that is"
	line "able to read the"
	para "thoughts of"
	line "#MON!"
	para "And this signal is"
	line "being developed"
	para "right here in"
	line "STAND CITY!"
	para "Though the signal"
	line "might have the"
	para "effect of making"
	line "#MON that are"
	para "exposed to it feel"
	line "unwell…"
	para "…"
	para "But just ignore"
	line "that!"
	para "They'll be fine!"
	para "The results of"
	line "this research will"
	para "allow us a greater"
	line "understanding of"
	para "#MON than ever"
	line "before!"
	para "And you can trust"
	line "me, because as you"
	para "can see, I am"
	line "PROF.OAK."
	para "That is all!"
	done

StandCityRockerText:
	text "The #MON that"
	line "usually are in the"
	para "ZOO over there"
	line "aren't feeling"
	cont "well."
	para "STAND CITY park"
	line "officials are"
	para "keeping them at"
	line "their park #MON"
	cont "CENTER."
	done
	
StandCityRockerAllGoodText:
	text "That wasn't the"
	line "real PROF.OAK?"
	para "That's crazy!"
	para "I'm so glad the"
	line "#MON are doing"
	cont "better now."
	done
	
StandCityRockerImposterText:
	text "TEAM ROCKET is"
	line "behind the #MON"
	cont "not feeling well?"
	para "But PROF.OAK tells"
	line "me that they'll be"
	para "okay and it's a"
	line "part of important"
	cont "research…"
	para "And I trust him."
	done

StandCityPokefanMText:
	text "I'm disappointed"
	line "the #MON aren't"
	cont "outside."
	para "But it's more"
	line "important that"
	cont "they get well."
	done
	
StandCityPokefanImposterText:
	text "PROF.OAK is"
	line "responsible for"
	para "the #MON not"
	line "feeling well?"
	para "He must have a"
	line "good reason…"
	done
	
StandCityPokefanAllGoodText:
	text "I'm so glad all of"
	line "the #MON are"
	cont "well again!"
	done

StandCityTwinText:
	text "The STAND CITY ZOO"
	line "is closed…"
	
	para "It's sad,"
	line "considering it's"
	para "STAND CITY's main"
	line "attraction."
	
	para "I hope the #MON"
	line "are okay."
	done
	
StandCityTwinImposterText:
	text "TEAM ROCKET is"
	line "back?"
	para "And with PROF.OAK?"
	para "This can't be"
	line "right…"
	done
	
StandCityTwinAllGoodText:
	text "Yay! The ZOO is"
	line "open again!"
	done

StandCityTeacherText:
	text "What are all of"
	line "these TEAM ROCKET"
	para "members doing"
	line "here?"
	para "This can't be"
	line "good!"
	done
	
StandCityTeacherImposterText:
	text "Something didn't"
	line "seem right about"
	cont "PROF.OAK…"
	done

StandCityTeacherAllGoodText:
	text "I'm so glad things"
	line "are normal again."
	done

StandCitySignText:
	text "STAND CITY"

	para "A utopia for"
	line "people and #MON"
	cont "alike"
	done

OldFuchsiaGymSignText:
	text "STAND CITY"
	line "#MON GYM"
	cont "LEADER: OKERA"

	para "The Kid who"
	line "thrives in the"
	cont "dark"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "SAFARI ZONE OFFICE"
	line "is closed until"
	cont "further notice."
	done

WardensHomeSignText:
	text "STAND CITY ZOO"
	line "Medical Center"
	done

SafariZoneClosedSignText:
	text "#MON:"
	line "KANGASKHAN"
	para "To avoid"
	line "crushing the"
	para "baby it carries in"
	line "its pouch, it"
	para "always sleeps"
	line "standing up."
	done

SafariZoneClefairySignText:
	text "#MON:"
	line "CLEFAIRY"
	para "Though rarely"
	line "seen, it becomes"
	para "easier to spot,"
	line "for some reason,"
	para "on the night of a "
	line "full moon."
	done
	
SafariZoneAmpharosSignText:
	text "#MON:"
	line "AMPHAROS"
	para "When it gets dark,"
	line "the light from its"
	para "bright, shiny tail"
	line "can be seen from"
	para "far away on the"
	line "ocean's surface."
	done
	
SafariZoneSkarmorySignText:
	text "#MON:"
	line "SKARMORY"
	para "The feathers that"
	line "it sheds are very"
	para "sharp. It is said"
	line "that people once"
	para "used the feathers"
	line "as swords."
	done
	
SafariZoneGolduckSignText:
	text "#MON:"
	line "GOLDUCK"
	para "It swims grace-"
	line "fully along on the"
	para "quiet, slow-moving"
	line "rivers and lakes"
	para "of which it is so"
	line "fond."
	done

NoLitteringSignText:
	text "STAND CITY ZOO"
	line "Main Office"
	done

StandCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 35, 26, STAND_MART, 1
	warp_event 16, 21, STAND_CITY_ZOO_OFFICE, 1
	warp_event 34, 31, STAND_GYM, 1
	warp_event 26, 29, BILLS_BROTHERS_HOUSE, 1
	warp_event 33, 20, STAND_POKECENTER_1F, 1
	warp_event 17, 31, STAND_CITY_ROCKET_HOUSE, 1
	warp_event  1,  0, SAFARI_ZONE_STAND_GATE_BETA, 3 ; inaccessible
	warp_event 30, 13, ROUTE_112_STAND_GATE, 3
	warp_event 31, 13, ROUTE_112_STAND_GATE, 4
	warp_event  6, 17, STAND_CITY_NATIONAL_PARK_GATE, 4
	warp_event  0,  0, MERIDIAN_PATH_RYUKYU_GATE, 2
	warp_event 35, 31, STAND_GYM, 2
	warp_event 24, 17, STAND_POKE, 1


	db 2 ; coord events
	coord_event  34, 32, SCENE_STAND_CITY_IMPOSTOR, ImposterIntro1
	coord_event  35, 32, SCENE_STAND_CITY_IMPOSTOR, ImposterIntro2

	db 12 ; bg events
	bg_event 36, 20, BGEVENT_READ, StandCitySign
	bg_event 32, 35, BGEVENT_READ, OldFuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 24, 20, BGEVENT_READ, WardensHomeSign
	bg_event  8,  8, BGEVENT_READ, SafariZoneClosedSign
	bg_event 18, 21, BGEVENT_READ, NoLitteringSign
	bg_event 34, 20, BGEVENT_READ, StandCityPokecenterSign
	bg_event 36, 26, BGEVENT_READ, StandCityMartSign
	bg_event 14,  8, BGEVENT_READ, SafariZoneClefairySign
	bg_event 20, 10, BGEVENT_READ, SafariZoneAmpharosSign
	bg_event 16, 16, BGEVENT_READ, SafariZoneSkarmorySign
	bg_event 10, 20, BGEVENT_READ, SafariZoneGolduckSign

	db 14 ; object events
	object_event 28, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityRocker, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityPokefanM, -1
	object_event 14, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityTwin, -1
	object_event 28, 30, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityTeacher, -1
	object_event 26, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandCityFruitTree, -1
	object_event 20,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event  7, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event  7,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 15, 14, SPRITE_BIRD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 12,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS
	object_event 28, 34, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket1, EVENT_CLEARED_RADIO_TOWER
;	object_event 28, 34, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket2, EVENT_CLEARED_RADIO_TOWER
;	object_event 30, 35, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket3, EVENT_CLEARED_RADIO_TOWER
;	object_event 31, 34, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket4, EVENT_CLEARED_RADIO_TOWER
	object_event -5, -5, SPRITE_OLD_FUCHSIA_GYM_1, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17, 32, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityHQBlockRocket, EVENT_BEAT_CHUCK
	object_event  6, 18, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityNationalBlockRocket, EVENT_CLEARED_RADIO_TOWER

