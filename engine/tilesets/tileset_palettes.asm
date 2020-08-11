LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jp z, .pokecom_2f
	cp TILESET_ICE_PATH
	jp z, .ice_path
	cp TILESET_HOUSE
	jp z, .house
	cp TILESET_TRADITIONAL_HOUSE
	jp z, .traditional_house
	cp TILESET_RADIO_TOWER
	jp z, .radio_tower
	cp TILESET_MANSION
	jp z, .mansion_mobile
	ld a, [wMapGroup]
	cp GROUP_ROUTE_103
	jp nz, .not_route_103
	ld a, [wMapNumber]
	cp MAP_ROUTE_103
	jp z, .SandOverBrownBGPalette
.not_route_103
	ld a, [wMapGroup]
	cp GROUP_BIRDON_TOWN
	jp nz, .not_birdon_town
	ld a, [wMapNumber]
	cp MAP_BIRDON_TOWN
	jp z, .SandOverBrownBGPalette
.not_birdon_town
	ld a, [wMapGroup]
	cp GROUP_ROUTE_104
	jp nz, .not_route_104
	ld a, [wMapNumber]
	cp MAP_ROUTE_104
	jp z, .SandOverBrownBGPalette
.not_route_104
	ld a, [wMapGroup]
	cp GROUP_ROUTE_105
	jp nz, .not_route_105
	ld a, [wMapNumber]
	cp MAP_ROUTE_105
	jp z, .SandOverBrownBGPalette	
.not_route_105
	ld a, [wMapGroup]
	cp GROUP_ROUTE_110
	jp nz, .not_route_110
	ld a, [wMapNumber]
	cp MAP_ROUTE_110
	jp z, .SnowOverGreyBGPalette
.not_route_110
	ld a, [wMapGroup]
	cp GROUP_BLUE_FOREST
	jp nz, .not_blueforest
	ld a, [wMapNumber]
	cp MAP_BLUE_FOREST
	jp z, .SnowOverGreyBGPalette
.not_blueforest
	ld a, [wMapGroup]
	cp GROUP_BLUE_FOREST_GYM
	jp nz, .not_blueforest_gym
	ld a, [wMapNumber]
	cp MAP_BLUE_FOREST_GYM
	jp z, .ice_path
.not_blueforest_gym
	ld a, [wMapGroup]
	cp GROUP_FROSTPOINT_TOWN
	jp nz, .not_frostpoint_town
	ld a, [wMapNumber]
	cp MAP_FROSTPOINT_TOWN
	jp z, .SnowOverGreyBGPalette
.not_frostpoint_town
	ld a, [wMapGroup]
	cp GROUP_ROUTE_111
	jp nz, .not_route_111
	ld a, [wMapNumber]
	cp MAP_ROUTE_111
	jp z, .SnowOverGreyBGPalette
.not_route_111
	ld a, [wMapGroup]
	cp GROUP_ROUTE_112
	jp nz, .not_route_112
	ld a, [wMapNumber]
	cp MAP_ROUTE_112
	jp z, .SnowOverGreyBGPalette
.not_route_112
	ld a, [wMapGroup]
	cp GROUP_JOULE_CAVE
	jp nz, .not_joule_cave
	ld a, [wMapNumber]
	cp MAP_JOULE_CAVE
	jp z, .TealOverBrownBGPalette
.not_joule_cave
	ld a, [wMapGroup]
	cp GROUP_JOULE_CAVE_ZAPDOS_ROOM
	jp nz, .not_joule_cave_zapdos_room
	ld a, [wMapNumber]
	cp MAP_JOULE_CAVE_ZAPDOS_ROOM
	jp z, .TealOverBrownBGPalette
.not_joule_cave_zapdos_room
	ld a, [wMapGroup]
	cp GROUP_CHARRED_SUMMIT
	jp nz, .not_charred_summit
	ld a, [wMapNumber]
	cp MAP_CHARRED_SUMMIT
	jp z, .CharredOverBrownSkyOverWaterBGPalette
.not_charred_summit
	ld a, [wMapGroup]
	cp GROUP_CHARRED_SUMMIT_CAVE
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_CHARRED_SUMMIT_CAVE
	jp z, .LavaOverRedCoalOverBrownBGPalette

