spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants

	spawn PLAYERS_HOUSE_2F,            4,  4
	spawn SILENT_POKECENTER_1F,      5,  3

	spawn IEJIMA_TOWN,              1, 7
	spawn KUME_CITY,                25, 19
	spawn NAGO_VILLAGE,               5,  5
	spawn AMAMI_TOWN,             17,  5
	spawn LAVENDER_TOWN,               5,  6
	spawn RYUKYU_CITY,               11,  5

	spawn SILENT_TOWN,               5,  5
	spawn KOBAN_ISLAND,                 9, 11
	spawn KANTO_REGION,               49, 31
	spawn STAND_CITY,               33, 21
	spawn FROSTPOINT_TOWN,            13, 13
	spawn FUJI_SUMMIT,                    9,  6
	spawn CROWN_CITY,            5, 23
	spawn PAGOTA_CITY,                27, 29
	spawn ROUTE_106,                    9, 11
	spawn BIRDON_TOWN,                15,  5
	spawn SUNPOINT_CITY,              31, 17
	spawn WESTPORT_CITY,             25, 15
	spawn ALLOY_CITY,                7,  9
	spawn ROUTE_109,             	  13, 29
	spawn TEKNOS_CITY,              31, 11
	spawn SANSKRIT_TOWN,               3, 13
	spawn KIKAI_VILLAGE,               15, 27
	spawn BLUE_FOREST,            13, 19
	spawn DAITO_RANCH,        23, 39
	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6,  2
	spawn N_A,                        -1, -1
