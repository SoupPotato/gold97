PlayRadioShow:
; If we're already in the radio program proper, we don't need to be here.
	ld a, [wCurRadioLine]
	cp POKE_FLUTE_RADIO
	jr nc, .ok
; If Team Rocket is not occupying the radio tower, we don't need to be here.
	ld a, [wStatusFlags2]
	bit STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F, a
	jr z, .ok
; If we're in Kanto, we don't need to be here.
	call IsInJohto
	and a
	jr nz, .ok
; Team Rocket broadcasts on all stations.
	ld a, ROCKET_RADIO
	ld [wCurRadioLine], a
.ok
; Jump to the currently loaded station.  The index to which we need to jump is in wCurRadioLine.
	ld a, [wCurRadioLine]
	ld e, a
	ld d, 0
	ld hl, RadioJumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

RadioJumptable:
; entries correspond to constants/radio_constants.asm
	dw OaksPKMNTalk1  ; $00
	dw BenMonMusic1  ; $02
	dw LuckyNumberShow1 ; $03
	dw BuenasPassword1 ; $04
	dw PeoplePlaces1 ; $05
	dw FernMonMusic1 ; $06
	dw RocketRadio1 ; $07
	dw PokeFluteRadio ; $08
	dw UnownRadio ; $09
	dw EvolutionRadio ; $0a
; OaksPKMNTalk
	dw OaksPKMNTalk2  ; $0b
	dw OaksPKMNTalk3  ; $0c
	dw OaksPKMNTalk4  ; $0d
	dw OaksPKMNTalk5  ; $0e
	dw OaksPKMNTalk6  ; $0f
	dw OaksPKMNTalk7  ; $10
	dw OaksPKMNTalk8  ; $11
	dw OaksPKMNTalk9  ; $12
; Ben Music
	dw BenMonMusic2  ; $17
	dw BenMonMusic3  ; $18
	dw BenFernMusic4 ; $19
	dw BenFernMusic5 ; $1a
	dw BenFernMusic6 ; $1b
	dw BenFernMusic7 ; $1c
	dw FernMonMusic2 ; $1d
; Lucky Number Show
	dw LuckyNumberShow2 ; $1e
	dw LuckyNumberShow3 ; $1f
	dw LuckyNumberShow4 ; $20
	dw LuckyNumberShow5 ; $21
	dw LuckyNumberShow6 ; $22
	dw LuckyNumberShow7 ; $23
	dw LuckyNumberShow8 ; $24
	dw LuckyNumberShow9 ; $25
	dw LuckyNumberShow10 ; $26
	dw LuckyNumberShow11 ; $27
	dw LuckyNumberShow12 ; $28
	dw LuckyNumberShow13 ; $29
	dw LuckyNumberShow14 ; $2a
	dw LuckyNumberShow15 ; $2b
; People & Places
	dw PeoplePlaces2 ; $2c
	dw PeoplePlaces3 ; $2d
	dw PeoplePlaces4 ; $2e
	dw PeoplePlaces5 ; $2f
	dw PeoplePlaces6 ; $30
	dw PeoplePlaces7 ; $31
; Rocket Radio
	dw RocketRadio2 ; $32
	dw RocketRadio3 ; $33
	dw RocketRadio4 ; $34
	dw RocketRadio5 ; $35
	dw RocketRadio6 ; $36
	dw RocketRadio7 ; $37
	dw RocketRadio8 ; $38
	dw RocketRadio9 ; $39
	dw RocketRadio10 ; $3a
; More Pokemon Channel stuff
	dw OaksPKMNTalk10 ; $3b
	dw OaksPKMNTalk11 ; $3c
	dw OaksPKMNTalk12 ; $3d
	dw OaksPKMNTalk13 ; $3e
	dw OaksPKMNTalk14 ; $3f
; Buenas Password
	dw BuenasPassword2 ; $40
	dw BuenasPassword3 ; $41
	dw BuenasPassword4 ; $42
	dw BuenasPassword5 ; $43
	dw BuenasPassword6 ; $44
	dw BuenasPassword7 ; $45
	dw BuenasPassword8 ; $46
	dw BuenasPassword9 ; $47
	dw BuenasPassword10 ; $48
	dw BuenasPassword11 ; $49
	dw BuenasPassword12 ; $4a
	dw BuenasPassword13 ; $4b
	dw BuenasPassword14 ; $4c
	dw BuenasPassword15 ; $4d
	dw BuenasPassword16 ; $4e
	dw BuenasPassword17 ; $4f
	dw BuenasPassword18 ; $50
	dw BuenasPassword19 ; $51
	dw BuenasPassword20 ; $52
	dw BuenasPassword21 ; $53
	dw RadioScroll ; $54
; More Pokemon Channel stuff
	dw OaksPKMNTalkSwarm1  ; $58
	dw OaksPKMNTalkSwarm2  ; $59
	dw OaksPKMNTalkSwarm3  ; $5a
	dw OaksPKMNTalkSwarm4  ; $5b
	dw OaksPKMNTalkSwarm5  ; $5c
	dw OaksPKMNTalkSwarm6  ; $5d
	dw OaksPKMNTalkSwarm7  ; $5e
	dw OaksPKMNTalkSwarm8  ; $5f
	dw OaksPKMNTalkSwarm9  ; $60
	dw OaksPKMNTalkSwarm10 ; $61
	dw OaksPKMNTalkSwarm11 ; $62
	dw OaksPKMNTalkSwarm12 ; $63

PrintRadioLine:
	ld [wNextRadioLine], a
	ld hl, wRadioText
	ld a, [wNumRadioLinesPrinted]
	cp 2
	jr nc, .print
	inc hl
	ld [hl], TX_START
	inc a
	ld [wNumRadioLinesPrinted], a
	cp 2
	jr nz, .print
	bccoord 1, 16
	call PlaceHLTextAtBC
	jr .skip
.print
	call PrintTextBoxText
.skip
	ld a, RADIO_SCROLL
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

ReplacePeriodsWithSpaces:
	push hl
	ld b, SCREEN_WIDTH * 2
.loop
	ld a, [hl]
	cp "."
	jr nz, .next
	ld [hl], " "

.next
	inc hl
	dec b
	jr nz, .loop
	pop hl
	ret

RadioScroll:
	ld hl, wRadioTextDelay
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret
.proceed
	ld a, [wNextRadioLine]
	ld [wCurRadioLine], a
	ld a, [wNumRadioLinesPrinted]
	cp 1
	call nz, CopyBottomLineToTopLine
	jp ClearBottomLine

OaksPKMNTalk1:
	ld a, 5
	ld [wOaksPKMNTalkSegmentCounter], a
	call StartRadioStation
	ld hl, OPT_IntroText1
	ld a, OAKS_POKEMON_TALK_2
	jp NextRadioLine

OaksPKMNTalk2:
	ld hl, OPT_IntroText2
	ld a, OAKS_POKEMON_TALK_3
	jp NextRadioLine

OaksPKMNTalk3:
	ld hl, OPT_IntroText3
	ld a, OAKS_POKEMON_TALK_SWARM_1
	jp NextRadioLine

OaksPKMNTalkSwarm1:
	ld hl, wSwarmFlags
	bit SWARMFLAGS_SWARM_ACTIVE, [hl]
	jp nz, .done

	ld hl, wDailyFlags1
	bit DAILYFLAGS_SWARM_F, [hl]
	jp nz, .check_alt_swarm
	jp .generate_flag

