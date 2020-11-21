map_attributes: MACRO
;\1: map name
;\2: map id
;\3: border block
;\4: connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_MapAttributes::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	db BANK(\1_Blocks)
	dw \1_Blocks
	db BANK(\1_MapScripts) ; aka BANK(\1_MapEvents)
	dw \1_MapScripts
	dw \1_MapEvents
	db \4
ENDM

; Connections go in order: north, south, west, east
connection: MACRO
;\1: direction
;\2: map name
;\3: map id
;\4: offset of the target map relative to the current map
;    (x offset for east/west, y offset for north/south)

; LEGACY: Support for old connection macro
if _NARG == 6
	connection \1, \2, \3, (\4) - (\5)
else

; Calculate tile offsets for source (current) and target maps
_src = 0
_tgt = (\4) + 3
if _tgt < 0
_src = -_tgt
_tgt = 0
endc

if "\1" == "north"
_blk = \3_WIDTH * (\3_HEIGHT - 3) + _src
_map = _tgt
_win = (\3_WIDTH + 6) * \3_HEIGHT + 1
_y = \3_HEIGHT * 2 - 1
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "south"
_blk = _src
_map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
_win = \3_WIDTH + 7
_y = 0
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "west"
_blk = (\3_WIDTH * _src) + \3_WIDTH - 3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 - 6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

elif "\1" == "east"
_blk = (\3_WIDTH * _src)
_map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
_win = \3_WIDTH + 7
_y = (\4) * -2
_x = 0
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

else
fail "Invalid direction for 'connection'."
endc

	map_id \3
	dw \2_Blocks + _blk
	dw wOverworldMapBlocks + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw wOverworldMapBlocks + _win
