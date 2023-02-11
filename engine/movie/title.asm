TITLE_BGP_INITIAL equ %00101010
TITLE_BGP_FINAL   equ %11011000

TITLE_SCX_INITIAL equ 152

TITLE_TILE_BORDER_UP   equ $1B
TITLE_TILE_BORDER_DOWN equ $1F

TITLE_TILE_GAMETITLE equ $FE
TITLE_SIZE_GAMETITLE equ 9

TITLE_TILE_COPYRIGHT equ $0E
TITLE_SIZE_COPYRIGHT equ 13

TITLE_TILE_HOOH equ $23

InitTitleScreen:
	call ClearBGPalettes
	xor a
	ld [wTimeOfDayPal], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DisableLCD
	call ClearSprites

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

	ldh [hMapAnims], a
	ldh [hSCY], a

	ld a, TITLE_SCX_INITIAL
	ldh [hSCX], a	; initial scroll position

; clear upper tileset
	ld hl, vTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill

	farcall ClearSpriteAnims

; title screen GFX
	ld hl, TitleScreenGFX2
	ld de, vTiles1
	ld a, BANK(TitleScreenGFX2)
	call FarDecompress

; blank out screen with $7F
	ld a, $7F
	ld hl, vBGMap0
	ld bc, vBGMap1 - vBGMap0
	call ByteFill
; while we're at it, blank out the tilemap buffer as well
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill

; fire or note GFX
	ld a, [hTitleScreenSelectedOption]
	call TitleScreenSwitchObjectGFX

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

; load 6 flying objects on the screen
	ld hl, .fire_starting_positions
	ld c, 6
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

; load color
	ld b, SCGB_BETA_TITLE_SCREEN
	call GetSGBLayout
	call LoadTitleScreenPals

; enable auto-updating
	ld a, 1
	ldh [hBGMapMode], a

; play start sound effect
	ld de, SFX_TITLE_ENTRANCE
	call PlaySFX
	ret

.fire_starting_positions
	dw $4CE0
	dw $58A0
	dw $6490
	dw $70D0
	dw $7CB0
	dw $8800

LoadTitleScreenPals:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ld a, TITLE_BGP_INITIAL
	ldh [rBGP], a
	ld a, %11100100
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret
.cgb
	ld a, TITLE_BGP_INITIAL
	call DmgToCgbBGPals
	ld a, %11100100
	call DmgToCgbObjPal0
	ret

FillTitleScreenPals:
	call ByteFill
	ld a, 0
	ldh [rVBK], a
	ret

LoadTitleScreenTilemap:
; Draw Pokemon logo
	hlcoord 0, 0
	lb bc, 7, 20
	lb de, $80, 20
	call DrawTitleGraphic
; ...except game title
	hlcoord 6, 6
	ld bc, 9
	ld a, $80
	call ByteFill
	ret

DrawTitleGraphic:
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

RunTitleScreen:
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done_title
	call TitleScreenScene
	ld a, $1
	ldh [hOAMUpdate], a
	farcall PlaySpriteAnimations
	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	and a
	ret

.done_title
	scf
	ret

TitleScreenScene:
	ld e, a
	ld d, 0
	ld hl, .scenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.scenes
	dw TitleScreenScrollIn
	dw TitleScreenFlash
	dw TitleScreenBorder
	dw TitleScreenGameTitle
	dw TitleScreenCopyright
	dw TitleScreenHooh
	dw TitleScreenTimer
	dw TitleScreenMain
	dw TitleScreenEnd

TitleScreenScrollIn:
	call DelayFrame	; demo has a bit of lag. why not emulate that?
	ldh a, [hSCX]
	add 4
	ldh [hSCX], a
	ret nc
	xor a
	ldh [hSCX], a
	ld de, 20
	jp TitleScreenSetTimerNextScene

TitleScreenFlash:
	ld a, [wTitleScreenTimer]
	ld c, 3
	call SimpleDivide

	and a
	jr nz, .no_switch

	bit 0, b
	jr z, .flash_white

.flash_shadowed
	ldh a, [hCGB]
	and a
	jr z, .fs_not_cgb
	ld a, TITLE_BGP_INITIAL
	call DmgToCgbBGPals
.fs_not_cgb
	ld a, TITLE_BGP_INITIAL
	ld [rBGP], a
	jr .no_switch

.flash_white
	ldh a, [hCGB]
	and a
	jr z, .fw_not_cgb
	xor a
	call DmgToCgbBGPals
.fw_not_cgb
	xor a
	ld [rBGP], a
	;jr .no_switch

.no_switch
	call TitleScreenRunTimer
	ret nz

; Play the title screen music.
	ld de, MUSIC_TITLE
	call PlayMusic

; Restore normal colors
	ldh a, [hCGB]
	and a
	jr z, .not_cgb
	ld a, TITLE_BGP_FINAL
	call DmgToCgbBGPals
	jr .skip
.not_cgb
	ld a, TITLE_BGP_FINAL
	ld [rBGP], a
.skip
	ld de, 20
	jp TitleScreenSetTimerNextScene

TitleScreenBorder:
	call TitleScreenRunTimer
	ret nz

