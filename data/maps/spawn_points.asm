spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants

	spawn PLAYERS_HOUSE_2F,            3,  3
	spawn PLAYERS_HOUSE_2F,                        -1, -1 ;duplicate

	spawn PLAYERS_HOUSE_2F,                        -1, -1 ;duplicate
	spawn PEWTER_CITY,                25, 19
	spawn CERULEAN_CITY,               5,  5
	spawn VERMILION_CITY,             17,  5
	spawn PLAYERS_HOUSE_2F,                        -1, -1 ;duplicate
	spawn SAFFRON_CITY,               11,  5

	spawn SILENT_TOWN,                 5, 13
	spawn PALLET_TOWN,                 9, 11
	spawn CELADON_CITY,               49, 31
	spawn FUCHSIA_CITY,               33, 21
	spawn CINNABAR_ISLAND,            13, 13
	spawn ROUTE_23,                    9,  6
	spawn CHERRYGROVE_CITY,            5, 23
	spawn OLD_CITY,                   27, 29
	spawn ROUTE_106,                    9, 11
	spawn AZALEA_TOWN,                15,  5
	spawn CIANWOOD_CITY,              33, 17
	spawn GOLDENROD_CITY,             25, 15
	spawn ALLOY_CITY,                7,  9
	spawn ROUTE_109,             	  13, 29
	spawn ECRUTEAK_CITY,              31, 11
	spawn SANSKRIT_TOWN,               3, 13
	spawn PLAYERS_HOUSE_2F,                        -1, -1 ;duplicate
	spawn BLACKTHORN_CITY,            13, 19
	spawn PLAYERS_HOUSE_2F,                        -1, -1 ;duplicate
	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6,  2
	spawn N_A,                        -1, -1
