TITLE_LOGO_TILE EQU $80
TITLE_COPYRIGHT_TILE EQU $0C
TITLE_BORDER_TILE EQU $1C
TITLE_HOOH_TILE EQU $24

TitleScreen:
; Initialize variables
	xor a
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wTitleScreenSelectedOption
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

; Prepare screen
	farcall ClearSpriteAnims
	call TitleScreenLoadGFX

	call ChannelsOff
	call SFXChannelsOff

;; Play starting sound effect
	;ld de, SFX_TITLE_SCREEN_ENTRANCE
	;jp PlaySFX

; Play the title screen music.
	ld de, MUSIC_TITLE
	call PlayMusic

; Start actually drawing screen
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	call SetPalettes
	call TitleScreenFireballs

.loop
	farcall PlaySpriteAnimationsAndDelayFrame
	ld a, [wJumptableIndex]
	bit 7, a
	ret nz
	call TitleScreenScene
	jr .loop

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
	dw TitleScreenTimer
	dw TitleScreenMain
	dw TitleScreenEnd

TitleScreenTimer:
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld hl, wTitleScreenTimer
	ld de, 73 * 60 + 36
	ld [hl], e
	inc hl
	ld [hl], d
	ret

TitleScreenMain:
; Run the timer down.
	ld hl, wTitleScreenTimer
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .end

	dec de
	ld [hl], d
	dec hl
	ld [hl], e

; Save data can be deleted by pressing Up + B + Select.
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and D_UP + B_BUTTON + SELECT
	cp  D_UP + B_BUTTON + SELECT
	jr z, .delete_save_data

; To bring up the clock reset dialog:

; Hold Down + B + Select to initiate the sequence.
	ldh a, [hClockResetTrigger]
	cp $34
	jr z, .clock_reset

	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr nz, .check_start

	ld a, $34
	ldh [hClockResetTrigger], a
	jr .check_start

; Keep Select pressed, and hold Left + Up.
; Then let go of Select.
.check_clock_reset
	bit SELECT_F, [hl]
	jr nz, .check_start

	xor a
	ldh [hClockResetTrigger], a

	ld a, [hl]
	and D_LEFT + D_UP
	cp  D_LEFT + D_UP
	jr z, .clock_reset

; Press Start or A to start the game.
.check_start
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
	ld [wTitleScreenSelectedOption], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.end
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Fade out the title screen music
	xor a
	ld [wMusicFadeID], a
	ld [wMusicFadeID + 1], a
	ld hl, wMusicFade
	ld [hl], 8 ; 1 second

	ld hl, wTitleScreenTimer
	inc [hl]
	ret

.clock_reset
	ld a, 4
	ld [wTitleScreenSelectedOption], a

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
	ld [wTitleScreenSelectedOption], a

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TitleScreenFireballs:
	ld hl, .Fireballs
	ld d, 6
.loop
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	push bc
	ld a, SPRITE_ANIM_INDEX_TITLE_FLAME
	call _InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	pop de
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a

	pop hl
	pop de
	dec d
	jr nz, .loop
	ret

.Fireballs:
	; x pos, y pos, sine offset, speed
	db $E0, $4C, $10, 2
	db $A0, $58, $20, 3
	db $90, $64, $30, 4
	db $D0, $70, $00, 1
	db $B0, $7C, $10, 2
	db $00, $88, $20, 3

TitleScreenLoadGFX:
	call DisableLCD
	call ClearPalettes
	call ClearSprites
	call ClearTileMap

; Disable background updates
	xor a
	ldh [hBGMapMode], a

; Decompress graphics
	ld de, vTiles1
	ld hl, TitleLogoGFX
	call Decompress
	ld hl, TitleBorderGFX
	call Decompress
	ld hl, TitleHoohGFX
	call Decompress
	ld de, vTiles0
	ld hl, TitleFlamesGFX
	call Decompress

; Clear the background map
	hlbgcoord 0, 0
	ld bc, vBGMap1 - vBGMap0
	ld a, $80 ; Will be loaded white
	call ByteFill

; Draw Pokemon logo
	hlcoord 0, 0
	lb bc, 6, 40
	lb de, TITLE_LOGO_TILE, 20
	call DrawTitleGraphic

; Draw border
	hlcoord 0, 8
	ld a, TITLE_BORDER_TILE
	call DrawTitleBorder
	hlcoord 0, 16
	ld a, TITLE_BORDER_TILE + 4
	call DrawTitleBorder

; Draw Ho-oh
	hlcoord 7, 9
	lb bc, 7, 7
	lb de, TITLE_HOOH_TILE, 7
	call DrawTitleGraphic

; Draw copyright text
	hlcoord 3, 17
	lb bc, 1, 13
	lb de, TITLE_COPYRIGHT_TILE, 0
	call DrawTitleGraphic

; Fill tile palettes:
	ld a, 1
	ldh [rVBK], a

; Logo
	hlbgcoord 0, 0
	ld bc, 7 * BG_MAP_WIDTH
	ld a, 0
	call ByteFill

; 'GOLD VERSION'
	hlbgcoord 5, 7
	ld bc, 9 ; length of version text
	ld a, 1
	call ByteFill

; Border, Ho-oh and copyright text
	hlbgcoord 0, 8
	ld bc, 10 * BG_MAP_WIDTH
	ld a, 2
	call ByteFill

	ld a, 0
	ldh [rVBK], a

; Load palettes
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 3 palettes
	call CopyBytes

	ld hl, TitleScreenFlamesPalette
	ld de, wOBPals1
	ld bc, 1 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a

; Commit everything
	call EnableLCD
	jp WaitBGMap

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

DrawTitleBorder:
	ld c, 5
.loop
	push af
	ld b, 4
.loop_inner
	ld [hli], a
	inc a
	dec b
	jr nz, .loop_inner
	pop af
	dec c
	jr nz, .loop
	ret

TitleHoohGFX:
INCBIN "gfx/title/hooh.2bpp.lz"

TitleLogoGFX:
INCBIN "gfx/title/logo.2bpp.lz"

TitleBorderGFX:
INCBIN "gfx/title/border.2bpp.lz"

TitleFlamesGFX:
INCBIN "gfx/title/flames.2bpp.lz"

TitleScreenFlamesPalette:
INCBIN "gfx/title/flames.gbcpal"

TitleScreenPalettes:
INCLUDE "gfx/title/title.pal"
