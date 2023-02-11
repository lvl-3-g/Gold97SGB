; GetOptionPointer.Pointers indexes
	const_def
	const OPT_TEXT_SPEED
	const OPT_BATTLE_SCENE
	const OPT_BATTLE_STYLE
	const OPT_SOUND
	const OPT_CANCEL
	const OPT_NEXT_PAGE

; page 2
	const_def
	const OPT_FRAME
	const OPT_PRINT
	const OPT_MENU_ACCOUNT
	const OPT_PAGE2_SKIP
	const OPT_CANCEL_2
	const OPT_PREV_PAGE

NUM_OPTIONS EQU const_value

	const_def
	const OPT_TEXT_SPEED_FAST
	const OPT_TEXT_SPEED_MED
	const OPT_TEXT_SPEED_SLOW

	const_def
	const OPT_PRINT_LIGHTEST ; 0
	const OPT_PRINT_LIGHTER  ; 1
	const OPT_PRINT_NORMAL   ; 2
	const OPT_PRINT_DARKER   ; 3
	const OPT_PRINT_DARKEST  ; 4

_Option:
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	call ClearBGPalettes

; load border graphic from trainer card
	ld de, CardGFX
	ld hl, vTiles0 tile $F1
	lb bc, BANK(CardGFX), 1
	call Request2bpp

	call PlaceOptionsString
	call PlaceOptionArrows

	xor a
	ld [wJumptableIndex], a

; display the settings of each option when the menu is opened
;	ld c, NUM_OPTIONS - 2 ; omit frame type, the last option
;.print_text_loop
;	push bc
;	xor a
;	ldh [hJoyLast], a
;	call GetOptionPointer
;	pop bc
;	ld hl, wJumptableIndex
;	inc [hl]
;	dec c
;	jr nz, .print_text_loop
;	call UpdateFrame ; display the frame type

	xor a
	ld [wJumptableIndex], a
	inc a
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_OPTIONS_MENU
	call GetSGBLayout
	call SetPalettes

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and START | B_BUTTON
	jr nz, .ExitOptions
	call OptionsControl
	jr c, .dpad
	call GetOptionPointer
	jr c, .ExitOptions

.dpad
;	call Options_UpdateCursorPosition
	ld c, 3
	call DelayFrames
	jr .joypad_loop

.ExitOptions:
	ld de, SFX_READ_TEXT
	call PlaySFX
	pop af
	ldh [hInMenu], a
	ret












PlaceOptionsString:
; fill the screen with border tiles
	hlcoord 0,0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, "×"
	call ByteFill
	jumptable .PageTable, wOptionsPage

.PageTable:
	dw .Page1
	dw .Page2

.Page1:
	hlcoord 1,1
	ld de, .Page1_text
	call PlaceString
	jr .PlaceExitAndPageIndicator

.Page2:
	hlcoord 1,1
	ld c, SCREEN_WIDTH - 4
	ld b, 1
	call Textbox

	hlcoord 3,2
	ld de, .Page2_textframe_text
	call PlaceString

	hlcoord 1, 5
	ld de, .Page2_text
	call PlaceString

	hlcoord 17, 2
	ld a, [wTextboxFrame]
	add "1"
	ld [hl], a

	ld a, [hCGB]
	and a
	jr z, .PlaceExitAndPageIndicator

	hlcoord 1, 13
	ld de, .Page2_CGB_text
	call PlaceString

.PlaceExitAndPageIndicator:
	hlcoord 2, 16
	ld de, .ExitText
	call PlaceString
	hlcoord 13, 16
	ld de, .PageText
	call PlaceString
	hlcoord 18, 16
	ld a, [wOptionsPage]
	add "1"
	ld [hl], a
	ret

.Page1_text:
	db "TEXT SPEED        <LF>"
	db "                  <LF>"
	db " FAST  MED    SLOW<LF><LF>"
	db "BATTLE SCENE      <LF>"
	db "                  <LF>"
	db " ON       OFF     <LF><LF>"
	db "BATTLE STYLE      <LF>"
	db "                  <LF>"
	db " SHIFT    SET     <LF><LF>"
	db " MONO    STEREO   @"

.Page2_text:
	db "PRINT BRIGHTNESS  <LF>"
	db "                  <LF>"
	db " -2  -1  0  +1  +2<LF><LF>"
	db "MENU ACCOUNT      <LF>"
	db "                  <LF>"
	db " ON       OFF     <LF><LF>@"

.Page2_CGB_text:
	db "COLOR:  SGB   GBC @"

.Page2_textframe_text: db "TEXT FRAME@"

.ExitText: db "EXIT@"
.PageText: db "PAGE  @"










PlaceOptionArrows:
	jumptable .PageTable, wOptionsPage

.PageTable:
	dw .Page1
	dw .Page2

