flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint SILENT,       SILENT_TOWN
	flypoint PAGOTA,       PAGOTA_CITY
	flypoint WESTPORT,     WESTPORT_CITY
	flypoint TEKNOS,       TEKNOS_CITY
	flypoint BIRDON,       BIRDON_TOWN
	flypoint SANSKRIT,     SANSKRIT_TOWN
	flypoint SUNPOINT,     SUNPOINT_CITY
	flypoint ALLOY,        ALLOY_CITY
	flypoint KOBAN,        KOBAN_ISLAND
	flypoint BLUEFOREST,   BLUE_FOREST
	flypoint FROSTPOINT,   FROSTPOINT_TOWN
	flypoint STAND,        STAND_CITY
	flypoint KANTO,        KANTO_REGION_M
	flypoint CROWN,        CROWN_CITY
	flypoint LEAGUE,       NIHON_LEAGUE

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint YORON,        YORON_CITY
	flypoint RYUKYU,       RYUKYU_CITY
	flypoint NAGO,         NAGO_VILLAGE
	flypoint AMAMI,        AMAMI_TOWN
	db -1
