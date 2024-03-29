tilepal: MACRO
; used in gfx/tilesets/*_palette_map.asm
; vram bank, pals
x = \1 << OAM_TILE_BANK
rept (_NARG - 1) / 2
	dn (x | PAL_BG_\3), (x | PAL_BG_\2)
	shift 2
endr
ENDM

TilesetKantoPalMap:
INCLUDE "gfx/tilesets/kanto_palette_map.asm"

Tileset0PalMap:
TilesetNihonPalMap:
INCLUDE "gfx/tilesets/nihon_palette_map.asm"

TilesetNihonModernPalMap:
INCLUDE "gfx/tilesets/nihon_modern_palette_map.asm"

TilesetHousePalMap:
INCLUDE "gfx/tilesets/house_palette_map.asm"

TilesetTropicalPalMap:
INCLUDE "gfx/tilesets/tropical_palette_map.asm"

TilesetPlayersHousePalMap:
INCLUDE "gfx/tilesets/players_house_palette_map.asm"

TilesetPokecenterPalMap:
INCLUDE "gfx/tilesets/pokecenter_palette_map.asm"

TilesetGatePalMap:
INCLUDE "gfx/tilesets/gate_palette_map.asm"

TilesetPortPalMap:
INCLUDE "gfx/tilesets/port_palette_map.asm"

TilesetLabPalMap:
INCLUDE "gfx/tilesets/lab_palette_map.asm"

TilesetFacilityPalMap:
INCLUDE "gfx/tilesets/facility_palette_map.asm"

TilesetMartPalMap:
INCLUDE "gfx/tilesets/mart_palette_map.asm"

TilesetMansionPalMap:
INCLUDE "gfx/tilesets/mansion_palette_map.asm"

TilesetGameCornerPalMap:
INCLUDE "gfx/tilesets/game_corner_palette_map.asm"

TilesetEliteFourRoomPalMap:
INCLUDE "gfx/tilesets/elite_four_room_palette_map.asm"

TilesetTraditionalHousePalMap:
INCLUDE "gfx/tilesets/traditional_house_palette_map.asm"

TilesetTowerPalMap:
INCLUDE "gfx/tilesets/tower_palette_map.asm"

TilesetCavePalMap:
INCLUDE "gfx/tilesets/dark_cave_palette_map.asm"

TilesetDarkCavePalMap:
INCLUDE "gfx/tilesets/cave_palette_map.asm"

TilesetParkPalMap:
INCLUDE "gfx/tilesets/park_palette_map.asm"

TilesetSanskritRuinsPalMap:
INCLUDE "gfx/tilesets/sanskrit_ruins_palette_map.asm"

TilesetRadioTowerPalMap:
INCLUDE "gfx/tilesets/radio_tower_palette_map.asm"

TilesetTrainStationPalMap:
INCLUDE "gfx/tilesets/train_station_palette_map.asm"

TilesetUndergroundPalMap:
INCLUDE "gfx/tilesets/underground_palette_map.asm"

TilesetChampionsRoomPalMap:
INCLUDE "gfx/tilesets/champions_room_palette_map.asm"

TilesetLighthousePalMap:
INCLUDE "gfx/tilesets/lighthouse_palette_map.asm"

TilesetPlayersRoomPalMap:
INCLUDE "gfx/tilesets/players_room_palette_map.asm"

UnusedMuseumPalMap:
INCLUDE "gfx/tilesets/unused_museum_palette_map.asm"

TilesetIcePathPalMap:
INCLUDE "gfx/tilesets/ice_path_palette_map.asm"

TilesetForestPalMap:
INCLUDE "gfx/tilesets/forest_palette_map.asm"

TilesetNihonOldPalMap:
INCLUDE "gfx/tilesets/nihon_old_palette_map.asm"

TilesetHontoPalMap:
INCLUDE "gfx/tilesets/honto_palette_map.asm"

TilesetBirdonPalMap:
INCLUDE "gfx/tilesets/birdon_palette_map.asm"

TilesetBlueForestPalMap:
INCLUDE "gfx/tilesets/blue_forest_palette_map.asm"

TilesetSouthPalMap:
INCLUDE "gfx/tilesets/south_palette_map.asm"

TilesetOfficePalMap:
INCLUDE "gfx/tilesets/office_palette_map.asm"

MapGroupPalettes:
; entries correspond to GROUP_* constants
rept NUM_MAP_GROUPS
	db PAL_BG_ROOF
endr