.do_nothing
	and a
	ret


.pokecom_2f
	ld a, [wMapGroup]
	cp GROUP_AMAMI_SWIMMING_POOL
	jp nz, .pokecom
	ld a, [wMapNumber]
	cp MAP_AMAMI_SWIMMING_POOL
	jp z, .SwimmingPoolBGPalette
.pokecom
	call LoadPokeComPalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
.MagmaShaft ;lava colors
	ld a, [wMapGroup]
	cp GROUP_MAGMA_SHAFT_1F
	jr nz, .not_B2F
	ld a, [wMapNumber]
	cp MAP_MAGMA_SHAFT_1F
	jr z, .LavaOverRedCoalOverBrownBGPalette
.not_B2F	
	ld a, [wMapGroup]
	cp GROUP_MAGMA_SHAFT_B1F
	jr nz, .not_B1F
	ld a, [wMapNumber]
	cp MAP_MAGMA_SHAFT_B1F
	jr z, .LavaOverRedCoalOverBrownBGPalette
.not_B1F
	ld a, [wMapGroup]
	cp GROUP_MAGMA_SHAFT_B2F
	jr nz, .ice
	ld a, [wMapNumber]
	cp MAP_MAGMA_SHAFT_B2F
	jr z, .LavaOverRedCoalOverBrownBGPalette
.ice
	call LoadIcePathPalette
	scf
	ret
	
.traditional_house
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
	
.SnowOverGreyBGPalette:
	ld hl, SnowOverGrey
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret
	
.LavaOverRedCoalOverBrownBGPalette
	ld hl, LavaOverRedCoalOverBrown
	ld bc, 8 palettes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret
	
.SwimmingPoolBGPalette
	ld hl, SwimmingPool
	ld bc, 8 palettes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret
	
.CharredOverBrownSkyOverWaterBGPalette
	ld hl, CharredOverBrownSkyOverWater
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
	call AddNTimes
	ld de, wBGPals1
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	scf
	ret

.TealOverBrownBGPalette
	ld hl, TealOverBrown
	ld bc, 8 palettes
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
	
LoadSpecialMapOBPalette:
	ld a, [wMapGroup]
	cp GROUP_ROUTE_103
	jr nz, .not_route103
	ld a, [wMapNumber]
	cp MAP_ROUTE_103
	jp z, .SandOverTreeOBPalette
	
.not_route103
	ld a, [wMapGroup]
	cp GROUP_BIRDON_TOWN
	jr nz, .not_birdon
	ld a, [wMapNumber]
	cp MAP_BIRDON_TOWN
	jp z, .SandOverTreeOBPalette
	
.not_birdon
	ld a, [wMapGroup]
	cp GROUP_ROUTE_104
	jr nz, .not_route_104
	ld a, [wMapNumber]
	cp MAP_ROUTE_104
	jp z, .SandOverTreeOBPalette
	
.not_route_104
	ld a, [wMapGroup]
	cp GROUP_ROUTE_105
	jr nz, .not_route_105
	ld a, [wMapNumber]
	cp MAP_ROUTE_105
	jp z, .SandOverTreeOBPalette
	
.not_route_105
	ld a, [wMapGroup]
	cp GROUP_ROUTE_110
	jr nz, .not_route_110
	ld a, [wMapNumber]
	cp MAP_ROUTE_110
	jp z, .SnowOverTreeOBPalette
	
.not_route_110
	ld a, [wMapGroup]
	cp GROUP_BLUE_FOREST
	jr nz, .not_blackthorn_city
	ld a, [wMapNumber]
	cp MAP_BLUE_FOREST
	jp z, .SnowOverTreeOBPalette
	
.not_blackthorn_city
	ld a, [wMapGroup]
	cp GROUP_ROUTE_112
	jr nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_ROUTE_112
	jp z, .SnowOverTreeOBPalette

.do_nothing
    and a
    ret

.SandOverTreeOBPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
    ld hl, SandOverTree
	jr .finish
	
.SnowOverTreeOBPalette:
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	ld bc, 8 palettes
    ld hl, SnowOverTree
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
