	object_const_def ; object_event constants
	const TEAMROCKETBASEOFFICE_POKE_BALL1
	const TEAMROCKETBASEOFFICE_POKE_BALL2
	const TEAMROCKETBASEOFFICE_POKE_BALL3
	const TEAMROCKETBASEOFFICE_GRUNT1
	const TEAMROCKETBASEOFFICE_GRUNT2
	const TEAMROCKETBASEOFFICE_GRUNT3
	const TEAMROCKETBASEOFFICE_GRUNT4
	const TEAMROCKETBASEOFFICE_GRUNT5
	const TEAMROCKETBASEOFFICE_IMPOSTOR
	const TEAMROCKETBASEOFFICE_EXECUTIVE

TeamRocketBaseOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeamRocketBaseOfficeHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseOfficeNugget:
	itemball NUGGET

TeamRocketBaseOfficeGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseOfficeHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_OFFICE_HIDDEN_REVIVE
	
RocketBossRoomGrunt1:
	jumptextfaceplayer RocketBossRoomGrunt1Text

RocketBossRoomGrunt2:
	jumptextfaceplayer RocketBossRoomGrunt2Text

RocketBossRoomGrunt3:
	jumptextfaceplayer RocketBossRoomGrunt3Text

RocketBossRoomGrunt4:
	jumptextfaceplayer RocketBossRoomGrunt4Text

RocketBossRoomGrunt5:
	jumptextfaceplayer RocketBossRoomGrunt5Text
	
ExecutiveConfrontationScene:
	turnobject PLAYER, UP
	jump ExecutiveConfrontationScript
	end
	
ExecutiveConfrontationScene2:
	applymovement PLAYER, PlayerStepsUpToImposter
	jump ExecutiveConfrontationScript
	end
	
ExecutiveConfrontationScript:
	pause 15
	opentext
	writetext ImposterTellsYouToSeeExecutive
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalksToExecutive
	pause 20
	opentext
	writetext TheExecutiveGreeting
	waitbutton
	closetext
	winlosstext ExecutiveWinText, ExecutiveLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext ExecutiveSceneAfterBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEOFFICE_EXECUTIVE, ExecutiveLeavesOffice
	disappear TEAMROCKETBASEOFFICE_EXECUTIVE
	disappear TEAMROCKETBASEOFFICE_IMPOSTOR
	setevent EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
	setscene SCENE_TEAMROCKETBASEOFFICE_NOTHING
	end
	
TeamRocketBaseOfficePassword:
	opentext
	writetext BadSecurityPractices
	waitbutton
	closetext
	setevent EVENT_ROUTE_105_BATTLE
	end
	
PlayerStepsUpToImposter:
	step UP
	step_end
	
PlayerWalksToExecutive:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
ExecutiveLeavesOffice:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
RocketBossRoomGrunt1Text:
	text "This is the final"
	line "preparation"
	para "meeting before our"
	line "machine becomes"
	cont "fully functional."
	para "I'm sure there"
	line "isn't anything"
	para "that can get in"
	line "the way of our"
	cont "plan now!"
	done
	
RocketBossRoomGrunt2Text:
	text "IMPOSTOR OAK did a"
	line "great job"
	para "convincing the"
	line "people of STAND"
	para "CITY to not worry"
	line "about our"
	cont "operations here."
	done
	
RocketBossRoomGrunt3Text:
	text "The EXECUTIVE is"
	line "the only person"
	para "who knows the"
	line "password to shut"
	para "down the mind"
	line "control antenna."
	para "He can also be"
	line "very forgetful…"
	done
	
RocketBossRoomGrunt4Text:
	text "The world won't"
	line "know what hit them"
	para "when our machine"
	line "is at full power"
	para "and we summon all"
	line "of their #MON"
	cont "to do our work!"
	done
	
RocketBossRoomGrunt5Text:
	text "According to my"
	line "calculations, the"
	para "mind control"
	line "signal should be"
	para "at full strength"
	line "within the next"
	cont "week!"
	done
	
