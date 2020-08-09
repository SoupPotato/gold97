; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const SILENT_TOWN       ; 01
	const ROUTE_101         ; 02
	const SILENT_HILLS      ; 15
	const PAGOTA_CITY       ; 06
	const BRASS_TOWER       ; 07
	const ROUTE_102         ; 14
	const WESTPORT_CITY     ; 10
	const RADIO_TOWER       ; 11
	const ROUTE_103         ; 12
	const BIRDON_TOWN       ; 0c
	const SLOWPOKE_WELL     ; 0d
	const ROUTE_116         ; 32
	const ROUTE_117         ; 34
	const ENDON_CAVE        ; 1c
	const SANSKRIT_TOWN     ; 24
	const RUINS_OF_ALPH     ; 09
	const ROUTE_118         ; 36
	const SUNPOINT_CITY     ; 21
	const MAGMA_SHAFT       ; 18
	const SUNPOINT_DOCKS    ; 3a
	const ROUTE_119         ; 3f
	const BOULDER_MINES     ; 0a
	const ROUTE_120         ; 40
	const TEKNOS_CITY       ; 16
	const BOARDWALK         ; 25
	const ROUTE_104         ; 0b
	const ROUTE_105         ; 04
	const JADE_FOREST       ; 0e
	const ROUTE_106         ; 05
	const ALLOY_CITY        ; 1b
	const ROUTE_107         ; 56
	const KOBAN_ISLAND      ; 2f
	const DRAGONS_MAW       ; 2a
	const ROUTE_108         ; 19
	const ROUTE_109         ; 1a
	const AMPARE_CAVERN     ; 2c
	const ROUTE_110         ; 1e
	const BLUE_FOREST       ; 29
	const DEEPWATER_PASSAGE ; 28
	const ROUTE_111         ; 20
	const WHIRL_ISLAND      ; 1f
	const FROSTPOINT_TOWN   ; 55
	const ROUTE_112         ; 08
	const STAND_CITY        ; 51
	const NATIONAL_PARK     ; 13
	const ROUTE_113         ; 0f
	const ROUTE_114         ; 41
	const KANTO_REGION_M    ; 47
	const ROUTE_115         ; 5c
	const CROWN_PASS        ; 58
	const CROWN_CITY        ; 03
	const VICTORY_ROAD      ; 58
	const NIHON_LEAGUE      ; 5a

KANTO_LANDMARK EQU const_value

	const BATTLE_TOWER      ; 1d
	const MT_MORTAR         ; 23
	const YORON_CITY        ; 33 1
	const ICED_CAVERN       ; 3e 10
	const YORON_POINT       ; 38 4
	const KERAMA_STRAIT     ; 52
	const URASOE_TRAIL      ; 4a
	const NANJO_FOREST      ; 54
	const URASOE_PARK       ; 35 2
	const RYUKYU_CITY       ; 48 9
	const MERIDIAN_PATH     ; 39 5
	const CHARRED_SUMMIT    ; 42 11
	const NAGO_VILLAGE      ; 37 3
	const ISEN_STRAIT       ; 53
	const SEASIDE_PATH      ; 43 8
	const JOULE_CAVE        ; 3b 6
	const AMAMI_TOWN        ; 3d 7
	const FAST_SHIP         ; 5f


; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f

; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
