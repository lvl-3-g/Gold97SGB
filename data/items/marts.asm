Marts:
; entries correspond to MART_* constants
	dw MartCrown
	dw MartCrownDex
	dw MartPagota
	dw MartBirdon
	dw MartSunpoint
	dw MartWestport2F1
	dw MartWestport2F2
	dw MartWestport3F
	dw MartWestport4F
	dw MartWestport5F1
	dw MartWestport5F2
	dw MartWestport5F3
	dw MartWestport5F4
	dw MartAlloy
	dw MartTeknos
	dw MartSanskrit1
	dw MartSanskrit2
	dw MartBlueForest
	dw MartActualSanskrit
	dw MartActualSunpoint
	dw MartActualKume
	dw MartActualFrostpoint
	dw MartAmami
	dw MartKanto2F1
	dw MartKanto2F2
	dw MartKanto3F
	dw MartKanto3F2
	dw MartKanto4F
	dw MartKanto5F1
	dw MartKanto5F2
	dw MartStand
	dw MartRyukyu
	dw MartMtMoon
	dw MartMountFuji
	dw MartUnderground
	dw MartTestGarden
	dw MartKoban
	dw MartWestportNew
.End

MartCrown:; UNUSED
	db 1 ; # items
	db ULTRA_BALL
	db -1 ; end

MartCrownDex:; good
	db 9 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db FULL_HEAL
	db SUPER_REPEL
	db MAX_REPEL
	db ESCAPE_ROPE
	db -1 ; end

MartPagota:; good
	db 9 ; # items
	db POKE_BALL
	db POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db X_DEFEND
	db X_ATTACK
	db X_SPEED
	db -1 ; end

MartBirdon:; good
	db 11 ; # items
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db SHARP_HORNS
	db STEEL_SHELL
	db POWER_WINGS
	db -1 ; end

MartSunpoint:; UNUSED
	db 1 ; # items
	db ULTRA_BALL
	db -1 ; end

MartWestport2F1:; good
	db 7 ; # items
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartWestport2F2:; good
	db 7 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ESCAPE_ROPE
	db REPEL
	db REVIVE
	db FULL_HEAL
	db POKE_DOLL
	db -1 ; end

MartWestport3F:; good
	db 7 ; # items
	db X_SPEED
	db X_SPECIAL
	db X_DEFEND
	db X_ATTACK
	db DIRE_HIT
	db GUARD_SPEC
	db X_ACCURACY
	db -1 ; end

MartWestport4F:; good
	db 5 ; # items
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db HP_UP
	db -1 ; end

MartWestport5F1:; all these 5f ones can be treated as either headbutt or not, but include headbutt
	db 8 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_FLASH
	db TM_THUNDER
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db TM_DEFENSE_CURL
	db -1 ; end

MartWestport5F2:; good
	db 9 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_FLASH
	db TM_HEADBUTT
	db TM_THUNDER
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db TM_DEFENSE_CURL
	db -1 ; end

MartWestport5F3:; good
	db 8 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_FLASH
	db TM_THUNDER
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db TM_DEFENSE_CURL
	db -1 ; end

MartWestport5F4:; good
	db 9 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_HEADBUTT
	db TM_FLASH
	db TM_THUNDER
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db TM_DEFENSE_CURL
	db -1 ; end

MartAlloy:; good
	db 12 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ICE_HEAL
	db SUPER_REPEL
	db X_ATTACK
	db X_DEFEND
	db STEEL_SHELL
	db POWER_WINGS
	db -1 ; end

MartTeknos:; good
	db 10 ; # items
	db POKE_BALL
	db ESCAPE_ROPE
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db REPEL
	db REVIVE
	db -1 ; end

MartSanskrit1:; UNUSED
	db 1 ; # items
	db ULTRA_BALL
	db -1 ; end

MartSanskrit2:; UNUSED
	db 1 ; # items
	db ULTRA_BALL
	db -1 ; end

MartBlueForest:; good
	db 11 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db FULL_HEAL
	db REVIVE
	db SUPER_REPEL
	db MAX_REPEL
	db X_DEFEND
	db X_ATTACK
	db ICE_HEAL
	db POWER_WINGS
	db ESCAPE_ROPE
	db -1 ; end

MartActualSanskrit:; good
	db 9 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db FULL_HEAL
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db SUPER_REPEL
	db -1 ; end

MartActualSunpoint:; good
	db 10 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db WISDOM_ORB
	db ENERGY_WALL
	db DETECT_ORB
	db -1 ; end

MartActualKume:; good
	db 8 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db FULL_HEAL
	db X_DEFEND
	db X_ATTACK
	db DIRE_HIT
	db -1 ; end

MartActualFrostpoint:; good
	db 9 ; # items
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db MAX_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ICE_HEAL
	db BURN_HEAL
	db -1 ; end

MartAmami:; good, also Kikai
	db 8 ; # items
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ESCAPE_ROPE
	db -1 ; end

MartKanto2F1:; good
	db 7 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db SUPER_REPEL
	db MAX_REPEL
	db -1 ; end

MartKanto2F2:; good
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db ESCAPE_ROPE
	db FULL_HEAL
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db -1 ; end

MartKanto3F:; good
	db 8 ; # items
	db TM_HIDDEN_POWER
	db TM_SUNNY_DAY
	db TM_PROTECT
	db TM_RAIN_DANCE
	db TM_SANDSTORM
	db TM_HYPER_BEAM
	db TM_DOUBLE_TEAM
	db TM_PSYCHIC_M
	db -1 ; end

MartKanto3F2:; good
	db 4 ; # items
	db FIRE_STONE
	db THUNDERSTONE
	db WATER_STONE
	db LEAF_STONE
	db -1 ; end

MartKanto4F:; UNUSED
	db 1 ; # items
	db ULTRA_BALL
	db -1 ; end

MartKanto5F1:; good
	db 5 ; # items
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db -1 ; end

MartKanto5F2:; good
	db 7 ; # items
	db X_ACCURACY
	db GUARD_SPEC
	db DIRE_HIT
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db -1 ; end

MartStand:;good also kanto mart
	db 7 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db MAX_REPEL
	db -1 ; end

MartRyukyu:; good
	db 10 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db ESCAPE_ROPE
	db X_ATTACK
	db X_DEFEND
	db SHARP_HORNS
	db FOCUS_ORB
	db -1 ; end

MartMtMoon:; UNUSED
	db 1 ; # items
	db ULTRA_BALL
	db -1 ; end

MartMountFuji:; good
	db 7 ; # items
	db ULTRA_BALL
	db MAX_REPEL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db -1 ; end

MartUnderground:; good
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db -1 ; end

DefaultMart:; UNUSED
	db 2 ; # items
	db POKE_BALL
	db POTION
	db -1 ; end
	
MartTestGarden:; UNUSED
	db 1 ; # items
	db ULTRA_BALL
	db -1 ; end

MartKoban:; good
	db 8 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ICE_HEAL
	db SUPER_REPEL
	db -1 ; end
	
MartWestportNew:; good, also kanto dept store
	db 7 ; # items
	db SHARP_HORNS
	db STEEL_SHELL
	db POWER_WINGS
	db WISDOM_ORB
	db ENERGY_WALL
	db DETECT_ORB
	db FOCUS_ORB
	db -1 ; end

