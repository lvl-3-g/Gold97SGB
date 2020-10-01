; MapGroupRoofs values; Roofs indexes
	const_def
	const ROOF_SILENT  ; 0
	const ROOF_PAGOTA    ; 1
	const ROOF_BIRDON    ; 2
	const ROOF_ALLOY   ; 3
	const ROOF_WESTPORT ; 4

MapGroupRoofs:
; entries correspond to map groups
; values are indexes for Roofs (see below)
	db -1             ;  0
	db -1             ; 12
	db -1             ; 13
	db -1             ; 14
	db -1             ; 15
	db -1             ; 16
	db -1             ; 17
	db -1             ; 12
	db -1             ; 13
	db -1             ; 14
	db -1             ; 15
	db -1             ; 16
	db -1             ; 12
	db -1             ; 13
	db -1             ; 14
	db -1             ; 15
	db -1             ; 16
	db -1             ; 12
	db -1             ; 13
	db -1             ; 14
	db -1             ; 15
	db -1             ; 16
	db -1             ; 17
	db -1             ; 17
	db -1             ; 16
	db -1             ; 17
	db -1             ; 17
	db -1

Roofs:
; entries correspond to ROOF_* constants
INCBIN "gfx/tilesets/roofs/silent.2bpp"
INCBIN "gfx/tilesets/roofs/pagota.2bpp"
INCBIN "gfx/tilesets/roofs/birdon.2bpp"
INCBIN "gfx/tilesets/roofs/alloy.2bpp"
INCBIN "gfx/tilesets/roofs/westport.2bpp"
