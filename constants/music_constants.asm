; song ids
; Music indexes (see audio/music_pointers.asm)
	const_def

	const MUSIC_NONE                         ; 00
	const MUSIC_TITLE                        ; 01
	const MUSIC_TROPICAL_ISLAND_JUNGLE                      ; 02
	const MUSIC_ROUTE_117                      ; 03
	const MUSIC_URASOE_TRAIL                     ; 04
	const MUSIC_MAGNET_TRAIN                 ; 05
	const MUSIC_SWISLANDS_GYM_LEADER_BATTLE      ; 06
	const MUSIC_SWISLANDS_TRAINER_BATTLE         ; 07
	const MUSIC_SWISLANDS_WILD_BATTLE            ; 08
	const MUSIC_POKEMON_CENTER               ; 09
	const MUSIC_HIKER_ENCOUNTER              ; 0a
	const MUSIC_LASS_ENCOUNTER               ; 0b
	const MUSIC_OFFICER_ENCOUNTER            ; 0c
	const MUSIC_HEAL                         ; 0d
	const MUSIC_LAVENDER_TOWN                ; 0e
	const MUSIC_ROUTE_116                      ; 0f
	const MUSIC_MT_MOON                      ; 10
	const MUSIC_SHOW_ME_AROUND               ; 11
	const MUSIC_GAME_CORNER                  ; 12
	const MUSIC_BICYCLE                      ; 13
	const MUSIC_HALL_OF_FAME                 ; 14
	const MUSIC_IEJIMA_TOWN                ; 15
	const MUSIC_KANTO_REGION                 ; 16
	const MUSIC_TRAINER_VICTORY              ; 17
	const MUSIC_WILD_VICTORY                 ; 18
	const MUSIC_GYM_VICTORY                  ; 19
	const MUSIC_MT_MOON_SQUARE               ; 1a
	const MUSIC_GYM                          ; 1b
	const MUSIC_KOBAN_ISLAND                  ; 1c
	const MUSIC_POKEMON_TALK                 ; 1d
	const MUSIC_PROF_OAK                     ; 1e
	const MUSIC_RIVAL_ENCOUNTER              ; 1f
	const MUSIC_RIVAL_AFTER                  ; 20
	const MUSIC_SURF                         ; 21
	const MUSIC_EVOLUTION                    ; 22
	const MUSIC_NATIONAL_PARK                ; 23
	const MUSIC_CREDITS                      ; 24
	const MUSIC_BIRDON_TOWN                  ; 25
	const MUSIC_CROWN_CITY             ; 26
	const MUSIC_KIMONO_ENCOUNTER             ; 27
	const MUSIC_UNION_CAVE                   ; 28
	const MUSIC_NIHON_WILD_BATTLE            ; 29
	const MUSIC_NIHON_TRAINER_BATTLE         ; 2a
	const MUSIC_ROUTE_105                     ; 2b
	const MUSIC_TEKNOS_CITY                ; 2c
	const MUSIC_PAGOTA_CITY                  ; 2d
	const MUSIC_NIHON_GYM_LEADER_BATTLE      ; 2e
	const MUSIC_CHAMPION_BATTLE              ; 2f
	const MUSIC_RIVAL_BATTLE                 ; 30
	const MUSIC_ROCKET_BATTLE                ; 31
	const MUSIC_PROF_OAK2                     ; 32
	const MUSIC_DARK_CAVE                    ; 33
	const MUSIC_ROUTE_101                     ; 34
	const MUSIC_ROUTE_102                     ; 35
	const MUSIC_SS_AQUA                      ; 36
	const MUSIC_YOUNGSTER_ENCOUNTER          ; 37
	const MUSIC_BEAUTY_ENCOUNTER             ; 38
	const MUSIC_ROCKET_ENCOUNTER             ; 39
	const MUSIC_POKEMANIAC_ENCOUNTER         ; 3a
	const MUSIC_SAGE_ENCOUNTER               ; 3b
	const MUSIC_SILENT_TOWN                ; 3c
	const MUSIC_WESTPORT_CITY               ; 3d
	const MUSIC_AMAMI_TOWN               ; 3e
	const MUSIC_POKEMON_CHANNEL              ; 3f
	const MUSIC_POKE_FLUTE_CHANNEL           ; 40
	const MUSIC_TIN_TOWER                    ; 41
	const MUSIC_SPROUT_TOWER                 ; 42
	const MUSIC_BURNED_TOWER                 ; 43
	const MUSIC_LIGHTHOUSE                   ; 44
	const MUSIC_KIKAI_VILLAGE                 ; 45
	const MUSIC_MOUNT_FUJI               ; 46
	const MUSIC_SILENT_HILLS                     ; 47
	const MUSIC_ROCKET_HIDEOUT               ; 48
	const MUSIC_DRAGONS_DEN                  ; 49
	const MUSIC_NIHON_WILD_BATTLE_NIGHT      ; 4a
	const MUSIC_RUINS_OF_ALPH_RADIO          ; 4b
	const MUSIC_CAPTURE                      ; 4c
	const MUSIC_ROUTE_115                     ; 4d
	const MUSIC_MOM                          ; 4e
	const MUSIC_VICTORY_ROAD                 ; 4f
	const MUSIC_POKEMON_LULLABY              ; 50
	const MUSIC_POKEMON_MARCH                ; 51
	const MUSIC_GS_OPENING                   ; 52
	const MUSIC_GS_OPENING_2                 ; 53
	const MUSIC_MAIN_MENU                    ; 54
	const MUSIC_RUINS_OF_ALPH_INTERIOR       ; 55
	const MUSIC_ROCKET_OVERTURE              ; 56
	const MUSIC_DANCING_HALL                 ; 57
	const MUSIC_BUG_CATCHING_CONTEST_RANKING ; 58
	const MUSIC_BUG_CATCHING_CONTEST         ; 59
	const MUSIC_KIKAI_VILLAGE_ROCKET_RADIO    ; 5a
	const MUSIC_PRINTER                      ; 5b
	const MUSIC_POST_CREDITS                 ; 5c

; GetMapMusic picks music for this value (see home/map.asm)
MUSIC_OLD_MAHOGANY_MART EQU $64

; ExitPokegearRadio_HandleMusic uses these values
RESTART_MAP_MUSIC EQU $fe
ENTER_MAP_MUSIC   EQU $ff

; GetMapMusic picks music for this bit flag
RADIO_TOWER_MUSIC_F EQU 7
RADIO_TOWER_MUSIC EQU 1 << RADIO_TOWER_MUSIC_F
