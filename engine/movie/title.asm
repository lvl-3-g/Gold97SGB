TitleScreen:
	call ClearBGPalettes
	xor a
	ld [wTimeOfDayPal], a
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearTilemap
	call DisableLCD
	call ClearSprites

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

	ldh [hMapAnims], a
	ldh [hSCY], a
	ldh [hSCX], a

	ld hl, vTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill
	farcall ClearSpriteAnims

; Decompress lower part of title screen
;	ld hl, TitleScreenGFX1
;	ld de, vTiles2
;	ld a, BANK(TitleScreenGFX1)
;	call FarDecompress

; Decompress upper part of title screen
	ld hl, TitleScreenGFX2
	ld de, vTiles1
	ld a, BANK(TitleScreenGFX2)
	call FarDecompress

; Decompress Ho-Oh/Blissey sprite
	ld hl, TitleScreenGFX4
	ld de, vTiles0
	ld a, BANK(TitleScreenGFX4)
	call FarDecompress

; Ho-Oh/Blissey title trail.
; This should only copy 4 tiles; there are 4 extra whitespace tiles in Gold
; before Ho-Oh gfx, but Silver reads the first 64 bytes of the compressed
; Blissey gfx and writes them to VRAM (but never displays them on screen).
	ld hl, TitleScreenGFX3
	ld de, vTiles0 tile $78
	ld bc, 8 tiles
	ld a, BANK(TitleScreenGFX3)
	call FarCopyBytes

	call FillTitleScreenPals
	call LoadTitleScreenTilemap
	ld hl, wSpriteAnimDict
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, rLCDC
	res rLCDC_SPRITE_SIZE, [hl]	; 8x8 sprite mode
	call EnableLCD

; Reset timing variables
	xor a
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

	ld hl, .fire_starting_positions
	ld c, 6 ; Load 6 flying objects on the screen.
.set_fire_note_loop
	push bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	ld a, SPRITE_ANIM_INDEX_GS_TITLE_TRAIL
	call InitSpriteAnimStruct
	pop hl
	pop bc
	dec c
	jr nz, .set_fire_note_loop

	ld b, SCGB_BETA_TITLE_SCREEN
	call GetSGBLayout
	call LoadTitleScreenPals
	ld de, MUSIC_TITLE
	call PlayMusic
	ret

.fire_starting_positions
	dw $4CE0
	dw $58A0
	dw $6490
	dw $70D0
	dw $7CB0
	dw $8800

LoadTitleScreenPals:; not this
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	jr nz, .sgb
	ld a, %11011000
	ldh [rBGP], a
	ld a, %11100100
	ldh [rOBP0], a
	ld a, %11100100
	ldh [rOBP1], a
	ret

.sgb
	ld a, %11011000
	ldh [rBGP], a
	ld a, %11100100
	ldh [rOBP0], a
	ld a, %11100100
	ldh [rOBP1], a
	ret

.cgb
	ld a, %11011000
	call DmgToCgbBGPals
	ld a, %11100100
	call DmgToCgbObjPal0
	ret

FillTitleScreenPals:
;	ldh a, [hCGB]
;	and a
;	ret z
;	ld a, 1
;	ldh [rVBK], a
;	hlbgcoord 0, 0
;	ld bc, 18 * BG_MAP_WIDTH
;	xor a
;	call ByteFill
;	hlbgcoord 0, 0, vBGMap2
;	lb bc, 7, SCREEN_WIDTH
;	ld a, 1
;	call DrawTitleGraphic
;	hlbgcoord 5, 6, vBGMap2
;	lb bc, 1, 10
;	ld a, 3
;	call DrawTitleGraphic
;	hlbgcoord 0, 12, vBGMap2
;	ld bc, 5 * BG_MAP_WIDTH
;	ld a, 4
	call ByteFill
	ld a, 0
	ldh [rVBK], a
	ret

;DrawTitleGraphic:
;.bgrows
;	push bc
;	push hl
;.col
;	ld [hli], a
;	dec c
;	jr nz, .col
;	pop hl
;	ld bc, BG_MAP_WIDTH
;	add hl, bc
;	pop bc
;	dec b
;	jr nz, .bgrows
	ret

LoadTitleScreenTilemap:; not this
	ld hl, TitleScreenTilemap
	debgcoord 0, 0
.loop
	ld a, BANK(TitleScreenTilemap)
	call GetFarByte
	cp -1
	jr z, .done
	inc hl
	ld [de], a
	inc de
	jr .loop

.done
;	ldh a, [hCGB]; this section fixed the weird triangle lineeeeeeeeeeeeeeeeee
;	and a
;	ret nz
;	hlbgcoord 0, 11
;	ld bc, BG_MAP_WIDTH
;	ld a, "@"
;	call ByteFill
	ret
