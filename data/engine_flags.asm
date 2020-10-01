engine_flag: MACRO
; location, bit
; (all locations are in WRAM bank 1)
	dwb \1 + (\2 / 8), 1 << (\2 % 8)
ENDM

EngineFlags:
; entries correspond to ENGINE_* constants

	; pokegear
	engine_flag wPokegearFlags, POKEGEAR_RADIO_CARD_F
	engine_flag wPokegearFlags, POKEGEAR_MAP_CARD_F
	engine_flag wPokegearFlags, POKEGEAR_PHONE_CARD_F
	engine_flag wPokegearFlags, POKEGEAR_EXPN_CARD_F
	engine_flag wPokegearFlags, POKEGEAR_OBTAINED_F

	; day-care
	engine_flag wDayCareMan, DAYCAREMAN_HAS_EGG_F
	engine_flag wDayCareMan, DAYCAREMAN_HAS_MON_F
	engine_flag wDayCareLady, DAYCARELADY_HAS_MON_F

	engine_flag wMomSavingMoney, MOM_SAVING_SOME_MONEY_F
	engine_flag wMomSavingMoney, MOM_ACTIVE_F

	engine_flag wUnusedTwoDayTimerOn, 0 ; unused, possibly related to a 2-day timer

	engine_flag wStatusFlags, STATUSFLAGS_POKEDEX_F
	engine_flag wStatusFlags, STATUSFLAGS_UNOWN_DEX_F
	engine_flag wStatusFlags, STATUSFLAGS_CAUGHT_POKERUS_F
	engine_flag wStatusFlags, STATUSFLAGS_ROCKET_SIGNAL_F
	engine_flag wStatusFlags, STATUSFLAGS_HALL_OF_FAME_F

	engine_flag wStatusFlags2, STATUSFLAGS2_BUG_CONTEST_TIMER_F
	engine_flag wStatusFlags2, STATUSFLAGS2_SAFARI_GAME_F
	engine_flag wStatusFlags2, STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F
	engine_flag wStatusFlags2, STATUSFLAGS2_BIKE_SHOP_CALL_F
	engine_flag wStatusFlags2, STATUSFLAGS2_UNUSED_5_F
	engine_flag wStatusFlags2, STATUSFLAGS2_REACHED_WESTPORT_F
	engine_flag wStatusFlags2, STATUSFLAGS2_ROCKETS_IN_SANSKRIT_F

	engine_flag wBikeFlags, BIKEFLAGS_STRENGTH_ACTIVE_F
	engine_flag wBikeFlags, BIKEFLAGS_ALWAYS_ON_BIKE_F
	engine_flag wBikeFlags, BIKEFLAGS_DOWNHILL_F

	engine_flag wNihonBadges, ZEPHYRBADGE
	engine_flag wNihonBadges, HIVEBADGE
	engine_flag wNihonBadges, PLAINBADGE
	engine_flag wNihonBadges, FOGBADGE
	engine_flag wNihonBadges, MINERALBADGE
	engine_flag wNihonBadges, STORMBADGE
	engine_flag wNihonBadges, GLACIERBADGE
	engine_flag wNihonBadges, RISINGBADGE

	engine_flag wSWIslandsBadges, BOULDERBADGE
	engine_flag wSWIslandsBadges, CASCADEBADGE
	engine_flag wSWIslandsBadges, THUNDERBADGE
	engine_flag wSWIslandsBadges, RAINBOWBADGE
	engine_flag wSWIslandsBadges, SOULBADGE
	engine_flag wSWIslandsBadges, MARSHBADGE
	engine_flag wSWIslandsBadges, VOLCANOBADGE
	engine_flag wSWIslandsBadges, EARTHBADGE

	; unown sets (see data/wild/unlocked_unowns.asm)
	engine_flag wUnlockedUnowns, 0 ; A-K
	engine_flag wUnlockedUnowns, 1 ; L-R
	engine_flag wUnlockedUnowns, 2 ; S-W
	engine_flag wUnlockedUnowns, 3 ; X-Z
	engine_flag wUnlockedUnowns, 4 ; unused
	engine_flag wUnlockedUnowns, 5 ; unused
	engine_flag wUnlockedUnowns, 6 ; unused
	engine_flag wUnlockedUnowns, 7 ; unused

	; fly
	engine_flag wVisitedSpawns, SPAWN_HOME
	engine_flag wVisitedSpawns, SPAWN_DEBUG
	engine_flag wVisitedSpawns, SPAWN_KOBAN
	engine_flag wVisitedSpawns, SPAWN_IEJIMA
	engine_flag wVisitedSpawns, SPAWN_KUME
	engine_flag wVisitedSpawns, SPAWN_NAGO
	engine_flag wVisitedSpawns, SPAWN_ROCK_TUNNEL
	engine_flag wVisitedSpawns, SPAWN_AMAMI
	engine_flag wVisitedSpawns, SPAWN_LAVENDER
	engine_flag wVisitedSpawns, SPAWN_RYUKYU
	engine_flag wVisitedSpawns, SPAWN_KANTO
	engine_flag wVisitedSpawns, SPAWN_STAND
	engine_flag wVisitedSpawns, SPAWN_FROSTPOINT
	engine_flag wVisitedSpawns, SPAWN_MOUNT_FUJI
	engine_flag wVisitedSpawns, SPAWN_SILENT
	engine_flag wVisitedSpawns, SPAWN_CROWN
	engine_flag wVisitedSpawns, SPAWN_PAGOTA
	engine_flag wVisitedSpawns, SPAWN_BIRDON
	engine_flag wVisitedSpawns, SPAWN_SUNPOINT
	engine_flag wVisitedSpawns, SPAWN_WESTPORT
	engine_flag wVisitedSpawns, SPAWN_ALLOY
	engine_flag wVisitedSpawns, SPAWN_TEKNOS
	engine_flag wVisitedSpawns, SPAWN_SANSKRIT
	engine_flag wVisitedSpawns, SPAWN_KIKAI
	engine_flag wVisitedSpawns, SPAWN_BLUE_FOREST
	engine_flag wVisitedSpawns, SPAWN_DAITO
	engine_flag wVisitedSpawns, NUM_SPAWNS ; unused

	engine_flag wLuckyNumberShowFlag, LUCKYNUMBERSHOW_GAME_OVER_F

	engine_flag wStatusFlags2, STATUSFLAGS2_UNUSED_3_F

	engine_flag wDailyFlags1, DAILYFLAGS1_KURT_MAKING_BALLS_F
	engine_flag wDailyFlags1, DAILYFLAGS1_BUG_CONTEST_F
	engine_flag wDailyFlags1, DAILYFLAGS1_SWARM_F
	engine_flag wDailyFlags1, DAILYFLAGS1_TIME_CAPSULE_F
	engine_flag wDailyFlags1, DAILYFLAGS1_ALL_FRUIT_TREES_F
	engine_flag wDailyFlags1, DAILYFLAGS1_GOT_SHUCKIE_TODAY_F
	engine_flag wDailyFlags1, DAILYFLAGS1_WESTPORT_UNDERGROUND_BARGAIN_F
	engine_flag wDailyFlags1, DAILYFLAGS1_TRAINER_HOUSE_F

	engine_flag wDailyFlags2, DAILYFLAGS2_MT_MOON_SQUARE_CLEFAIRY_F
	engine_flag wDailyFlags2, DAILYFLAGS2_UNION_CAVE_LAPRAS_F
	engine_flag wDailyFlags2, DAILYFLAGS2_WESTPORT_UNDERGROUND_GOT_HAIRCUT_F
	engine_flag wDailyFlags2, DAILYFLAGS2_WESTPORT_DEPT_STORE_TM27_RETURN_F
	engine_flag wDailyFlags2, DAILYFLAGS2_DAISYS_GROOMING_F
	engine_flag wDailyFlags2, DAILYFLAGS2_MOUNT_FUJI_RIVAL_FIGHT_F
