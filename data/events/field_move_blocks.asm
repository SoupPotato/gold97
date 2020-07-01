CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO_MODERN, .johto_modern
	dbw TILESET_KANTO,        .kanto
	dbw TILESET_JOHTO,        .johto
	dbw TILESET_PARK,         .park
	dbw TILESET_FOREST,       .forest
	dbw TILESET_BATTLE_TOWER_OUTSIDE, .battle_tower_outside
	dbw TILESET_BATTLE_TOWER, .battle_tower
	db -1 ; end


.johto_modern:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $3c, $0c, 0 ; tree
	db $4c, $5C, 0 ; tree
	db -1 ; end

.kanto:
; facing block, replacement block, animation
	db $0b, $0a, 1 ; grass
	db $32, $6d, 0 ; tree
	db $33, $6c, 0 ; tree
	db $34, $6f, 0 ; tree
	db $35, $4c, 0 ; tree
	db $60, $6e, 0 ; tree
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $77, $07, 0 ; tree
	db -1 ; end
	
.park:
; facing block, replacement block, animation
	db $03, $01, 1 ; grass
	db -1 ; end
	
.battle_tower_outside:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $07, $39, 0 ; tree
	db -1 ; end
	
.battle_tower:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db -1 ; end

.forest:
; facing block, replacement block, animation
	db $0f, $17, 0
	db -1 ; end

WhirlpoolBlockPointers:
	dbw TILESET_PARK, .park
	dbw TILESET_BATTLE_TOWER, .battle_tower
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $7C, $3B, 0
	db -1 ; end
	
.battle_tower:
; facing block, replacement block, animation
	db $26, $36, 0
	db -1 ; end
