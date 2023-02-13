NewPokedexEntry: ; erosunica: modded to mimic sw97 pokédex
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	call LowVolume
	call ClearBGPalettes
	call ClearTilemap
	call UpdateSprites
	call ClearSprites
	ld a, [wPokedexStatus]
	push af
	xor a
	ld [wPokedexStatus], a
	farcall _NewPokedexEntry
	call WaitPressAorB_BlinkCursor
;;; erosunica: added to handle entries for uncaught Pokémon and mimic SW97 behaviour
	ld a, [wNamedObjectIndexBuffer]
	dec a
	call CheckCaughtMon
	jr z, .notcaught
;;;
	ld a, 1 ; page 2
	ld [wPokedexStatus], a
	farcall DisplayNewDexEntry ; erosunica: modded, it was DisplayDexEntry
	call WaitPressAorB_BlinkCursor
	pop af
	ld [wPokedexStatus], a
	call MaxVolume
	call RotateThreePalettesRight
	call .ReturnFromDexRegistration
;;; erosunica: added to handle entries for uncaught Pokémon and mimic SW97 behaviour
	jr .skip
.notcaught
	pop af
	ld [wPokedexStatus], a
	call MaxVolume
	call ClearBGPalettes
	call ClearPalettes
.skip
;;;
	pop af
	ldh [hMapAnims], a
	ret

.ReturnFromDexRegistration:
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	;farcall Pokedex_PlaceFrontpicTopLeftCorner ; erosunica: commented to mimic SW97 behaviour
	;call WaitBGMap2
	farcall GetEnemyMonDVs
	ld a, [hli]
	ld [wTempMonDVs], a
	ld a, [hl]
	ld [wTempMonDVs + 1], a
	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	jp SetPalettes
