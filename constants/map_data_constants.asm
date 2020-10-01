GROUP_N_A  EQU -1
MAP_N_A    EQU -1
GROUP_NONE EQU 0
MAP_NONE   EQU 0

; map struct members (see data/maps/maps.asm)
	const_def
	const MAP_MAPATTRIBUTES_BANK ; 0
	const MAP_TILESET            ; 1
	const MAP_ENVIRONMENT        ; 2
	const MAP_MAPATTRIBUTES      ; 3
	const MAP_MAPATTRIBUTES_HI   ; 4
	const MAP_LOCATION           ; 5
	const MAP_MUSIC              ; 6
	const MAP_PALETTE            ; 7
	const MAP_FISHGROUP          ; 8

; map environments (wEnvironment)
	const_def 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const ENVIRONMENT_5
	const GATE
	const DUNGEON

; map palettes (wEnvironment)
	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_DARK

; FishGroups indexes (see data/wild/fish.asm)
	const_def
	const FISHGROUP_NONE
	const FISHGROUP_SHORE
	const FISHGROUP_OCEAN
	const FISHGROUP_LAKE
	const FISHGROUP_POND
	const FISHGROUP_DRATINI
	const FISHGROUP_QWILFISH_SWARM
	const FISHGROUP_REMORAID_SWARM
	const FISHGROUP_GYARADOS
	const FISHGROUP_DRATINI_2
	const FISHGROUP_WHIRL_ISLANDS
	const FISHGROUP_QWILFISH
	const FISHGROUP_REMORAID
	const FISHGROUP_QWILFISH_NO_SWARM

; connection directions (see data/maps/data.asm)
	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

; wMapConnections
	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH

; SpawnPoints indexes (see data/maps/spawn_points.asm)
const_value = -1
	const SPAWN_N_A
	const SPAWN_HOME
	const SPAWN_DEBUG
; swislands
	const SPAWN_IEJIMA
	const SPAWN_KUME
	const SPAWN_NAGO
	const SPAWN_AMAMI
	const SPAWN_LAVENDER
	const SPAWN_RYUKYU
; nihon
	const SPAWN_SILENT
	const SPAWN_KOBAN
	const SPAWN_KANTO
	const SPAWN_STAND
	const SPAWN_FROSTPOINT
	const SPAWN_MOUNT_FUJI
	const SPAWN_CROWN
	const SPAWN_PAGOTA
	const SPAWN_JADE_FOREST
	const SPAWN_BIRDON
	const SPAWN_SUNPOINT
	const SPAWN_WESTPORT
	const SPAWN_ALLOY
	const SPAWN_ROCK_TUNNEL
	const SPAWN_TEKNOS
	const SPAWN_SANSKRIT
	const SPAWN_KIKAI
	const SPAWN_BLUE_FOREST
	const SPAWN_DAITO
	const SPAWN_FAST_SHIP
NUM_SPAWNS EQU const_value

; Flypoints indexes (see data/maps/flypoints.asm)
	const_def
; nihon
	const FLY_SILENT
	const FLY_PAGOTA
	const FLY_WESTPORT
	const FLY_BIRDON
	const FLY_SANSKRIT
	const FLY_SUNPOINT
	const FLY_TEKNOS
	const FLY_ALLOY
	const FLY_KOBAN
	const FLY_BLUE_FOREST
	const FLY_FROSTPOINT
	const FLY_STAND
	const FLY_KANTO
	const FLY_CROWN
	const FLY_MOUNT_FUJI
; swislands
SWISLANDS_FLYPOINT EQU const_value
	const FLY_KIKAI
	const FLY_KUME
	const FLY_DAITO
	const FLY_RYUKYU
	const FLY_IEJIMA
	const FLY_NAGO
	const FLY_AMAMI
	const FLY_LAVENDER

MAX_OUTDOOR_SPRITES EQU 11 ; see engine/overworld/overworld.asm
