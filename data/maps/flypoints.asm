flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint SILENT,       SILENT_TOWN
	flypoint VIOLET,       OLD_CITY
	flypoint GOLDENROD,    GOLDENROD_CITY
	flypoint BIRDON,       BIRDON_TOWN
	flypoint SANSKRIT,     SANSKRIT_TOWN
	flypoint CIANWOOD,     CIANWOOD_CITY
	flypoint TEKNOS,       TEKNOS_CITY
	flypoint ALLOY,        ALLOY_CITY
	flypoint PALLET,       PALLET_TOWN
	flypoint BLUEFOREST,   BLUE_FOREST
	flypoint FROSTPOINT,   FROSTPOINT_TOWN
	flypoint STAND,        STAND_CITY
	flypoint CELADON,      CELADON_CITY
	flypoint CHERRYGROVE,  CHERRYGROVE_CITY
	flypoint INDIGO,       INDIGO_PLATEAU

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint PEWTER,       PEWTER_CITY
	flypoint SAFFRON,      SAFFRON_CITY
	flypoint NAGO,         NAGO_VILLAGE
	flypoint VERMILION,    VERMILION_CITY
	db -1