.Page2:
; place text frame arrow
	hlcoord 2, 2
	ld [hl], "▷"

; place gbprinterbrightness
	ld a, [wGBPrinterBrightness]
	cp a, $7f
	jr c, .shift_brightness
	jr .place_arrow
.shift_brightness
rept 5
	rrca
endr
	ld l, a
	ld h, 0
	ld de, .PrinterPositions
	add hl, de
	ld e, [hl]
	ld d, 0
.place_arrow
	hlcoord 1, 7
	add hl, de
	ld [hl], "▷"

; place menu account
	ld a, [wOptions2]
	bit MENU_ACCOUNT, a
	jr z, .no_account
	hlcoord 1, 11
	jr .account_ok
.no_account
	hlcoord 10, 11
.account_ok
	ld [hl], "▷"

	ld a, [hCGB]
	and a
	jr z, .end_

; place cgb color mode
	ld a, [wOptions2]
	bit COLOR_MODE, a
	jr z, .sgb_color
	hlcoord 14, 13
	jr .color_ok
.sgb_color
	hlcoord 8, 13
.color_ok
	ld [hl], "▷"

.end_
	jp .ExitAndPage

.PrinterPositions:
	db 16 ; 00
	db 12 ; 20
	db 8  ; 40
	db 4  ; 60

.Page1:
	ld hl, wOptions
; fetch text speed
	ld a, [hl]
	and a, TEXT_DELAY_MASK
	push hl
	  ld l, a
	  ld h, 0
	  ld de, .TextSpeedPositions
	  add hl, de
	  ld e, [hl]
	  ld d, 0
	  hlcoord 1, 3	; starting position
	  add hl, de
	  ld [hl], "▷"
	pop hl

; fetch battle scene
	ld a, [hl]
	push hl
	  bit BATTLE_SCENE, a
	  jr z, .no_battle_scene
	  hlcoord 10, 7
	  jr .battle_scene_ok
.no_battle_scene
	  hlcoord 1, 7
.battle_scene_ok
	  ld [hl], "▷"
	pop hl

; fetch battle style
	ld a, [hl]
	push hl
	  bit BATTLE_SHIFT, a
	  jr z, .no_battle_shift
	  hlcoord 10, 11
	  jr .battle_shift_ok
.no_battle_shift
	  hlcoord 1, 11
.battle_shift_ok
	  ld [hl], "▷"
	pop hl

; fetch sound settings
	ld a, [hl]
	push hl
	  bit STEREO, a
	  jr z, .no_stereo
	  hlcoord 9, 13
	  jr .stereo_ok
.no_stereo
	  hlcoord 1, 13
.stereo_ok
	  ld [hl], "▷"
	pop hl
	jp .ExitAndPage

.TextSpeedPositions:
	db 0	; 0 -
	db 0	; 1 fast
	db 0	; 2 -
	db 6	; 3 mid
	db 0	; 4 -
	db 13	; 5 slow

.ExitAndPage:
; draw exit and page arrows
	hlcoord 1, 16
	ld [hl], "▷"
	hlcoord 12, 16
	ld [hl], "▷"
	ret











GetOptionPointer:
	ld a, [wOptionsPage]
	and a
	ld a, [wJumptableIndex]
	jr z, .page1
	add 6
.page1
	ld e, a
	ld d, 0
	ld hl, .Pointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Pointers:
; page 1
	dw Options_TextSpeed
	dw Options_BattleScene
	dw Options_BattleStyle
	dw Options_Sound
	dw Options_Cancel
	dw Options_SwitchPage
; page 2
	dw Options_Frame
	dw Options_Print
	dw Options_MenuAccount
	dw Options_Colors
	dw Options_Cancel
	dw Options_SwitchPage


Options_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_TEXT_SPEED_SLOW
	jr c, .Increase
	ld c, OPT_TEXT_SPEED_FAST - 1
.Increase:
	inc c
	ld a, e
	jr .Save
.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_TEXT_SPEED_SLOW + 1
.Decrease:
	dec c
	ld a, d
.Save:
	ld b, a
	ld a, [wOptions]
	and $f0
	or b
	ld [wOptions], a
.NonePressed:
; clear arrows
	hlcoord 1, 3
	ld [hl], " "
	hlcoord 7, 3
	ld [hl], " "
	hlcoord 14, 3
	ld [hl], " "
; determine arrow position
	ld e, c
	ld d, 0
	ld hl, .PositionOffsets
	add hl, de
	ld e, [hl]
	ld d, 0
	hlcoord 1, 3
	add hl, de
	ld [hl], "▶"
	and a
	ret
.PositionOffsets:
	db 0
	db 6
	db 13

GetTextSpeed:
; converts TEXT_DELAY_* value in a to OPT_TEXT_SPEED_* value in c,
; with previous/next TEXT_DELAY_* values in d/e
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	cp TEXT_DELAY_SLOW
	jr z, .slow
	cp TEXT_DELAY_FAST
	jr z, .fast
	; none of the above
	ld c, OPT_TEXT_SPEED_MED
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_SLOW
	ret
