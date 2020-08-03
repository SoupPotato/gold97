TITLE_LOGO_TILE EQU $80
TITLE_COPYRIGHT_TILE EQU $0C
TITLE_BORDER_TILE EQU $1C
TITLE_HOOH_TILE EQU $24

TitleScreen:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

	call TitleScreenLoadGFX

	call ChannelsOff
	call SFXChannelsOff

;; Play starting sound effect
	;ld de, SFX_TITLE_SCREEN_ENTRANCE
	;jp PlaySFX

; Play the title screen music.
	ld de, MUSIC_TITLE
	call PlayMusic
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call TitleScreenScene
	call DelayFrame
	jr .loop

.done
	pop af
	ldh [rSVBK], a
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
	;dw TitleScreenEntrance
	dw TitleScreenTimer
	dw TitleScreenMain
	dw TitleScreenEnd

TitleScreenEntrance:
; Animate the logo:
; Move each line by 4 pixels until our count hits 0.
	ldh a, [hSCX]
	and a
	jr z, .done
	sub 4
	ldh [hSCX], a

; Lay out a base (all lines scrolling together).
	ld e, a
	ld hl, wLYOverrides
	ld bc, 8 * 10 ; logo height
	call ByteFill

; Reversed signage for every other line's position.
; This is responsible for the interlaced effect.
	ld a, e
	xor $ff
	inc a

	ld b, 8 * 10 / 2 ; logo height / 2
	ld hl, wLYOverrides + 1
.loop
	ld [hli], a
	inc hl
	dec b
	jr nz, .loop
	ret

.done
; Next scene
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ldh [hLCDCPointer], a

; Play the title screen music.
	ld de, MUSIC_TITLE
	call PlayMusic

	ld a, $88
	ldh [hWY], a
	ret

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

TitleScreenLoadGFX:
	call DisableLCD
	call ClearPalettes
	call ClearSprites
	call ClearTileMap

; Reset timing variables
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh [hBGMapMode], a
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

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
	call WaitBGMap
	jp SetPalettes

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
