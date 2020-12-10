; See data/maps/scenes.asm for which maps have scene variables.
; Each scene_script and coord_event is associated with a current scene ID.

; Scene variables default to 0.
SCENE_DEFAULT  EQU 0
; Often a map will have a one-time default event for scene 0, and switch to a
; do-nothing scene 1 when the event finishes.
SCENE_FINISHED EQU 1

; wPokecenter2FSceneID
	const_def 1
	const SCENE_POKECENTER2F_LEAVE_TRADE_CENTER       ; 1
	const SCENE_POKECENTER2F_LEAVE_COLOSSEUM          ; 2
	const SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE       ; 3
	const SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM  ; 4
	const SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM ; 5

; wHydroPlantSceneID
	const_def
	const SCENE_HYDROPLANT_NOTHING               ; 0
	const SCENE_HYDROPLANT_GUARD_GETS_PHONE_CALL ; 1

; wJadeForestSnorlaxRoomSceneID
	const_def
	const SCENE_NAGOGYM_NOTHING        ; 0
	const SCENE_NAGOGYM_GRUNT_RUNS_OUT ; 1

; wMeridianPathSceneID
	const_def
	const SCENE_MERIDIANPATH_NOTHING     ; 0
	const SCENE_MERIDIANPATH_MISTYS_DATE ; 1

; wLancesRoomSceneID
	const_def 1
	const SCENE_LANCESROOM_APPROACH_LANCE ; 1
	
; wSilentSceneID
	const_def 1
	const SCENE_TEACHER_STOPS
	const SCENE_SILENT_NOTHING

; wOakLabFrontRoomSceneID
	const_def 1
	const SCENE_HEAD_TO_THE_BACK
	const SCENE_OAK_LAB_FRONT_ROOM_NOTHING
	const SCENE_OAK_LAB_FRONT_ROOM_POKEDEX
	const SCENE_OAK_LAB_FRONT_ROOM_DAISY
	const SCENE_OAK_LAB_FRONT_ROOM_GO_SEE_OAK
	const SCENE_OAK_LAB_FRONT_ROOM_BATTLE

; wOakLabBackRoomSceneID
	const_def 1
	const SCENE_OAK2SLAB_CANT_LEAVE            ; 1
	const SCENE_OAK2SLAB_NOTHING               ; 2
	const SCENE_OAK2SLAB_MEET_OFFICER          ; 3
	const SCENE_OAK2SLAB_UNUSED                ; 4
	const SCENE_OAK2SLAB_AIDE_GIVES_POTION     ; 5
	const SCENE_OAK2SLAB_AIDE_GIVES_POKE_BALLS ; 6

; wRoute101SceneID
	const_def
	const SCENE_ROUTE101_NOTHING        ; 0
	const SCENE_ROUTE101_CATCH_TUTORIAL ; 1

; wCrownCitySceneID
	const_def
	const SCENE_CROWNCITY_NOTHING    ; 0
	const SCENE_CROWNCITY_MEET_RIVAL ; 1

; wRoute112SceneID
	const_def 1
	const SCENE_ROUTE112_OFFER_SLOWPOKETAIL ; 1
	const SCENE_ROUTE112_NOTHING            ; 2

; wRoute103NationalParkGateSceneID
	const_def
	const SCENE_ROUTE103NATIONALPARKGATE_NOTHING             ; 0
	const SCENE_ROUTE103NATIONALPARKGATE_UNUSED              ; 1
	const SCENE_ROUTE103NATIONALPARKGATE_LEAVE_CONTEST_EARLY ; 2

; wRoute102SceneID
	const_def 1
	const SCENE_ROUTE102_NOTHING ; 0
	const SCENE_ROUTE102_SILVER ; 1

; wStandCityNationalParkGateSceneID
	const_def
	const SCENE_STANDCITYNATIONALPARKGATE_NOTHING             ; 0
	const SCENE_STANDCITYNATIONALPARKGATE_UNUSED              ; 1
	const SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY ; 2

; wBirdonTownSceneID
	const_def
	const SCENE_BIRDONTOWN_NOTHING              ; 0
	const SCENE_BIRDONTOWN_RIVAL_BATTLE         ; 1
	const SCENE_BIRDONTOWN_KURT_RETURNS_GS_BALL ; 2

; wTeknosGymSceneID
	const_def
	const SCENE_TEKNOSGYM_NOTHING              ; 0
	const SCENE_TEKNOSGYM_WHITNEY_STOPS_CRYING ; 1

; wRouteU4USceneID
	const_def
	const SCENE_ROUTEU4U_NOTHING ; 0
	const SCENE_ROUTEU4U_SUICUNE ; 1

; wSunpointCitySceneID
	const_def
	const SCENE_SUNPOINTCITY_NOTHING            ; 0
	const SCENE_SUNPOINTCITY_SUICUNE_AND_EUSINE ; 1

; wBurnedTower1FSceneID
	const_def 1
	const SCENE_BURNEDTOWER1F_RIVAL_BATTLE ; 1
	const SCENE_BURNEDTOWER1F_NOTHING      ; 2

; wRadioTower5FSceneID
	const_def 1
	const SCENE_RADIOTOWER5F_ROCKET_BOSS ; 1
	const SCENE_RADIOTOWER5F_NOTHING     ; 2