.check_alt_swarm
	ld hl, wSwarmFlags
	bit SWARMFLAGS_ALT_SWARM_F, [hl]
	jp nz, .done

.generate_flag
	call Random ; generate a random number below 8
	and %11 ; '3' in bit  (increase bit number with each new added swarm)
	cp 0
	jp z, .normal_swarm
	cp 1
	jp z, .alternate_swarm
	jp .generate_flag

.normal_swarm
	ld hl, wDailyFlags1
	bit DAILYFLAGS_SWARM_F, [hl]
	jp z, .generate_number
	jp .done
	
.alternate_swarm
	ld hl, wSwarmFlags
	bit SWARMFLAGS_ALT_SWARM_F, [hl]
	jp z, .generate_alt_number
	jp .done
	
.done
	jp OaksPKMNTalk4

.generate_number
	ld hl, wSwarmFlags
	set SWARMFLAGS_SWARM_ACTIVE, [hl]
	call .InJohto
	jp nc, .generate_number_kanto
	call Random ; generate a random number below 32
	and %11111 ; '31' in bit  (increase bit number with each new added swarm)
	cp 0
	jp z, .nyanya
	cp 1
	jp z, .paramite
	cp 2
	jp z, .tangtrip
	cp 3
	jp z, .drowzee
	cp 4
	jp z, .kotora
	cp 5
	jp z, .koffing
	cp 6
	jp z, .horsea
	cp 7
	jp z, .gupgold
	cp 8
	jp z, .corasun
	cp 9
	jp z, .bomsheal
	cp 10
	jp z, .phanpy
	cp 11
	jp z, .grimer
	cp 12
	jp z, .oddish
	cp 13
	jp z, .slowpoke
	cp 14
	jp z, .natu
	cp 15
	jp z, .magnemite
	cp 16
	jp z, .sunflora
	cp 17
	jp z, .lickitung
	cp 18
	jp z, .rayleep
	cp 19
	jp z, .farfetch_d
	cp 20
	jp z, .qwilfish
	cp 21
	jp z, .remoraid
	cp 22
	jp z, .delibird
	cp 23
	jp z, .wolfan
	cp 24
	jp z, .snubbull
;	cp 25
;	jp z, .gligar
	jp .generate_number

.generate_alt_number
	ld hl, wSwarmFlags
	set SWARMFLAGS_SWARM_ACTIVE, [hl]
	call .InJohto
	jp nc, .generate_alt_number_kanto
	call Random ; generate a random number below 32
	and %11111 ; '31' in bit  (increase bit number with each new added swarm)
	cp 0
	jp z, .hoppip
	cp 1
	jp z, .kurstraw
	cp 2
	jp z, .chix
	cp 3
	jp z, .houndour
	cp 4
	jp z, .rinring
	cp 5
	jp z, .onix
	cp 6
	jp z, .voltorb
	cp 7
	jp z, .marill
	cp 8
	jp z, .bellsprout
	cp 9
	jp z, .magmar
	cp 10
	jp z, .smeargle
	cp 11
	jp z, .quagsire
	cp 12
	jp z, .cubone
	cp 13
	jp z, .turban
	cp 14
	jp z, .twinz
	cp 15
	jp z, .murkrow
	cp 16
	jp z, .aipom
	cp 17
	jp z, .eevee
	cp 18
	jp z, .electabuzz
	cp 19
	jp z, .pinsir
	cp 20
	jp z, .scyther
	cp 21
	jp z, .sneasel
	cp 22
	jp z, .jynx
	cp 23
	jp z, .skarmory
	cp 24
	jp z, .togepi
;	cp 25
;	jp z, .skarmory
	jp .generate_alt_number

.generate_number_kanto
;	call Random ; generate a random number below 32
;	and %11111 ; '31' in bit  (increase bit number with each new added swarm)
;	cp 18
;	jp z, .seel
;	jp .generate_number_kanto

.generate_alt_number_kanto
;	call Random ; generate a random number below 32
;	and %11111 ; '31' in bit  (increase bit number with each new added swarm)
;	cp 18
;	jp z, .jynx
;	jp .generate_alt_number_kanto

.nyanya
	ld a, NYANYA
	call .store_mon_name
	ld d, GROUP_ROUTE_101
	ld e, MAP_ROUTE_101
	farcall StoreSwarmMapIndices
	ld e, ROUTE_101
	jp .finish

.hoppip
	ld a, HOPPIP
	call .store_mon_name
	ld d, GROUP_ROUTE_101
	ld e, MAP_ROUTE_101
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_101
	jp .finish

.paramite
	ld a, PARAMITE
	call .store_mon_name
	ld d, GROUP_SILENT_HILLS
	ld e, MAP_SILENT_HILLS
	farcall StoreSwarmMapIndices
	ld e, SILENT_HILLS
	jp .finish

.kurstraw
	ld a, KURSTRAW
	call .store_mon_name
	ld d, GROUP_BRASS_TOWER_2F
	ld e, MAP_BRASS_TOWER_2F
	farcall StoreSwarmMapIndicesAlternate
	ld e, BRASS_TOWER
	jp .finish

.tangtrip
	ld a, TANGTRIP
	call .store_mon_name
	ld d, GROUP_ROUTE_102
	ld e, MAP_ROUTE_102
	farcall StoreSwarmMapIndices
	ld e, ROUTE_102
	jp .finish

.chix
	ld a, CHIX
	call .store_mon_name
	ld d, GROUP_ROUTE_102
	ld e, MAP_ROUTE_102
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_102
	jp .finish

.drowzee
	ld a, DROWZEE
	call .store_mon_name
	ld d, GROUP_ROUTE_103
	ld e, MAP_ROUTE_103
	farcall StoreSwarmMapIndices
	ld e, ROUTE_103
	jp .finish

.houndour
	ld a, HOUNDOUR
	call .store_mon_name
	ld d, GROUP_ROUTE_103
	ld e, MAP_ROUTE_103
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_103
	jp .finish

.kotora
	ld a, KOTORA
	call .store_mon_name
	ld d, GROUP_ROUTE_120
	ld e, MAP_ROUTE_120
	farcall StoreSwarmMapIndices
	ld e, ROUTE_120
	jp .finish

.rinring
	ld a, RINRING
	call .store_mon_name
	ld d, GROUP_ROUTE_120
	ld e, MAP_ROUTE_120
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_120
	jp .finish

.koffing
	ld a, KOFFING
	call .store_mon_name
	ld d, GROUP_BOULDER_MINES_1F
	ld e, MAP_BOULDER_MINES_1F
	farcall StoreSwarmMapIndices
	ld e, BOULDER_MINES
	jp .finish

.onix
	ld a, ONIX
	call .store_mon_name
	ld d, GROUP_BOULDER_MINES_1F
	ld e, MAP_BOULDER_MINES_1F
	farcall StoreSwarmMapIndicesAlternate
	ld e, BOULDER_MINES
	jp .finish

