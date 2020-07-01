treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map ROUTE_29,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_37,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_8,                   TREEMON_SET_ROUTE
	treemon_map ROUTE_7,                   TREEMON_SET_LAKE
	treemon_map ROUTE_4,                   TREEMON_SET_LAKE
	treemon_map ROUTE_38,                  TREEMON_SET_KANTO
	treemon_map ROUTE_39,                  TREEMON_SET_KANTO
	treemon_map ROUTE_34,                  TREEMON_SET_KANTO
	treemon_map ROUTE_32,                  TREEMON_SET_KANTO
	treemon_map ROUTE_10_NORTH,            TREEMON_SET_KANTO
	treemon_map ROUTE_27,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_12,                  TREEMON_SET_ROUTE
	treemon_map ROUTE_25,                  TREEMON_SET_ROUTE
	treemon_map EASTWARD_SUMMIT,           TREEMON_SET_ROUTE
	treemon_map ROUTE_3,                   TREEMON_SET_ROUTE
	treemon_map RUINS_OF_ALPH_OUTSIDE,     TREEMON_SET_LAKE
	treemon_map ECRUTEAK_CITY,             TREEMON_SET_CITY
	treemon_map FUCHSIA_CITY,              TREEMON_SET_CITY
	treemon_map CHERRYGROVE_CITY,          TREEMON_SET_CITY
	treemon_map VERMILION_CITY,            TREEMON_SET_CITY
	treemon_map PEWTER_CITY,               TREEMON_SET_CITY
	treemon_map OLIVINE_CITY,              TREEMON_SET_CITY
	treemon_map MAHOGANY_TOWN,             TREEMON_SET_TOWN
	treemon_map CERULEAN_CITY,             TREEMON_SET_TOWN
	treemon_map PALLET_TOWN,               TREEMON_SET_LAKE
	treemon_map ILEX_FOREST,               TREEMON_SET_FOREST
	treemon_map SAFARI_ZONE_BETA,          TREEMON_SET_FOREST
	treemon_map NATIONAL_PARK,             TREEMON_SET_ROUTE

	db -1

RockMonMaps:
	treemon_map CIANWOOD_CITY,             TREEMON_SET_ROCK
	db -1