endc
ENDM


	map_attributes SilentTown, SILENT_TOWN, $2f, NORTH | WEST | EAST
	connection north, SilentNorth, SILENT_NORTH, 0
	connection west, Route101, ROUTE_101, 0
	connection east, Route115, ROUTE_115, 0

	map_attributes CrownCity, CROWN_CITY, $2F, NORTH | SOUTH
	connection north, MountFujiOutside, MOUNT_FUJI_OUTSIDE, 0
	connection south, SilentNorth, SILENT_NORTH, 0
	
	map_attributes MountFujiOutside, MOUNT_FUJI_OUTSIDE, $7E, NORTH | SOUTH
	connection north, FujiSummit, FUJI_SUMMIT, 0
	connection south, CrownCity, CROWN_CITY, 0

	map_attributes PagotaCity, PAGOTA_CITY, $2F, WEST
	connection west, Route102, ROUTE_102, 5

	map_attributes BirdonTown, BIRDON_TOWN, $2F, SOUTH | EAST
	connection south, Route103, ROUTE_103, 0
	connection east, Route104, ROUTE_104, 0

	map_attributes SunpointCity, SUNPOINT_CITY, $35, EAST
	connection east, Route111, ROUTE_111, 0

	map_attributes WestportCity, WESTPORT_CITY, $21, NORTH | EAST
	connection north, Route103, ROUTE_103, 5
	connection east, Route102, ROUTE_102, 5

	map_attributes AlloyCity, ALLOY_CITY, $2F, WEST | EAST
	connection west, Route106, ROUTE_106, 0
	connection east, Route108, ROUTE_108, 9

	map_attributes TeknosCity, TEKNOS_CITY, $21, NORTH | WEST
	connection north, Boardwalk, BOARDWALK, 8
	connection west, Route120, ROUTE_120, 0

	map_attributes SanskritTown, SANSKRIT_TOWN, $21, NORTH | SOUTH | WEST | EAST
	connection north, RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, 0
	connection south, Boardwalk, BOARDWALK, -3
	connection west, Route118, ROUTE_118, 0
	connection east, Route117, ROUTE_117, 0

	map_attributes KikaiVillage, KIKAI_VILLAGE, $2F, SOUTH
	connection south, KikaiStrait, KIKAI_STRAIT, 0

	map_attributes BlueForest, BLUE_FOREST, $2F, NORTH | SOUTH | WEST
	connection north, Route111, ROUTE_111, 5
	connection south, Route112, ROUTE_112, 5
	connection west, Route110, ROUTE_110, 9

	map_attributes DaitoRanch, DAITO_RANCH, $21, WEST
	connection west, GreatEastStrait, GREAT_EAST_STRAIT, 18

	map_attributes Route115, ROUTE_115, $35, WEST
	connection west, SilentTown, SILENT_TOWN, 0

	map_attributes RouteU5U, ROUTE_U5U, $2c, WEST
	connection west, DaitoRanch, DAITO_RANCH, -9

	map_attributes Route101, ROUTE_101, $2F, WEST | EAST
	connection west, Route101N, ROUTE_101N, -9
	connection east, SilentTown, SILENT_TOWN, 0

	map_attributes Route105, ROUTE_105, $2F, SOUTH | WEST
	connection south, Route106, ROUTE_106, 0
	connection west, Route104, ROUTE_104, 0

	map_attributes Route106, ROUTE_106, $2F, EAST
	connection east, AlloyCity, ALLOY_CITY, 0

	map_attributes Route112, ROUTE_112, $2F, NORTH
	connection north, BlueForest, BLUE_FOREST, -5

	map_attributes Route104, ROUTE_104, $2F, WEST | EAST
	connection west, BirdonTown, BIRDON_TOWN, 0
	connection east, Route105, ROUTE_105, 0

	map_attributes Route113, ROUTE_113, $2F, NORTH
	connection north, StandCity, STAND_CITY, -10

	map_attributes Route103, ROUTE_103, $2F, NORTH | SOUTH
	connection north, BirdonTown, BIRDON_TOWN, 0
	connection south, WestportCity, WESTPORT_CITY, -5

	map_attributes Route102, ROUTE_102, $05, WEST | EAST
	connection west, WestportCity, WESTPORT_CITY, -5
	connection east, PagotaCity, PAGOTA_CITY, -5

	map_attributes SilentHills, SILENT_HILLS, $00, 0

	map_attributes Route108, ROUTE_108, $7A, WEST | EAST
	connection west, AlloyCity, ALLOY_CITY, -9
	connection east, Route109, ROUTE_109, -36

	map_attributes Route109, ROUTE_109, $7A, WEST
	connection west, Route108, ROUTE_108, 36

	map_attributes Route110, ROUTE_110, $2F, EAST
	connection east, BlueForest, BLUE_FOREST, -9

	map_attributes Route111, ROUTE_111, $21, NORTH | SOUTH
	connection north, FrostpointTown, FROSTPOINT_TOWN, 0
	connection south, BlueForest, BLUE_FOREST, -5

	map_attributes RouteU4U, ROUTE_U4U, $05, WEST | EAST
	connection west, TeknosCity, TEKNOS_CITY, -9
	connection east, SanskritTown, SANSKRIT_TOWN, 0

	map_attributes Boardwalk, BOARDWALK, $21, NORTH | SOUTH
	connection north, SanskritTown, SANSKRIT_TOWN, 3
	connection south, TeknosCity, TEKNOS_CITY, -8

	map_attributes KikaiStrait, KIKAI_STRAIT, $21, NORTH | WEST
	connection north, KikaiVillage, KIKAI_VILLAGE, 0
	connection west, TatsugoPath, TATSUGO_PATH, 9

	map_attributes TatsugoPath, TATSUGO_PATH, $2F, EAST
	connection east, KikaiStrait, KIKAI_STRAIT, -9

	map_attributes GreatEastStrait, GREAT_EAST_STRAIT, $21, EAST
	connection east, DaitoRanch, DAITO_RANCH, -18

	map_attributes KumeCity, KUME_CITY, $21, SOUTH | EAST
	connection south, ForkedStraitNorth, FORKED_STRAIT_NORTH, 0
	connection east, KumePoint, KUME_POINT, 9

	map_attributes Route116, ROUTE_116, $21, WEST
	connection west, Route117, ROUTE_117, 0

	map_attributes IejimaTown, IEJIMA_TOWN, $2f, WEST
	connection west, WeatheredTrail, WEATHERED_TRAIL, 0


	map_attributes RouteU7U, ROUTE_U7U, $2c, EAST
	connection east, IejimaTown, IEJIMA_TOWN, -4

	map_attributes TropicalIslandJungle, TROPICAL_ISLAND_JUNGLE, $05, 0

	map_attributes KobanIsland, KOBAN_ISLAND, $21, SOUTH
	connection south, Route107, ROUTE_107, 0

	map_attributes Route107, ROUTE_107, $21, NORTH
	connection north, KobanIsland, KOBAN_ISLAND, 0

	map_attributes FrostpointTown, FROSTPOINT_TOWN, $2F, SOUTH
	connection south, Route111, ROUTE_111, 0

	map_attributes IsenStrait, ISEN_STRAIT, $21, WEST
	connection west, NagoVillage, NAGO_VILLAGE, 0

	map_attributes KeramaStrait, KERAMA_STRAIT, $21, WEST | EAST
	connection west, KumePoint, KUME_POINT, 0
	connection east, UrasoeTrail, URASOE_TRAIL, -9

	map_attributes StandCity, STAND_CITY, $2F, SOUTH
	connection south, Route113, ROUTE_113, 10

	map_attributes RouteU8U, ROUTE_U8U, $43, WEST | EAST
	connection west, WeatheredTrail, WEATHERED_TRAIL, -38
	connection east, StandCity, STAND_CITY, -7

	map_attributes WeatheredTrail, WEATHERED_TRAIL, $2F, EAST
	connection east, IejimaTown, IEJIMA_TOWN, 0


	map_attributes RouteU10U, ROUTE_U10U, $0f, SOUTH | EAST
	connection south, WeatheredTrail, WEATHERED_TRAIL, 0
	connection east, KantoRegion, KANTO_REGION, -9

	map_attributes KantoRegion, KANTO_REGION, $2f, EAST
	connection east, Route114, ROUTE_114, 9

	map_attributes Route119, ROUTE_119, $01, EAST
	connection east, Route120, ROUTE_120, 18

	map_attributes RouteU11U, ROUTE_U11U, $0f, WEST | EAST
	connection west, StandCity, STAND_CITY, -9
	connection east, SilentNorth, SILENT_NORTH, -9

	map_attributes SilentNorth, SILENT_NORTH, $2f, NORTH | SOUTH
	connection north, CrownCity, CROWN_CITY, 0
	connection south, SilentTown, SILENT_TOWN, 0

	map_attributes RouteU12U, ROUTE_U12U, $43, NORTH | SOUTH
	connection north, UrasoeTrail, URASOE_TRAIL, 20
	connection south, SilentNorth, SILENT_NORTH, 0

	map_attributes UrasoeTrail, URASOE_TRAIL, $21, WEST
	connection west, KeramaStrait, KERAMA_STRAIT, 9

	map_attributes MotobuPath, MOTOBU_PATH, $2f, EAST
	connection east, NagoVillage, NAGO_VILLAGE, 0

	map_attributes LavenderTown, LAVENDER_TOWN, $2c, NORTH | SOUTH | WEST
	connection north, UrasoePark, URASOE_PARK, 0
	connection south, UrasoeTrail, URASOE_TRAIL, 0
	connection west, Route120, ROUTE_120, 0

	map_attributes AmamiTown, AMAMI_TOWN, $21, SOUTH
	connection south, SeasidePath, SEASIDE_PATH, 0

	map_attributes Route101N, ROUTE_101N, $2F, EAST
	connection east, Route101, ROUTE_101, 9

	map_attributes RyukyuCity, RYUKYU_CITY, $21, SOUTH
	connection south, UrasoePark, URASOE_PARK, 0

	map_attributes SunpointDocks, SUNPOINT_DOCKS, $0A, 0


	map_attributes NagoVillage, NAGO_VILLAGE, $21, SOUTH | WEST | EAST
	connection south, MeridianPath, MERIDIAN_PATH, 0
	connection west, MotobuPath, MOTOBU_PATH, 0
	connection east, IsenStrait, ISEN_STRAIT, 0

	map_attributes Route114, ROUTE_114, $2f, WEST
	connection west, KantoRegion, KANTO_REGION, -9

	map_attributes KumePoint, KUME_POINT, $21, WEST | EAST
	connection west, KumeCity, KUME_CITY, -9
	connection east, KeramaStrait, KERAMA_STRAIT, 0

	map_attributes MeridianPath, MERIDIAN_PATH, $21, NORTH | EAST
	connection north, NagoVillage, NAGO_VILLAGE, 0
	connection east, CharredSummit, CHARRED_SUMMIT, 9
	
	map_attributes CharredSummit, CHARRED_SUMMIT, $21, WEST
	connection west, MeridianPath, MERIDIAN_PATH, -9

	map_attributes Route117, ROUTE_117, $21, WEST | EAST
	connection west, SanskritTown, SANSKRIT_TOWN, 0
	connection east, Route116, ROUTE_116, 0

	map_attributes Route118, ROUTE_118, $21, EAST
	connection east, SanskritTown, SANSKRIT_TOWN, 0

	map_attributes Route120, ROUTE_120, $01, WEST | EAST
	connection west, Route119, ROUTE_119, -18
	connection east, TeknosCity, TEKNOS_CITY, 0

	map_attributes SeasidePath, SEASIDE_PATH, $21, NORTH
	connection north, AmamiTown, AMAMI_TOWN, 0

	map_attributes UrasoePark, URASOE_PARK, $2F, NORTH
	connection north, RyukyuCity, RYUKYU_CITY, 0

	map_attributes FujiSummit, FUJI_SUMMIT, $2F, SOUTH
	connection south, MountFujiOutside, MOUNT_FUJI_OUTSIDE, 0
	
	map_attributes RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, $21, SOUTH
	connection south, SanskritTown, SANSKRIT_TOWN, 0
	
	map_attributes ForkedStraitNorth, FORKED_STRAIT_NORTH, $21, NORTH
	connection north, KumeCity, KUME_CITY, 0
	
	map_attributes ForkedStraitWest, FORKED_STRAIT_WEST, $0D, WEST
	connection west, RainbowIsland, RAINBOW_ISLAND, -18

	map_attributes RainbowIsland, RAINBOW_ISLAND, $0D, EAST
	connection east, ForkedStraitWest, FORKED_STRAIT_WEST, 18

	map_attributes ForkedStraitEast, FORKED_STRAIT_EAST, $0D, EAST
	connection east, TropicalIslandOutside, TROPICAL_ISLAND_OUTSIDE, -18

	map_attributes TropicalIslandOutside, TROPICAL_ISLAND_OUTSIDE, $0D, WEST
	connection west, ForkedStraitEast, FORKED_STRAIT_EAST, 18


	map_attributes FiveFloorTower1F, FIVE_FLOOR_TOWER_1F, $00, 0
	map_attributes FiveFloorTower2F, FIVE_FLOOR_TOWER_2F, $00, 0
	map_attributes FiveFloorTower3F, FIVE_FLOOR_TOWER_3F, $00, 0
	map_attributes HydraulicCave, HYDRAULIC_CAVE, $1D, 0
	map_attributes FiveFloorTower4F, FIVE_FLOOR_TOWER_4F, $00, 0
	map_attributes FiveFloorTower5F, FIVE_FLOOR_TOWER_5F, $00, 0
	map_attributes TinTower9F, TIN_TOWER_9F, $00, 0
	map_attributes BurnedTower1F, BURNED_TOWER_1F, $00, 0
	map_attributes BurnedTowerB1F, BURNED_TOWER_B1F, $09, 0
	map_attributes NationalPark, NATIONAL_PARK, $2F, 0
	map_attributes NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $2F, 0
	map_attributes RadioTower1F, RADIO_TOWER_1F, $00, 0
	map_attributes RadioTower2F, RADIO_TOWER_2F, $00, 0
	map_attributes RadioTower3F, RADIO_TOWER_3F, $00, 0
	map_attributes RadioTower4F, RADIO_TOWER_4F, $00, 0
	map_attributes RadioTower5F, RADIO_TOWER_5F, $00, 0
	map_attributes RadioTower6F, RADIO_TOWER_5F, $00, 0
	map_attributes RuinsOfAlphHoOhChamber, RUINS_OF_ALPH_HO_OH_CHAMBER, $00, 0
	map_attributes RuinsOfAlphKabutoChamber, RUINS_OF_ALPH_KABUTO_CHAMBER, $00, 0
	map_attributes RuinsOfAlphOmanyteChamber, RUINS_OF_ALPH_OMANYTE_CHAMBER, $00, 0
	map_attributes RuinsOfAlphAerodactylChamber, RUINS_OF_ALPH_AERODACTYL_CHAMBER, $00, 0
	map_attributes RuinsOfAlphInnerChamber, RUINS_OF_ALPH_INNER_CHAMBER, $00, 0
	map_attributes RuinsOfAlphResearchCenter, RUINS_OF_ALPH_RESEARCH_CENTER, $00, 0
	map_attributes BoulderMine1F, BOULDER_MINE_1F, $1D, 0
	map_attributes BoulderMineB1F, BOULDER_MINE_B1F, $1D, 0
	map_attributes BoulderMineB5F, BOULDER_MINE_B5F, $0B, 0
	map_attributes SlowpokeWellB1F, SLOWPOKE_WELL_B1F, $2E, 0
	map_attributes SlowpokeWellB2F, SLOWPOKE_WELL_B2F, $09, 0
	map_attributes TeknosAquarium1F, TEKNOS_AQUARIUM_1F, $00, 0
	map_attributes TeknosAquarium2F, TEKNOS_AQUARIUM_2F, $00, 0
	map_attributes EndonCave2F, ENDON_CAVE_2F, $09, 0
	map_attributes EndonCaveRuinsConnection, ENDON_CAVE_RUINS_CONNECTION, $09, 0
	map_attributes AlloyLighthouse5F, ALLOY_LIGHTHOUSE_5F, $00, 0
	map_attributes AlloyLighthouse6F, ALLOY_LIGHTHOUSE_6F, $00, 0
	map_attributes OldMahoganyMart1F, OLD_MAHOGANY_MART_1F, $00, 0
	map_attributes BlueForestHouse1, BLUE_FOREST_HOUSE_1, $00, 0
	map_attributes TeamRocketBaseOffice, TEAM_ROCKET_BASE_OFFICE, $00, 0
	map_attributes TeamRocketBaseB1F, TEAM_ROCKET_BASE_B1F, $00, 0
	map_attributes TeamRocketBaseB2F, TEAM_ROCKET_BASE_B2F, $00, 0
	map_attributes JadeForest, JADE_FOREST, $00, 0
	map_attributes WestportUnderground, WESTPORT_UNDERGROUND, $00, 0
	map_attributes WestportUndergroundSwitchRoomEntrances, WESTPORT_UNDERGROUND_SWITCH_ROOM_ENTRANCES, $00, 0
	map_attributes WestportDeptStoreB1F, WESTPORT_DEPT_STORE_B1F, $00, 0
	map_attributes WestportUndergroundWarehouse, WESTPORT_UNDERGROUND_WAREHOUSE, $00, 0
	map_attributes CharredSummitCave, CHARRED_SUMMIT_CAVE, $09, 0
	map_attributes JouleCaveZapdosRoom, MOUNT_MORTAR_ZAPDOS_ROOM, $09, 0
	map_attributes JouleCave1F, JOULE_CAVE_1F, $09, 0
	map_attributes IcedCavern1F, ICED_CAVERN_1F, $09, 0
	map_attributes IcedCavernB1F, ICED_CAVERN_B1F, $09, 0
	map_attributes DeepwaterPassageB2F, DEEPWATER_PASSAGE_B2F, $09, 0
	map_attributes MagmaShaftB1F, MAGMA_SHAFT_B1F, $59, 0
	map_attributes MagmaShaftB2F, MAGMA_SHAFT_B2F, $59, 0
	map_attributes MagmaShaft1F, MAGMA_SHAFT_1F, $59, 0
	map_attributes DeepwaterPassageB1F, DEEPWATER_PASSAGE_B1F, $09, 0
	map_attributes DeepwaterPassageEastCavern, DEEPWATER_PASSAGE_EAST_CAVERN, $09, 0
	map_attributes WhirlIslandSuicuneChamber, WHIRL_ISLAND_SUICUNE_CHAMBER, $09, 0
	map_attributes WhirlIsland1F, WHIRL_ISLAND_1F, $09, 0
	map_attributes WhirlIslandSW, WHIRL_ISLAND_SW, $09, 0
	map_attributes WhirlIslandCave, WHIRL_ISLAND_CAVE, $09, 0
	map_attributes WhirlIslandSE, WHIRL_ISLAND_SE, $09, 0
	map_attributes WhirlIslandB1F, WHIRL_ISLAND_B1F, $09, 0
	map_attributes WhirlIslandB2F, WHIRL_ISLAND_B2F, $09, 0
	map_attributes WhirlIslandBlisseyChamber, WHIRL_ISLAND_BLISSEY_CHAMBER, $0f, 0
	map_attributes SilverCaveRoom1, SILVER_CAVE_ROOM_1, $09, 0
	map_attributes SilverCaveRoom2, SILVER_CAVE_ROOM_2, $09, 0
	map_attributes SilverCaveRoom3, SILVER_CAVE_ROOM_3, $09, 0
	map_attributes SilverCaveItemRooms, SILVER_CAVE_ITEM_ROOMS, $09, 0
	map_attributes AmpareCavernB1F, AMPARE_CAVERN_B1F, $1D, 0
	map_attributes AmpareCavern1F, AMPARE_CAVERN_1F, $09, 0
	map_attributes DeepwaterPassageEntrance, DEEPWATER_PASSAGE_ENTRANCE, $09, 0
	map_attributes DragonsDenB1F, DRAGONS_DEN_B1F, $09, 0
	map_attributes TohjoFalls, TOHJO_FALLS, $09, 0
	map_attributes AlloyPokecenter1F, ALLOY_POKECENTER_1F, $00, 0
	map_attributes AlloyGym, ALLOY_GYM, $00, 0
	map_attributes AlloyTimsHouse, ALLOY_TIMS_HOUSE, $00, 0
	map_attributes AlloyHouseBeta, ALLOY_HOUSE_BETA, $00, 0
	map_attributes AlloyPunishmentSpeechHouse, ALLOY_PUNISHMENT_SPEECH_HOUSE, $00, 0
	map_attributes AlloyGoodRodHouse, ALLOY_GOOD_ROD_HOUSE, $00, 0
	map_attributes AlloyCafe, ALLOY_CAFE, $00, 0
	map_attributes AlloyMart, ALLOY_MART, $00, 0
	map_attributes Route109Route110Gate, ROUTE_109_ROUTE_110_GATE, $00, 0
	map_attributes AmamiTatsugoPathGate, AMAMI_TATSUGO_PATH_GATE, $00, 0
	map_attributes DaitoRanchBarn, DAITO_RANCH_BARN, $00, 0
	map_attributes DaitoRanchHouse, DAITO_RANCH_HOUSE, $00, 0
	map_attributes SanskritGamblerManHouse, SANSKRIT_GAMBLER_MAN_HOUSE, $00, 0
	map_attributes BlueForestGym, BLUE_FOREST_GYM, $00, 0
	map_attributes SanskritPokecenter1F, SANSKRIT_POKECENTER_1F, $00, 0
	map_attributes MotobuPathIejimaGate, MOTOBU_PATH_IEJIMA_GATE, $00, 0
	map_attributes EndonCave1F, ENDON_CAVE_1F, $09, 0
	map_attributes BoulderMineB4F, BOULDER_MINE_B4F, $1D, 0
	map_attributes CrownPath, CROWN_PATH, $09, 0
	map_attributes BoulderMineB2F, BOULDER_MINE_B2F, $1D, 0
	map_attributes BoulderMineB3F, BOULDER_MINE_B3F, $09, 0
	map_attributes SafariZoneStandGateBeta, SAFARI_ZONE_STAND_GATE_BETA, $00, 0
	map_attributes NanjoForest, NANJO_FOREST, $00, 0
	map_attributes VictoryRoad, VICTORY_ROAD, $09, 0
	map_attributes VictoryRoad2F, VICTORY_ROAD_2F, $09, 0
	map_attributes TeknosTinTowerEntrance, TEKNOS_TIN_TOWER_ENTRANCE, $00, 0
	map_attributes TeknosTinTowerBackEntrance, TEKNOS_TIN_TOWER_BACK_ENTRANCE, $00, 0
	map_attributes TeknosPokecenter1F, TEKNOS_POKECENTER_1F, $00, 0
	map_attributes TeknosFishingHouse, TEKNOS_FISHING_HOUSE, $00, 0
	map_attributes KantoLaboratory, KANTO_LABORATORY, $00, 0
	map_attributes TeknosMart, TEKNOS_MART, $00, 0
	map_attributes BirdonGym, BIRDON_GYM, $00, 0
	map_attributes TeknosItemfinderHouse, TEKNOS_ITEMFINDER_HOUSE, $00, 0
	map_attributes IsenLabBack, ISEN_LAB_BACK, $00, 0
	map_attributes IsenLabFront, ISEN_LAB_FRONT, $00, 0
	map_attributes BlueForestDragonSpeechHouse, BLUE_FOREST_DRAGON_SPEECH_HOUSE, $00, 0
	map_attributes BlueForestEmysHouse, BLUE_FOREST_EMYS_HOUSE, $00, 0
	map_attributes BlueForestMart, BLUE_FOREST_MART, $00, 0
	map_attributes BlueForestPokecenter1F, BLUE_FOREST_POKECENTER_1F, $00, 0
	map_attributes MoveDeletersHouse, MOVE_DELETERS_HOUSE, $00, 0
	map_attributes FrostpointPokecenter1F, FROSTPOINT_POKECENTER_1F, $00, 0
	map_attributes FrostpointPokecenter2FBeta, FROSTPOINT_POKECENTER_2F_BETA, $00, 0
	map_attributes MeridianPathRyukyuGate, MERIDIAN_PATH_RYUKYU_GATE, $00, 0
	map_attributes SeafoamGym, SEAFOAM_GYM, $09, 0
	map_attributes GardenerGeoffDaitoHouse, GARDENER_GEOFF_DAITO_HOUSE, $00, 0
	map_attributes NagoImposterHouse, NAGO_IMPOSTOR_HOUSE, $00, 0
	map_attributes RyukyuOldCoupleHouse, RYUKYU_OLD_COUPLE_HOUSE, $00, 0
	map_attributes NagoPokecenter1F, NAGO_POKECENTER_1F, $00, 0
	map_attributes NagoPokecenter2FBeta, NAGO_POKECENTER_2F_BETA, $00, 0
	map_attributes JadeForestSnorlaxRoom, JADE_FOREST_SNORLAX_ROOM, $00, 0
	map_attributes KumeMart, KUME_MART, $00, 0
	map_attributes Route109Pokecenter1F, ROUTE_109_POKECENTER_1F, $00, 0
	map_attributes Route109Pokecenter2FBeta, ROUTE_109_POKECENTER_2F_BETA, $00, 0
	map_attributes HydroPlant, HYDRO_PLANT, $00, 0
	map_attributes EarlsMuseum, EARLS_MUSEUM, $00, 0
	map_attributes BirdonPokecenter1F, BIRDON_POKECENTER_1F, $00, 0
	map_attributes BirdonMilkBar, BIRDON_MILK_BAR, $00, 0
	map_attributes BirdonMart, BIRDON_MART, $00, 0
	map_attributes KurtsHouse, KURTS_HOUSE, $00, 0
	map_attributes WestportGym, WESTPORT_GYM, $00, 0
	map_attributes KikaiVillageHiddenPowerHouse, KIKAI_VILLAGE_HIDDEN_POWER_HOUSE, $00, 0
	map_attributes KikaiVillageMagikarpHouse, KIKAI_VILLAGE_MAGIKARP_HOUSE, $00, 0
	map_attributes BoardwalkTeknosGate, BOARDWALK_TEKNOS_GATE, $00, 0
	map_attributes BoardwalkGate, BOARDWALK_GATE, $00, 0
	map_attributes PagotaMart, PAGOTA_MART, $00, 0
	map_attributes PagotaGym, PAGOTA_GYM, $00, 0
	map_attributes EarlsPokemonAcademy, EARLS_POKEMON_ACADEMY, $00, 0
	map_attributes PagotaNicknameSpeechHouse, PAGOTA_NICKNAME_SPEECH_HOUSE, $00, 0
	map_attributes PagotaPokecenter1F, PAGOTA_POKECENTER_1F, $00, 0
	map_attributes KikaiPokecenter1F, KIKAI_POKECENTER_1F, $00, 0
	map_attributes KikaiMart, KIKAI_MART, $00, 0
	map_attributes KikaiHouse1, KIKAI_HOUSE_1, $00, 0
	map_attributes KikaiHouse2, KIKAI_HOUSE_2, $00, 0
	map_attributes KikaiCaldera1F, KIKAI_CALDERA_1F, $59, 0
	map_attributes KikaiCaldera2F, KIKAI_CALDERA_2F, $59, 0
	map_attributes KikaiCaldera3F, KIKAI_CALDERA_3F, $59, 0
	map_attributes TeknosTradeHouse, TEKNOS_TRADE_HOUSE, $00, 0
	map_attributes Route112RuinsOfAlphGate, ROUTE_112_RUINS_OF_ALPH_GATE, $00, 0
	map_attributes Route106Pokecenter1F, ROUTE_106_POKECENTER_1F, $00, 0
	map_attributes Route103WestportGate, ROUTE_103_WESTPORT_GATE, $00, 0
	map_attributes Route103NationalParkGate, ROUTE_103_NATIONAL_PARK_GATE, $00, 0
	map_attributes Route112StandGate, ROUTE_112_STAND_GATE, $00, 0
	map_attributes StandCityNationalParkGate, STAND_CITY_NATIONAL_PARK_GATE, $00, 0
	map_attributes TeknosGym, TEKNOS_GYM, $00, 0
	map_attributes WestportBikeShop, WESTPORT_BIKE_SHOP, $00, 0
	map_attributes WestportHappinessRater, WESTPORT_HAPPINESS_RATER, $00, 0
	map_attributes BillsFamilysHouse, BILLS_FAMILYS_HOUSE, $00, 0
	map_attributes WestportMagnetTrainStation, WESTPORT_MAGNET_TRAIN_STATION, $00, 0
	map_attributes Route102GameHouse, ROUTE_102_GAME_HOUSE, $00, 0
	map_attributes WestportPokecenter1F, WESTPORT_POKECENTER_1F, $00, 0
	map_attributes WestportPPSpeechHouse, WESTPORT_PP_SPEECH_HOUSE, $00, 0
	map_attributes WestportNameRater, WESTPORT_NAME_RATER, $00, 0
	map_attributes WestportDeptStore1F, WESTPORT_DEPT_STORE_1F, $00, 0
	map_attributes WestportDeptStore2F, WESTPORT_DEPT_STORE_2F, $00, 0
	map_attributes WestportDeptStore3F, WESTPORT_DEPT_STORE_3F, $00, 0
	map_attributes WestportDeptStore4F, WESTPORT_DEPT_STORE_4F, $00, 0
	map_attributes WestportDeptStore5F, WESTPORT_DEPT_STORE_5F, $00, 0
	map_attributes WestportDeptStore6F, WESTPORT_DEPT_STORE_6F, $00, 0
	map_attributes WestportDeptStoreElevator, WESTPORT_DEPT_STORE_ELEVATOR, $00, 0
	map_attributes BoardwalkGameCorner, BOARDWALK_GAME_CORNER, $00, 0
	map_attributes Route115KantoGate, ROUTE_115_KANTO_GATE, $00, 0
	map_attributes Route113Route114Gate, ROUTE_113_ROUTE_114_GATE, $00, 0
	map_attributes DayCare, DAY_CARE, $00, 0
	map_attributes AmamiFishingSpeechHouse, AMAMI_FISHING_SPEECH_HOUSE, $00, 0
	map_attributes AmamiPokecenter1F, AMAMI_POKECENTER_1F, $00, 0
	map_attributes AmamiPokecenter2FBeta, AMAMI_POKECENTER_2F_BETA, $00, 0
	map_attributes PokemonFanClub, POKEMON_FAN_CLUB, $00, 0
	map_attributes NagoCharmanderHouse, NAGO_CHARMANDER_HOUSE, $00, 0
	map_attributes AmamiMart, AMAMI_MART, $00, 0
	map_attributes AmamiTownHouse2, AMAMI_TOWN_HOUSE_2, $00, 0
	map_attributes AmamiPublicPool, AMAMI_PUBLIC_POOL, $00, 0
	map_attributes RyukyuUrasoeParkGate, RYUKYU_URASOE_PARK_GATE, $00, 0
	map_attributes Route101NCrownPathEntrance, ROUTE_101N_CROWN_PATH_ENTRANCE, $00, 0
	map_attributes RedsHouse1F, REDS_HOUSE_1F, $00, 0
	map_attributes RedsHouse2F, REDS_HOUSE_2F, $00, 0
	map_attributes BluesHouse, BLUES_HOUSE, $00, 0
	map_attributes OaksLab, OAKS_LAB, $00, 0
	map_attributes KumeShipPartsHouse, KUME_SHIP_PARTS_HOUSE, $00, 0
	map_attributes KumeSocialHouse, KUME_SOCIAL_HOUSE, $00, 0
	map_attributes SunpointMart, SUNPOINT_MART, $00, 0
	map_attributes KumePokecenter1F, KUME_POKECENTER_1F, $00, 0
	map_attributes KumePokecenter2FBeta, KUME_POKECENTER_2F_BETA, $00, 0
	map_attributes KumeSnoozeSpeechHouse, KUME_SNOOZE_SPEECH_HOUSE, $00, 0
	map_attributes WestportPort, WESTPORT_PORT, $0a, 0
	map_attributes AmamiPort, AMAMI_PORT, $0a, 0
	map_attributes FastShip1F, FAST_SHIP_1F, $00, 0
	map_attributes FastShipCabins_NNW_NNE_NE, FAST_SHIP_CABINS_NNW_NNE_NE, $00, 0
	map_attributes FastShipCabins_SW_SSW_NW, FAST_SHIP_CABINS_SW_SSW_NW, $00, 0
	map_attributes FastShipCabins_SE_SSE_CaptainsCabin, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, $00, 0
	map_attributes FastShipB1F, FAST_SHIP_B1F, $00, 0
	map_attributes WestportPortPassage, WESTPORT_PORT_PASSAGE, $00, 0
	map_attributes TeknosPortPassage, TEKNOS_PORT_PASSAGE, $00, 0
	map_attributes AmamiPortPassage, AMAMI_PORT_PASSAGE, $00, 0
	map_attributes BoulderMineB4FGiftShop, BOULDER_MINE_B4F_GIFT_SHOP, $00, 0
	map_attributes FiveFloorTowerRoof, FIVE_FLOOR_TOWER_ROOF, $00, 0
	map_attributes MountFujiPokecenter1F, MOUNT_FUJI_POKECENTER_1F, $00, 0
	map_attributes WillsRoom, WILLS_ROOM, $00, 0
	map_attributes KogasRoom, KOGAS_ROOM, $00, 0
	map_attributes BrunosRoom, BRUNOS_ROOM, $00, 0
	map_attributes KarensRoom, KARENS_ROOM, $00, 0
	map_attributes LancesRoom, LANCES_ROOM, $00, 0
	map_attributes HallOfFame, HALL_OF_FAME, $00, 0
	map_attributes StandMart, STAND_MART, $00, 0
	map_attributes StandCityZooOffice, STAND_CITY_ZOO_OFFICE, $00, 0
	map_attributes OldFuchsiaGym, OLD_FUCHSIA_GYM, $00, 0
	map_attributes BillsBrothersHouse, BILLS_BROTHERS_HOUSE, $00, 0
	map_attributes StandPokecenter1F, STAND_POKECENTER_1F, $00, 0
	map_attributes StandPokecenter2FBeta, STAND_POKECENTER_2F_BETA, $00, 0
	map_attributes StandCityRocketHouse, STAND_CITY_ROCKET_HOUSE, $00, 0
	map_attributes StandCityRocketHouse2F, STAND_CITY_ROCKET_HOUSE_2F, $00, 0
	map_attributes Route119SunpointGate, ROUTE_119_SUNPOINT_GATE, $00, 0
	map_attributes KobanPokecenter1F, KOBAN_POKECENTER_1F, $00, 0
	map_attributes KobanPokecenter2FBeta, KOBAN_POKECENTER_2F_BETA, $00, 0
	map_attributes MrFujisHouse, MR_FUJIS_HOUSE, $00, 0
	map_attributes FrostpointPryceHouse, FROSTPOINT_PRYCE_HOUSE, $00, 0
	map_attributes FrostpointOtherHouse, FROSTPOINT_OTHER_HOUSE, $00, 0
	map_attributes FrostpointMart, FROSTPOINT_MART, $00, 0
	map_attributes SoulHouse, SOUL_HOUSE, $00, 0
	map_attributes SanskritRocketHouse, SANSKRIT_ROCKET_HOUSE, $00, 0
	map_attributes UrasoeParkUrasoeTrailGate, URASOE_PARK_URASOE_TRAIL_GATE, $00, 0
	map_attributes AmamiTownSuperRodHouse, AMAMI_TOWN_SUPER_ROD_HOUSE, $00, 0
	map_attributes DaitoPokecenter1F, DAITO_POKECENTER_1F, $00, 0
	map_attributes DaitoRanchOrchardHouse, DAITO_RANCH_ORCHARD_HOUSE, $00, 0
	map_attributes Pokecenter2F, POKECENTER_2F, $00, 0
	map_attributes TradeCenter, TRADE_CENTER, $00, 0
	map_attributes Colosseum, COLOSSEUM, $00, 0
	map_attributes TimeCapsule, TIME_CAPSULE, $00, 0
	map_attributes KantoDeptStore1F, KANTO_DEPT_STORE_1F, $00, 0
	map_attributes KantoDeptStore2F, KANTO_DEPT_STORE_2F, $00, 0
	map_attributes KantoDeptStore3F, KANTO_DEPT_STORE_3F, $00, 0
	map_attributes KantoDeptStore4F, KANTO_DEPT_STORE_4F, $00, 0
	map_attributes KantoDeptStore5F, KANTO_DEPT_STORE_5F, $00, 0
	map_attributes KantoDeptStore6F, KANTO_DEPT_STORE_6F, $00, 0
	map_attributes KantoDeptStoreElevator, KANTO_DEPT_STORE_ELEVATOR, $00, 0
	map_attributes KantoMansion1F, KANTO_MANSION_1F, $00, 0
	map_attributes KantoMansion2F, KANTO_MANSION_2F, $00, 0
	map_attributes KantoMansion3F, KANTO_MANSION_3F, $00, 0
	map_attributes KantoMansionRoof, KANTO_MANSION_ROOF, $00, 0
	map_attributes KantoMansionRoofHouse, KANTO_MANSION_ROOF_HOUSE, $00, 0
	map_attributes KantoPokecenter1F, KANTO_POKECENTER_1F, $00, 0
	map_attributes KantoPokecenter2FBeta, KANTO_POKECENTER_2F_BETA, $00, 0
	map_attributes KantoGameCorner, KANTO_GAME_CORNER, $00, 0
	map_attributes KantoGameCornerPrizeRoom, KANTO_GAME_CORNER_PRIZE_ROOM, $00, 0
	map_attributes KantoGym, KANTO_GYM, $00, 0
	map_attributes KantoCafe, KANTO_CAFE, $00, 0
	map_attributes CrownCityTrainerHouse, CROWN_CITY_TRAINER_HOUSE, $00, 0
	map_attributes ForkedStraitGate, FORKED_STRAIT_GATE, $00, 0
	map_attributes Route118SunpointGate, ROUTE_118_SUNPOINT_GATE, $00, 0
	map_attributes SeasidePathIsenStraitGate, SEASIDE_PATH_ISEN_STRAIT_GATE, $00, 0
	map_attributes ManiasHouse, MANIAS_HOUSE, $00, 0
	map_attributes StandGym, STAND_GYM, $00, 0
	map_attributes SunpointPokecenter1F, SUNPOINT_POKECENTER_1F, $00, 0
	map_attributes CrownHouse2, CROWN_HOUSE_2, $00, 0
	map_attributes SunpointPhotoStudio, SUNPOINT_PHOTO_STUDIO, $00, 0
	map_attributes CrownHouse1, CROWN_HOUSE_1, $00, 0
	map_attributes TeamRocketShipBase, TEAM_ROCKET_SHIP_BASE, $00, 0
	map_attributes ViridianNicknameSpeechHouse, VIRIDIAN_NICKNAME_SPEECH_HOUSE, $00, 0
	map_attributes TrainerHouse1F, TRAINER_HOUSE_1F, $00, 0
	map_attributes TrainerHouseB1F, TRAINER_HOUSE_B1F, $00, 0
	map_attributes SanskritMart, SANSKRIT_MART, $00, 0
	map_attributes SilentPokecenter1F, SILENT_POKECENTER_1F, $00, 0
	map_attributes SilentPokecenter2FBeta, SILENT_POKECENTER_2F_BETA, $00, 0
	map_attributes Route116NuggetHouse, ROUTE_116_NUGGET_HOUSE, $00, 0
	map_attributes Route116BirdonGate, ROUTE_116_BIRDON_GATE, $00, 0
	map_attributes VictoryRoadGate, VICTORY_ROAD_GATE, $00, 0
	map_attributes OakLabFrontRoom, OAK_LAB_FRONT_ROOM, $00, 0
	map_attributes OakLabBackRoom, OAK_LAB_BACK_ROOM, $00, 0
	map_attributes PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_attributes PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0
	map_attributes PlayersNeighborsHouse, PLAYERS_NEIGHBORS_HOUSE, $00, 0
	map_attributes RivalsHouse, RIVALS_HOUSE, $00, 0
	map_attributes DaitoRanchOtherHouse, DAITO_RANCH_OTHER_HOUSE, $00, 0
	map_attributes DayOfWeekSiblingsHouse, DAY_OF_WEEK_SIBLINGS_HOUSE, $00, 0
	map_attributes Route110SandstormHouse, ROUTE_110_SANDSTORM_HOUSE, $00, 0
	map_attributes BlueForestRoute111Gate, BLUE_FOREST_ROUTE_111_GATE, $00, 0
	map_attributes FightingDojo, FIGHTING_DOJO, $00, 0
	map_attributes RyukyuGym, RYUKYU_GYM, $00, 0
	map_attributes RyukyuMart, RYUKYU_MART, $00, 0
	map_attributes RyukyuPokecenter1F, RYUKYU_POKECENTER_1F, $00, 0
	map_attributes RyukyuPokecenter2FBeta, RYUKYU_POKECENTER_2F_BETA, $00, 0
	map_attributes RyukyuTradeHouse, RYUKYU_TRADE_HOUSE, $00, 0
	map_attributes RyukyuArboretum, RYUKYU_ARBORETUM, $00, 0
	map_attributes SilphCo1F, SILPH_CO_1F, $00, 0
	map_attributes CopycatsHouse1F, COPYCATS_HOUSE_1F, $00, 0
	map_attributes CopycatsHouse2F, COPYCATS_HOUSE_2F, $00, 0
	map_attributes SunpointDocksCrownPathEntrance, SUNPOINT_DOCKS_CROWN_PATH_ENTRANCE, $00, 0
	map_attributes SunpointDocksGate, SUNPOINT_DOCKS_GATE, $00, 0
	map_attributes SunpointDocksCleanseTagHouse, SUNPOINT_DOCKS_CLEANSE_TAG_HOUSE, $00, 0
	map_attributes CrownMart, CROWN_MART, $00, 0
	map_attributes CrownPokecenter1F, CROWN_POKECENTER_1F, $00, 0
	map_attributes BirdonElderHouse, BIRDON_ELDER_HOUSE, $00, 0
	map_attributes SkateboarderHouse, SKATEBOARDER_HOUSE, $00, 0
	map_attributes CrownEvolutionSpeechHouse, CROWN_EVOLUTION_SPEECH_HOUSE, $00, 0
	map_attributes Route104GeoffsHouse, ROUTE_104_GEOFFS_HOUSE, $00, 0
	map_attributes MrPokemonsHouse, MR_POKEMONS_HOUSE, $00, 0
	map_attributes Route101PagotaGate, ROUTE_101_PAGOTA_GATE, $00, 0
	map_attributes Route101PagotaGate2F, ROUTE_101_PAGOTA_GATE_2F, $00, 0
	map_attributes KantoBattleClub1F, KANTO_BATTLE_CLUB_1F, $00, 0
	map_attributes KantoBattleClubB1F, KANTO_BATTLE_CLUB_B1F, $00, 0
	map_attributes TeknosPort, TEKNOS_PORT, $0a, 0
	map_attributes KantoRestaurant, KANTO_RESTAURANT, $00, 0
	map_attributes Route102WestGate, ROUTE_102_WEST_GATE, $00, 0
	map_attributes Route102WestGate2F, ROUTE_102_WEST_GATE_2F, $00, 0
	map_attributes StandPoke, STAND_POKE, $00, 0
	map_attributes Route105Route106Gate, ROUTE_105_ROUTE_106_GATE, $00, 0
	map_attributes AlloyRoute107Gate, ALLOY_ROUTE_107_GATE, $00, 0
	map_attributes AlloyRoute107Gate2F, ALLOY_ROUTE_107_GATE_2F, $00, 0
	map_attributes KobanMart, KOBAN_MART, $00, 0
	map_attributes KobanHouse1, KOBAN_HOUSE_1, $00, 0
	map_attributes KobanHouse2, KOBAN_HOUSE_2, $00, 0
	map_attributes KantoHouse1, KANTO_HOUSE_1, $00, 0
	map_attributes KantoHouse2, KANTO_HOUSE_2, $00, 0
	map_attributes KantoHouse3, KANTO_HOUSE_3, $00, 0
	map_attributes KantoHouse4, KANTO_HOUSE_4, $00, 0
	map_attributes Kanto2Pokecenter1F, KANTO_2_POKECENTER_1F, $00, 0
	map_attributes KantoMart, KANTO_MART, $00, 0
	map_attributes IejimaPokecenter1F, IEJIMA_POKECENTER_1F, $00, 0
	map_attributes IejimaHouse1, IEJIMA_HOUSE_1, $00, 0
	map_attributes IejimaHouse2, IEJIMA_HOUSE_2, $00, 0

