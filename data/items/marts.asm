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
	dw MartViridian
	dw MartKume
	dw MartNago
	dw MartLavender
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

MartCrown:
	db 4 ; # items
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartCrownDex:
	db 6 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db MAX_REPEL
	db -1 ; end

MartPagota:
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

MartBirdon:
	db 7 ; # items
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db -1 ; end

MartSunpoint:
	db 5 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db -1 ; end

MartWestport2F1:
	db 7 ; # items
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartWestport2F2:
	db 7 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ESCAPE_ROPE
	db REPEL
	db REVIVE
	db FULL_HEAL
	db POKE_DOLL
	db -1 ; end

MartWestport3F:
	db 7 ; # items
	db X_SPEED
	db X_SPECIAL
	db X_DEFEND
	db X_ATTACK
	db DIRE_HIT
	db GUARD_SPEC
	db X_ACCURACY
	db -1 ; end

MartWestport4F:
	db 5 ; # items
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db HP_UP
	db -1 ; end

MartWestport5F1:
	db 7 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_FLASH
	db TM_THUNDER
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db -1 ; end

MartWestport5F2:
	db 8 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_FLASH
	db TM_HEADBUTT
	db TM_THUNDER
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db -1 ; end

MartWestport5F3:
	db 7 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_FLASH
	db TM_THUNDER
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db -1 ; end

MartWestport5F4:
	db 8 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_HEADBUTT
	db TM_FLASH
	db TM_THUNDER
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db -1 ; end

MartAlloy:
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

MartTeknos:
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db REVIVE
	db -1 ; end

MartSanskrit1:
	db 4 ; # items
	db TINYMUSHROOM
	db SLOWPOKETAIL
	db POKE_BALL
	db POTION
	db -1 ; end

MartSanskrit2:
	db 8 ; # items
	db RAGECANDYBAR
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db SUPER_REPEL
	db REVIVE
	db -1 ; end

MartBlueForest:
	db 7 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db FULL_HEAL
	db REVIVE
	db MAX_REPEL
	db X_DEFEND
	db X_ATTACK
	db -1 ; end

MartViridian:
	db 8 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db FULL_HEAL
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartKume:
	db 7 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartNago:
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

MartLavender:
	db 8 ; # items
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db MAX_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartAmami:
	db 7 ; # items
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartKanto2F1:
	db 7 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db SUPER_REPEL
	db MAX_REPEL
	db -1 ; end

MartKanto2F2:
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

MartKanto3F:
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

MartKanto3F2:
	db 4 ; # items
	db FIRE_STONE
	db THUNDERSTONE
	db WATER_STONE
	db LEAF_STONE
	db -1 ; end

MartKanto4F:
	db 1 ; # items
	db POKE_DOLL
	db -1 ; end

MartKanto5F1:
	db 5 ; # items
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db -1 ; end

MartKanto5F2:
	db 7 ; # items
	db X_ACCURACY
	db GUARD_SPEC
	db DIRE_HIT
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db -1 ; end

MartStand:
	db 7 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db MAX_REPEL
	db -1 ; end

MartRyukyu:
	db 7 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db -1 ; end

MartMtMoon:
	db 5 ; # items
	db POKE_DOLL
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db REPEL
	db -1 ; end

MartMountFuji:
	db 7 ; # items
	db ULTRA_BALL
	db MAX_REPEL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db -1 ; end

MartUnderground:
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db -1 ; end

DefaultMart:
	db 2 ; # items
	db POKE_BALL
	db POTION
	db -1 ; end
	
MartTestGarden:
	db 8 ; # items
	db MASTER_BALL
	db ULTRA_BALL
	db COVENANT_ORB
	db MAX_REVIVE
	db HEART_STONE
	db POISON_STONE
	db FULL_HEAL
	db RARE_CANDY
	db -1 ; end

MartKoban:
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
	
MartWestportNew:
	db 7 ; # items
	db SHARP_HORNS
	db STEEL_SHELL
	db POWER_WINGS
	db WISDOM_ORB
	db ENERGY_WALL
	db DETECT_ORB
	db FOCUS_ORB
	db -1 ; end