; Draw border (upper)	
	hlcoord 0, 8
	call DrawUpperBorder	
	hlcoord 4, 8
	call DrawUpperBorder	
	hlcoord 8, 8
	call DrawUpperBorder	
	hlcoord 12, 8
	call DrawUpperBorder	
	hlcoord 16, 8
	call DrawUpperBorder

; Draw border (lower)
	hlcoord 0, $10
	call DrawLowerBorder	
	hlcoord 4, $10
	call DrawLowerBorder	
	hlcoord 8, $10
	call DrawLowerBorder	
	hlcoord 12, $10
	call DrawLowerBorder	
	hlcoord 16, $10
	call DrawLowerBorder

	ld de, 20
	jp TitleScreenSetTimerNextScene

DrawUpperBorder:
	ld d, TITLE_TILE_BORDER_UP
	ld b, 1
	ld c, $04
	call DrawTitleGraphic
	ret

DrawLowerBorder:
	ld d, TITLE_TILE_BORDER_DOWN
	ld b, 1
	ld c, $04
	call DrawTitleGraphic
	ret

TitleScreenGameTitle:
	call TitleScreenRunTimer
	ret nz

; Draw game title
	hlcoord 6, 6
	ld d, TITLE_TILE_GAMETITLE
	ld b, 1
	ld c, TITLE_SIZE_GAMETITLE
	call DrawTitleGraphic

	ld de, 20
	jp TitleScreenSetTimerNextScene

TitleScreenCopyright:
	call TitleScreenRunTimer
	ret nz

; Draw copyright text
	hlcoord 3, $11
	ld d, TITLE_TILE_COPYRIGHT
	ld b, 1
	ld c, TITLE_SIZE_COPYRIGHT
	call DrawTitleGraphic

	ld de, 20
	jp TitleScreenSetTimerNextScene

TitleScreenHooh:
	call TitleScreenRunTimer
	ret nz

; Draw Ho-oh
	hlcoord 6, 9
	ld d, TITLE_TILE_HOOH
	ld e, 8	; advance 8 tiles each row
	ld bc, $0708	; 7x8 ho-oh pic
	call DrawTitleGraphic


	ld hl, wJumptableIndex
	inc [hl]
	ret

TitleScreenSetTimerNextScene:
	ld hl, wTitleScreenTimer
	ld a, e
	ld [hli], a
	ld [hl], d
;TitleScreenNextScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

TitleScreenTimer:
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld hl, wTitleScreenTimer
	ld de, 84 * 60 + 16
	ld [hl], e
	inc hl
	ld [hl], d
	ret

TitleScreenRunTimer:
	ld hl, wTitleScreenTimer
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	ret z

	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

TitleScreenMain:
; Run the timer down.
	call TitleScreenRunTimer
	jr z, .end

	call GetJoypad
	ld hl, hJoyDown

; Change to musical notes and back with Left + B

; If there's musical notes on the screen, the Pikachu
; minigame is enabled

	ld a, [hl]
	and D_LEFT + B_BUTTON
	cp  D_LEFT + B_BUTTON
	jr nz, .reset_last_pressed

	ldh a, [hTitleScreenLastPressed]
	cp D_LEFT + B_BUTTON
	jr z, .no_switch

	ld a, [hl]
	ldh [hTitleScreenLastPressed], a

	ldh a, [hTitleScreenSelectedOption]
	xor 1
	ldh [hTitleScreenSelectedOption], a

	jp TitleScreenSwitchObjectGFX

.reset_last_pressed
	xor a
	ldh [hTitleScreenLastPressed], a
.no_switch

; Save data can be deleted by pressing Up + B + Select.
	ld a, [hl]
	and D_UP + B_BUTTON + SELECT
	cp  D_UP + B_BUTTON + SELECT
	jr z, .delete_save_data

; Clock can be reset by pressing Down + B + Select.
	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr z, .clock_reset

; Press Start or A to start the game.
	ld a, [hl]
	and START | A_BUTTON
	jr nz, .incave
	ret

.incave
	ld a, 0
	jr .done

.delete_save_data
	ld a, 1

.done
	ld [wIntroSceneFrameCounter], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.end
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Fade out the title screen music
	xor a ; MUSIC_NONE
	ld [wMusicFadeID], a
	ld [wMusicFadeID + 1], a
	ld hl, wMusicFade
	ld [hl], 8 ; 1 second

	ld hl, wTitleScreenTimer
	inc [hl]
	ret

.clock_reset
	ld a, 4
	ld [wIntroSceneFrameCounter], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TitleScreenEnd:
; Wait until the music is done fading.

	ld hl, wTitleScreenTimer
	inc [hl]

	ld a, [wMusicFade]
	and a
	ret nz

	ld a, 2
	ld [wIntroSceneFrameCounter], a

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TitleScreenSwitchObjectGFX:
	add a
	ld l, a
	ld h, 0
	ld bc, .array
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, vTiles0 tile $78
	lb bc, BANK(TitleScreenGFX3), 8
	jp Get2bpp

.array
	dw TitleScreenGFX3	; Fire
	dw TitleScreenGFX4	; Notes
