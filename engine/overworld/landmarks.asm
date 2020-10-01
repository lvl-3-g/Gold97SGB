GetLandmarkCoords:
; Return coordinates (d, e) of landmark e.
	push hl
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Landmarks
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret

GetLandmarkName::
; Copy the name of landmark e to wStringBuffer1.
	push hl
	push de
	push bc

	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Landmarks + 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, wStringBuffer1
	ld c, 18
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/maps/landmarks.asm"

RegionCheck:
; Checks if the player is in SWIslands or Nihon.
; If in Nihon, returns 0 in e.
; If in SWIslands, returns 1 in e.
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp LANDMARK_FAST_SHIP ; S.S. Aqua
	jr z, .nihon
	cp LANDMARK_SPECIAL
	jr nz, .checkagain

; In a special map, get the backup map group / map id
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.checkagain
	cp SWISLANDS_LANDMARK
	jr c, .nihon

; Victory Road area is considered to be Nihon.
	cp LANDMARK_CROWN_PATH
	jr c, .swislands

.nihon
	ld e, NIHON_REGION
	ret
.swislands
	ld e, SWISLANDS_REGION
	ret
