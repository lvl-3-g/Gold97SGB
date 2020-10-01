INCLUDE "constants.asm"

tilecoll: MACRO
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX


TilesetForestGFX::
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetKantoMeta::
INCBIN "data/tilesets/kanto_metatiles.bin"

TilesetKantoColl::
INCLUDE "data/tilesets/kanto_collision.asm"

TilesetEliteFourRoomColl::
INCLUDE "data/tilesets/elite_four_room_collision.asm"

Tileset0GFX::


Tileset0Meta::
TilesetNihonMeta::
INCBIN "data/tilesets/nihon_metatiles.bin"

Tileset0Coll::
TilesetNihonColl::
INCLUDE "data/tilesets/nihon_collision.asm"

TilesetNihonModernGFX::
INCBIN "gfx/tilesets/nihon_modern.2bpp.lz"

TilesetNihonModernMeta::
INCBIN "data/tilesets/nihon_modern_metatiles.bin"

TilesetNihonModernColl::
INCLUDE "data/tilesets/nihon_modern_collision.asm"

TilesetSouthGFX::
INCBIN "gfx/tilesets/south.2bpp.lz"


TilesetTraditionalHouseGFX::
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"

TilesetTraditionalHouseMeta::
INCBIN "data/tilesets/traditional_house_metatiles.bin"

TilesetTraditionalHouseColl::
INCLUDE "data/tilesets/traditional_house_collision.asm"


SECTION "Tileset Data 2", ROMX

TilesetGateGFX::
INCBIN "gfx/tilesets/gate.2bpp.lz"

TilesetGateMeta::
INCBIN "data/tilesets/gate_metatiles.bin"

TilesetGateColl::
INCLUDE "data/tilesets/gate_collision.asm"

TilesetPokecenterGFX::
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta::
INCBIN "data/tilesets/pokecenter_metatiles.bin"

TilesetPokecenterColl::
INCLUDE "data/tilesets/pokecenter_collision.asm"

TilesetPortGFX::
INCBIN "gfx/tilesets/port.2bpp.lz"

TilesetPortMeta::
INCBIN "data/tilesets/port_metatiles.bin"

TilesetPortColl::
INCLUDE "data/tilesets/port_collision.asm"

TilesetPlayersHouseGFX::
INCBIN "gfx/tilesets/players_house.2bpp.lz"

TilesetPlayersHouseMeta::
INCBIN "data/tilesets/players_house_metatiles.bin"

TilesetPlayersHouseColl::
INCLUDE "data/tilesets/players_house_collision.asm"

TilesetMansionGFX::
INCBIN "gfx/tilesets/mansion.2bpp.lz"

TilesetMansionMeta::
INCBIN "data/tilesets/mansion_metatiles.bin"

TilesetMansionColl::
INCLUDE "data/tilesets/mansion_collision.asm"

TilesetCaveGFX::
INCBIN "gfx/tilesets/cave.2bpp.lz"

SECTION "Tileset Data 3", ROMX

TilesetTowerGFX::
INCBIN "gfx/tilesets/tower.2bpp.lz"

TilesetTowerMeta::
INCBIN "data/tilesets/tower_metatiles.bin"

TilesetTowerColl::
INCLUDE "data/tilesets/tower_collision.asm"

TilesetLabGFX::
INCBIN "gfx/tilesets/lab.2bpp.lz"

TilesetLabMeta::
INCBIN "data/tilesets/lab_metatiles.bin"

TilesetLabColl::
INCLUDE "data/tilesets/lab_collision.asm"

TilesetFacilityGFX::
INCBIN "gfx/tilesets/facility.2bpp.lz"

TilesetFacilityMeta::
INCBIN "data/tilesets/facility_metatiles.bin"

TilesetFacilityColl::
INCLUDE "data/tilesets/facility_collision.asm"

TilesetMartGFX::
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartMeta::
INCBIN "data/tilesets/mart_metatiles.bin"

TilesetMartColl::
INCLUDE "data/tilesets/mart_collision.asm"

TilesetGameCornerGFX::
INCBIN "gfx/tilesets/game_corner.2bpp.lz"

TilesetGameCornerMeta::
INCBIN "data/tilesets/game_corner_metatiles.bin"

TilesetGameCornerColl::
INCLUDE "data/tilesets/game_corner_collision.asm"

TilesetTrainStationGFX::
INCBIN "gfx/tilesets/train_station.2bpp.lz"

TilesetTrainStationMeta::
INCBIN "data/tilesets/train_station_metatiles.bin"

TilesetTrainStationColl::
INCLUDE "data/tilesets/train_station_collision.asm"

TilesetForestMeta::
INCBIN "data/tilesets/forest_metatiles.bin"


SECTION "Tileset Data 4", ROMX

TilesetEliteFourRoomGFX::
INCBIN "gfx/tilesets/elite_four_room.2bpp.lz"

TilesetParkGFX::
INCBIN "gfx/tilesets/park.2bpp.lz"

TilesetParkMeta::
INCBIN "data/tilesets/park_metatiles.bin"

TilesetParkColl::
INCLUDE "data/tilesets/park_collision.asm"

TilesetRuinsOfAlphGFX::
INCBIN "gfx/tilesets/ruins_of_alph.2bpp.lz"

