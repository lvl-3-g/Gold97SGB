AnimateDexSearchSlowpoke:
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	jp DoDexSearchSlowpokeFrame ; erosunica: removed DelayFrames from below

.FrameIDs: ; erosunica: modded to accommodate the new graphic
	; frame ID, duration
	db 0, 8
	db 1, 8
	db 2, 8
	db 3, 8
	db -2

DoDexSearchSlowpokeFrame:
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SlowpokeSpriteData
	ld de, wVirtualOAMSprite00
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a ; y
	inc de
	ld a, [hli]
	ld [de], a ; x
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	jr .loop

.SlowpokeSpriteData: ; erosunica: modded to accommodate the new graphic
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	dbsprite  4,  8, 0, 0, $00, 0
	dbsprite  5,  8, 0, 0, $01, 0
	dbsprite  6,  8, 0, 0, $02, 0
	dbsprite  4,  9, 0, 0, $10, 0
	dbsprite  5,  9, 0, 0, $11, 0
	dbsprite  6,  9, 0, 0, $12, 0
	dbsprite  4, 10, 0, 0, $20, 0
	dbsprite  5, 10, 0, 0, $21, 0
	dbsprite  6, 10, 0, 0, $22, 0
	dbsprite  4, 11, 0, 0, $30, 0
	dbsprite  5, 11, 0, 0, $31, 0
	dbsprite  6, 11, 0, 0, $32, 0
	dbsprite  7, 10, 0, 0, $40, 0
	dbsprite  7,  9, 0, 0, $41, 0
	dbsprite  7,  8, 0, 0, $42, 0
	db -1

DisplayDexEntry:
	call GetPokemonName
	hlcoord 9, 2
	call PlaceString ; mon species
	ld a, [wTempSpecies]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 4
	call FarString ; dex species
	ld h, b
	ld l, c
	push de
; Print dex number
	hlcoord 2, 8
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	ld de, wTempSpecies
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
; Get the height of the Pokemon.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	inc hl
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, l
	ld e, h
	pop hl
	inc hl
	inc hl
	ld a, d
	or e
	jr z, .skip_height
	push hl
	push de
; Print the height, with two of the four digits in front of the decimal point
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 12, 6
	lb bc, 2, (2 << 4) | 4
	call PrintNum
; Replace the decimal point with a ft symbol
	hlcoord 14, 6
	ld [hl], $5e
	pop af
	pop hl

.skip_height
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, l
	ld e, h
	ld a, e
	or d
	jr z, .skip_weight
	push de
; Print the weight, with four of the five digits in front of the decimal point
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 12, 8
	lb bc, 2, (3 << 4) | 4
	call PrintNum
	pop de

.skip_weight ; erosunica: modded to mimic sw97 pokédex
; Page 1
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 1, 10
	call ClearBox
	pop de
	inc de
	pop af
	hlcoord 1, 10
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a ; check for page 2
	ret z

; Page 2
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 1, 10
	call ClearBox
	pop de
	inc de
	pop af
	hlcoord 1, 10
	jp FarString

DisplayNewDexEntry: ; erosunica: new, needed by NewPokedexEntry
	call GetPokemonName
	hlcoord 9, 2
	call PlaceString ; mon species
	ld a, [wTempSpecies]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 4
	call FarString ; dex species
	ld h, b
	ld l, c
	push de
; Print dex number
	hlcoord 2, 8
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	ld de, wTempSpecies
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
; Get the height of the Pokemon.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	inc hl
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, l
	ld e, h
	pop hl
	inc hl
	inc hl
	ld a, d
	or e
	jr z, .skip_height
	push hl
	push de
; Print the height, with two of the four digits in front of the decimal point
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 12, 6
	lb bc, 2, (2 << 4) | 4
	call PrintNum
; Replace the decimal point with a ft symbol
	hlcoord 14, 6
	ld [hl], $5e
	pop af
	pop hl

.skip_height
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, l
	ld e, h
	ld a, e
	or d
	jr z, .skip_weight
	push de
; Print the weight, with four of the five digits in front of the decimal point
	ld hl, sp+0
	ld d, h
	ld e, l
	hlcoord 12, 8
	lb bc, 2, (3 << 4) | 4
	call PrintNum
	pop de

.skip_weight ; erosunica: modded to mimic sw97 pokédex
; Page 1
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 1, 10
	call ClearBox
	pop de
	inc de
	pop af
	hlcoord 1, 10
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a ; check for page 2
	ret z

; Page 2
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 1, 10
	call ClearBox
	pop de
	inc de
	pop af
	hlcoord 1, 10
	jp FarString

GetDexEntryPointer:
; return dex entry pointer b:de
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	rlca
	rlca
	maskbits NUM_DEX_ENTRY_BANKS
	add BANK("Pokedex Entries 001-064")
	ld b, a
	pop hl
	ret

GetDexEntryPagePointer:
	call GetDexEntryPointer
	push hl
	ld h, d
	ld l, e
; skip species name
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
; skip height and weight
rept 3
	inc hl
endr
; if c != 1: skip entry
	dec c
	jr z, .done
; skip entry
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret

INCLUDE "data/pokemon/dex_entry_pointers.asm"
