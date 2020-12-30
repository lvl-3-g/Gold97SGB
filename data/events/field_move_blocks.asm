CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_NIHON,        .nihon
	dbw TILESET_NIHON_MODERN, .nihon_modern
	dbw TILESET_NIHON_OLD,    .nihon_old
	dbw TILESET_BIRDON,       .birdon
	dbw TILESET_HONTO,        .honto
	dbw TILESET_KANTO,        .kanto
	dbw TILESET_PARK,         .park
	dbw TILESET_FOREST,       .forest
	dbw TILESET_TROPICAL,     .tropical
	dbw TILESET_BLUE_FOREST,  .blue_forest
	dbw TILESET_SOUTH,        .south
	dbw TILESET_DARK_CAVE,    .dark_cave
	db -1 ; end

.nihon:
; facing block, replacement block, animation
	db $3B, $04, 1 ; grass
	db $30, $25, 0 ; tree
	db $31, $2A, 0 ; tree
	db $32, $34, 0 ; tree
	db $33, $35, 0 ; tree
	db $6D, $35, 0 ; tree
	db -1 ; end

.nihon_modern:
; facing block, replacement block, animation
	db $03, $04, 1 ; grass
	db $3b, $04, 1 ; grass
	db -1 ; end
	
.nihon_old:
; facing block, replacement block, animation
	db $3B, $04, 1 ; grass
	db $6C, $6D, 0 ; tree
	db -1 ; end
	
.birdon:
; facing block, replacement block, animation
	db $3B, $04, 1 ; grass
	db $32, $31, 0 ; tree
	db -1 ; end
	
.honto:
; facing block, replacement block, animation
	db $3B, $04, 1 ; grass
	db $30, $25, 0 ; tree
	db -1 ; end

.kanto:
; facing block, replacement block, animation
	db $13, $04, 1 ; grass
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $3B, $04, 1 ; grass
	db -1 ; end

.forest:
; facing block, replacement block, animation
	db $27, $01, 1
	db $28, $01, 1
	db $0F, $17, 0 ; tree
	db -1 ; end

.tropical:
; facing block, replacement block, animation
	db $13, $02, 1
	db $40, $02, 1
	db $03, $02, 1
	db $11, $13, 1
	db -1 ; end

.blue_forest:
; facing block, replacement block, animation
	db $3B, $04, 1
	db -1 ; end

.south:
; facing block, replacement block, animation
	db $3B, $04, 1
	db -1 ; end

.dark_cave:
; facing block, replacement block, animation
	db $01, $09, 1
	db -1 ; end

WhirlpoolBlockPointers:
	dbw TILESET_NIHON, .nihon
	dbw TILESET_BLUE_FOREST, .blue_forest
	dbw TILESET_PARK, .park
	db -1 ; end

.nihon:
; facing block, replacement block, animation
	db $07, $36, 0
	db -1 ; end
	
.blue_forest:
; facing block, replacement block, animation
	db $5b, $4a, 0
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $68, $4a, 0
	db -1 ; end
