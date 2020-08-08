treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map ROUTE_101,                  TREEMON_SET_ROUTE
	treemon_map SILENT_HILLS,              TREEMON_SET_ROUTE
	treemon_map ROUTE_120,                 TREEMON_SET_ROUTE
	treemon_map ROUTE_119,                 TREEMON_SET_LAKE
	treemon_map ROUTE_118,                 TREEMON_SET_LAKE
	treemon_map ROUTE_108,                 TREEMON_SET_KANTO
	treemon_map ROUTE_109,                 TREEMON_SET_KANTO
	treemon_map ROUTE_113,                 TREEMON_SET_KANTO
	treemon_map ROUTE_112,                 TREEMON_SET_KANTO
	treemon_map SEASIDE_PATH,              TREEMON_SET_KANTO
	treemon_map ROUTE_115,                 TREEMON_SET_ROUTE
	treemon_map URASOE_TRAIL,              TREEMON_SET_ROUTE
	treemon_map MERIDIAN_PATH,             TREEMON_SET_ROUTE
	treemon_map CHARRED_SUMMIT,            TREEMON_SET_ROUTE
	treemon_map ROUTE_117,                 TREEMON_SET_ROUTE
	treemon_map RUINS_OF_ALPH_OUTSIDE,     TREEMON_SET_LAKE
	treemon_map TEKNOS_CITY,               TREEMON_SET_CITY
	treemon_map STAND_CITY,                TREEMON_SET_CITY
	treemon_map CROWN_CITY,                TREEMON_SET_CITY
	treemon_map AMAMI_TOWN,                TREEMON_SET_CITY
	treemon_map YORON_CITY,                TREEMON_SET_CITY
	treemon_map ALLOY_CITY,                TREEMON_SET_CITY
	treemon_map SANSKRIT_TOWN,             TREEMON_SET_TOWN
	treemon_map NAGO_VILLAGE,              TREEMON_SET_TOWN
	treemon_map KOBAN_ISLAND,              TREEMON_SET_LAKE
	treemon_map JADE_FOREST,               TREEMON_SET_FOREST
	treemon_map NANJO_FOREST,              TREEMON_SET_FOREST
	treemon_map NATIONAL_PARK,             TREEMON_SET_ROUTE

	db -1

RockMonMaps:
	treemon_map SUNPOINT_CITY,             TREEMON_SET_ROCK
	db -1
