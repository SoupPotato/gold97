GenerateSwarmShiny:
	ld a, [wSwarmMapGroup]
	ld b, a
	ld a, [wSwarmMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp ROUTE_101
	jp z, .nyanya
	cp SILENT_HILLS
	jp z, .paramite
	cp ROUTE_102
	jp z, .tangtrip
	cp ROUTE_103
	jp z, .drowzee
	cp ROUTE_120
	jp z, .kotora
	cp BOULDER_MINES
	jp z, .koffing
	cp ROUTE_119
	jp z, .horsea
	cp BOARDWALK
	jp z, .gupgold
	cp ROUTE_118
	jp z, .corasun
	cp MAGMA_SHAFT
	jp z, .bomsheal
	cp RUINS_OF_ALPH
	jp z, .phanpy
	cp ENDON_CAVE
	jp z, .grimer
	cp ROUTE_117
	jp z, .oddish
	cp SLOWPOKE_WELL
	jp z, .slowpoke
	cp ROUTE_104
	jp z, .natu
	cp ROUTE_105
	jp z, .magnemite
	cp JADE_FOREST
	jp z, .sunflora
	cp ROUTE_106
	jp z, .lickitung
	cp ROUTE_107
	jp z, .rayleep
	cp ROUTE_108
	jp z, .farfetch_d
	cp ROUTE_109
	jp z, .qwilfish
	cp ROUTE_110
	jp z, .remoraid
	cp DEEPWATER_PASSAGE
	jp z, .delibird
	cp ROUTE_112
	jp z, .wolfan
	cp NATIONAL_PARK
	jp z, .snubbull
;	cp ROUTE_45
;	jp z, .gligar
;	cp VICTORY_ROAD
;	jp z, .golbat
;	cp ROUTE_26
;	jp z, .doduo
;	cp ROUTE_1
;	jp z, .furret
;	cp VIRIDIAN_FOREST
;	jp z, .pikachu
;	cp POKEMON_MANSION
;	jp z, .magmar
;	cp MT_MOON
;	jp z, .geodude
;	cp ROUTE_5
;	jp z, .jigglypuff
;	cp ROUTE_6
;	jp z, .poliwag
;	cp ROUTE_11
;	jp z, .meowth
;	cp ROUTE_9
;	jp z, .fearow
;	cp ROCK_TUNNEL
;	jp z, .cubone
;	cp ROUTE_7
;	jp z, .murkrow
;	cp ROUTE_8
;	jp z, .haunter
;	cp ROUTE_16
;	jp z, .slugma
;	cp ROUTE_10
;	jp z, .voltorb
;	cp ROUTE_14
;	jp z, .nidorino
;	cp ROUTE_13
;	jp z, .farfetch_d
;	cp ROUTE_19
;	jp z, .staryu
;	cp SEAFOAM_ISLANDS
;	jp z, .seel
	jp .skipshine

.nyanya
	ld a, [wCurPartySpecies]
	cp NYANYA
	jp .next
.paramite
	ld a, [wCurPartySpecies]
	cp PARAMITE
	jp .next
.tangtrip
	ld a, [wCurPartySpecies]
	cp TANGTRIP
	jp .next
.drowzee
	ld a, [wCurPartySpecies]
	cp DROWZEE
	jp .next
.kotora
	ld a, [wCurPartySpecies]
	cp KOTORA
	jp .next
.koffing
	ld a, [wCurPartySpecies]
	cp KOFFING
	jp .next
.horsea
	ld a, [wCurPartySpecies]
	cp HORSEA
	jp .next
.gupgold
	ld a, [wCurPartySpecies]
	cp GUPGOLD
	jp .next
.corasun
	ld a, [wCurPartySpecies]
	cp CORASUN
	jp .next
.bomsheal
	ld a, [wCurPartySpecies]
	cp BOMSHEAL
	jp .next
.phanpy
	ld a, [wCurPartySpecies]
	cp PHANPY
	jp .next
.grimer
	ld a, [wCurPartySpecies]
	cp GRIMER
	jp .next
.oddish
	ld a, [wCurPartySpecies]
	cp ODDISH
	jp .next
.slowpoke
	ld a, [wCurPartySpecies]
	cp SLOWPOKE
	jp .next
.natu
	ld a, [wCurPartySpecies]
	cp NATU
	jp .next
.magnemite
	ld a, [wCurPartySpecies]
	cp MAGNEMITE
	jp .next
.sunflora
	ld a, [wCurPartySpecies]
	cp SUNFLORA
	jp .next
.lickitung
	ld a, [wCurPartySpecies]
	cp LICKITUNG
	jp .next
.rayleep
	ld a, [wCurPartySpecies]
	cp RAYLEEP
	jp .next
.farfetch_d
	ld a, [wCurPartySpecies]
	cp FARFETCH_D
	jp .next
.qwilfish
	ld a, [wCurPartySpecies]
	cp QWILFISH
	jp .next
.remoraid
	ld a, [wCurPartySpecies]
	cp REMORAID
	jp .next
.delibird
	ld a, [wCurPartySpecies]
	cp DELIBIRD
	jp .next
.wolfan
	ld a, [wCurPartySpecies]
	cp WOLFAN
	jp .next
.snubbull
	ld a, [wCurPartySpecies]
	cp SNUBBULL
	jp .next
;.gligar
;	ld a, [wCurPartySpecies]
;	cp GLIGAR
;	jp .next
;.golbat
;	ld a, [wCurPartySpecies]
;	cp GOLBAT
;	jp .next
;.doduo
;	ld a, [wCurPartySpecies]
;	cp DODUO
;	jp .next
;.furret
;	ld a, [wCurPartySpecies]
;	cp FURRET
;	jp .next
;.pikachu
;	ld a, [wCurPartySpecies]
;	cp PIKACHU
;	jp .next
;.magmar
;	ld a, [wCurPartySpecies]
;	cp MAGMAR
;	jp .next
;.geodude
;	ld a, [wCurPartySpecies]
;	cp GEODUDE
;	jp .next
;.jigglypuff
;	ld a, [wCurPartySpecies]
;	cp JIGGLYPUFF
;	jp .next
;.poliwag
;	ld a, [wCurPartySpecies]
;	cp POLIWAG
;	jp .next
;.meowth
;	ld a, [wCurPartySpecies]
;	cp MEOWTH
;	jp .next
;.fearow
;	ld a, [wCurPartySpecies]
;	cp FEAROW
;	jp .next
;.cubone
;	ld a, [wCurPartySpecies]
;	cp CUBONE
;	jp .next
;.murkrow
;	ld a, [wCurPartySpecies]
;	cp MURKROW
;	jp .next
;.haunter
;	ld a, [wCurPartySpecies]
;	cp HAUNTER
;	jp .next
;.slugma
;	ld a, [wCurPartySpecies]
;	cp SLUGMA
;	jp .next
;.voltorb
;	ld a, [wCurPartySpecies]
;	cp VOLTORB
;	jp .next
;.nidorino
;	ld a, [wCurPartySpecies]
;	cp NIDORINO
;	jp .next
;.farfetch_d
;	ld a, [wCurPartySpecies]
;	cp FARFETCH_D
;	jp .next
;.staryu
;	ld a, [wCurPartySpecies]
;	cp STARYU
;	jp .next
;.seel
;	ld a, [wCurPartySpecies]
;	cp SEEL
.next
	jr nz, .skipshine
	;fallthrough
.rollshiny
	call Random
	cp 7 ; adjust to desired percentage
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs
.trynext:
	call Random
	cp 7 ; adjust to desired percentage
	jr nc, .skipshine
	ld b, ATKDEFDV_SHINYF
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs

.skipshine:
; Generate new random DVs
	call BattleRandom
	ld b, a
	call BattleRandom
	ld c, a

.UpdateDVs:
; Input DVs in register bc
	ld hl, wEnemyMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c
	ret