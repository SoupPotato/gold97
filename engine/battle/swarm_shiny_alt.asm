GenerateAltSwarmShiny:
	ld a, [wSwarmMapGroup]
	ld b, a
	ld a, [wSwarmMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp ROUTE_101
	jp z, .hoppip
	cp BRASS_TOWER
	jp z, .kurstraw
	cp ROUTE_102
	jp z, .chix
	cp ROUTE_103
	jp z, .houndour
	cp ROUTE_120
	jp z, .rinring
	cp BOULDER_MINES
	jp z, .onix
	cp ROUTE_119
	jp z, .voltorb
	cp BOARDWALK
	jp z, .marill
	cp ROUTE_118
	jp z, .bellsprout
	cp MAGMA_SHAFT
	jp z, .magmar
	cp RUINS_OF_ALPH
	jp z, .smeargle
	cp ENDON_CAVE
	jp z, .quagsire
	cp ROUTE_116
	jp z, .cubone
	cp SLOWPOKE_WELL
	jp z, .turban
	cp ROUTE_104
	jp z, .twinz
	cp ROUTE_105
	jp z, .murkrow
	cp JADE_FOREST
	jp z, .aipom
	cp ROUTE_106
	jp z, .eevee
	cp AMPARE_CAVERN
	jp z, .electabuzz
	cp ROUTE_108
	jp z, .pinsir
	cp ROUTE_109
	jp z, .scyther
	cp ROUTE_110
	jp z, .sneasel
	cp DEEPWATER_PASSAGE
	jp z, .jynx
	cp ROUTE_112
	jp z, .skarmory
	cp NATIONAL_PARK
	jp z, .togepi
	cp KANTO_REGION_M
	jp z, .ditto
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
;	jp .skipshine

.hoppip
	ld a, [wCurPartySpecies]
	cp HOPPIP
	jp .next
.kurstraw
	ld a, [wCurPartySpecies]
	cp KURSTRAW
	jp .next
.chix
	ld a, [wCurPartySpecies]
	cp CHIX
	jp .next
.houndour
	ld a, [wCurPartySpecies]
	cp HOUNDOUR
	jp .next
.rinring
	ld a, [wCurPartySpecies]
	cp RINRING
	jp .next
.onix
	ld a, [wCurPartySpecies]
	cp ONIX
	jp .next
.voltorb
	ld a, [wCurPartySpecies]
	cp VOLTORB
	jp .next
.marill
	ld a, [wCurPartySpecies]
	cp MARILL
	jp .next
.bellsprout
	ld a, [wCurPartySpecies]
	cp BELLSPROUT
	jp .next
.magmar
	ld a, [wCurPartySpecies]
	cp MAGMAR
	jp .next
.smeargle
	ld a, [wCurPartySpecies]
	cp SMEARGLE
	jp .next
.quagsire
	ld a, [wCurPartySpecies]
	cp QUAGSIRE
	jp .next
.cubone
	ld a, [wCurPartySpecies]
	cp CUBONE
	jp .next
.turban
	ld a, [wCurPartySpecies]
	cp TURBAN
	jp .next
.twinz
	ld a, [wCurPartySpecies]
	cp TWINZ
	jp .next
.murkrow
	ld a, [wCurPartySpecies]
	cp MURKROW
	jp .next
.aipom
	ld a, [wCurPartySpecies]
	cp AIPOM
	jp .next
.eevee
	ld a, [wCurPartySpecies]
	cp EEVEE
	jp .next
.electabuzz
	ld a, [wCurPartySpecies]
	cp ELECTABUZZ
	jp .next
.pinsir
	ld a, [wCurPartySpecies]
	cp PINSIR
	jp .next
.scyther
	ld a, [wCurPartySpecies]
	cp SCYTHER
	jp .next
.sneasel
	ld a, [wCurPartySpecies]
	cp SNEASEL
	jp .next
.jynx
	ld a, [wCurPartySpecies]
	cp JYNX
	jp .next
.skarmory
	ld a, [wCurPartySpecies]
	cp SKARMORY
	jp .next
.togepi
	ld a, [wCurPartySpecies]
	cp TOGEPI
	jp .next
.ditto
	ld a, [wCurPartySpecies]
	cp DITTO
	jp .next
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