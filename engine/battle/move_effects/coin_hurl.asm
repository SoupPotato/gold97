BattleCommand_CoinHurl:
; coinhurl
	push bc
	push de

	; Load current money and comparison value
	ld hl, wMoney
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld hl, .Coins1k
	ld de, wStringBuffer2
	ld bc, 3
	call CopyBytes

	; Subtract 1k a maximum of 12 times, c holds the amount of times
	ld c, 0
.loop
	call .Sub1k
	jr c, .done
	inc c
	ld a, c
	cp 12
	jr c, .loop
.done

	; Add c * 5 to the move power
	ld a, c ; *1
	add a ; *2
	add a ; *4
	add c ; *5
	pop de ; move power in d
	add d
	ld d, a

	pop bc
	ret

.Sub1k:
	; Subtract 1k coins from the current value
	; Returns carry if the value goes below 0
	push bc
	ld bc, wStringBuffer2
	ld de, hMoneyTemp
	farcall SubtractMoney
	pop bc
	ret

.Coins1k:
	dt 1000