; wRuinsOfAlphOutsideSceneID
	const_def
	const SCENE_RUINSOFALPHOUTSIDE_NOTHING       ; 0
	const SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX ; 1

; wRuinsOfAlphResearchCenterSceneID
	const_def
	const SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING       ; 0
	const SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX ; 1

; wRuinsOfAlphInnerChamberSceneID
	const_def
	const SCENE_RUINSOFALPHINNERCHAMBER_NOTHING          ; 0
	const SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE ; 1

; wOldMahoganyMart1FSceneID
	const_def
	const SCENE_OLDMAHOGANYMART1F_NOTHING               ; 0
	const SCENE_OLDMAHOGANYMART1F_LANCE_UNCOVERS_STAIRS ; 1

; wTeamRocketBaseOfficeSceneID	
	const_def 1
	const SCENE_TEAMROCKETBASEOFFICE_NOTHING

; wTeamRocketBaseB1FSceneID
	const_def 1
	const SCENE_TEAMROCKETBASEB1F_ROCKET_BOSS ; 1
	const SCENE_TEAMROCKETBASEB1F_ELECTRODES  ; 2
	const SCENE_TEAMROCKETBASEB1F_NOTHING     ; 3

; wTeamRocketBaseB2FSceneID
	const_def 1
	const SCENE_TEAMROCKETBASEB2F_RIVAL_ENCOUNTER ; 1
	const SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS     ; 2
	const SCENE_TEAMROCKETBASEB2F_NOTHING         ; 3

; wDragonsDenB1FSceneID
	const_def
	const SCENE_DRAGONSDENB1F_NOTHING        ; 0
	const SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM ; 1

; wWestportPortSceneID
	const_def 1
	const SCENE_WESTPORTPORT_LEAVE_SHIP ; 1

; wAmamiPortSceneID
	const_def 1
	const SCENE_AMAMIPORT_LEAVE_SHIP ; 1

; wFastShip1FSceneID
	const_def 1
	const SCENE_FASTSHIP1F_ENTER_SHIP   ; 1
	const SCENE_FASTSHIP1F_MEET_GRANDPA ; 2
	
; wKurtsHouseSceneID
	const_def 1
	const SCENE_KURTS_HOUSE_NOTHING
	
; wTeknosPortSceneID
	const_def 1
	const SCENE_TEKNOS_PORT_NOTHING
	
; wSlowpokeWellB1FSceneID
	const_def 1
	const SCENE_SLOWPOKE1_NOTHING
	
; wSlowpokeWellB2FSceneID
	const_def 1
	const SCENE_SLOWPOKE2_NOTHING
	
;wRoute103SceneID
	const_def 1
	const SCENE_ROUTE_103_NOTHING
	
;wTeamRocketShipBaseSceneID
	const_def 1
	const SCENE_TEAM_ROCKET_SHIP_BASE_IMPOSTOR
	
;wRoute104SceneID
	const_def 1
	const SCENE_ROUTE104_NOTHING
	
;wRoute102RuinsOfAlphSceneID
	const_def 1
	const SCENE_ROUTE_112_STAND_GATE_NOTHING
	
;wStandCitySceneID
	const_def 1
	const SCENE_STAND_CITY_IMPOSTOR
	
;wStandCityRocketHouseSceneID
	const_def 1
	const SCENE_STAND_CITY_ROCKET_HOUSE_NOTHING
	const SCENE_STAND_CITY_ROCKET_HOUSE_BASE_UNCOVERED

;wStandCityRocketHouse2FSceneID
	const_def 1
	const SCENE_STAND_CITY_ROCKET_HOUSE_2F_NOTHING
	
;wRadioTower6FSceneID
	const_def 1
	const SCENE_RADIOTOWER6F_NOTHING
	
;wWestportCitySceneID
	const_def 1
	const SCENE_WESTPORT_CITY_RIVAL
	
;wPagotaCitySceneID
	const_def 1
	const SCENE_KURTS_HOUSE_LOCKED

;wFiveFloorTower5FSceneID
	const_def 1
	const SCENE_HO_OH_EVENT
	
;wKantoGymSceneID
	const_def 1
	const SCENE_RED_IS_HERE
	
;wKantoBattleClubB1FSceneID
	const_def 1
	const SCENE_BATTLE_CLUB_BATTLE

;wKantoBattleClub1FSceneID
	const_def 1
	const SCENE_BATTLE_CLUB_1F_NOTHING
	
;wCrownPathSceneID
	const_def 1
	const SCENE_UNDERGROUND_NOTHING
	
;wRyukyuGymSceneID
	const_def 1
	const SCENE_RYUKYU_GYM_TRAINER_2
	const SCENE_RYUKYU_GYM_NOTHING
	
;wRoute101NSceneID
	const_def 1
	const SCENE_ROUTE_101N_AFTER_SILVER
	const SCENE_ROUTE_101N_TREE_CUT
	
;wTeknosAquarium1FSceneID
	const_def 1
	const SCENE_TEKNOS_AQUARIUM_1F_NOTHING
	
;wPlayersHouse2FSceneID
	const_def 1
	const SCENE_PLAYERS_HOUSE_2F_NOTHING

