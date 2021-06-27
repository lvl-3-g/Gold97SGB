PlayBattleMusic:
	push hl
	push de
	push bc

	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume
	
	ld a, [wBattleType]
	cp BATTLETYPE_LEGENDSWISLANDS
	ld de, MUSIC_SWISLANDS_WILD_BATTLE
	jp z, .done

	; Are we fighting a trainer?
	ld a, [wOtherTrainerClass]
	and a
	jr nz, .trainermusic

	farcall RegionCheck
	ld a, e
	and a
	jr nz, .swislandswild

	ld de, MUSIC_NIHON_WILD_BATTLE
	ld a, [wTimeOfDay]
	cp NITE_F
	jr nz, .done
	ld de, MUSIC_NIHON_WILD_BATTLE_NIGHT
	jr .done

.swislandswild
	ld de, MUSIC_SWISLANDS_WILD_BATTLE
	jr .done

.trainermusic
	ld de, MUSIC_CHAMPION_BATTLE
	cp CHAMPION
	jr z, .done
	cp RED
	jr z, .done

	; They should have included EXECUTIVEM, EXECUTIVEF, and SCIENTIST too...
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done
	cp EXECUTIVEM
	jr z, .done
	cp EXECUTIVEF
	jr z, .done
	cp SCIENTIST
	jr z, .done
	cp SABRINA; this is imposter oak
	jr z, .done
	cp BROCK; this is giovanni
	jr z, .done

	ld de, MUSIC_SWISLANDS_GYM_LEADER_BATTLE
	farcall IsSWIslandsGymLeader
	jr c, .done

	; IsGymLeader also counts CHAMPION, RED, and the SWIslands gym leaders
	; but they have been taken care of before this
	ld de, MUSIC_NIHON_GYM_LEADER_BATTLE
	farcall IsGymLeader
	jr c, .done

	ld de, MUSIC_RIVAL_BATTLE
	ld a, [wOtherTrainerClass]
	cp RIVAL1
	jr z, .done
	cp RIVAL2
	jr nz, .othertrainer

	ld a, [wOtherTrainerID]
	cp RIVAL2_2_CHIKORITA ; Rival in MountFuji Plateau
	jr c, .done
	ld de, MUSIC_CHAMPION_BATTLE
	jr .done

.othertrainer
	ld a, [wLinkMode]
	and a
	jr nz, .nihontrainer

	farcall RegionCheck
	ld a, e
	and a
	jr nz, .swislandstrainer

.nihontrainer
	ld de, MUSIC_NIHON_TRAINER_BATTLE
	jr .done

.swislandstrainer
	ld de, MUSIC_SWISLANDS_TRAINER_BATTLE

.done
	call PlayMusic

	pop bc
	pop de
	pop hl
	ret

ClearBattleRAM:
	xor a
	ld [wBattlePlayerAction], a
	ld [wBattleResult], a

	ld hl, wPartyMenuCursor
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [wMenuScrollPosition], a
	ld [wCriticalHit], a
	ld [wBattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [wCurBattleMon], a
	ld [wForcedSwitch], a
	ld [wTimeOfDayPal], a
	ld [wPlayerTurnsTaken], a
	ld [wEnemyTurnsTaken], a
	ld [wEvolvableFlags], a

	ld hl, wPlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, wBattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, wEnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	callfar ResetEnemyStatLevels

	call ClearWindowData

	ld hl, hBGMapAddress
	xor a ; LOW(vBGMap0)
	ld [hli], a
	ld [hl], HIGH(vBGMap0)
	ret
