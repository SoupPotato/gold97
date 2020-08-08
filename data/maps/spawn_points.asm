spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants

	spawn PLAYERS_HOUSE_2F,            3,  3
	spawn PLAYERS_HOUSE_2F,           -1, -1 ;duplicate

	spawn PLAYERS_HOUSE_2F,           -1, -1 ;duplicate
	spawn YORON_CITY,                 25, 19
	spawn NAGO_VILLAGE,                5,  5
	spawn AMAMI_TOWN,                 17,  5
	spawn PLAYERS_HOUSE_2F,           -1, -1 ;duplicate
	spawn RYUKYU_CITY,                11,  5

	spawn SILENT_TOWN,                 5, 13
	spawn KOBAN_ISLAND,                9, 11
	spawn KANTO_REGION,               49, 31
	spawn STAND_CITY,                 33, 21
	spawn FROSTPOINT_TOWN,            13, 13
	spawn NIHON_LEAGUE,                9,  6
	spawn CROWN_CITY,                  5, 23
	spawn PAGOTA_CITY,                27, 29
	spawn ROUTE_106,                   9, 11
	spawn BIRDON_TOWN,                15,  5
	spawn SUNPOINT_CITY,              33, 17
	spawn WESTPORT_CITY,              25, 15
	spawn ALLOY_CITY,                  7,  9
	spawn ROUTE_109,             	  13, 29
	spawn TEKNOS_CITY,                31, 11
	spawn SANSKRIT_TOWN,               3, 13
	spawn PLAYERS_HOUSE_2F,           -1, -1 ;duplicate
	spawn BLUE_FOREST,                13, 19
	spawn PLAYERS_HOUSE_2F,           -1, -1 ;duplicate
	spawn FAST_SHIP_CABINS_SW_SSW_NW,  6,  2
	spawn N_A,                        -1, -1
