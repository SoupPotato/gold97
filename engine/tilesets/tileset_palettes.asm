LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	ld a, [wMapGroup]
	cp GROUP_ROUTE_35
	jr nz, .not_route_35
	ld a, [wMapNumber]
	cp MAP_ROUTE_35
	jr z, .SandOverBrownBGPalette
.not_route_35
	ld a, [wMapGroup]
	cp GROUP_AZALEA_TOWN
	jr nz, .not_azalea_town
	ld a, [wMapNumber]
	cp MAP_AZALEA_TOWN
	jr z, .SandOverBrownBGPalette
.not_azalea_town
	ld a, [wMapGroup]
	cp GROUP_ROUTE_33
	jr nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_ROUTE_33
	jr z, .SandOverBrownBGPalette


.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.do_nothing
	and a
	ret
	
.SandOverBrownBGPalette:
	ld hl, SandOverRock
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret
	
INCLUDE "gfx/tilesets/bg_tiles_special_pals.pal"

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"


LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadSpecialOWMapPalettes:
	ld a, [wMapNumber]
	cp MAP_ROUTE_33
	jr z, .GetMapNumber
	
.GetMapNumber
	ld a, [wMapGroup]
	cp GROUP_ROUTE_33
	jr z, .SandOverBrownBGPalette
	
.do_nothing
    and a
    ret
	
.SandOverBrownBGPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, SandOverRock
	ld bc, 8 palettes
	call FarCopyWRAM
    scf
    ret
	
LoadSpecialMapOBPalette:
	ld a, [wMapGroup]
	cp GROUP_ROUTE_35
	jr nz, .not_route35
	ld a, [wMapNumber]
	cp MAP_ROUTE_35
	jp z, .SandOverTreeOBPalette
	
.not_route35
	ld a, [wMapGroup]
	cp GROUP_AZALEA_TOWN
	jr nz, .not_azalea
	ld a, [wMapNumber]
	cp MAP_AZALEA_TOWN
	jp z, .SandOverTreeOBPalette
	
.not_azalea
	ld a, [wMapGroup]
	cp GROUP_ROUTE_33
	jr nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_ROUTE_33
	jp z, .SandOverTreeOBPalette
	

.do_nothing
    and a
    ret

.SandOverTreeOBPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
    ld hl, SandOverTree
	jr .finish

	
.finish
	call AddNTimes
    ld de, wOBPals1
    ld bc, 8 palettes
	ld a, BANK(wOBPals1)
    call FarCopyWRAM
    scf
    ret

; Special Overworld Pals
INCLUDE "gfx/overworld/npc_sprites_special.pal"
