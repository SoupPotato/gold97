; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const SILENT_TOWN       ; 01
	const ROUTE_29          ; 02
	const ROUTE_37          ; 15
	const OLD_CITY          ; 06
	const BRASS_TOWER      ; 07
	const ROUTE_36          ; 14
	const GOLDENROD_CITY    ; 10
	const RADIO_TOWER       ; 11
	const ROUTE_35          ; 12
	const AZALEA_TOWN       ; 0c
	const SLOWPOKE_WELL     ; 0d
	const ROUTE_116         ; 32
	const ROUTE_117         ; 34
	const ENDON_CAVE        ; 1c
	const SANSKRIT_TOWN     ; 24
	const RUINS_OF_ALPH     ; 09
	const ROUTE_118         ; 36
	const CIANWOOD_CITY     ; 21
	const MAGMA_SHAFT       ; 18
	const ROUTE_5           ; 3a
	const ROUTE_7           ; 3f
	const BOULDER_MINES     ; 0a
	const ROUTE_8           ; 40
	const ECRUTEAK_CITY     ; 16
	const BOARDWALK         ; 25
	const ROUTE_33          ; 0b
	const ROUTE_30          ; 04
	const JADE_FOREST       ; 0e
	const ROUTE_106         ; 05
	const ALLOY_CITY        ; 1b
	const ROUTE_107         ; 56
	const PALLET_TOWN       ; 2f
	const DRAGONS_DEN       ; 2a
	const ROUTE_108         ; 19
	const ROUTE_109         ; 1a
	const AMPARE_CAVERN     ; 2c
	const ROUTE_110         ; 1e
	const BLACKTHORN_CITY   ; 29
	const DEEPWATER_PASSAGE ; 28
	const ROUTE_41          ; 20
	const WHIRL_ISLAND      ; 1f
	const CINNABAR_ISLAND   ; 55
	const ROUTE_32          ; 08
	const STAND_CITY        ; 51
	const NATIONAL_PARK     ; 13
	const ROUTE_34          ; 0f
	const ROUTE_9           ; 41
	const CELADON_CITY      ; 47
	const ROUTE_27          ; 5c
	const VIRIDIAN_CITY     ; 58
	const CHERRYGROVE_CITY  ; 03
	const VICTORY_ROAD      ; 58
	const INDIGO_PLATEAU    ; 5a

KANTO_LANDMARK EQU const_value

	const ROUTE_11          ; 49
	const BATTLE_TOWER      ; 1d
	const MT_MORTAR         ; 23
	const ROUTE_14          ; 4c
	const ROUTE_13          ; 4b
	const ROUTE_15          ; 4d
	const ROUTE_16          ; 4e
	const ROUTE_17          ; 4f
	const ROUTE_18          ; 50
	const ROUTE_22          ; 57
	const ROUTE_23          ; 59
	const ROUTE_26          ; 5b
	const TOHJO_FALLS       ; 5d
	const ROUTE_28          ; 5e
	const TIN_TOWER         ; 17
	const ROUTE_42          ; 22
	const LAKE_OF_RAGE      ; 26
	const ROUTE_44          ; 27
	const ROUTE_45          ; 2b
	const ROUTE_46          ; 2d
	const ROUTE_1           ; 30
	const CROWN_PASS        ; 31
	const POWER_PLANT       ; 44
	const LAVENDER_TOWN     ; 45
	const LAV_RADIO_TOWER   ; 46
	const SILVER_CAVE       ; 2e
	const PEWTER_CITY       ; 33 1
	const ICED_CAVERN       ; 3e 10
	const ROUTE_24          ; 38 4
	const ROUTE_19          ; 52
	const ROUTE_12          ; 4a
	const NANJO_FOREST      ; 54
	const MT_MOON           ; 35 2
	const SAFFRON_CITY      ; 48 9
	const ROUTE_25          ; 39 5
	const CHARRED_SUMMIT    ; 42 11
	const CERULEAN_CITY     ; 37 3
	const ROUTE_20          ; 53
	const ROUTE_10          ; 43 8
	const JOULE_CAVE        ; 3b 6
	const VERMILION_CITY    ; 3d 7
	const FAST_SHIP         ; 5f

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f

; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
