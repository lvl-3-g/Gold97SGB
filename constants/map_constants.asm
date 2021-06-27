newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup                                                      ;  1

	map_const ALLOY_POKECENTER_1F,                        8,  4 ;  1
	map_const ALLOY_GYM,                                 10,  8 ;  2
	map_const ALLOY_TIMS_HOUSE,                           5,  4 ;  3
	map_const ALLOY_SAILOR_HO_OH_HOUSE,                           5,  4 ;  4
	map_const ALLOY_PUNISHMENT_SPEECH_HOUSE,              5,  4 ;  5
	map_const ALLOY_GOOD_ROD_HOUSE,                       5,  4 ;  6
	map_const ALLOY_CAFE,                                 4,  4 ;  7
	map_const ALLOY_MART,                                 8,  4 ;  8
	map_const ROUTE_109_ROUTE_110_GATE,                       5,  4 ;  9
	map_const ROUTE_108,                                    15,  9 ; 12
	map_const ROUTE_109,                                    10, 45 ; 13
	map_const ALLOY_CITY,                                20, 18 ; 14
	map_const ROUTE_106,                                    30,  9 ;  2
	map_const ROUTE_106_POKECENTER_1F,                       8,  4 ; 13
	map_const JADE_FOREST_SNORLAX_ROOM,                                 5,  8 ;  6
	map_const DAY_CARE,                                     5,  4 ; 22
	map_const ALLOY_ROUTE_107_GATE,						5,  4 ; 15
	map_const FIGHTING_DOJO,                                5,  6 ;  3
	map_const ROUTE_109_POKECENTER_1F,                       8,  4 ;  8

	newgroup                                                      ;  2

	map_const SANSKRIT_GAMBLER_MAN_HOUSE,           5,  4 ;  1
	map_const SANSKRIT_POKECENTER_1F,                       8,  4 ;  3
	map_const ROUTE_U4U,                                    10,  9 ;  5
	map_const SANSKRIT_TOWN,                               10,  9 ;  7
	map_const BOARDWALK,                                    10, 27 ;  5
	map_const BOARDWALK_GAME_CORNER,                       10,  7 ; 19
	map_const ROUTE_117,                                     30,  9 ;  1
	map_const ROUTE_116,                                     10, 18 ;  1
	map_const SANSKRIT_RUINS_OUTSIDE,                       10, 18 ; 22
	map_const ROUTE_118,                                     35,  9 ; 12
	map_const SANSKRIT_MART,                                8,  4 ;  8
	map_const SANSKRIT_RUINS_RESEARCH_CENTER,                4,  4 ; 28
	map_const SANSKRIT_ROCKET_HOUSE,                          10,  4 ; 12
	map_const ROUTE_118_SUNPOINT_GATE,                         5,  4 ; 25

	newgroup                                                      ;  3

	map_const FIVE_FLOOR_TOWER_1F,                              4,  4 ;  1
	map_const FIVE_FLOOR_TOWER_2F,                              4,  4 ;  2
	map_const FIVE_FLOOR_TOWER_3F,                              4,  4 ;  3
	map_const HYDRAULIC_CAVE,                                10,  9 ;  4
	map_const FIVE_FLOOR_TOWER_4F,                                 4,  4 ;  7
	map_const FIVE_FLOOR_TOWER_5F,                                 3,  3 ;  8
	map_const TIN_TOWER_9F,                                10,  9 ; 12
	map_const BURNED_TOWER_1F,                             10,  9 ; 13
	map_const BURNED_TOWER_B1F,                            10,  9 ; 14
	map_const NATIONAL_PARK,                               20, 27 ; 15
	map_const NATIONAL_PARK_BUG_CONTEST,                   20, 27 ; 16
	map_const SANSKRIT_RUINS_HO_OH_CHAMBER,                  4,  5 ; 23
	map_const SANSKRIT_RUINS_KABUTO_CHAMBER,                 4,  5 ; 24
	map_const SANSKRIT_RUINS_OMANYTE_CHAMBER,                4,  5 ; 25
	map_const SANSKRIT_RUINS_AERODACTYL_CHAMBER,             4,  5 ; 26
	map_const SANSKRIT_RUINS_INNER_CHAMBER,                 10, 14 ; 27
	map_const BOULDER_MINE_1F,                               20,  9 ; 29
	map_const BOULDER_MINE_B1F,                              20,  9 ; 30
	map_const BOULDER_MINE_B5F,                              10,  9 ; 31
	map_const SLOWPOKE_WELL_B1F,                           10,  9 ; 32
	map_const SLOWPOKE_WELL_B2F,                           10,  9 ; 33
	map_const ENDON_CAVE_2F,                       30,  9 ; 36
	map_const ENDON_CAVE_RUINS_CONNECTION,                       10,  27 ; 37
	map_const ALLOY_LIGHTHOUSE_5F,                       10,  9 ; 38
	map_const ALLOY_LIGHTHOUSE_6F,                       10,  9 ; 39
	map_const OLD_MAHOGANY_MART_1F,                             4,  4 ; 40
	map_const TEAM_ROCKET_BASE_OFFICE,                        15,  9 ; 41
	map_const TEAM_ROCKET_BASE_B1F,                        15, 15 ; 42
	map_const TEAM_ROCKET_BASE_B2F,                        15, 15 ; 43
	map_const JADE_FOREST,                                 25, 32 ; 44
	map_const WESTPORT_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 15, 18 ; 46
	map_const WESTPORT_DEPT_STORE_B1F,                    10,  9 ; 47
	map_const WESTPORT_UNDERGROUND_WAREHOUSE,             10,  9 ; 48
	map_const CHARRED_SUMMIT_CAVE,                     20, 18 ; 57
	map_const JOULE_CAVE_1F,                      30, 18 ; 58
	map_const MOUNT_MORTAR_ZAPDOS_ROOM,                    10,  9 ; 58
	map_const ICED_CAVERN_1F,                      20, 18 ; 59
	map_const ICED_CAVERN_B1F,                            20, 18 ; 60
	map_const DEEPWATER_PASSAGE_B2F,                                 10, 36 ; 61
	map_const MAGMA_SHAFT_B1F,                                20,  9 ; 62
	map_const MAGMA_SHAFT_B2F,                  20, 18 ; 63
	map_const MAGMA_SHAFT_1F,                10,  9 ; 64
	map_const DEEPWATER_PASSAGE_B1F,                                10,  9 ; 65
	map_const DEEPWATER_PASSAGE_EAST_CAVERN,								   20, 18 ; idk
	map_const WHIRL_ISLAND_SUICUNE_CHAMBER,                              5,  9 ; 66
	map_const WHIRL_ISLAND_1F,                             10,  9 ; 67
	map_const WHIRL_ISLAND_SW,                             10,  9 ; 68
	map_const WHIRL_ISLAND_SE,                              5,  9 ; 70
	map_const WHIRL_ISLAND_B1F,                            20, 18 ; 71
	map_const WHIRL_ISLAND_B2F,                            20, 18 ; 72
	map_const WHIRL_ISLAND_BLISSEY_CHAMBER,                  10,  9 ; 73
	map_const AMPARE_CAVERN_B1F,                   20, 18 ; 70
	map_const AMPARE_CAVERN_1F,               15, 18 ; 71
	map_const DEEPWATER_PASSAGE_ENTRANCE,                               5, 18 ; 72
	map_const TOHJO_FALLS,                                 15,  9 ; 74
	map_const ENDON_CAVE_1F,                               30,  9 ; 75
	map_const BOULDER_MINE_B4F,                                  15,  9 ; 76
	map_const CROWN_PATH,                            10, 18 ; 77
	map_const BOULDER_MINE_B2F,                              20, 9 ; 78
	map_const BOULDER_MINE_B3F,                             20, 9 ; 79
	map_const SAFARI_ZONE_STAND_GATE_BETA,                5,  4 ; 80
	map_const NANJO_FOREST,                            20, 18 ; 81
	map_const MT_FUJI_INTERIOR_LOWER,                                20, 27 ; 91
	map_const MT_FUJI_INTERIOR_UPPER,                             20, 27 ; 91

	newgroup                                                      ;  4

	map_const TEKNOS_POKECENTER_1F,                       8,  4 ;  3
	map_const TEKNOS_FISHING_HOUSE,                  5,  4 ;  4
	map_const TEKNOS_MART,                                8,  4 ;  6
	map_const TEKNOS_ITEMFINDER_HOUSE,                    5,  4 ;  8
	map_const TEKNOS_CITY,                               20, 18 ;  9
	map_const TEKNOS_PORT_PASSAGE,						   10,  9 ;
	map_const TEKNOS_TRADE_HOUSE,                           5,  4 ; 11
	map_const TEKNOS_AQUARIUM_1F,                        8,  4 ; 34
	map_const TEKNOS_AQUARIUM_2F,                        8,  4 ; 35
	map_const TEKNOS_GYM,                               10,  9 ;  3
	map_const ROUTE_120,                                     25,  9 ;  1
	map_const ROUTE_119,                                     10, 27 ;  1

	newgroup                                                      ;  5

	map_const BLUE_FOREST_DRAGON_SPEECH_HOUSE,               4,  4 ;  3
	map_const BLUE_FOREST_EMYS_HOUSE,                        5,  4 ;  4
	map_const BLUE_FOREST_MART,                              8,  4 ;  5
	map_const BLUE_FOREST_POKECENTER_1F,                     8,  4 ;  6
	map_const MOVE_DELETERS_HOUSE,                          5,  4 ;  7
	map_const BLUE_FOREST,                             20, 18 ; 10
	map_const ROUTE_110,                                    25,  9 ;  1
	map_const ROUTE_110_SANDSTORM_HOUSE,                     5,  4 ; 12
	map_const BLUE_FOREST_HOUSE_1,							5,  4 ;
	map_const BLUE_FOREST_GYM,                                 5,  9 ;  2
	map_const BLUE_FOREST_ROUTE_111_GATE,                       5,  4 ; 13
	map_const ROUTE_112,                                    10, 27 ;  1
	map_const ROUTE_112_STAND_GATE,                  5,  4 ; 16

	newgroup                                                      ;  6

	map_const FROSTPOINT_POKECENTER_1F,                       8,  4 ;  1
	map_const FROSTPOINT_POKECENTER_2F_BETA,                  8,  4 ;  2
	map_const MERIDIAN_PATH_RYUKYU_GATE,                        5,  4 ;  3
	map_const SEAFOAM_GYM,                                  5,  4 ;  4
	map_const FROSTPOINT_TOWN,                             10,  9 ;  8
	map_const ROUTE_111,                                    10, 27 ;  2
	map_const FROSTPOINT_MART,                                8,  4 ; 10
	map_const FROSTPOINT_PRYCE_HOUSE,                        5,  4 ;  8
	map_const FROSTPOINT_OTHER_HOUSE,                          5,  4 ;  9

	newgroup  	;  7

	map_const MOTOBU_PATH,                                    30,  9 ;  2
	map_const ISEN_LAB_BACK,                            5,  4 ;  1
	map_const ISEN_LAB_FRONT,                           20,  9 ;  2
	map_const NAGO_IMPOSTOR_HOUSE,                      5,  4 ;  2
	map_const NAGO_POKECENTER_1F,                       8,  4 ;  4
	map_const NAGO_POKECENTER_2F_BETA,                  8,  4 ;  5
	map_const ROUTE_109_POKECENTER_2F_BETA,                  8,  4 ;  9
	map_const MERIDIAN_PATH,                                    10, 27 ; 16
	map_const NAGO_VILLAGE,                               10, 18 ; 17
	map_const ISEN_STRAIT,                                    30,  9 ;  6
	map_const CHARRED_SUMMIT,							   10,  9 ;asdf
	map_const NAGO_CHARMANDER_HOUSE,          5,  4 ;  8


	newgroup                                                      ;  8

	map_const BIRDON_POKECENTER_1F,                         8,  4 ;  1
	map_const BIRDON_MILK_BAR,                                4,  4 ;  2
	map_const BIRDON_MART,                                  8,  4 ;  3
	map_const ROUTE_104,                                    50,  9 ;  6
	map_const ROUTE_105,                                    10, 18 ;  1
	map_const ROUTE_103,                                    10, 27 ;  2
	map_const BIRDON_TOWN,                                 10,  9 ;  7
	map_const BIRDON_ELDER_HOUSE,                 4,  4 ;  6
	map_const BIRDON_GYM,                                10,  5 ;  7
	map_const ROUTE_116_BIRDON_GATE,                                 5,  4 ; 12
	map_const CROWN_EVOLUTION_SPEECH_HOUSE,           5,  4 ;  8
	map_const ROUTE_105_ROUTE_106_GATE,						5,  4 ; 19
	map_const ROUTE_104_GEOFFS_HOUSE,                         5,  4 ;  9

	newgroup        	;  9

	map_const KIKAI_STRAIT,                                    10, 18 ;  6
	map_const AMAMI_TATSUGO_PATH_GATE,                       5,  4 ;  8
	map_const TATSUGO_PATH,                                    30,  9 ;  8
	map_const KIKAI_VILLAGE_HIDDEN_POWER_HOUSE,              4,  4 ;  1
	map_const KIKAI_VILLAGE_MAGIKARP_HOUSE,                  4,  4 ;  2
	map_const BOARDWALK_TEKNOS_GATE,                       5,  4 ;  3
	map_const BOARDWALK_GATE,                                5,  4 ;  4
	map_const KIKAI_VILLAGE,                                10, 18 ;  6
	map_const KIKAI_POKECENTER_1F,								8,  4
	map_const KIKAI_MART,										8,  4
	map_const KIKAI_HOUSE_1,									5,  4
	map_const KIKAI_HOUSE_2,										5,  4
	map_const KIKAI_CALDERA_1F,									15,  10
	map_const KIKAI_CALDERA_2F,									10,  9
	map_const KIKAI_CALDERA_3F,									5,  4

	newgroup                                                      ; 10

	map_const ROUTE_102,                                    30,  9 ;  3
	map_const PAGOTA_CITY,                                 20, 18 ;  5
	map_const PAGOTA_MART,                                  8,  4 ;  6
	map_const PAGOTA_GYM,                                   5,  8 ;  7
	map_const PAGOTA_POKEMON_ACADEMY,                        4,  8 ;  8
	map_const PAGOTA_NICKNAME_SPEECH_HOUSE,                 4,  4 ;  9
	map_const PAGOTA_POKECENTER_1F,                         8,  4 ; 10
	map_const ROUTE_112_SANSKRIT_RUINS_GATE,                  5,  4 ; 12
	map_const ROUTE_103_WESTPORT_GATE,                      5,  4 ; 14
	map_const ROUTE_103_NATIONAL_PARK_GATE,                  4,  4 ; 15
	map_const KURTS_HOUSE,                                  8,  4 ;  4
	map_const BILLS_FAMILYS_HOUSE,                          4,  4 ;  6
	map_const EARLS_MUSEUM,                                  8,  4 ; 11
	map_const ROUTE_102_GAME_HOUSE,                        4,  4 ;  8
	map_const ROUTE_102_WEST_GATE,                        5,  4 ; 18
	map_const DRAGONS_MAW_1F,                             20, 18 ; 81

	newgroup                                                      ; 11

	map_const WESTPORT_CITY,                              20, 18 ;  2
	map_const WESTPORT_BIKE_SHOP,                          4,  4 ;  4
	map_const WESTPORT_HAPPINESS_RATER,                    5,  4 ;  5
	map_const WESTPORT_POKECENTER_1F,                      8,  4 ;  9
	map_const WESTPORT_PP_SPEECH_HOUSE,                    5,  4 ; 10
	map_const WESTPORT_NAME_RATER,                         5,  4 ; 11
	map_const WESTPORT_DEPT_STORE_1F,                      8,  4 ; 12
	map_const WESTPORT_DEPT_STORE_2F,                      8,  4 ; 13
	map_const WESTPORT_DEPT_STORE_3F,                      8,  4 ; 14
	map_const WESTPORT_DEPT_STORE_4F,                      8,  4 ; 15
	map_const WESTPORT_DEPT_STORE_5F,                      8,  4 ; 16
	map_const WESTPORT_DEPT_STORE_6F,                      8,  4 ; 17
	map_const WESTPORT_DEPT_STORE_ELEVATOR,                2,  2 ; 18
	map_const ROUTE_115_KANTO_GATE,                      5,  4 ; 20
	map_const ROUTE_113_ROUTE_114_GATE,                    5,  4 ; 21
	map_const WESTPORT_PORT_PASSAGE,                        10,  9 ;  8
	map_const RADIO_TOWER_1F,                               4,  4 ; 17
	map_const RADIO_TOWER_2F,                               4,  4 ; 18
	map_const RADIO_TOWER_3F,                               4,  4 ; 19
	map_const RADIO_TOWER_4F,                               4,  4 ; 20
	map_const RADIO_TOWER_5F,                               4,  4 ; 21
	map_const RADIO_TOWER_6F,                               4,  4 ; 21
	map_const WESTPORT_UNDERGROUND,                       15, 18 ; 45
	map_const WESTPORT_GYM,                                   5,  8 ;  5
	map_const ROUTE_101_PAGOTA_GATE_2F,                      4,  3 ; 11
	map_const ROUTE_102_WEST_GATE_2F,                     4,  3 ; 18
	map_const ALLOY_ROUTE_107_GATE_2F,						4,  3 ; 15

	newgroup                                                      ; 12

	map_const AMAMI_TOWN,                              20,  9 ;  3
	map_const AMAMI_FISHING_SPEECH_HOUSE,               4,  4 ;  4
	map_const AMAMI_POKECENTER_1F,                      8,  4 ;  5
	map_const AMAMI_POKECENTER_2F_BETA,                 8,  4 ;  6
	map_const POKEMON_FAN_CLUB,                             5,  4 ;  7
	map_const AMAMI_MART,                               8,  4 ;  9
	map_const AMAMI_TOWN_HOUSE_2,         5,  4 ; 10
	map_const AMAMI_PUBLIC_POOL,                               10,  9 ; 11
	map_const RYUKYU_URASOE_PARK_GATE,                         5,  4 ; 12
	map_const ROUTE_101N_CROWN_PATH_ENTRANCE,            4,  4 ; 13
	map_const SEASIDE_PATH,                              30,  9 ; 14
	map_const AMAMI_TOWN_SUPER_ROD_HOUSE,                     5,  4 ; 14

	newgroup                                                      ; 13

	map_const KOBAN_ISLAND,                                 10,  9 ;  2
	map_const ROUTE_107,                                    10, 27 ;  7
	map_const KOBAN_MART,									8,  4 ; 
	map_const KOBAN_HOUSE_2,      				            4,  4 ;  6
	map_const KOBAN_HOUSE_1,      				            5,  4 ;  6
	map_const KOBAN_POKECENTER_1F,                       8,  4 ;  5

	newgroup                                                      ; 14

	map_const KUME_CITY,                                 20, 18 ;  2
	map_const KUME_SHIP_PARTS_HOUSE,                  4,  4 ;  3
	map_const KUME_SOCIAL_HOUSE,                                   5,  4 ;  4
	map_const KUME_POKECENTER_1F,                         8,  4 ;  6
	map_const KUME_POKECENTER_2F_BETA,                    8,  4 ;  7
	map_const KUME_SNOOZE_SPEECH_HOUSE,                   5,  4 ;  8
	map_const URASOE_TRAIL,                                    10, 18 ;  2
	map_const KERAMA_STRAIT,                                    30,  9 ;  5
	map_const KUME_POINT,                                    10,  9 ; 15
	map_const KUME_MART,                                8,  4 ;  7
	map_const FORKED_STRAIT_NORTH,                                10, 36 ;  9

	newgroup                                                      ; 15

	map_const WESTPORT_PORT,                                10, 18 ;  1
	map_const AMAMI_PORT,                              10, 18 ;  2
	map_const FAST_SHIP_1F,                                16,  9 ;  3
	map_const FAST_SHIP_CABINS_NNW_NNE_NE,                  4, 16 ;  4
	map_const FAST_SHIP_CABINS_SW_SSW_NW,                   4, 16 ;  5
	map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,       5, 17 ;  6
	map_const FAST_SHIP_B1F,                               16,  8 ;  7
	map_const AMAMI_PORT_PASSAGE,                      10,  9 ;  9
	map_const BOULDER_MINE_B4F_GIFT_SHOP,                         4,  4 ; 11
	map_const FIVE_FLOOR_TOWER_ROOF,                              10,  9 ; 12
	map_const TEKNOS_PORT,								   10,  9 ;

	newgroup                                                      ; 16

	map_const FUJI_SUMMIT,                                    10,  9 ;  1
	map_const MOUNT_FUJI_POKECENTER_1F,                 9,  7 ;  2
	map_const WILLS_ROOM,                                   5,  9 ;  3
	map_const KOGAS_ROOM,                                   5,  9 ;  4
	map_const BRUNOS_ROOM,                                  5,  9 ;  5
	map_const KARENS_ROOM,                                  5,  9 ;  6
	map_const LANCES_ROOM,                                  5, 12 ;  7
	map_const HALL_OF_FAME,                                 5,  7 ;  8

	newgroup                                                      ; 17

	map_const ROUTE_U12U,                                    30,  9 ;  1
	map_const ROUTE_U11U,                                    20,  9 ;  3
	map_const ROUTE_U8U,                                    10,  9 ;  4
	map_const STAND_CITY,                                20, 18 ;  5
	map_const STAND_MART,                                 8,  4 ;  6
	map_const STAND_CITY_ZOO_OFFICE,                      8,  4 ;  7
	map_const OLD_FUCHSIA_GYM,                                  5,  9 ;  8
	map_const BILLS_BROTHERS_HOUSE,                         5,  4 ;  9
	map_const STAND_POKECENTER_1F,                        8,  4 ; 10
	map_const STAND_POKECENTER_2F_BETA,                   8,  4 ; 11
	map_const STAND_CITY_ROCKET_HOUSE,                    10,  4 ; 12
	map_const STAND_CITY_ROCKET_HOUSE_2F,                 10,  4 ; 12
	map_const STAND_POKE,									4,  4 ; derp
	map_const STAND_GYM,                                 15, 18 ;  5
	map_const STAND_CITY_NATIONAL_PARK_GATE,                  5,  4 ; 17
	map_const ROUTE_113,                                    10, 27 ;  1

	newgroup                                                      ; 18

	map_const TROPICAL_ISLAND_OUTSIDE,                        30,  27 ;  5
	map_const RAINBOW_ISLAND,                                30, 27 ;  6
	map_const FORKED_STRAIT_WEST,                                20,  9 ; 10
	map_const FORKED_STRAIT_EAST,                                20,  9 ; 11
	map_const TROPICAL_ISLAND_JUNGLE,                                     20, 18 ;  1
	map_const LAVENDER_TOWN,                               10,  9 ;  4
	map_const KOBAN_POKECENTER_2F_BETA,                  8,  4 ;  6
	map_const MR_FUJIS_HOUSE,                               5,  4 ;  7
	map_const URASOE_PARK_URASOE_TRAIL_GATE,                         5,  4 ; 13

	newgroup                                                      ; 19

	map_const GREAT_EAST_STRAIT,                                    60, 9 ;  9
	map_const ROUTE_U5U,                                     10,  9 ;  1
	map_const DAITO_RANCH,                         15, 27 ;  2
	map_const DAITO_POKECENTER_1F,                    8,  4 ;  3
	map_const DAITO_RANCH_ORCHARD_HOUSE,                    5,  4 ;  4
	map_const DAITO_RANCH_BARN,                                4,  4 ; 10
	map_const DAITO_RANCH_HOUSE,                           5,  4 ; 11
	map_const GARDENER_GEOFF_DAITO_HOUSE,              5,  4 ;  1
	map_const DAITO_RANCH_OTHER_HOUSE,                          5,  4 ; 10

	newgroup                                                      ; 20

	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const TIME_CAPSULE,                                 5,  4 ;  4

	newgroup                                                      ; 21

	map_const ROUTE_U10U,                                    10,  9 ;  2
	map_const KANTO_REGION,                                30, 27 ;  4
	map_const KANTO_DEPT_STORE_1F,                        8,  4 ;  5
	map_const KANTO_DEPT_STORE_2F,                        8,  4 ;  6
	map_const KANTO_DEPT_STORE_3F,                        8,  4 ;  7
	map_const KANTO_DEPT_STORE_4F,                        8,  4 ;  8
	map_const KANTO_DEPT_STORE_5F,                        8,  4 ;  9
	map_const KANTO_DEPT_STORE_6F,                        8,  4 ; 10
	map_const KANTO_DEPT_STORE_ELEVATOR,                  2,  2 ; 11
	map_const KANTO_MANSION_1F,                           4,  6 ; 12
	map_const KANTO_MANSION_2F,                           4,  6 ; 13
	map_const KANTO_MANSION_3F,                           4,  6 ; 14
	map_const KANTO_MANSION_ROOF,                         4,  6 ; 15
	map_const KANTO_MANSION_ROOF_HOUSE,                   4,  4 ; 16
	map_const KANTO_POKECENTER_1F,                        8,  4 ; 17
	map_const KANTO_POKECENTER_2F_BETA,                   8,  4 ; 18
	map_const KANTO_GAME_CORNER,                         10,  7 ; 19
	map_const KANTO_GAME_CORNER_PRIZE_ROOM,               5,  4 ; 20
	map_const KANTO_GYM,                                  5,  9 ; 21
	map_const KANTO_CAFE,                                 6,  4 ; 22
	map_const FORKED_STRAIT_GATE,                               20,  9 ; 24
	map_const SEASIDE_PATH_ISEN_STRAIT_GATE,                       5,  4 ; 26
	map_const KANTO_BATTLE_CLUB_1F, 						5,  4 ; asdf
	map_const KANTO_BATTLE_CLUB_B1F,					   10,  9 ; asda
	map_const KANTO_RESTAURANT,                                5,  5 ; 82
	map_const ROUTE_114,                                     20,  9 ; 13
	map_const KANTO_HOUSE_1,								5,  4 ;
	map_const KANTO_HOUSE_2,								5,  4 ;
	map_const KANTO_HOUSE_3,								5,  4 ;
	map_const KANTO_HOUSE_4,								5,  4 ;
	map_const KANTO_2_POKECENTER_1F,                          8,  4 ; 17
	map_const KANTO_MART,                                   8,  4 ;  5
	map_const SILPH_CO_1F,                                 12,  8 ; 10
	map_const KANTO_HOTEL,               8,  4 ;  7
	map_const OAKS_LAB,                                     5,  6 ;  6
	map_const BLUES_HOUSE,                                  5,  4 ;  5
	map_const REDS_HOUSE_1F,                                4,  4 ;  3
	map_const REDS_HOUSE_2F,                                4,  4 ;  4
	map_const KANTO_LABORATORY,                               10,  8 ;  5

	newgroup                                                      ; 22

	map_const SUNPOINT_CITY,                               20, 18 ;  3
	map_const MANIAS_HOUSE,                                 4,  4 ;  4
	map_const SUNPOINT_POKECENTER_1F,                       8,  4 ;  6
	map_const SUNPOINT_PHOTO_STUDIO,                        5,  4 ;  8
	map_const SUNPOINT_DOCKS,                                     10, 18 ;  1
	map_const SUNPOINT_MART,                                  8,  4 ;  5
	map_const SUNPOINT_DOCKS_GATE,                         5,  4 ; 14
	map_const ROUTE_119_SUNPOINT_GATE,                        5,  4 ; 13
	map_const TEAM_ROCKET_SHIP_BASE,                                20, 18 ;  4
	map_const SKATEBOARDER_HOUSE,                            5,  4 ;  7

	newgroup                                                      ; 23

	map_const WEATHERED_TRAIL,                                    30, 9 ;  3
	map_const ROUTE_U7U,                                    20,  9 ;  2
	map_const IEJIMA_TOWN,                               15,  9 ;  3
	map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE,               4,  4 ;  5
	map_const TRAINER_HOUSE_1F,                             5,  7 ;  6
	map_const TRAINER_HOUSE_B1F,                            5,  8 ;  7
	map_const SILENT_POKECENTER_2F_BETA,                  8,  4 ; 10
	map_const ROUTE_116_NUGGET_HOUSE,                         4,  4 ; 11
	map_const CROWN_PATH_GATE,                           10,  9 ; 13
	map_const MOTOBU_PATH_IEJIMA_GATE,                       5,  4 ;  4
	map_const HYDRO_PLANT,                                 20, 18 ; 10
	map_const IEJIMA_POKECENTER_1F,							8,  4
	map_const IEJIMA_HOUSE_1,								5,  4
	map_const IEJIMA_HOUSE_2,								5,  4

	newgroup                                                      ; 24

	map_const ROUTE_115,                                    30,  9 ;  2
	map_const ROUTE_101,                                    15,  9 ;  3
	map_const ROUTE_101N,                                     10, 18 ;  1
	map_const SILENT_TOWN,                               10,  9 ;  4
	map_const OAK_LAB_FRONT_ROOM,									4,  8 ; new
	map_const OAK_LAB_BACK_ROOM,                                     4,  4 ;  5
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  6
	map_const PLAYERS_HOUSE_2F,                             5,  4 ;  7
	map_const PLAYERS_NEIGHBORS_HOUSE,                      4,  4 ;  8
	map_const RIVALS_HOUSE,                                   5,  4 ;  9
	map_const DAY_OF_WEEK_SIBLINGS_HOUSE,                   4,  4 ; 11
	map_const SILENT_POKECENTER_1F,                       8,  4 ;  9
	map_const ROUTE_101_PAGOTA_GATE,                         5,  4 ; 11
	map_const SILENT_NORTH,                                    10,  5 ;  2

	newgroup                                                      ; 25

	map_const RYUKYU_CITY,                                20, 18 ;  2
	map_const RYUKYU_GYM,                                 10,  9 ;  4
	map_const RYUKYU_MART,                                 8,  4 ;  5
	map_const RYUKYU_POKECENTER_1F,                        8,  4 ;  6
	map_const RYUKYU_POKECENTER_2F_BETA,                   8,  4 ;  7
	map_const RYUKYU_TRADE_HOUSE,                            5,  4 ;  8
	map_const RYUKYU_ARBORETUM,                10,  9 ;  9
	map_const COPYCATS_HOUSE_1F,                            4,  4 ; 11
	map_const COPYCATS_HOUSE_2F,                            5,  3 ; 12
	map_const SUNPOINT_DOCKS_CROWN_PATH_ENTRANCE,            4,  4 ; 13
	map_const SUNPOINT_DOCKS_CLEANSE_TAG_HOUSE,                    4,  4 ; 15
	map_const URASOE_PARK,                              20,  9 ;  3
	map_const RYUKYU_OLD_COUPLE_HOUSE,                  5,  4 ;  3
	map_const RYUKYU_HOTEL,                          15, 5 ; 67
	map_const RYUKYU_HOTEL_2F,                          10,  9 ; 67
	map_const RYUKYU_HOTEL_3F,                          10,  9 ; 67
	map_const RYUKYU_HOTEL_4F,                          10,  9 ; 67
	map_const RYUKYU_HOTEL_5F,                          10,  9 ; 67
	map_const RYUKYU_HOTEL_ROOMS,                          20,  9 ; 67
	map_const RYUKYU_ELEVATOR,                       2,  2 ; 69
	map_const RYUKYU_RESTAURANT,                           10,  9 ; 69
	map_const RYUKYU_THEATRE,                          10, 9 ; 66

	newgroup                                                      ; 26

	map_const CROWN_CITY,                            10, 13 ;  3
	map_const CROWN_MART,                             8,  4 ;  4
	map_const CROWN_POKECENTER_1F,                    8,  4 ;  5
	map_const MR_POKEMONS_HOUSE,                            4,  4 ; 10
	map_const MOUNT_FUJI_OUTSIDE,                           10,  9 ; 10
	map_const CROWN_HOUSE_1,                5,  4 ;  9
	map_const CROWN_HOUSE_2,                            5,  4 ;  7
	map_const CROWN_CITY_TRAINER_HOUSE,                8,  4 ; 23
	
	newgroup
	
	map_const SILENT_HILLS,                                    25, 18 ;  4

NUM_MAP_GROUPS EQU const_value ; 26
