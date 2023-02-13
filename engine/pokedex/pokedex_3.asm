LoadQuestionMarkPic:
	ld hl, .QuestionMarkLZ
	ld de, sScratch
	jp Decompress

.QuestionMarkLZ:
INCBIN "gfx/pokedex/question_mark.2bpp.lz"

DrawPokedexListWindow: ; erosunica: modded to mimic sw97 pokédex
	hlcoord 1, 1
	lb bc, 16, 11
	call ClearBox
	ld a, $34
	hlcoord 1, 0
	ld bc, 11
	call ByteFill
	ld a, $39
	hlcoord 1, 17
	ld bc, 11
	call ByteFill
	hlcoord 6, 0
	ld [hl], $3f
	hlcoord 6, 17
	ld [hl], $40
	hlcoord 0, 0
	ld [hl], $33
	ld a, $36
	hlcoord 0, 1
	ld b, SCREEN_HEIGHT - 2
	call Pokedex_FillColumn2
	ld [hl], $38
	ret

; erosunica: DrawPokedexSearchResultsWindow and DrawDexEntryScreenRightEdge are no longer needed

Pokedex_FillColumn2:
; A local duplicate of Pokedex_FillColumn.
	push de
	ld de, SCREEN_WIDTH
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop de
	ret
