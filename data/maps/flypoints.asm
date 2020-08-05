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
	flypoint AZALEA,       AZALEA_TOWN
	flypoint MAHOGANY,     MAHOGANY_TOWN
	flypoint CIANWOOD,     CIANWOOD_CITY
	flypoint ECRUTEAK,     ECRUTEAK_CITY
	flypoint OLIVINE,      OLIVINE_CITY
	flypoint PALLET,       PALLET_TOWN
	flypoint BLACKTHORN,   BLACKTHORN_CITY
	flypoint CINNABAR,     CINNABAR_ISLAND
	flypoint FUCHSIA,      FUCHSIA_CITY
	flypoint CELADON,      CELADON_CITY
	flypoint CHERRYGROVE,  CHERRYGROVE_CITY
	flypoint INDIGO,       INDIGO_PLATEAU

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint PEWTER,       PEWTER_CITY
	flypoint SAFFRON,      SAFFRON_CITY
	flypoint CERULEAN,     CERULEAN_CITY
	flypoint VERMILION,    VERMILION_CITY

	db -1