TilesetRuinsOfAlphMeta::
INCBIN "data/tilesets/ruins_of_alph_metatiles.bin"

TilesetRuinsOfAlphColl::
INCLUDE "data/tilesets/ruins_of_alph_collision.asm"

TilesetRadioTowerGFX::
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"

TilesetRadioTowerMeta::
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl::
INCLUDE "data/tilesets/radio_tower_collision.asm"

TilesetUndergroundGFX::
INCBIN "gfx/tilesets/underground.2bpp.lz"

TilesetUndergroundMeta::
INCBIN "data/tilesets/underground_metatiles.bin"

TilesetUndergroundColl::
INCLUDE "data/tilesets/underground_collision.asm"

TilesetIcePathGFX::
INCBIN "gfx/tilesets/ice_path.2bpp.lz"

TilesetIcePathMeta::
INCBIN "data/tilesets/ice_path_metatiles.bin"


SECTION "Tileset Data 5", ROMX


TilesetChampionsRoomGFX::
INCBIN "gfx/tilesets/champions_room.2bpp.lz"

TilesetChampionsRoomMeta::
INCBIN "data/tilesets/champions_room_metatiles.bin"

TilesetChampionsRoomColl::
INCLUDE "data/tilesets/champions_room_collision.asm"

TilesetHouseGFX::
INCBIN "gfx/tilesets/house.2bpp.lz"

TilesetHouseMeta::
INCBIN "data/tilesets/house_metatiles.bin"

TilesetHouseColl::
INCLUDE "data/tilesets/house_collision.asm"

TilesetLighthouseGFX::
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"

TilesetLighthouseMeta::
INCBIN "data/tilesets/lighthouse_metatiles.bin"

TilesetLighthouseColl::
INCLUDE "data/tilesets/lighthouse_collision.asm"

TilesetPlayersRoomGFX::
INCBIN "gfx/tilesets/players_room.2bpp.lz"

TilesetPlayersRoomMeta::
INCBIN "data/tilesets/players_room_metatiles.bin"

TilesetPlayersRoomColl::
INCLUDE "data/tilesets/players_room_collision.asm"


SECTION "Tileset Data 6", ROMX

TilesetKantoGFX::
INCBIN "gfx/tilesets/kanto.2bpp.lz"

TilesetNihonOldGFX::
INCBIN "gfx/tilesets/nihon_old.2bpp.lz"

TilesetNihonOldMeta::
INCBIN "data/tilesets/nihon_old_metatiles.bin"

TilesetNihonOldColl::
INCLUDE "data/tilesets/nihon_old_collision.asm"

TilesetHontoGFX::
INCBIN "gfx/tilesets/honto.2bpp.lz"

TilesetHontoMeta::
INCBIN "data/tilesets/honto_metatiles.bin"

TilesetHontoColl::
INCLUDE "data/tilesets/honto_collision.asm"



SECTION "Tileset Data 7", ROMX

TilesetBlueForestColl::
INCLUDE "data/tilesets/blue_forest_collision.asm"

TilesetCaveColl::
INCLUDE "data/tilesets/cave_collision.asm"

TilesetDarkCaveColl::
INCLUDE "data/tilesets/dark_cave_collision.asm"

TilesetCaveMeta::
INCBIN "data/tilesets/cave_metatiles.bin"

SECTION "Tileset Data 8", ROMX

TilesetDarkCaveMeta::
INCBIN "data/tilesets/dark_cave_metatiles.bin"

TilesetBlueForestGFX::
INCBIN "gfx/tilesets/blue_forest.2bpp.lz"

TilesetTropicalGFX::
INCBIN "gfx/tilesets/tropical.2bpp.lz"

TilesetBlueForestMeta::
INCBIN "data/tilesets/blue_forest_metatiles.bin"

TilesetSouthMeta::
INCBIN "data/tilesets/south_metatiles.bin"

TilesetTropicalMeta::
INCBIN "data/tilesets/tropical_metatiles.bin"


SECTION "Tileset Data 9", ROMX

TilesetSouthColl::
INCLUDE "data/tilesets/south_collision.asm"

TilesetTropicalColl::
INCLUDE "data/tilesets/tropical_collision.asm"

TilesetBirdonColl::
INCLUDE "data/tilesets/birdon_collision.asm"

TilesetNihonGFX::
INCBIN "gfx/tilesets/nihon.2bpp.lz"

SECTION "Tileset Data 10", ROMX

TilesetForestColl::
INCLUDE "data/tilesets/forest_collision.asm"

TilesetBirdonGFX::
INCBIN "gfx/tilesets/birdon.2bpp.lz"

TilesetBirdonMeta::
INCBIN "data/tilesets/birdon_metatiles.bin"

TilesetIcePathColl::
INCLUDE "data/tilesets/ice_path_collision.asm"

TilesetDarkCaveGFX::
INCBIN "gfx/tilesets/dark_cave.2bpp.lz"

TilesetEliteFourRoomMeta::
INCBIN "data/tilesets/elite_four_room_metatiles.bin"

TilesetOfficeGFX::
INCBIN "gfx/tilesets/office.2bpp.lz"

TilesetOfficeMeta::
INCBIN "data/tilesets/office_metatiles.bin"

TilesetOfficeColl::
INCLUDE "data/tilesets/office_collision.asm"