.slow
	ld c, OPT_TEXT_SPEED_SLOW
	lb de, TEXT_DELAY_MED, TEXT_DELAY_FAST
	ret
.fast
	ld c, OPT_TEXT_SPEED_FAST
	lb de, TEXT_DELAY_SLOW, TEXT_DELAY_MED
	ret






Options_BattleScene:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SCENE, [hl]
	jr nz, .ToggleOn
	jr .ToggleOff
.LeftPressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOff
	jr .ToggleOn
.NonePressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOn
	jr .ToggleOff
.ToggleOn:
	res BATTLE_SCENE, [hl]
	hlcoord 1, 7
	ld [hl], "▶"
	hlcoord 10, 7
	ld [hl], " "
	jr .Display
.ToggleOff:
	set BATTLE_SCENE, [hl]
	hlcoord 10, 7
	ld [hl], "▶"
	hlcoord 1, 7
	ld [hl], " "
.Display:
	and a
	ret





Options_BattleStyle:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleOn
	jr .ToggleOff
.LeftPressed:
	bit BATTLE_SHIFT, [hl]
	jr z, .ToggleOff
	jr .ToggleOn
.NonePressed:
	bit BATTLE_SHIFT, [hl]
	jr z, .ToggleOn
	jr .ToggleOff
.ToggleOn:
	res BATTLE_SHIFT, [hl]
	hlcoord 1, 11
	ld [hl], "▶"
	hlcoord 10, 11
	ld [hl], " "
	jr .Display
.ToggleOff:
	set BATTLE_SHIFT, [hl]
	hlcoord 10, 11
	ld [hl], "▶"
	hlcoord 1, 11
	ld [hl], " "
.Display:
	and a
	ret


Options_Sound:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit STEREO, [hl]
	jr nz, .SetMono
	jr .SetStereo
.LeftPressed:
	bit STEREO, [hl]
	jr z, .SetStereo
	jr .SetMono
.NonePressed:
	bit STEREO, [hl]
	jr nz, .ToggleStereo
	jr .ToggleMono
.SetMono:
	res STEREO, [hl]
	call RestartMapMusic
.ToggleMono:
	hlcoord 1, 13
	ld [hl], "▶"
	hlcoord 9, 13
	ld [hl], " "
	jr .Display
.SetStereo:
	set STEREO, [hl]
	call RestartMapMusic
.ToggleStereo:
	hlcoord 9, 13
	ld [hl], "▶"
	hlcoord 1, 13
	ld [hl], " "
.Display:
	and a
	ret


Options_Print:
	call GetPrinterSetting
	ldh a, [hJoyPressed]
	bit D_RIGHT_F, a
	jr nz, .RightPressed
	bit D_LEFT_F, a
	jr z, .NonePressed
	ld a, c
	cp OPT_PRINT_DARKEST
	jr c, .Increase
	ld c, OPT_PRINT_LIGHTEST - 1
.Increase:
	inc c
	ld a, e
	jr .Save
.RightPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_PRINT_DARKEST + 1
.Decrease:
	dec c
	ld a, d
.Save:
	ld b, a
	ld [wGBPrinterBrightness], a
.NonePressed:
; clear arrows
	hlcoord 1, 7
	ld [hl], " "
	hlcoord 5, 7
	ld [hl], " "
	hlcoord 9, 7
	ld [hl], " "
	hlcoord 13, 7
	ld [hl], " "
	hlcoord 17, 7
	ld [hl], " "

; determine arrow position
	ld e, c
	ld d, 0
	ld hl, .PositionOffsets
	add hl, de
	ld e, [hl]
	ld d, 0
	hlcoord 1, 7
	add hl, de
	ld [hl], "▶"
	and a
	ret
.PositionOffsets:
	db 16
	db 12
	db 8
	db 4
	db 0

GetPrinterSetting:
; converts GBPRINTER_* value in a to OPT_PRINT_* value in c,
; with previous/next GBPRINTER_* values in d/e
	ld a, [wGBPrinterBrightness]
	and a
	jr z, .IsLightest
	cp GBPRINTER_LIGHTER
	jr z, .IsLight
	cp GBPRINTER_DARKER
	jr z, .IsDark
	cp GBPRINTER_DARKEST
	jr z, .IsDarkest
	; none of the above
	ld c, OPT_PRINT_NORMAL
	lb de, GBPRINTER_LIGHTER, GBPRINTER_DARKER
	ret
.IsLightest:
	ld c, OPT_PRINT_LIGHTEST
	lb de, GBPRINTER_DARKEST, GBPRINTER_LIGHTER
	ret
