ConstantDamage:
    ld hl, wBattleMonLevel
    ldh a, [hBattleTurn]
    and a
    jr z, .got_turn
    ld hl, wEnemyMonLevel
 
.got_turn
    ld a, BATTLE_VARS_MOVE_EFFECT
    call GetBattleVar
    cp EFFECT_LEVEL_DAMAGE
    ld b, [hl]
    ld a, 0
    jr z, .got_power
 
    ld a, BATTLE_VARS_MOVE_EFFECT
    call GetBattleVar
    cp EFFECT_PSYWAVE
    jr z, .psywave
 
    cp EFFECT_SUPER_FANG
    jr z, .super_fang
 
    cp EFFECT_REVERSAL
    jr z, .reversal
 
    ld a, BATTLE_VARS_MOVE_POWER
    call GetBattleVar
    ld b, a
    ld a, $0
    jr .got_power
 
.psywave
    ld a, b
    srl a
    add b
    ld b, a
.psywave_loop
    call BattleRandom
    and a
    jr z, .psywave_loop
    cp b
    jr nc, .psywave_loop
    ld b, a
    ld a, 0
    jr .got_power
 
.super_fang
    ld hl, wEnemyMonHP
    ldh a, [hBattleTurn]
    and a
    jr z, .got_hp
    ld hl, wBattleMonHP
.got_hp
    ld a, [hli]
    srl a
    ld b, a
    ld a, [hl]
    rr a
    push af
    ld a, b
    pop bc
    and a
    jr nz, .got_power
    or b
    ld a, 0
    jr nz, .got_power
    ld b, 1
    jr .got_power
 
.got_power
    ld hl, wCurDamage
    ld [hli], a
    ld [hl], b
    ret
 
.reversal
    ld hl, wBattleMonHP
    ldh a, [hBattleTurn]
    and a
    jr z, .reversal_got_hp
    ld hl, wEnemyMonHP
.reversal_got_hp
    xor a
    ldh [hDividend], a
    ldh [hMultiplicand + 0], a
    ld a, [hli]
    ldh [hMultiplicand + 1], a
    ld a, [hli]
    ldh [hMultiplicand + 2], a
    ld a, 48
    ldh [hMultiplier], a
    call Multiply
    ld a, [hli]
    ld b, a
    ld a, [hl]
    ldh [hDivisor], a
    ld a, b
    and a
    jr z, .skip_to_divide
 
    ldh a, [hProduct + 4]
    srl b
    rr a
    srl b
    rr a
    ldh [hDivisor], a
    ldh a, [hProduct + 2]
    ld b, a
    srl b
    ldh a, [hProduct + 3]
    rr a
    srl b
    rr a
    ldh [hDividend + 3], a
    ld a, b
    ldh [hDividend + 2], a
 
.skip_to_divide
    ld b, 4
    call Divide
    ldh a, [hQuotient + 3]
    ld b, a
    ld hl, FlailReversalPower
 
.reversal_loop
    ld a, [hli]
    cp b
    jr nc, .break_loop
    inc hl
    jr .reversal_loop
 
.break_loop
    ldh a, [hBattleTurn]
    and a
    ld a, [hl]
    jr nz, .notPlayersTurn
 
    ld hl, wPlayerMoveStructPower
    ld [hl], a
    push hl
    farcall PlayerAttackDamage
    jr .notEnemysTurn
 
.notPlayersTurn
    ld hl, wEnemyMoveStructPower
    ld [hl], a
    push hl
    farcall EnemyAttackDamage
 
.notEnemysTurn
    farcall BattleCommand_DamageCalc
    pop hl
    ld [hl], 1
    ret