BadSecurityPractices:
	text "What's this?"
	para "The EXECUTIVE has"
	line "a note stuck to"
	cont "his computer…"
	para "It's the password"
	line "to the console!"
	para "…"
	para "<PLAYER>"
	line "remembered the"
	cont "password!"
	done
	
ExecutiveSceneAfterBattleText:
	text "Argh!"
	para "You may have"
	line "defeated me in"
	para "battle, but that"
	line "means little now."
	para "Our machine is"
	line "inching ever"
	para "closer to full"
	line "power!"
	para "Your #MON may"
	line "have defeated mine"
	para "now, but it won't"
	line "matter soon when"
	para "even they are"
	line "under my control!"
	para "Now if you'll"
	line "excuse me, I've"
	para "got some very"
	line "important business"
	cont "to attend to!"
	done
	
ExecutiveWinText:
	text "I can't believe"
	line "this!"
	done
	
ExecutiveLossText:
	text "HA!"
	done
	
TheExecutiveGreeting:
	text "Do you understand"
	line "what you've gotten"
	cont "yourself into?"
	para "Clearly you don't,"
	line "or you wouldn't be"
	cont "here."
	para "…"
	para "You remember me,"
	line "right?"
	para "I was the CAPTAIN"
	line "of our cargo ship."
	para "But primarily, I'm"
	line "the lead EXECUTIVE"
	cont "of TEAM ROCKET."
	para "Second only to our"
	line "leader, GIOVANNI."
	para "Am I right to"
	line "assume you've"
	para "figured out what"
	line "we're doing here?"
	para "All of the money"
	line "and supplies we've"
	para "gathered have been"
	line "used for this one"
	cont "ultimate goal!"
	para "We've built a"
	line "device that can"
	para "emit a powerful"
	line "wave which can be"
	para "used to control"
	line "the minds of"
	cont "#MON!"
	para "Soon, all #MON"
	line "will be under the"
	para "command of TEAM"
	line "ROCKET!"
	para "We'll make better"
	line "use of them than"
	cont "anyone ever has!"
	para "I refuse to let"
	line "you get in the way"
	para "of TEAM ROCKET any"
	line "longer!"
	done
	
	
ImposterTellsYouToSeeExecutive:
	text "Looks like none"
	line "of our GRUNTS"
	cont "could stop you."
	para "But honestly, we"
	line "expected that by"
	cont "this point."
	para "I think you need"
	line "to go see the"
	cont "EXECUTIVE."
	para "But I know you"
	line "were planning on"
	cont "doing that anyway."
	para "He's not too"
	line "happy about this"
	cont "whole situation."
	para "I'd be worried"
	line "if I were you."
	done


TeamRocketBaseOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 24, 17, TEAM_ROCKET_BASE_B2F, 4
	warp_event 25, 17, TEAM_ROCKET_BASE_B2F, 5

	db 2 ; coord events
	coord_event  7, 12, SCENE_DEFAULT, ExecutiveConfrontationScene
	coord_event  7, 13, SCENE_DEFAULT, ExecutiveConfrontationScene2


	db 3 ; bg events
	bg_event  9,  1, BGEVENT_ITEM, TeamRocketBaseOfficeHiddenRevive
	bg_event  6,  1, BGEVENT_READ, TeamRocketBaseOfficePassword
	bg_event  7,  1, BGEVENT_READ, TeamRocketBaseOfficePassword


	db 10 ; object events
	object_event  9, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeHyperPotion, EVENT_TEAM_ROCKET_BASE_OFFICE_HYPER_POTION
	object_event 16,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeNugget, EVENT_TEAM_ROCKET_BASE_OFFICE_NUGGET
	object_event 24,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeGuardSpec, EVENT_TEAM_ROCKET_BASE_OFFICE_GUARD_SPEC
	object_event 21,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt1, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 28,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt2, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 22, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt3, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 19,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt4, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event 25,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt5, EVENT_ROCKETS_IN_ROCKET_BASE
	object_event  7, 11, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_IMPOSTOR_AND_EXECUTIVE_DISAPPEAR
