TITLE_LOGO_TILE EQU $80
TITLE_COPYRIGHT_TILE EQU $0C
TITLE_BORDER_TILE EQU $1C
TITLE_HOOH_TILE EQU $24

TitleScreen:
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