.IsLight:
	ld c, OPT_PRINT_LIGHTER
	lb de, GBPRINTER_LIGHTEST, GBPRINTER_NORMAL
	ret
.IsDark:
	ld c, OPT_PRINT_DARKER
	lb de, GBPRINTER_NORMAL, GBPRINTER_DARKEST
	ret
.IsDarkest:
	ld c, OPT_PRINT_DARKEST
	lb de, GBPRINTER_DARKER, GBPRINTER_LIGHTEST
	ret

Options_MenuAccount:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit MENU_ACCOUNT, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit MENU_ACCOUNT, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit MENU_ACCOUNT, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res MENU_ACCOUNT, [hl]
	hlcoord 10, 11
	ld [hl], "▶"
	hlcoord 1, 11
	ld [hl], " "
	jr .Display

.ToggleOn:
	set MENU_ACCOUNT, [hl]
	hlcoord 1, 11
	ld [hl], "▶"
	hlcoord 10, 11
	ld [hl], " "

.Display:
	and a
	ret

Options_Frame:
	hlcoord 2, 2
	ld [hl], "▶"
	ld hl, wTextboxFrame
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr nz, .RightPressed
	and a
	ret
.RightPressed:
	ld a, [hl]
	inc a
	jr .Save
.LeftPressed:
	ld a, [hl]
	dec a
.Save:
	maskbits NUM_FRAMES
	ld [hl], a
UpdateFrame:
	ld a, [wTextboxFrame]
	hlcoord 17, 2 ; where on the screen the number is drawn
	add "1"
	ld [hl], a
	call LoadFontsExtra
	and a
	ret

Options_Colors:
	ld a, [hCGB]
	and a
	ret z

	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit COLOR_MODE, [hl]
	jr nz, .ToggleSGB
	jr .ToggleGBC
.LeftPressed:
	bit COLOR_MODE, [hl]
	jr z, .ToggleGBC
	jr .ToggleSGB
.NonePressed:
	bit COLOR_MODE, [hl]
	jr nz, .ToggleGBC
.ToggleSGB:
	res COLOR_MODE, [hl]
	hlcoord 8, 13
	ld [hl], "▶"
	hlcoord 14, 13
	ld [hl], " "
	jr .Display
.ToggleGBC:
	set COLOR_MODE, [hl]
	hlcoord 14, 13
	ld [hl], "▶"
	hlcoord 8, 13
	ld [hl], " "
.Display:
	and a
	ret

Options_Cancel:
	hlcoord 1, 16
	ld [hl], "▶"
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Exit
	and a
	ret
.Exit:
	scf
	ret

Options_SwitchPage:
	hlcoord 12, 16
	ld [hl], "▶"
	ld hl, wOptionsPage
	ldh a, [hJoyPressed]
	and A_BUTTON | D_LEFT | D_RIGHT
	jr z, .NonePressed
	bit 0, [hl]
	jr z, .Page2
;.Page1:
	res 0, [hl]
	jr .Display
.Page2:
	set 0, [hl]
.Display:
	call PlaceOptionsString
	call PlaceOptionArrows
	ld a, OPT_NEXT_PAGE ; OPT_PREV_PAGE
	ld [wJumptableIndex], a
.NonePressed:
; place arrow on the page
	and a
	ret









OptionsCleanupArrowOnSwitch:
	jp PlaceOptionArrows










OptionsControl:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp D_DOWN
	jr z, .Down
	cp D_UP
	jr z, .Up
	and a
	ret
.Down:
	ld a, [hCGB]
	and a
	ld a, [hl]
	jr nz, .down_ok	; skip if not on CGB

	ld a, [wOptionsPage]
	and a
	ld a, [hl] ; load the cursor position to a
	jr z, .down_ok
	cp OPT_PAGE2_SKIP - 1
	jr nz, .down_ok
; on page 2
	ld [hl], OPT_CANCEL_2 ; skip missing options
	jr .down_end
.down_ok
	cp OPT_NEXT_PAGE ; maximum number of items in option menu
	jr nz, .increase
	ld [hl], -1	; set to 0
.increase
	inc [hl]
.down_end
	call OptionsCleanupArrowOnSwitch
	scf
	ret
.Up:
	ld a, [hCGB]
	and a
	ld a, [hl]
	jr nz, .up_ok	; skip if not on CGB

	ld a, [wOptionsPage]
	and a
	ld a, [hl]
	jr z, .up_ok
	cp OPT_PAGE2_SKIP + 1
	jr nz, .up_ok
; on page 2
	ld [hl], OPT_MENU_ACCOUNT ; skip missing options
	jr .up_end
.up_ok
	and a
	jr nz, .decrease
	ld [hl], OPT_NEXT_PAGE + 1 ; number of option items + 1
.decrease
	dec [hl]
.up_end
	call OptionsCleanupArrowOnSwitch
	scf
	ret