.horsea
	ld a, HORSEA
	call .store_mon_name
	ld d, GROUP_ROUTE_119
	ld e, MAP_ROUTE_119
	ld a, 1  ; FISHSWARM_HORSEA (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, ROUTE_119
	jp .finish

.voltorb
	ld a, VOLTORB
	call .store_mon_name
	ld d, GROUP_ROUTE_119
	ld e, MAP_ROUTE_119
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_119
	jp .finish

.gupgold
	ld a, GUPGOLD
	call .store_mon_name
	ld d, GROUP_BOARDWALK
	ld e, MAP_BOARDWALK
	ld a, 2  ; FISHSWARM_GUPGOLD (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, BOARDWALK
	jp .finish

.marill
	ld a, MARILL
	call .store_mon_name
	ld d, GROUP_BOARDWALK
	ld e, MAP_BOARDWALK
	farcall StoreSwarmMapIndicesAlternate
	ld e, BOARDWALK
	jp .finish

.corasun
	ld a, CORASUN
	call .store_mon_name
	ld d, GROUP_ROUTE_118
	ld e, MAP_ROUTE_118
	ld a, 3  ; FISHSWARM_CORASUN (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, ROUTE_118
	jp .finish

.bellsprout
	ld a, BELLSPROUT
	call .store_mon_name
	ld d, GROUP_ROUTE_118
	ld e, MAP_ROUTE_118
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_118
	jp .finish

.bomsheal
	ld a, BOMSHEAL
	call .store_mon_name
	ld d, GROUP_MAGMA_SHAFT_B1F
	ld e, MAP_MAGMA_SHAFT_B1F
	farcall StoreSwarmMapIndices
	ld e, MAGMA_SHAFT
	jp .finish

.magmar
	ld a, MAGMAR
	call .store_mon_name
	ld d, GROUP_MAGMA_SHAFT_B1F
	ld e, MAP_MAGMA_SHAFT_B1F
	farcall StoreSwarmMapIndicesAlternate
	ld e, MAGMA_SHAFT
	jp .finish

.phanpy
	ld a, PHANPY
	call .store_mon_name
	ld d, GROUP_RUINS_OF_ALPH_OUTSIDE
	ld e, MAP_RUINS_OF_ALPH_OUTSIDE
	farcall StoreSwarmMapIndices
	ld e, RUINS_OF_ALPH
	jp .finish

.smeargle
	ld a, SMEARGLE
	call .store_mon_name
	ld d, GROUP_RUINS_OF_ALPH_OUTSIDE
	ld e, MAP_RUINS_OF_ALPH_OUTSIDE
	farcall StoreSwarmMapIndicesAlternate
	ld e, RUINS_OF_ALPH
	jp .finish

.grimer
	ld a, GRIMER
	call .store_mon_name
	ld d, GROUP_ENDON_CAVE_1F
	ld e, MAP_ENDON_CAVE_1F
	farcall StoreSwarmMapIndices
	ld e, ENDON_CAVE
	jp .finish

.quagsire
	ld a, QUAGSIRE
	call .store_mon_name
	ld d, GROUP_ENDON_CAVE_1F
	ld e, MAP_ENDON_CAVE_1F
	farcall StoreSwarmMapIndicesAlternate
	ld e, ENDON_CAVE
	jp .finish

.oddish
	ld a, ODDISH
	call .store_mon_name
	ld d, GROUP_ROUTE_117
	ld e, MAP_ROUTE_117
	farcall StoreSwarmMapIndices
	ld e, ROUTE_117
	jp .finish

.cubone
	ld a, CUBONE
	call .store_mon_name
	ld d, GROUP_ROUTE_116
	ld e, MAP_ROUTE_116
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_116
	jp .finish

.slowpoke
	ld a, SLOWPOKE
	call .store_mon_name
	ld d, GROUP_SLOWPOKE_WELL_B2F
	ld e, MAP_SLOWPOKE_WELL_B2F
	farcall StoreSwarmMapIndices
	ld e, SLOWPOKE_WELL
	jp .finish

.turban
	ld a, TURBAN
	call .store_mon_name
	ld d, GROUP_SLOWPOKE_WELL_B2F
	ld e, MAP_SLOWPOKE_WELL_B2F
	farcall StoreSwarmMapIndicesAlternate
	ld e, SLOWPOKE_WELL
	jp .finish

.natu
	ld a, NATU
	call .store_mon_name
	ld d, GROUP_ROUTE_104
	ld e, MAP_ROUTE_104
	farcall StoreSwarmMapIndices
	ld e, ROUTE_104
	jp .finish

.twinz
	ld a, TWINZ
	call .store_mon_name
	ld d, GROUP_ROUTE_104
	ld e, MAP_ROUTE_104
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_104
	jp .finish

.magnemite
	ld a, MAGNEMITE
	call .store_mon_name
	ld d, GROUP_ROUTE_105
	ld e, MAP_ROUTE_105
	farcall StoreSwarmMapIndices
	ld e, ROUTE_105
	jp .finish

.murkrow
	ld a, MURKROW
	call .store_mon_name
	ld d, GROUP_ROUTE_105
	ld e, MAP_ROUTE_105
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_105
	jp .finish

.sunflora
	ld a, SUNFLORA
	call .store_mon_name
	ld d, GROUP_JADE_FOREST
	ld e, MAP_JADE_FOREST
	farcall StoreSwarmMapIndices
	ld e, JADE_FOREST
	jp .finish

.aipom
	ld a, AIPOM
	call .store_mon_name
	ld d, GROUP_JADE_FOREST
	ld e, MAP_JADE_FOREST
	farcall StoreSwarmMapIndicesAlternate
	ld e, JADE_FOREST
	jp .finish

.lickitung
	ld a, LICKITUNG
	call .store_mon_name
	ld d, GROUP_ROUTE_106
	ld e, MAP_ROUTE_106
	farcall StoreSwarmMapIndices
	ld e, ROUTE_106
	jp .finish

.eevee
	ld a, EEVEE
	call .store_mon_name
	ld d, GROUP_ROUTE_106
	ld e, MAP_ROUTE_106
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_106
	jp .finish

.rayleep
	ld a, RAYLEEP
	call .store_mon_name
	ld d, GROUP_ROUTE_107
	ld e, MAP_ROUTE_107
	farcall StoreSwarmMapIndices
	ld e, ROUTE_107
	jp .finish

.electabuzz
	ld a, ELECTABUZZ
	call .store_mon_name
	ld d, GROUP_AMPARE_CAVERN_1F
	ld e, MAP_AMPARE_CAVERN_1F
	farcall StoreSwarmMapIndicesAlternate
	ld e, AMPARE_CAVERN
	jp .finish

.farfetch_d
	ld a, FARFETCH_D
	call .store_mon_name
	ld d, GROUP_ROUTE_108
	ld e, MAP_ROUTE_108
	farcall StoreSwarmMapIndices
	ld e, ROUTE_108
	jp .finish

.pinsir
	ld a, PINSIR
	call .store_mon_name
	ld d, GROUP_ROUTE_108
	ld e, MAP_ROUTE_108
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_108
	jp .finish

.qwilfish
	ld a, QWILFISH
	call .store_mon_name
	ld d, GROUP_ROUTE_109
	ld e, MAP_ROUTE_109
	ld a, 4  ; FISHSWARM_QWILFISH (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, ROUTE_109
	jp .finish

.scyther
	ld a, SCYTHER
	call .store_mon_name
	ld d, GROUP_ROUTE_109
	ld e, MAP_ROUTE_109
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_109
	jp .finish

.remoraid
	ld a, REMORAID
	call .store_mon_name
	ld d, GROUP_ROUTE_110
	ld e, MAP_ROUTE_110
	ld a, 5  ; FISHSWARM_REMORAID (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, ROUTE_110
	jp .finish

.sneasel
	ld a, SNEASEL
	call .store_mon_name
	ld d, GROUP_ROUTE_110
	ld e, MAP_ROUTE_110
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_110
	jp .finish

.delibird
	ld a, DELIBIRD
	call .store_mon_name
	ld d, GROUP_DEEPWATER_PASSAGE_B2F
	ld e, MAP_DEEPWATER_PASSAGE_B2F
	farcall StoreSwarmMapIndices
	ld e, DEEPWATER_PASSAGE
	jp .finish

.jynx
	ld a, JYNX
	call .store_mon_name
	ld d, GROUP_DEEPWATER_PASSAGE_B2F
	ld e, MAP_DEEPWATER_PASSAGE_B2F
	farcall StoreSwarmMapIndicesAlternate
	ld e, DEEPWATER_PASSAGE
	jp .finish

.wolfan
	ld a, WOLFAN
	call .store_mon_name
	ld d, GROUP_ROUTE_112
	ld e, MAP_ROUTE_112
	farcall StoreSwarmMapIndices
	ld e, ROUTE_112
	jp .finish

.skarmory
	ld a, SKARMORY
	call .store_mon_name
	ld d, GROUP_ROUTE_112
	ld e, MAP_ROUTE_112
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_112
	jp .finish

.snubbull
	ld a, SNUBBULL
	call .store_mon_name
	ld d, GROUP_NATIONAL_PARK
	ld e, MAP_NATIONAL_PARK
	farcall StoreSwarmMapIndices
	ld e, NATIONAL_PARK
	jp .finish

.togepi
	ld a, TOGEPI
	call .store_mon_name
	ld d, GROUP_NATIONAL_PARK
	ld e, MAP_NATIONAL_PARK
	farcall StoreSwarmMapIndicesAlternate
	ld e, NATIONAL_PARK
	jp .finish

;.jynx
;	ld a, JYNX
;	call .store_mon_name
;	ld d, GROUP_SEAFOAM_ISLANDS_B4F
;	ld e, MAP_SEAFOAM_ISLANDS_B4F
;	farcall StoreSwarmMapIndicesAlternate
;	ld e, SEAFOAM_ISLANDS
;	jp .finish

.store_mon_name
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ret


.finish
	farcall GetLandmarkName
	ld hl, OPT_SwarmText1
	ld a, OAKS_POKEMON_TALK_SWARM_2
	jp NextRadioLine

.InJohto:
; if in Johto or on the S.S. Aqua, set carry

; otherwise clear carry
	ld a, [wPokegearMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	and a
	ret

.johto
	scf
	ret

OaksPKMNTalkSwarm2:
	ld hl, OPT_SwarmText2
	ld a, OAKS_POKEMON_TALK_SWARM_3
	jp NextRadioLine

OaksPKMNTalkSwarm3:
	ld hl, OPT_SwarmText3
	ld a, OAKS_POKEMON_TALK_SWARM_4
	jp NextRadioLine

OaksPKMNTalkSwarm4:
	ld hl, OPT_SwarmText4
	ld a, OAKS_POKEMON_TALK_SWARM_5
	jp NextRadioLine

OaksPKMNTalkSwarm5:
	ld hl, OPT_SwarmText5
	ld a, OAKS_POKEMON_TALK_SWARM_6
	jp NextRadioLine

OaksPKMNTalkSwarm6:
	ld hl, OPT_SwarmText6
	ld a, OAKS_POKEMON_TALK_SWARM_7
	jp NextRadioLine

OaksPKMNTalkSwarm7:
	ld hl, OPT_SwarmText7
	ld a, OAKS_POKEMON_TALK_SWARM_8
	jp NextRadioLine
	
OaksPKMNTalkSwarm8:
	ld hl, OPT_SwarmText8
	ld a, OAKS_POKEMON_TALK_SWARM_9
	jp NextRadioLine

OaksPKMNTalkSwarm9:
	ld hl, OPT_SwarmText9
	ld a, OAKS_POKEMON_TALK_SWARM_10
	jp NextRadioLine

OaksPKMNTalkSwarm10:
	ld hl, OPT_SwarmText10
	ld a, OAKS_POKEMON_TALK_SWARM_11
	jp NextRadioLine

OaksPKMNTalkSwarm11:
	ld hl, OPT_SwarmText11
	ld a, OAKS_POKEMON_TALK_SWARM_12
	jp NextRadioLine

OaksPKMNTalkSwarm12:
	ld hl, OPT_SwarmText12
	ld a, OAKS_POKEMON_TALK_4
	jp NextRadioLine

OaksPKMNTalk4:
; Choose a random route, and a random Pokemon from that route.
.sample
	call Random
	and %11111
	cp (OaksPKMNTalkRoutes.End - OaksPKMNTalkRoutes) / 2
	jr nc, .sample
	; We now have a number between 0 and 14.
	ld hl, OaksPKMNTalkRoutes
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	; bc now contains the chosen map's group and number indices.
	push bc

	; Search the JohtoGrassWildMons array for the chosen map.
	ld hl, JohtoGrassWildMons
.loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp -1
	jr z, .overflow
	inc hl
	cp b
	jr nz, .next
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp c
	jr z, .done
.next
	dec hl
	ld de, GRASS_WILDDATA_LENGTH
	add hl, de
	jr .loop

.done
	; Point hl to the list of morning Pokémon., skipping percentages
rept 4
	inc hl
endr
	; Generate a number, either 0, 1, or 2, to choose a time of day.
.loop2
	call Random
	maskbits NUM_DAYTIMES
	cp DARKNESS_F
	jr z, .loop2

	ld bc, 2 * NUM_GRASSMON
	call AddNTimes
.loop3
	; Choose one of the middle three Pokemon.
	call Random
	and NUM_GRASSMON
	cp 2
	jr c, .loop3
	cp 5
	jr nc, .loop3
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	inc hl ; skip level
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	ld [wNamedObjectIndexBuffer], a
	ld [wCurPartySpecies], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	; Now that we've chosen our wild Pokemon,
	; let's recover the map index info and get its name.
	pop bc
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, OPT_OakText1
	call CopyRadioTextToRAM
	ld a, OAKS_POKEMON_TALK_5
	jp PrintRadioLine

.overflow
	pop bc
	ld a, OAKS_POKEMON_TALK
	jp PrintRadioLine

INCLUDE "data/radio/oaks_pkmn_talk_routes.asm"

OaksPKMNTalk5:
	ld hl, OPT_OakText2
	ld a, OAKS_POKEMON_TALK_6
	jp NextRadioLine

OaksPKMNTalk6:
	ld hl, OPT_OakText3
	ld a, OAKS_POKEMON_TALK_7
	jp NextRadioLine

OPT_IntroText1:
	; MARY: PROF.OAK'S
	text_far _OPT_IntroText1
	text_end

OPT_IntroText2:
	; #MON TALK!
	text_far _OPT_IntroText2
	text_end

OPT_IntroText3:
	; With me, MARY!
	text_far _OPT_IntroText3
	db "@"

OPT_SwarmText1:
	; Breaking news!
	text_far _OPT_SwarmText1
	db "@"

OPT_SwarmText2:
	; A group of
	text_far _OPT_SwarmText2
	db "@"

OPT_SwarmText3:
	; @ 
	text_far _OPT_SwarmText3
	db "@"

OPT_SwarmText4:
	; have be seen at
	text_far _OPT_SwarmText4
	db "@"

OPT_SwarmText5:
	; @ .
	text_far _OPT_SwarmText5
	db "@"

OPT_SwarmText6:
	; If any trainers
	text_far _OPT_SwarmText6
	db "@"

OPT_SwarmText7:
	; want to catch a
	text_far _OPT_SwarmText7
	db "@"

OPT_SwarmText8:
	; @ ,
	text_far _OPT_SwarmText8
	db "@"

OPT_SwarmText9:
	; then head over to
	text_far _OPT_SwarmText9
	db "@"

OPT_SwarmText10:
	; @ .
	text_far _OPT_SwarmText5
	db "@"

OPT_SwarmText11:
	; Now, let's start
	text_far _OPT_SwarmText10
	db "@"

OPT_SwarmText12:
	; the show!
	text_far _OPT_SwarmText11
	db "@"

OPT_OakText1:
	; OAK: @ @
	text_far _OPT_OakText1
	text_end

OPT_OakText2:
	; may be seen around
	text_far _OPT_OakText2
	text_end

OPT_OakText3:
	; @ .
	text_far _OPT_OakText3
	text_end

OaksPKMNTalk7:
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, OPT_MaryText1
	ld a, OAKS_POKEMON_TALK_8
	jp NextRadioLine

OPT_MaryText1:
	; MARY: @ 's
	text_far _OPT_MaryText1
	text_end

OaksPKMNTalk8:
	; 0-15 are all valid indexes into .Adverbs,
	; so no need for a retry loop
	call Random
	maskbits NUM_OAKS_POKEMON_TALK_ADVERBS
	ld e, a
	ld d, 0
	ld hl, .Adverbs
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, OAKS_POKEMON_TALK_9
	jp NextRadioLine

.Adverbs:
; there are NUM_OAKS_POKEMON_TALK_ADVERBS entries
	dw .sweetadorably
	dw .wigglyslickly
	dw .aptlynamed
	dw .undeniablykindof
	dw .unbearably
	dw .wowimpressively
	dw .almostpoisonously
	dw .sensually
	dw .mischievously
	dw .topically
	dw .addictively
	dw .looksinwater
	dw .evolutionmustbe
	dw .provocatively
	dw .flippedout
	dw .heartmeltingly

.sweetadorably
	; sweet and adorably
	text_far OPT_SweetAdorably
	text_end

.wigglyslickly
	; wiggly and slickly
	text_far OPT_WigglySlickly
	text_end

.aptlynamed
	; aptly named and
	text_far OPT_AptlyNamed
	text_end

.undeniablykindof
	; undeniably kind of
	text_far OPT_UndeniablyKindOf
	text_end

.unbearably
	; so, so unbearably
	text_far OPT_Unbearably
	text_end

.wowimpressively
	; wow, impressively
	text_far OPT_WowImpressively
	text_end

.almostpoisonously
	; almost poisonously
	text_far OPT_AlmostPoisonously
	text_end

.sensually
	; ooh, so sensually
	text_far OPT_Sensually
	text_end

.mischievously
	; so mischievously
	text_far OPT_Mischievously
	text_end

.topically
	; so very topically
	text_far OPT_Topically
	text_end

.addictively
	; sure addictively
	text_far OPT_Addictively
	text_end

.looksinwater
	; looks in water is
	text_far OPT_LooksInWater
	text_end

.evolutionmustbe
	; evolution must be
	text_far OPT_EvolutionMustBe
	text_end

.provocatively
	; provocatively
	text_far OPT_Provocatively
	text_end

.flippedout
	; so flipped out and
	text_far OPT_FlippedOut
	text_end

.heartmeltingly
	; heart-meltingly
	text_far OPT_HeartMeltingly
	text_end

OaksPKMNTalk9:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_OAKS_POKEMON_TALK_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOaksPKMNTalkSegmentCounter]
	dec a
	ld [wOaksPKMNTalkSegmentCounter], a
	ld a, OAKS_POKEMON_TALK_4
	jr nz, .ok
	ld a, 5
	ld [wOaksPKMNTalkSegmentCounter], a
	ld a, OAKS_POKEMON_TALK_10
.ok
	jp NextRadioLine

.Adjectives:
; there are NUM_OAKS_POKEMON_TALK_ADJECTIVES entries
	dw .cute
	dw .weird
	dw .pleasant
	dw .boldsortof
	dw .frightening
	dw .suavedebonair
	dw .powerful
	dw .exciting
	dw .groovy
	dw .inspiring
	dw .friendly
	dw .hothothot
	dw .stimulating
	dw .guarded
	dw .lovely
	dw .speedy

.cute
	; cute.
	text_far OPT_Cute
	text_end

.weird
	; weird.
	text_far OPT_Weird
	text_end

.pleasant
	; pleasant.
	text_far OPT_Pleasant
	text_end

.boldsortof
	; bold, sort of.
	text_far OPT_BoldSortOf
	text_end

.frightening
	; frightening.
	text_far OPT_Frightening
	text_end

.suavedebonair
	; suave & debonair!
	text_far OPT_SuaveDebonair
	text_end

.powerful
	; powerful.
	text_far OPT_Powerful
	text_end

.exciting
	; exciting.
	text_far OPT_Exciting
	text_end

.groovy
	; groovy!
	text_far OPT_Groovy
	text_end

.inspiring
	; inspiring.
	text_far OPT_Inspiring
	text_end

.friendly
	; friendly.
	text_far OPT_Friendly
	text_end

.hothothot
	; hot, hot, hot!
	text_far OPT_HotHotHot
	text_end

.stimulating
	; stimulating.
	text_far OPT_Stimulating
	text_end

.guarded
	; guarded.
	text_far OPT_Guarded
	text_end

.lovely
	; lovely.
	text_far OPT_Lovely
	text_end

.speedy
	; speedy.
	text_far OPT_Speedy
	text_end

OaksPKMNTalk10:
	farcall RadioMusicRestartPokemonChannel
	ld hl, OPT_RestartText
	call PrintText
	call WaitBGMap
	ld hl, OPT_PokemonChannelText
	call PrintText
	ld a, OAKS_POKEMON_TALK_11
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

OPT_PokemonChannelText:
	; #MON
	text_far _OPT_PokemonChannelText
	text_end

OPT_RestartText:
	text_end

OaksPKMNTalk11:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 9, 14
	ld de, .pokemon_string
	ld a, OAKS_POKEMON_TALK_12
	jp PlaceRadioString

.pokemon_string
	db "#MON@"

OaksPKMNTalk12:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 1, 16
	ld de, .pokemon_channel_string
	ld a, OAKS_POKEMON_TALK_13
	jp PlaceRadioString

.pokemon_channel_string
	db "#MON Channel@"

OaksPKMNTalk13:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 12, 16
	ld de, .terminator
	ld a, OAKS_POKEMON_TALK_14
	jp PlaceRadioString

.terminator
	db "@"

OaksPKMNTalk14:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	ld de, MUSIC_PROF_ELM
	callfar RadioMusicRestartDE
	ld hl, .terminator
	call PrintText
	ld a, OAKS_POKEMON_TALK_4
	ld [wNextRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, RADIO_SCROLL
	ld [wCurRadioLine], a
	ld a, 10
	ld [wRadioTextDelay], a
	ret

.terminator
	db "@"

PlaceRadioString:
	ld [wCurRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	jp PlaceString

CopyBottomLineToTopLine:
	hlcoord 0, 15
	decoord 0, 13
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

ClearBottomLine:
	hlcoord 1, 15
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	call ByteFill
	hlcoord 1, 16
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	jp ByteFill

BenMonMusic1:
	call StartPokemonMusicChannel
	ld hl, BenIntroText1
	ld a, POKEMON_MUSIC_2
	jp NextRadioLine

BenMonMusic2:
	ld hl, BenIntroText2
	ld a, POKEMON_MUSIC_3
	jp NextRadioLine

BenMonMusic3:
	ld hl, BenIntroText3
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

FernMonMusic1:
	call StartPokemonMusicChannel
	ld hl, FernIntroText1
	ld a, LETS_ALL_SING_2
	jp NextRadioLine

FernMonMusic2:
	ld hl, FernIntroMusic2
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

BenFernMusic4:
	ld hl, BenFernText1
	ld a, POKEMON_MUSIC_5
	jp NextRadioLine

BenFernMusic5:
	call GetWeekday
	and 1
	ld hl, BenFernText2A
	jr z, .SunTueThurSun
	ld hl, BenFernText2B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_6
	jp NextRadioLine

BenFernMusic6:
	call GetWeekday
	and 1
	ld hl, BenFernText3A
	jr z, .SunTueThurSun
	ld hl, BenFernText3B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_7
	jp NextRadioLine

BenFernMusic7:
	ret

StartPokemonMusicChannel:
	call RadioTerminator
	call PrintText
	ld de, MUSIC_POKEMON_MARCH
	call GetWeekday
	and 1
	jr z, .SunTueThurSun
	ld de, MUSIC_POKEMON_LULLABY
.SunTueThurSun:
	callfar RadioMusicRestartDE
	ret

BenIntroText1:
	; BEN: #MON MUSIC
	text_far _BenIntroText1
	text_end

BenIntroText2:
	; CHANNEL!
	text_far _BenIntroText2
	text_end

BenIntroText3:
	; It's me, DJ BEN!
	text_far _BenIntroText3
	text_end

FernIntroText1:
	; FERN: #MUSIC!
	text_far _FernIntroText1
	text_end

FernIntroMusic2:
	; With DJ FERN!
	text_far _FernIntroText2
	text_end

BenFernText1:
	; Today's @ ,
	text_far _BenFernText1
	text_end

BenFernText2A:
	; so let us jam to
	text_far _BenFernText2A
	text_end

BenFernText2B:
	; so chill out to
	text_far _BenFernText2B
	text_end

BenFernText3A:
	; #MON March!
	text_far _BenFernText3A
	text_end

BenFernText3B:
	; #MON Lullaby!
	text_far _BenFernText3B
	text_end

LuckyNumberShow1:
	call StartRadioStation
	callfar CheckLuckyNumberShowFlag
	jr nc, .dontreset
	callfar ResetLuckyNumberShowFlag
.dontreset
	ld hl, LC_Text1
	ld a, LUCKY_NUMBER_SHOW_2
	jp NextRadioLine

LuckyNumberShow2:
	ld hl, LC_Text2
	ld a, LUCKY_NUMBER_SHOW_3
	jp NextRadioLine

LuckyNumberShow3:
	ld hl, LC_Text3
	ld a, LUCKY_NUMBER_SHOW_4
	jp NextRadioLine

LuckyNumberShow4:
	ld hl, LC_Text4
	ld a, LUCKY_NUMBER_SHOW_5
	jp NextRadioLine

LuckyNumberShow5:
	ld hl, LC_Text5
	ld a, LUCKY_NUMBER_SHOW_6
	jp NextRadioLine

LuckyNumberShow6:
	ld hl, LC_Text6
	ld a, LUCKY_NUMBER_SHOW_7
	jp NextRadioLine

LuckyNumberShow7:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_8
	jp NextRadioLine

LuckyNumberShow8:
	ld hl, wStringBuffer1
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [wStringBuffer1 + 5], a
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_9
	jp NextRadioLine

LuckyNumberShow9:
	ld hl, LC_Text9
	ld a, LUCKY_NUMBER_SHOW_10
	jp NextRadioLine

LuckyNumberShow10:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_11
	jp NextRadioLine

LuckyNumberShow11:
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_12
	jp NextRadioLine

LuckyNumberShow12:
	ld hl, LC_Text10
	ld a, LUCKY_NUMBER_SHOW_13
	jp NextRadioLine

LuckyNumberShow13:
	ld hl, LC_Text11
	call Random
	and a
	ld a, LUCKY_CHANNEL
	jr nz, .okay
	ld a, LUCKY_NUMBER_SHOW_14
.okay
	jp NextRadioLine

LuckyNumberShow14:
	ld hl, LC_DragText1
	ld a, LUCKY_NUMBER_SHOW_15
	jp NextRadioLine

LuckyNumberShow15:
	ld hl, LC_DragText2
	ld a, LUCKY_CHANNEL
	jp NextRadioLine

LC_Text1:
	; REED: Yeehaw! How
	text_far _LC_Text1
	text_end

LC_Text2:
	; y'all doin' now?
	text_far _LC_Text2
	text_end

LC_Text3:
	; Whether you're up
	text_far _LC_Text3
	text_end

LC_Text4:
	; or way down low,
	text_far _LC_Text4
	text_end

LC_Text5:
	; don't you miss the
	text_far _LC_Text5
	text_end

LC_Text6:
	; LUCKY NUMBER SHOW!
	text_far _LC_Text6
	text_end

LC_Text7:
	; This week's Lucky
	text_far _LC_Text7
	text_end

LC_Text8:
	; Number is @ !
	text_far _LC_Text8
	text_end

LC_Text9:
	; I'll repeat that!
	text_far _LC_Text9
	text_end

LC_Text10:
	; Match it and go to
	text_far _LC_Text10
	text_end

LC_Text11:
	; the RADIO TOWER!
	text_far _LC_Text11
	text_end

LC_DragText1:
	; …Repeating myself
	text_far _LC_DragText1
	text_end

LC_DragText2:
	; gets to be a drag…
	text_far _LC_DragText2
	text_end

PeoplePlaces1:
	call StartRadioStation
	ld hl, PnP_Text1
	ld a, PLACES_AND_PEOPLE_2
	jp NextRadioLine

PeoplePlaces2:
	ld hl, PnP_Text2
	ld a, PLACES_AND_PEOPLE_3
	jp NextRadioLine

PeoplePlaces3:
	ld hl, PnP_Text3
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine

PnP_Text1:
	; PLACES AND PEOPLE!
	text_far _PnP_Text1
	text_end

PnP_Text2:
	; Brought to you by
	text_far _PnP_Text2
	text_end

PnP_Text3:
	; me, DJ LILY!
	text_far _PnP_Text3
	text_end

PeoplePlaces4: ; People
	call Random
	maskbits NUM_TRAINER_CLASSES
	inc a
	cp NUM_TRAINER_CLASSES - 1
	jr nc, PeoplePlaces4
	push af
	ld hl, PnP_HiddenPeople
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr z, .ok
	ld hl, PnP_HiddenPeople_BeatE4
	ld a, [wKantoBadges]
	cp %11111111 ; all badges
	jr nz, .ok
	ld hl, PnP_HiddenPeople_BeatKanto
.ok
	pop af
	ld c, a
	ld de, 1
	push bc
	call IsInArray
	pop bc
	jr c, PeoplePlaces4
	push bc
	callfar GetTrainerClassName
	ld de, wStringBuffer1
	call CopyName1
	pop bc
	ld b, 1
	callfar GetTrainerName
	ld hl, PnP_Text4
	ld a, PLACES_AND_PEOPLE_5
	jp NextRadioLine

INCLUDE "data/radio/pnp_hidden_people.asm"

PnP_Text4:
	; @  @ @
	text_far _PnP_Text4
	text_end

PeoplePlaces5:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_PNP_PEOPLE_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine

.Adjectives:
; there are NUM_PNP_PEOPLE_ADJECTIVES entries
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_soso
	dw PnP_great
	dw PnP_mytype
	dw PnP_cool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd

PnP_cute:
	; is cute.
	text_far _PnP_cute
	text_end

PnP_lazy:
	; is sort of lazy.
	text_far _PnP_lazy
	text_end

PnP_happy:
	; is always happy.
	text_far _PnP_happy
	text_end

PnP_noisy:
	; is quite noisy.
	text_far _PnP_noisy
	text_end

PnP_precocious:
	; is precocious.
	text_far _PnP_precocious
	text_end

PnP_bold:
	; is somewhat bold.
	text_far _PnP_bold
	text_end

PnP_picky:
	; is too picky!
	text_far _PnP_picky
	text_end

PnP_sortofok:
	; is sort of OK.
	text_far _PnP_sortofok
	text_end

PnP_soso:
	; is just so-so.
	text_far _PnP_soso
	text_end

PnP_great:
	; is actually great.
	text_far _PnP_great
	text_end

PnP_mytype:
	; is just my type.
	text_far _PnP_mytype
	text_end

PnP_cool:
	; is so cool, no?
	text_far _PnP_cool
	text_end

PnP_inspiring:
	; is inspiring!
	text_far _PnP_inspiring
	text_end

PnP_weird:
	; is kind of weird.
	text_far _PnP_weird
	text_end

PnP_rightforme:
	; is right for me?
	text_far _PnP_rightforme
	text_end

PnP_odd:
	; is definitely odd!
	text_far _PnP_odd
	text_end

PeoplePlaces6: ; Places
	call Random
	cp (PnP_HiddenPlaces.End - PnP_HiddenPlaces) / 2
	jr nc, PeoplePlaces6
	ld hl, PnP_HiddenPlaces
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, PnP_Text5
	ld a, PLACES_AND_PEOPLE_7
	jp NextRadioLine

INCLUDE "data/radio/pnp_hidden_places.asm"

PnP_Text5:
	; @ @
	text_far _PnP_Text5
	text_end

PeoplePlaces7:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_PNP_PLACES_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyRadioTextToRAM
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp PrintRadioLine

.Adjectives:
; there are NUM_PNP_PLACES_ADJECTIVES entries
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_soso
	dw PnP_great
	dw PnP_mytype
	dw PnP_cool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd

RocketRadio1:
	call StartRadioStation
	ld hl, RocketRadioText1
	ld a, ROCKET_RADIO_2
	jp NextRadioLine

RocketRadio2:
	ld hl, RocketRadioText2
	ld a, ROCKET_RADIO_3
	jp NextRadioLine

RocketRadio3:
	ld hl, RocketRadioText3
	ld a, ROCKET_RADIO_4
	jp NextRadioLine

RocketRadio4:
	ld hl, RocketRadioText4
	ld a, ROCKET_RADIO_5
	jp NextRadioLine

RocketRadio5:
	ld hl, RocketRadioText5
	ld a, ROCKET_RADIO_6
	jp NextRadioLine

RocketRadio6:
	ld hl, RocketRadioText6
	ld a, ROCKET_RADIO_7
	jp NextRadioLine

RocketRadio7:
	ld hl, RocketRadioText7
	ld a, ROCKET_RADIO_8
	jp NextRadioLine

RocketRadio8:
	ld hl, RocketRadioText8
	ld a, ROCKET_RADIO_9
	jp NextRadioLine

RocketRadio9:
	ld hl, RocketRadioText9
	ld a, ROCKET_RADIO_10
	jp NextRadioLine

RocketRadio10:
	ld hl, RocketRadioText10
	ld a, ROCKET_RADIO
	jp NextRadioLine

RocketRadioText1:
	; … …Ahem, we are
	text_far _RocketRadioText1
	text_end

RocketRadioText2:
	; TEAM ROCKET!
	text_far _RocketRadioText2
	text_end

RocketRadioText3:
	; After three years
	text_far _RocketRadioText3
	text_end

RocketRadioText4:
	; of preparation, we
	text_far _RocketRadioText4
	text_end

RocketRadioText5:
	; have risen again
	text_far _RocketRadioText5
	text_end

RocketRadioText6:
	; from the ashes!
	text_far _RocketRadioText6
	text_end

RocketRadioText7:
	; GIOVANNI! @ Can you
	text_far _RocketRadioText7
	text_end

RocketRadioText8:
	; hear?@  We did it!
	text_far _RocketRadioText8
	text_end

RocketRadioText9:
	; @ Where is our boss?
	text_far _RocketRadioText9
	text_end

RocketRadioText10:
	; @ Is he listening?
	text_far _RocketRadioText10
	text_end

PokeFluteRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

UnownRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

EvolutionRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

BuenasPassword1:
; Determine if we need to be here
	call BuenasPasswordCheckTime
	jp nc, .PlayPassword
	ld a, [wNumRadioLinesPrinted]
	and a
	jp z, BuenasPassword20
	jp BuenasPassword8

.PlayPassword:
	call StartRadioStation
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld de, BuenasPasswordChannelName
	hlcoord 2, 9
	call PlaceString
	pop af
	ldh [hBGMapMode], a
	ld hl, BuenaRadioText1
	ld a, BUENAS_PASSWORD_2
	jp NextRadioLine

BuenasPassword2:
	ld hl, BuenaRadioText2
	ld a, BUENAS_PASSWORD_3
	jp NextRadioLine

BuenasPassword3:
	call BuenasPasswordCheckTime
	ld hl, BuenaRadioText3
	jp c, BuenasPasswordAfterMidnight
	ld a, BUENAS_PASSWORD_4
	jp NextRadioLine

BuenasPassword4:
	call BuenasPasswordCheckTime
	jp c, BuenasPassword8
	ld a, [wBuenasPassword]
; If we already generated the password today, we don't need to generate a new one.
	ld hl, wDailyFlags2
	bit DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	jr nz, .AlreadyGotIt
; There are only 11 groups to choose from.
.greater_than_11
	call Random
	maskbits NUM_PASSWORD_CATEGORIES
	cp NUM_PASSWORD_CATEGORIES
	jr nc, .greater_than_11
; Store it in the high nybble of e.
	swap a
	ld e, a
; For each group, choose one of the three passwords.
.greater_than_three
	call Random
	maskbits NUM_PASSWORDS_PER_CATEGORY
	cp NUM_PASSWORDS_PER_CATEGORY
	jr nc, .greater_than_three
; The high nybble of wBuenasPassword will now contain the password group index, and the low nybble contains the actual password.
	add e
	ld [wBuenasPassword], a
; Set the flag so that we don't generate a new password this week.
	ld hl, wDailyFlags2
	set DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
.AlreadyGotIt:
	ld c, a
	call GetBuenasPassword
	ld hl, BuenaRadioText4
	ld a, BUENAS_PASSWORD_5
	jp NextRadioLine

GetBuenasPassword:
; The password indices are held in c.  High nybble contains the group index, low nybble contains the word index.
; Load the password group pointer in hl.
	ld a, c
	swap a
	and $f
	ld hl, BuenasPasswordTable
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Get the password type and store it in b.
	ld a, [hli]
	ld b, a
	push hl
	inc hl
; Get the password index.
	ld a, c
	and $f
	ld c, a
	push hl
	ld hl, .StringFunctionJumpTable
	ld e, b
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de ; de now contains the pointer to the value of this week's password, in Blue Card Points.
	call _hl_
	pop hl
	ld c, [hl]
	ret

.StringFunctionJumpTable:
; entries correspond to BUENA_* constants
	dw .Mon       ; BUENA_MON
	dw .Item      ; BUENA_ITEM
	dw .Move      ; BUENA_MOVE
	dw .RawString ; BUENA_STRING

.Mon:
	call .GetTheIndex
	call GetPokemonName
	ret

.Item:
	call .GetTheIndex
	call GetItemName
	ret

.Move:
	call .GetTheIndex
	call GetMoveName
	ret

.GetTheIndex:
	ld h, 0
	ld l, c
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	ret

.RawString:
; Get the string from the table...
	ld a, c
	and a
	jr z, .skip
.read_loop
	ld a, [de]
	inc de
	cp "@"
	jr nz, .read_loop
	dec c
	jr nz, .read_loop
; ... and copy it into wStringBuffer1.
.skip
	ld hl, wStringBuffer1
.copy_loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .copy_loop
	ld de, wStringBuffer1
	ret

INCLUDE "data/radio/buenas_passwords.asm"

BuenasPassword5:
	ld hl, BuenaRadioText5
	ld a, BUENAS_PASSWORD_6
	jp NextRadioLine

BuenasPassword6:
	ld hl, BuenaRadioText6
	ld a, BUENAS_PASSWORD_7
	jp NextRadioLine

BuenasPassword7:
	call BuenasPasswordCheckTime
	ld hl, BuenaRadioText7
	jr c, BuenasPasswordAfterMidnight
	ld a, BUENAS_PASSWORD
	jp NextRadioLine

BuenasPasswordAfterMidnight:
	push hl
	ld hl, wDailyFlags2
	res DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	pop hl
	ld a, BUENAS_PASSWORD_8
	jp NextRadioLine

BuenasPassword8:
	ld hl, wDailyFlags2
	res DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_9
	jp NextRadioLine

BuenasPassword9:
	ld hl, BuenaRadioMidnightText1
	ld a, BUENAS_PASSWORD_10
	jp NextRadioLine

BuenasPassword10:
	ld hl, BuenaRadioMidnightText2
	ld a, BUENAS_PASSWORD_11
	jp NextRadioLine

BuenasPassword11:
	ld hl, BuenaRadioMidnightText3
	ld a, BUENAS_PASSWORD_12
	jp NextRadioLine

BuenasPassword12:
	ld hl, BuenaRadioMidnightText4
	ld a, BUENAS_PASSWORD_13
	jp NextRadioLine

BuenasPassword13:
	ld hl, BuenaRadioMidnightText5
	ld a, BUENAS_PASSWORD_14
	jp NextRadioLine

BuenasPassword14:
	ld hl, BuenaRadioMidnightText6
	ld a, BUENAS_PASSWORD_15
	jp NextRadioLine

BuenasPassword15:
	ld hl, BuenaRadioMidnightText7
	ld a, BUENAS_PASSWORD_16
	jp NextRadioLine

BuenasPassword16:
	ld hl, BuenaRadioMidnightText8
	ld a, BUENAS_PASSWORD_17
	jp NextRadioLine

BuenasPassword17:
	ld hl, BuenaRadioMidnightText9
	ld a, BUENAS_PASSWORD_18
	jp NextRadioLine

BuenasPassword18:
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_19
	jp NextRadioLine

BuenasPassword19:
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_20
	jp NextRadioLine

BuenasPassword20:
	ldh a, [hBGMapMode]
	push af
	farcall NoRadioMusic
	farcall NoRadioName
	pop af
	ldh [hBGMapMode], a
	ld hl, wDailyFlags2
	res DAILYFLAGS2_BUENAS_PASSWORD_F, [hl]
	ld a, BUENAS_PASSWORD
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld hl, BuenaOffTheAirText
	ld a, BUENAS_PASSWORD_21
	jp NextRadioLine

BuenasPassword21:
	ld a, BUENAS_PASSWORD
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	call BuenasPasswordCheckTime
	jp nc, BuenasPassword1
	ld hl, BuenaOffTheAirText
	ld a, BUENAS_PASSWORD_21
	jp NextRadioLine

BuenasPasswordCheckTime:
	call UpdateTime
	ldh a, [hHours]
	cp NITE_HOUR
	ret

BuenasPasswordChannelName:
	db "BUENA'S PASSWORD@"

BuenaRadioText1:
	; BUENA: BUENA here!
	text_far _BuenaRadioText1
	text_end

BuenaRadioText2:
	; Today's password!
	text_far _BuenaRadioText2
	text_end

BuenaRadioText3:
	; Let me think… It's
	text_far _BuenaRadioText3
	text_end

BuenaRadioText4:
	; @ !
	text_far _BuenaRadioText4
	text_end

BuenaRadioText5:
	; Don't forget it!
	text_far _BuenaRadioText5
	text_end

BuenaRadioText6:
	; I'm in GOLDENROD's
	text_far _BuenaRadioText6
	text_end

BuenaRadioText7:
	; RADIO TOWER!
	text_far _BuenaRadioText7
	text_end

BuenaRadioMidnightText1:
	; BUENA: Oh my…
	text_far _BuenaRadioMidnightText1
	text_end

BuenaRadioMidnightText2:
	; It's midnight! I
	text_far _BuenaRadioMidnightText2
	text_end

BuenaRadioMidnightText3:
	; have to shut down!
	text_far _BuenaRadioMidnightText3
	text_end

BuenaRadioMidnightText4:
	; Thanks for tuning
	text_far _BuenaRadioMidnightText4
	text_end

BuenaRadioMidnightText5:
	; in to the end! But
	text_far _BuenaRadioMidnightText5
	text_end

BuenaRadioMidnightText6:
	; don't stay up too
	text_far _BuenaRadioMidnightText6
	text_end

BuenaRadioMidnightText7:
	; late! Presented to
	text_far _BuenaRadioMidnightText7
	text_end

BuenaRadioMidnightText8:
	; you by DJ BUENA!
	text_far _BuenaRadioMidnightText8
	text_end

BuenaRadioMidnightText9:
	; I'm outta here!
	text_far _BuenaRadioMidnightText9
	text_end

BuenaRadioMidnightText10:
	; …
	text_far _BuenaRadioMidnightText10
	text_end

BuenaOffTheAirText:
	;
	text_far _BuenaOffTheAirText
	text_end

CopyRadioTextToRAM:
	ld a, [hl]
	cp TX_FAR
	jp z, FarCopyRadioText
	ld de, wRadioText
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

StartRadioStation:
	ld a, [wNumRadioLinesPrinted]
	and a
	ret nz
	call RadioTerminator
	call PrintText
	ld hl, RadioChannelSongs
	ld a, [wCurRadioLine]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	callfar RadioMusicRestartDE
	ret

INCLUDE "data/radio/channel_music.asm"

NextRadioLine:
	push af
	call CopyRadioTextToRAM
	pop af
	jp PrintRadioLine
